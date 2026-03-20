// gemm_bench.cpp
// Benchmark comparing ggml_gemm_q4_0_8x8_q8_0 (baseline 4x8)
// vs ggml_gemm_q4_0_8x8_q8_0_4x16 (4x16 two-pass)
//
// Build:
// riscv64-linux-gnu-g++ \
//   -O3 -march=rv64gcv -mabi=lp64d -std=gnu++17 \
//   -I/home/paddymac/llama.cpp/ggml/include \
//   -I/home/paddymac/llama.cpp/ggml/src \
//   -I/home/paddymac/llama.cpp/ggml/src/ggml-cpu \
//   -I/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv \
//   -I/home/paddymac/llama.cpp/include \
//   gemm_bench.cpp repack.cpp repack_4x16.cpp \
//   -lm -o gemm_bench
//
// Run:
// qemu-riscv64 -cpu rv64,v=true,vlen=256,vext_spec=v1.0 \
//   -L /usr/riscv64-linux-gnu ./gemm_bench

#define GGML_COMMON_DECL_C
#define GGML_COMMON_DECL_CPP
#include "ggml-common.h"
#include "../../repack.h"
#include "ggml.h"
#include "repack_4x16.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdint.h>
#include <math.h>

#include <vector>
#include <algorithm>
#include <numeric>
#include <cmath>
#include <cstring>
#include <cstdio>

#define BLOCK_SIZE  32
#define NS(t) ((t).tv_sec * 1000000000LL + (t).tv_nsec)

// ── Iteration scaling — keep total runtime manageable on QEMU ────────────────
// Work scales linearly with M so we reduce iteration count as M grows.
// The minimum-time statistic remains meaningful with fewer iterations —
// we only need enough runs to get one clean uninterrupted measurement.
static int iters_for_m(int M) {
    if (M <=   4) return 2000;
    if (M <=   8) return 1000;
    if (M <=  16) return  500;
    if (M <=  32) return  200;
    if (M <=  64) return  100;
    if (M <= 128) return   50;
    return 20;
}

static int warmup_for_m(int M) {
    return iters_for_m(M) / 10;
}

// ── Stubs for ggml symbols not available in the standalone benchmark ──────────

// fp16 to fp32 lookup table — used by GGML_CPU_FP16_TO_FP32 in the kernels.
// Must be populated via init_fp16_table() before calling any kernel.
float ggml_table_f32_f16[65536];

static void init_fp16_table(void) {
    for (int i = 0; i < 65536; i++) {
        uint16_t h        = (uint16_t)i;
        uint32_t sign     = (h >> 15) & 0x1;
        uint32_t exponent = (h >> 10) & 0x1f;
        uint32_t mantissa =  h        & 0x3ff;
        uint32_t f;
        if (exponent == 0) {
            if (mantissa == 0) {
                f = sign << 31;
            } else {
                exponent = 1;
                while (!(mantissa & 0x400)) { mantissa <<= 1; exponent--; }
                mantissa &= 0x3ff;
                f = (sign << 31) | ((exponent + 127 - 15) << 23) | (mantissa << 13);
            }
        } else if (exponent == 31) {
            f = (sign << 31) | (0xff << 23) | (mantissa << 13);
        } else {
            f = (sign << 31) | ((exponent + 127 - 15) << 23) | (mantissa << 13);
        }
        memcpy(&ggml_table_f32_f16[i], &f, sizeof(float));
    }
}

// Generic fallbacks — only reached if VLEN < 256, which cannot happen
// on QEMU with vlen=256. Defined here only to satisfy the linker.
extern "C" void ggml_gemm_q4_0_8x8_q8_0_generic(
        int, float *, size_t, const void *, const void *, int, int) {
    fprintf(stderr, "ERROR: generic GEMM fallback called — "
                    "RVV path not taken, check QEMU vlen setting\n");
    abort();
}

extern "C" void ggml_gemv_q4_0_8x8_q8_0_generic(
        int, float *, size_t, const void *, const void *, int, int) {
    fprintf(stderr, "ERROR: generic GEMV fallback called — "
                    "RVV path not taken, check QEMU vlen setting\n");
    abort();
}

// ── Kernel declarations ───────────────────────────────────────────────────────

extern "C" void ggml_gemm_q4_0_8x8_q8_0(
    int n, float * GGML_RESTRICT s, size_t bs,
    const void * GGML_RESTRICT vx,
    const void * GGML_RESTRICT vy,
    int nr, int nc);

// ── Helpers ───────────────────────────────────────────────────────────────────

static void fill_random(void * buf, size_t bytes) {
    uint8_t * p = (uint8_t *)buf;
    for (size_t i = 0; i < bytes; i++)
        p[i] = (uint8_t)(rand() & 0xFF);
}

// ── Core benchmark function ───────────────────────────────────────────────────

static void run_bench(int M, int N, int K) {
    const int ITERS  = iters_for_m(M);
    const int WARMUP = warmup_for_m(M);
    const int nb     = K / BLOCK_SIZE;

    // vx = weight matrix:     (nc/8) groups x nb blocks of block_q4_0x8
    // vy = activation matrix: (nr/4) groups x nb blocks of block_q8_0x4
    size_t A_size = (size_t)(N / 8) * nb * sizeof(block_q4_0x8);
    size_t B_size = (size_t)(M / 4) * nb * sizeof(block_q8_0x4);
    size_t C_size = (size_t)(M * N) * sizeof(float);

    void  * A          = aligned_alloc(64, A_size);
    void  * B          = aligned_alloc(64, B_size);
    float * C_baseline = (float *)aligned_alloc(64, C_size);
    float * C_new      = (float *)aligned_alloc(64, C_size);

    if (!A || !B || !C_baseline || !C_new) {
        fprintf(stderr, "ERROR: allocation failed for M=%d N=%d K=%d\n", M, N, K);
        abort();
    }

    fill_random(A, A_size);
    fill_random(B, B_size);

    std::vector<long long> times_48(ITERS);
    std::vector<long long> times_416(ITERS);
    struct timespec t0, t1;

    // ── 4x8 warmup then timed ────────────────────────────────────────────────
    memset(C_baseline, 0, C_size);
    for (int i = 0; i < WARMUP; i++)
        ggml_gemm_q4_0_8x8_q8_0(K, C_baseline, (size_t)N, A, B, M, N);
    memset(C_baseline, 0, C_size);
    for (int i = 0; i < ITERS; i++) {
        clock_gettime(CLOCK_MONOTONIC, &t0);
        ggml_gemm_q4_0_8x8_q8_0(K, C_baseline, (size_t)N, A, B, M, N);
        clock_gettime(CLOCK_MONOTONIC, &t1);
        times_48[i] = NS(t1) - NS(t0);
    }

    // ── 4x16 warmup then timed ───────────────────────────────────────────────
    memset(C_new, 0, C_size);
    for (int i = 0; i < WARMUP; i++)
        ggml_gemm_q4_0_8x8_q8_0_4x16(K, C_new, (size_t)N, A, B, M, N);
    memset(C_new, 0, C_size);
    for (int i = 0; i < ITERS; i++) {
        clock_gettime(CLOCK_MONOTONIC, &t0);
        ggml_gemm_q4_0_8x8_q8_0_4x16(K, C_new, (size_t)N, A, B, M, N);
        clock_gettime(CLOCK_MONOTONIC, &t1);
        times_416[i] = NS(t1) - NS(t0);
    }

    // ── Statistics ───────────────────────────────────────────────────────────
    std::sort(times_48.begin(),  times_48.end());
    std::sort(times_416.begin(), times_416.end());

    auto median = [](std::vector<long long>& v) {
        return v[v.size() / 2];
    };
    auto mean_fn = [](std::vector<long long>& v) {
        return std::accumulate(v.begin(), v.end(), 0LL) / (long long)v.size();
    };
    auto stddev_fn = [](std::vector<long long>& v, long long m) {
        double s = 0;
        for (auto x : v) s += (double)(x - m) * (x - m);
        return std::sqrt(s / (double)v.size());
    };

    long long min_48   = times_48.front();
    long long min_416  = times_416.front();
    long long med_48   = median(times_48);
    long long med_416  = median(times_416);
    long long mean_48  = mean_fn(times_48);
    long long mean_416 = mean_fn(times_416);
    double    std_48   = stddev_fn(times_48,  mean_48);
    double    std_416  = stddev_fn(times_416, mean_416);

    // ── Numerical correctness check ───────────────────────────────────────────
    // Run each kernel once into a fresh zero buffer for a clean single-pass
    // comparison — avoids accumulated drift from the timed loops above.
    float * C_check_48  = (float *)aligned_alloc(64, C_size);
    float * C_check_416 = (float *)aligned_alloc(64, C_size);
    memset(C_check_48,  0, C_size);
    memset(C_check_416, 0, C_size);
    ggml_gemm_q4_0_8x8_q8_0(K,      C_check_48,  (size_t)N, A, B, M, N);
    ggml_gemm_q4_0_8x8_q8_0_4x16(K, C_check_416, (size_t)N, A, B, M, N);

    double max_diff = 0.0;
    int    max_idx  = 0;
    for (int i = 0; i < M * N; i++) {
        double d = fabs((double)C_check_48[i] - (double)C_check_416[i]);
        if (d > max_diff) { max_diff = d; max_idx = i; }
    }
    free(C_check_48);
    free(C_check_416);

    // ── Throughput estimates ──────────────────────────────────────────────────
    // Useful FLOPs: 2 x M x N x K (multiply + add per element per K step)
    double flops    = 2.0 * M * N * K;
    double gf_48    = flops / (double)min_48;
    double gf_416   = flops / (double)min_416;

    // Memory traffic: read A (Q8_0) + read B (Q4_0) + write C (f32)
    double bytes    = (double)(A_size + B_size + C_size);
    double gbps_48  = bytes / (double)min_48;
    double gbps_416 = bytes / (double)min_416;

    double speedup_min  = (double)min_48  / (double)min_416;
    double speedup_med  = (double)med_48  / (double)med_416;
    double speedup_mean = (double)mean_48 / (double)mean_416;

    // ── Print results ─────────────────────────────────────────────────────────
    printf("\n  M=%-4d N=%-5d K=%-5d  (iters=%d)\n", M, N, K, ITERS);
    printf("  %-8s  %12s  %12s  %12s  %12s  %8s  %8s\n",
           "kernel", "min(ns)", "median(ns)", "mean(ns)", "stddev(ns)",
           "GFLOP/s", "GB/s");
    printf("  %-8s  %12lld  %12lld  %12lld  %12.0f  %8.3f  %8.3f\n",
           "4x8",  min_48,  med_48,  mean_48,  std_48,  gf_48,  gbps_48);
    printf("  %-8s  %12lld  %12lld  %12lld  %12.0f  %8.3f  %8.3f\n",
           "4x16", min_416, med_416, mean_416, std_416, gf_416, gbps_416);
    printf("  speedup  min=%.3fx  median=%.3fx  mean=%.3fx\n",
           speedup_min, speedup_med, speedup_mean);
    printf("  max diff %e at index %d  %s\n",
           max_diff, max_idx,
           max_diff < 1e-3 ? "(OK)" : "(MISMATCH — check kernel!)");

    free(A); free(B); free(C_baseline); free(C_new);
}

// ── Main ──────────────────────────────────────────────────────────────────────

int main(void) {
    init_fp16_table();
    srand(42);

    printf("=======================================================\n");
    printf("  GEMM kernel benchmark  --  RISC-V RVV  vlen=256\n");
    printf("  4x8 baseline  vs  4x16 two-pass (A-amortised)\n");
    printf("=======================================================\n");

    // Qwen2.5-0.5B attention projection shapes
    // hidden=896, sweeping M (prefill sequence length / batch size)
    printf("\n-- Qwen2.5-0.5B attention  K=896  N=896 --\n");
    for (int M : {4, 8, 16, 32, 64})
        run_bench(M, 896, 896);

    // Qwen2.5-0.5B FFN shapes
    // hidden=896, intermediate=4864
    printf("\n-- Qwen2.5-0.5B FFN  K=896  N=4864 --\n");
    for (int M : {4, 8, 16, 32})
        run_bench(M, 4864, 896);

    // Original single-point shape for comparison with earlier result
    // printf("\n-- Original shape  K=2048  N=512 --\n");
    // for (int M : {4, 8, 16, 32, 64})
    //     run_bench(M, 512, 2048);

    printf("\n=======================================================\n");
    return 0;
}