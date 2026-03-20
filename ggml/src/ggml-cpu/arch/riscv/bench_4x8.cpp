// bench_4x8.cpp
// gem5 driver for the 4x8 baseline kernel only.
// No timing calls — all measurements come from m5out/stats.txt.
//
// Build (static binary required for gem5 SE mode):
// riscv64-linux-gnu-g++ \
//   -O3 -march=rv64gcv_zvl256b -mabi=lp64d -std=gnu++17 -static \
//   -I/home/paddymac/llama.cpp/ggml/include \
//   -I/home/paddymac/llama.cpp/ggml/src \
//   -I/home/paddymac/llama.cpp/ggml/src/ggml-cpu \
//   -I/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv \
//   -I/home/paddymac/llama.cpp/include \
//   bench_4x8.cpp repack.cpp repack_4x16.cpp -lm -o bench_4x8
//
// Run with gem5:
// ./build/RISCV/gem5.opt configs/deprecated/example/se.py \
//   --cpu-type=MinorCPU --caches \
//   --l1d_size=32kB --l1i_size=32kB \
//   --l2cache --l2_size=512kB \
//   --sys-clock=1.5GHz --cpu-clock=1.5GHz \
//   --cmd=$(pwd)/bench_4x8
// cp m5out/stats.txt m5out/stats_4x8.txt

#define GGML_COMMON_DECL_C
#define GGML_COMMON_DECL_CPP
#include "ggml-common.h"
#include "../../repack.h"
#include "ggml.h"

#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdio.h>

// ── Kernel declaration ────────────────────────────────────────────────────────
extern "C" void ggml_gemm_q4_0_8x8_q8_0(
    int n, float * GGML_RESTRICT s, size_t bs,
    const void * GGML_RESTRICT vx,
    const void * GGML_RESTRICT vy,
    int nr, int nc);

// ── ggml stubs ────────────────────────────────────────────────────────────────
// fp16->fp32 lookup table used by GGML_CPU_FP16_TO_FP32 inside the kernel
float ggml_table_f32_f16[65536];

// Generic fallbacks — abort if called, which means the RVV guard failed
extern "C" void ggml_gemm_q4_0_8x8_q8_0_generic(
        int, float *, size_t, const void *, const void *, int, int) {
    fprintf(stderr, "ERROR: generic GEMM fallback called\n");
    abort();
}

extern "C" void ggml_gemv_q4_0_8x8_q8_0_generic(
        int, float *, size_t, const void *, const void *, int, int) {
    fprintf(stderr, "ERROR: generic GEMV fallback called\n");
    abort();
}

// ── fp16 table initialisation ─────────────────────────────────────────────────
static void init_fp16_table(void) {
    // Fill with a constant fp32 value of 1.0 (bit pattern 0x3F800000)
    // Correctness does not matter for gem5 cycle counting —
    // we only need the kernel to execute its full instruction sequence.
    uint32_t one = 0x3F800000;
    for (int i = 0; i < 65536; i++)
        memcpy(&ggml_table_f32_f16[i], &one, sizeof(float));
}

// ── Shape: Qwen2.5-0.5B attention projection ─────────────────────────────────
// M=4  (minimum tile size — single decode step or start of prefill)
// N=896 (hidden dimension)
// K=896 (hidden dimension)
#define M          4
#define N          896
#define K          896
#define BLOCK_SIZE 32
#define WARMUP     10    // discard cold cache effects
#define ITERS      50   // keep gem5 runtime manageable

int main(void) {
    init_fp16_table();
    srand(42);

    const int nb  = K / BLOCK_SIZE;

    // vx = weight matrix:     (N/8) groups x nb blocks of block_q4_0x8
    // vy = activation matrix: (M/4) groups x nb blocks of block_q8_0x4
    size_t A_size = (size_t)(N / 8) * nb * sizeof(block_q4_0x8);
    size_t B_size = (size_t)(M / 4) * nb * sizeof(block_q8_0x4);
    size_t C_size = (size_t)(M * N) * sizeof(float);

    void  * A = aligned_alloc(64, A_size);
    void  * B = aligned_alloc(64, B_size);
    float * C = (float *)aligned_alloc(64, C_size);

    if (!A || !B || !C) {
        fprintf(stderr, "ERROR: allocation failed\n");
        return 1;
    }

    // Fill with deterministic random data
    uint8_t *pa = (uint8_t *)A;
    uint8_t *pb = (uint8_t *)B;
    for (size_t i = 0; i < A_size; i++) pa[i] = (uint8_t)(rand() & 0xFF);
    for (size_t i = 0; i < B_size; i++) pb[i] = (uint8_t)(rand() & 0xFF);

    // ── Warmup — not counted in gem5 stats (stats reset is not used here,
    //    so keep warmup small; gem5 stats cover the whole run including warmup)
    memset(C, 0, C_size);
    for (int i = 0; i < WARMUP; i++)
        ggml_gemm_q4_0_8x8_q8_0(K, C, (size_t)N, A, B, M, N);

    // ── Timed region — gem5 accumulates stats across all iterations
    memset(C, 0, C_size);
    for (int i = 0; i < ITERS; i++)
        ggml_gemm_q4_0_8x8_q8_0(K, C, (size_t)N, A, B, M, N);

    // Prevent dead-code elimination — use one output value
    volatile float sink = C[0];
    (void)sink;

    free(A); free(B); free(C);
    return 0;
}
