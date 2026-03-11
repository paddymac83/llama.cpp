// gemm_bench.cpp
// Benchmark comparing ggml_gemm_q4_0_8x8_q8_0 (baseline)
// vs ggml_gemm_q4_0_8x8_q8_0_4x16 (4x16 tile extension)
//
// Build from ~/llama.cpp/ggml/src/ggml-cpu/arch/riscv/:
//
// riscv64-linux-gnu-g++ \
//   -O3 -march=rv64gcv -mabi=lp64d -std=gnu++17 \
//   -I/home/paddymac/llama.cpp/ggml/include \
//   -I/home/paddymac/llama.cpp/ggml/src \
//   -I/home/paddymac/llama.cpp/ggml/src/ggml-cpu \
//   -I/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv \
//   -I/home/paddymac/llama.cpp/include \
//   gemm_bench.cpp repack.cpp repack_4x16.cpp \
//   -lm -o gemm_bench
#define GGML_COMMON_DECL_C
#define GGML_COMMON_DECL_CPP
#include "ggml-common.h"
#include "../../repack.h" 

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdint.h>
#include <math.h>

#include "ggml.h"
#include "repack_4x16.h"

// Declare baseline kernel — defined in repack.cpp
extern "C" void ggml_gemm_q4_0_8x8_q8_0(int n, float * GGML_RESTRICT s, size_t bs,
                                          const void * GGML_RESTRICT vx,
                                          const void * GGML_RESTRICT vy,
                                          int nr, int nc);

// --- Benchmark config ---
#define ITERATIONS  5000
#define WARMUP      100

// Matrix dimensions
// K = inner dimension (typical weight matrix hidden size)
// N = output columns
// M = output rows (small, typical for single token deode)
#define M  4      // must be multiple of 4
#define N  512    // must be multiple of 16 (for the 4x16 path)
#define K  2048  

// Q4_0 block: 2 bytes scale (fp16) + 16 bytes data (32 x 4-bit) = 18 bytes
// Q8_0 block: 2 bytes scale (fp16) + 32 bytes data (32 x 8-bit) = 34 bytes
#define BLOCK_SIZE_Q4_0  18
#define BLOCK_SIZE_Q8_0  34
#define BLOCK_SIZE       32   // values per block

#define NS(t) ((t).tv_sec * 1000000000LL + (t).tv_nsec)

static void fill_random(void * buf, size_t bytes) {
    uint8_t * p = (uint8_t *)buf;
    for (size_t i = 0; i < bytes; i++)
        p[i] = (uint8_t)(rand() & 0xFF);
}

int main(void) {
    srand(42); // fixed seed for reproducibility
    printf("sizeof block_q4_0x8 = %zu\n", sizeof(block_q4_0x8));
    printf("sizeof block_q8_0x4 = %zu\n", sizeof(block_q8_0x4));
    printf("nb = %d\n", K / 32);
    printf("A needs = %zu bytes\n", (size_t)(M * K / 32) * sizeof(block_q4_0x8));
    printf("B needs = %zu bytes\n", (size_t)(N * K / 32) * sizeof(block_q8_0x4));

    struct timespec t0, t1;
    long long baseline_ns, new_ns;

    // Buffer sizes
    // vx = weight matrix: (nc/8) groups × nb blocks each
    size_t A_size = (size_t)(N / 8) * (K / 32) * sizeof(block_q4_0x8);

    // vy = activation matrix: (nr/4) groups × nb blocks each  
    size_t B_size = (size_t)(M / 4) * (K / 32) * sizeof(block_q8_0x4);

    size_t C_size = (size_t)(M * N) * sizeof(float);

    // size_t A_size = (size_t)(M * K / BLOCK_SIZE) * BLOCK_SIZE_Q4_0;
    // size_t B_size = (size_t)(N * K / BLOCK_SIZE) * BLOCK_SIZE_Q8_0;
    // size_t C_size = (size_t)(M * N) * sizeof(float);

    // Allocate 64-byte aligned buffers
    void  * A          = aligned_alloc(64, A_size);
    void  * B          = aligned_alloc(64, B_size);
    float * C_baseline = (float *)aligned_alloc(64, C_size);
    float * C_new      = (float *)aligned_alloc(64, C_size);

    if (!A || !B || !C_baseline || !C_new) {
        fprintf(stderr, "ERROR: allocation failed\n");
        return 1;
    }

    fill_random(A, A_size);
    fill_random(B, B_size);
    memset(C_baseline, 0, C_size);
    memset(C_new,      0, C_size);

    printf("===========================================\n");
    printf("  GEMM kernel benchmark (RISC-V / RVV)\n");
    printf("===========================================\n");
    printf("  M=%d  N=%d  K=%d\n", M, N, K);
    printf("  Iterations : %d\n", ITERATIONS);
    printf("  Warmup     : %d\n\n", WARMUP);

    // ---------------------------------------------------
    // Baseline: original 4x8 kernel from repack.cpp
    // ---------------------------------------------------
    for (int i = 0; i < WARMUP; i++)
        ggml_gemm_q4_0_8x8_q8_0(K, C_baseline, (size_t)N, A, B, M, N);

    clock_gettime(CLOCK_MONOTONIC, &t0);
    for (int i = 0; i < ITERATIONS; i++)
        ggml_gemm_q4_0_8x8_q8_0_4x16(K, C_new, (size_t)N, A, B, M, N);
    clock_gettime(CLOCK_MONOTONIC, &t1);

    baseline_ns = (NS(t1) - NS(t0)) / ITERATIONS;
    printf("  4x8  original : %7lld ns/call\n", baseline_ns);

    // ---------------------------------------------------
    // New: 4x16 tile kernel from repack_4x16.cpp
    // ---------------------------------------------------
    for (int i = 0; i < WARMUP; i++)
        ggml_gemm_q4_0_8x8_q8_0(K, C_baseline, (size_t)N, A, B, M, N);

    clock_gettime(CLOCK_MONOTONIC, &t0);
    for (int i = 0; i < ITERATIONS; i++)
        ggml_gemm_q4_0_8x8_q8_0_4x16(K, C_new, (size_t)N, A, B, M, N);
    clock_gettime(CLOCK_MONOTONIC, &t1);

    new_ns = (NS(t1) - NS(t0)) / ITERATIONS;
    printf("  4x16 two-pass : %7lld ns/call\n\n", new_ns);

    // ---------------------------------------------------
    // Summary
    // ---------------------------------------------------
    double speedup = (double)baseline_ns / (double)new_ns;
    double pct     = (speedup - 1.0) * 100.0;

    printf("  Speedup : %.3fx  (%+.1f%%)\n", speedup, pct);

    if (speedup > 1.05)
        printf("  Result  : 4x16 is FASTER - candidate for merge\n\n");
    else if (speedup < 0.95)
        printf("  Result  : 4x16 is SLOWER - discard\n\n");
    else
        printf("  Result  : within noise margin - inconclusive\n\n");

    // ---------------------------------------------------
    // Numerical sanity check
    // Both kernels must produce the same output
    // ---------------------------------------------------
    double max_diff = 0.0;
    int    max_idx  = 0;

    for (int i = 0; i < M * N; i++) {
        double diff = fabs((double)C_baseline[i] - (double)C_new[i]);
        if (diff > max_diff) {
            max_diff = diff;
            max_idx  = i;
        }
    }

    printf("  Max output diff : %e at index %d  %s\n",
           max_diff, max_idx,
           max_diff < 1e-3 ? "(OK)" : "(WARNING: mismatch - check your kernel!)");

    printf("===========================================\n");

    free(A);
    free(B);
    free(C_baseline);
    free(C_new);

    return 0;
}