// repack_4x16_amortised.cpp
//
// 4×16 tile kernel with TRUE A amortisation.
//
// KEY DIFFERENCE from the two-pass version:
//   Two-pass (old): two separate K-loops → A loaded TWICE per row per K-block
//   Interleaved (new): one K-loop, both column groups processed per row
//                      → A loaded ONCE per row per K-block
//
// REGISTER BUDGET (VLEN=256, peak inside MAC chain):
//
//   sumf0..7      f32m1 × 8   =  8 phys regs  (persistent, full x-loop)
//   lhs_0..3      i8m2  × 4   =  8 phys regs  (live across both passes, one row)
//   rhs halves    i8m2  × 4   =  8 phys regs  (one pass at a time)
//   MAC acc       i16m4 × 1   =  4 phys regs  (one pass at a time)
//   b_scales_vec  f32m1 × 1   =  1 phys reg   (one pass at a time)
//   ─────────────────────────────────────────────────────────────────
//   Peak total                = 29 of 32      (3 spare)
//
// The two-pass RHS registers (rhs0 and rhs1) are NEVER simultaneously live —
// rhs0 is fully consumed and freed before rhs1 is loaded.
// The LHS registers lhs_0..3 ARE live across both passes for the same row,
// which is what enables A amortisation without blowing the register budget.

#include "ggml-impl.h"
#define GGML_CPU_CLANG_WORKAROUND
#include "../../repack.h"
#include "ggml-common.h"
#include "ggml-cpu-impl.h"
#include "repack_4x16.h"
#include "ggml-cpu.h"
#include "simd-mappings.h"

#ifndef UNUSED
#define UNUSED(x) (void)(x)
#endif

// ---------------------------------------------------------------------------
// Inline reduction: i16m4 (64 lanes) → i32m1 (8 lanes)
//
// Uses three rounds of reinterpret + narrow + add to fold pairs of adjacent
// lanes together without any horizontal-add instruction (RVV has none).
//
// Round 1:  64 i16  →  32 u16  (reinterpret as u32m4, vnsrl(0/16), vadd)
// Round 2:  32 u16  →  16 u16  (reinterpret as u32m2, vnsrl(0/16), vadd)
// Round 3:  16 u16  →   8 i32  (reinterpret as u32m1, vnsrl(0/16) as i16mf2,
//                               vwadd widening to i32)
// ---------------------------------------------------------------------------
static inline vint32m1_t reduce_i16m4_to_i32m1(vint16m4_t acc, size_t vl)
{
    const vuint32m4_t si32  = __riscv_vreinterpret_v_i32m4_u32m4(
                               __riscv_vreinterpret_v_i16m4_i32m4(acc));

    const vuint16m2_t h2_0  = __riscv_vnsrl_wx_u16m2(si32, 0,  vl);
    const vuint16m2_t h2_1  = __riscv_vnsrl_wx_u16m2(si32, 16, vl);
    const vuint16m2_t h2    = __riscv_vadd_vv_u16m2(h2_0, h2_1, vl);

    const vuint32m2_t h2i32 = __riscv_vreinterpret_v_u16m2_u32m2(h2);
    const vuint16m1_t h4_0  = __riscv_vnsrl_wx_u16m1(h2i32, 0,  vl / 2);
    const vuint16m1_t h4_1  = __riscv_vnsrl_wx_u16m1(h2i32, 16, vl / 2);
    const vuint16m1_t h4    = __riscv_vadd_vv_u16m1(h4_0, h4_1, vl / 2);

    const vuint32m1_t h4i32 = __riscv_vreinterpret_v_u16m1_u32m1(h4);
    const vint16mf2_t h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(
                               __riscv_vnsrl_wx_u16mf2(h4i32, 0,  vl / 4));
    const vint16mf2_t h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(
                               __riscv_vnsrl_wx_u16mf2(h4i32, 16, vl / 4));
    return __riscv_vwadd_vv_i32m1(h8_0, h8_1, vl / 4);
}

#ifdef __cplusplus
extern "C" {
#endif

void ggml_gemm_q4_0_8x8_q8_0_4x16(
        int n,
        float       * GGML_RESTRICT s,
        size_t        bs,
        const void  * GGML_RESTRICT vx,
        const void  * GGML_RESTRICT vy,
        int nr, int nc)
{
    const int qk               = QK8_0;          // 32
    const int nb               = n / qk;
    const int ncols_interleaved = 8;

    assert(n  % qk  == 0);
    assert(nr % 4   == 0);
    assert(nc % ncols_interleaved == 0);

    UNUSED(s); UNUSED(bs); UNUSED(vx); UNUSED(vy);
    UNUSED(nr); UNUSED(nc); UNUSED(nb); UNUSED(ncols_interleaved);

#if defined __riscv_v
    if (__riscv_vlenb() >= QK4_0) {

        // vl = 32 throughout.  Derived constants:
        //   vl*4  = 128  → bytes in one block_q4_0x8.qs (RHS load width)
        //   vl*2  =  64  → element count for i8m2→i16m4 widening MACs
        //   vl/4  =   8  → float32 lanes per sumf register (one per B column)
        const size_t vl = QK4_0;

        // ── 4×16 interleaved path ─────────────────────────────────────────
        // Requires nc divisible by 16.
        // Each x-step advances by 2 (covering two block_q4_0x8 column groups,
        // i.e. 16 output columns).
        if (nc % 16 == 0) {

            for (int y = 0; y < nr / 4; y++) {
                const block_q8_0x4 * a_ptr =
                    (const block_q8_0x4 *) vy + (y * nb);

                // x steps by 2: each iteration covers columns x and x+1
                for (int x = 0; x < nc / ncols_interleaved; x += 2) {

                    // Two consecutive block_q4_0x8 column groups
                    const block_q4_0x8 * b_ptr0 =
                        (const block_q4_0x8 *) vx + (x     * nb);
                    const block_q4_0x8 * b_ptr1 =
                        (const block_q4_0x8 *) vx + ((x+1) * nb);

                    // ── Float32 output accumulators ───────────────────────
                    // sumf0-3: rows 0-3, column group x   (cols 0-7 of tile)
                    // sumf4-7: rows 0-3, column group x+1 (cols 8-15 of tile)
                    //
                    // All 8 are initialised here and persist across the full
                    // K-loop (nb iterations). They are never written to memory
                    // until the store block at the end.
                    //
                    // Each sumf is an f32m1 with vl/4 = 8 lanes — one lane
                    // per output column within the group.
                    vfloat32m1_t sumf0 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                    vfloat32m1_t sumf1 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                    vfloat32m1_t sumf2 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                    vfloat32m1_t sumf3 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                    vfloat32m1_t sumf4 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                    vfloat32m1_t sumf5 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                    vfloat32m1_t sumf6 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                    vfloat32m1_t sumf7 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);

                    // ── Single interleaved K-loop ─────────────────────────
                    // For each K-block we process all 4 rows, and for each
                    // row we process both column groups before moving on.
                    // This means A is loaded ONCE per row per K-block.
                    for (int l = 0; l < nb; l++) {

                        // A scales — loaded once, used by both column groups
                        const float a_scales[4] = {
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[0]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[1]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[2]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[3])
                        };

                        // ══════════════════════════════════════════════════
                        // ROW 0
                        // block_q8_0x4 interleaves 4 rows in 8-byte chunks.
                        // Row 0 bytes: offsets 0, 32, 64, 96.
                        // Each is read as one int64 (8 bytes = 8 i8 elements).
                        // ══════════════════════════════════════════════════
                        {
                            const int64_t A0 = *(const int64_t *)&a_ptr[l].qs[0];
                            const int64_t A4 = *(const int64_t *)&a_ptr[l].qs[32];
                            const int64_t A8 = *(const int64_t *)&a_ptr[l].qs[64];
                            const int64_t Ac = *(const int64_t *)&a_ptr[l].qs[96];
                            // Barrier: prevents GCC emitting a fused strided
                            // load (vlse64) which would violate alignment.
                            __asm__ __volatile__("" ::: "memory");

                            // Broadcast trick:
                            // vmv_v_x_i64m2(A0, 8) fills 8 i64 lanes with A0.
                            // Reinterpreted as i8m2 → 64 i8 lanes where the
                            // same 8 bytes repeat 8 times (one copy per B col).
                            // This lets a single vwmul compute all 8 column
                            // dot-products simultaneously.
                            const vint8m2_t lhs_0 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A0, vl/4));
                            const vint8m2_t lhs_1 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A4, vl/4));
                            const vint8m2_t lhs_2 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A8, vl/4));
                            const vint8m2_t lhs_3 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(Ac, vl/4));
                            // lhs_0..3 occupy 8 physical registers and remain
                            // live across BOTH passes below. This is the key
                            // to A amortisation — they are not reloaded for
                            // the second column group.

                            // ── Row 0, Pass 1: column group x ────────────
                            // Register peak here:
                            //   sumf0-7  (8) + lhs_0-3 (8) + rhs (8) +
                            //   MAC acc  (4) + b_scales (1) = 29 of 32
                            {
                                // Load and unpack 128 bytes of 4-bit weights.
                                // Each packed byte holds two nibbles (lo, hi).
                                // Sign-extend each nibble to i8 via arithmetic
                                // shift: lo = (x<<4)>>4,  hi = x>>4
                                const vint8m4_t rhs_raw  = __riscv_vle8_v_i8m4(
                                    (const int8_t *)b_ptr0[l].qs, vl*4);
                                const vint8m4_t rhs_lo   = __riscv_vsra_vx_i8m4(
                                    __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                                const vint8m4_t rhs_hi   = __riscv_vsra_vx_i8m4(
                                    rhs_raw, 4, vl*4);

                                // Split i8m4 into two i8m2 halves:
                                //   _0 = cols 0-3,  _1 = cols 4-7
                                const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                                const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                                const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                                const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);

                                // B column scales — loaded as f32m1 (8 lanes)
                                const float b0_s[8] = {
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[0]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[1]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[2]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[3]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[4]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[5]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[6]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[7])
                                };
                                const vfloat32m1_t b0sv = __riscv_vle32_v_f32m1(b0_s, vl/4);

                                // 4-step widening MAC chain.
                                // Each step covers 8 K-elements across all 8 B columns:
                                //   mac0: lo nibbles cols 0-3 × A elems 0-7
                                //   mac1: lo nibbles cols 4-7 × A elems 8-15
                                //   mac2: hi nibbles cols 0-3 × A elems 16-23
                                //   mac3: hi nibbles cols 4-7 × A elems 24-31
                                // Result: i16m4 with 64 lanes of i16 partial sums
                                const vint16m4_t mac0 = __riscv_vwmul_vv_i16m4(
                                    rhs_lo_0, lhs_0, vl*2);
                                const vint16m4_t mac1 = __riscv_vwmacc_vv_i16m4(
                                    mac0, rhs_lo_1, lhs_1, vl*2);
                                const vint16m4_t mac2 = __riscv_vwmacc_vv_i16m4(
                                    mac1, rhs_hi_0, lhs_2, vl*2);
                                const vint16m4_t mac3 = __riscv_vwmacc_vv_i16m4(
                                    mac2, rhs_hi_1, lhs_3, vl*2);

                                // Reduce 64 i16 → 8 i32, convert to f32,
                                // scale by A row scale and B col scales,
                                // accumulate into sumf0
                                const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(
                                    reduce_i16m4_to_i32m1(mac3, vl), vl/4);
                                sumf0 = __riscv_vfmacc_vv_f32m1(sumf0,
                                    __riscv_vfmul_vf_f32m1(facc, a_scales[0], vl/4),
                                    b0sv, vl/4);
                            }
                            // rhs0 halves, MAC acc, b0sv all freed at end of
                            // block above. lhs_0..3 remain live.

                            // ── Row 0, Pass 2: column group x+1 ──────────
                            // lhs_0..3 are reused here without reloading.
                            // Register peak identical to pass 1: 29 of 32.
                            {
                                const vint8m4_t rhs_raw  = __riscv_vle8_v_i8m4(
                                    (const int8_t *)b_ptr1[l].qs, vl*4);
                                const vint8m4_t rhs_lo   = __riscv_vsra_vx_i8m4(
                                    __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                                const vint8m4_t rhs_hi   = __riscv_vsra_vx_i8m4(
                                    rhs_raw, 4, vl*4);
                                const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                                const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                                const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                                const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);

                                const float b1_s[8] = {
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[0]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[1]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[2]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[3]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[4]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[5]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[6]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[7])
                                };
                                const vfloat32m1_t b1sv = __riscv_vle32_v_f32m1(b1_s, vl/4);

                                const vint16m4_t mac0 = __riscv_vwmul_vv_i16m4(
                                    rhs_lo_0, lhs_0, vl*2);
                                const vint16m4_t mac1 = __riscv_vwmacc_vv_i16m4(
                                    mac0, rhs_lo_1, lhs_1, vl*2);
                                const vint16m4_t mac2 = __riscv_vwmacc_vv_i16m4(
                                    mac1, rhs_hi_0, lhs_2, vl*2);
                                const vint16m4_t mac3 = __riscv_vwmacc_vv_i16m4(
                                    mac2, rhs_hi_1, lhs_3, vl*2);

                                const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(
                                    reduce_i16m4_to_i32m1(mac3, vl), vl/4);
                                sumf4 = __riscv_vfmacc_vv_f32m1(sumf4,
                                    __riscv_vfmul_vf_f32m1(facc, a_scales[0], vl/4),
                                    b1sv, vl/4);
                            }
                            // lhs_0..3 freed here — row 0 done
                        }

                        // ══════════════════════════════════════════════════
                        // ROW 1  (offsets 8, 40, 72, 104)
                        // ══════════════════════════════════════════════════
                        {
                            const int64_t A1 = *(const int64_t *)&a_ptr[l].qs[8];
                            const int64_t A5 = *(const int64_t *)&a_ptr[l].qs[40];
                            const int64_t A9 = *(const int64_t *)&a_ptr[l].qs[72];
                            const int64_t Ad = *(const int64_t *)&a_ptr[l].qs[104];
                            __asm__ __volatile__("" ::: "memory");

                            const vint8m2_t lhs_0 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A1, vl/4));
                            const vint8m2_t lhs_1 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A5, vl/4));
                            const vint8m2_t lhs_2 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A9, vl/4));
                            const vint8m2_t lhs_3 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(Ad, vl/4));

                            // Pass 1: column group x → sumf1
                            {
                                const vint8m4_t rhs_raw  = __riscv_vle8_v_i8m4(
                                    (const int8_t *)b_ptr0[l].qs, vl*4);
                                const vint8m4_t rhs_lo   = __riscv_vsra_vx_i8m4(
                                    __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                                const vint8m4_t rhs_hi   = __riscv_vsra_vx_i8m4(
                                    rhs_raw, 4, vl*4);
                                const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                                const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                                const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                                const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);
                                const float b0_s[8] = {
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[0]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[1]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[2]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[3]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[4]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[5]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[6]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[7])
                                };
                                const vfloat32m1_t b0sv = __riscv_vle32_v_f32m1(b0_s, vl/4);
                                const vint16m4_t mac0 = __riscv_vwmul_vv_i16m4(rhs_lo_0, lhs_0, vl*2);
                                const vint16m4_t mac1 = __riscv_vwmacc_vv_i16m4(mac0, rhs_lo_1, lhs_1, vl*2);
                                const vint16m4_t mac2 = __riscv_vwmacc_vv_i16m4(mac1, rhs_hi_0, lhs_2, vl*2);
                                const vint16m4_t mac3 = __riscv_vwmacc_vv_i16m4(mac2, rhs_hi_1, lhs_3, vl*2);
                                const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(
                                    reduce_i16m4_to_i32m1(mac3, vl), vl/4);
                                sumf1 = __riscv_vfmacc_vv_f32m1(sumf1,
                                    __riscv_vfmul_vf_f32m1(facc, a_scales[1], vl/4),
                                    b0sv, vl/4);
                            }

                            // Pass 2: column group x+1 → sumf5
                            {
                                const vint8m4_t rhs_raw  = __riscv_vle8_v_i8m4(
                                    (const int8_t *)b_ptr1[l].qs, vl*4);
                                const vint8m4_t rhs_lo   = __riscv_vsra_vx_i8m4(
                                    __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                                const vint8m4_t rhs_hi   = __riscv_vsra_vx_i8m4(
                                    rhs_raw, 4, vl*4);
                                const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                                const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                                const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                                const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);
                                const float b1_s[8] = {
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[0]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[1]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[2]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[3]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[4]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[5]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[6]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[7])
                                };
                                const vfloat32m1_t b1sv = __riscv_vle32_v_f32m1(b1_s, vl/4);
                                const vint16m4_t mac0 = __riscv_vwmul_vv_i16m4(rhs_lo_0, lhs_0, vl*2);
                                const vint16m4_t mac1 = __riscv_vwmacc_vv_i16m4(mac0, rhs_lo_1, lhs_1, vl*2);
                                const vint16m4_t mac2 = __riscv_vwmacc_vv_i16m4(mac1, rhs_hi_0, lhs_2, vl*2);
                                const vint16m4_t mac3 = __riscv_vwmacc_vv_i16m4(mac2, rhs_hi_1, lhs_3, vl*2);
                                const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(
                                    reduce_i16m4_to_i32m1(mac3, vl), vl/4);
                                sumf5 = __riscv_vfmacc_vv_f32m1(sumf5,
                                    __riscv_vfmul_vf_f32m1(facc, a_scales[1], vl/4),
                                    b1sv, vl/4);
                            }
                        }

                        // ══════════════════════════════════════════════════
                        // ROW 2  (offsets 16, 48, 80, 112)
                        // ══════════════════════════════════════════════════
                        {
                            const int64_t A2 = *(const int64_t *)&a_ptr[l].qs[16];
                            const int64_t A6 = *(const int64_t *)&a_ptr[l].qs[48];
                            const int64_t Aa = *(const int64_t *)&a_ptr[l].qs[80];
                            const int64_t Ae = *(const int64_t *)&a_ptr[l].qs[112];
                            __asm__ __volatile__("" ::: "memory");

                            const vint8m2_t lhs_0 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A2, vl/4));
                            const vint8m2_t lhs_1 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A6, vl/4));
                            const vint8m2_t lhs_2 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(Aa, vl/4));
                            const vint8m2_t lhs_3 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(Ae, vl/4));

                            // Pass 1 → sumf2
                            {
                                const vint8m4_t rhs_raw  = __riscv_vle8_v_i8m4(
                                    (const int8_t *)b_ptr0[l].qs, vl*4);
                                const vint8m4_t rhs_lo   = __riscv_vsra_vx_i8m4(
                                    __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                                const vint8m4_t rhs_hi   = __riscv_vsra_vx_i8m4(rhs_raw, 4, vl*4);
                                const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                                const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                                const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                                const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);
                                const float b0_s[8] = {
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[0]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[1]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[2]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[3]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[4]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[5]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[6]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[7])
                                };
                                const vfloat32m1_t b0sv = __riscv_vle32_v_f32m1(b0_s, vl/4);
                                const vint16m4_t mac0 = __riscv_vwmul_vv_i16m4(rhs_lo_0, lhs_0, vl*2);
                                const vint16m4_t mac1 = __riscv_vwmacc_vv_i16m4(mac0, rhs_lo_1, lhs_1, vl*2);
                                const vint16m4_t mac2 = __riscv_vwmacc_vv_i16m4(mac1, rhs_hi_0, lhs_2, vl*2);
                                const vint16m4_t mac3 = __riscv_vwmacc_vv_i16m4(mac2, rhs_hi_1, lhs_3, vl*2);
                                const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(
                                    reduce_i16m4_to_i32m1(mac3, vl), vl/4);
                                sumf2 = __riscv_vfmacc_vv_f32m1(sumf2,
                                    __riscv_vfmul_vf_f32m1(facc, a_scales[2], vl/4),
                                    b0sv, vl/4);
                            }

                            // Pass 2 → sumf6
                            {
                                const vint8m4_t rhs_raw  = __riscv_vle8_v_i8m4(
                                    (const int8_t *)b_ptr1[l].qs, vl*4);
                                const vint8m4_t rhs_lo   = __riscv_vsra_vx_i8m4(
                                    __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                                const vint8m4_t rhs_hi   = __riscv_vsra_vx_i8m4(rhs_raw, 4, vl*4);
                                const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                                const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                                const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                                const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);
                                const float b1_s[8] = {
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[0]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[1]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[2]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[3]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[4]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[5]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[6]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[7])
                                };
                                const vfloat32m1_t b1sv = __riscv_vle32_v_f32m1(b1_s, vl/4);
                                const vint16m4_t mac0 = __riscv_vwmul_vv_i16m4(rhs_lo_0, lhs_0, vl*2);
                                const vint16m4_t mac1 = __riscv_vwmacc_vv_i16m4(mac0, rhs_lo_1, lhs_1, vl*2);
                                const vint16m4_t mac2 = __riscv_vwmacc_vv_i16m4(mac1, rhs_hi_0, lhs_2, vl*2);
                                const vint16m4_t mac3 = __riscv_vwmacc_vv_i16m4(mac2, rhs_hi_1, lhs_3, vl*2);
                                const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(
                                    reduce_i16m4_to_i32m1(mac3, vl), vl/4);
                                sumf6 = __riscv_vfmacc_vv_f32m1(sumf6,
                                    __riscv_vfmul_vf_f32m1(facc, a_scales[2], vl/4),
                                    b1sv, vl/4);
                            }
                        }

                        // ══════════════════════════════════════════════════
                        // ROW 3  (offsets 24, 56, 88, 120)
                        // ══════════════════════════════════════════════════
                        {
                            const int64_t A3 = *(const int64_t *)&a_ptr[l].qs[24];
                            const int64_t A7 = *(const int64_t *)&a_ptr[l].qs[56];
                            const int64_t Ab = *(const int64_t *)&a_ptr[l].qs[88];
                            const int64_t Af = *(const int64_t *)&a_ptr[l].qs[120];
                            __asm__ __volatile__("" ::: "memory");

                            const vint8m2_t lhs_0 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A3, vl/4));
                            const vint8m2_t lhs_1 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(A7, vl/4));
                            const vint8m2_t lhs_2 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(Ab, vl/4));
                            const vint8m2_t lhs_3 = __riscv_vreinterpret_v_i64m2_i8m2(
                                                     __riscv_vmv_v_x_i64m2(Af, vl/4));

                            // Pass 1 → sumf3
                            {
                                const vint8m4_t rhs_raw  = __riscv_vle8_v_i8m4(
                                    (const int8_t *)b_ptr0[l].qs, vl*4);
                                const vint8m4_t rhs_lo   = __riscv_vsra_vx_i8m4(
                                    __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                                const vint8m4_t rhs_hi   = __riscv_vsra_vx_i8m4(rhs_raw, 4, vl*4);
                                const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                                const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                                const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                                const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);
                                const float b0_s[8] = {
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[0]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[1]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[2]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[3]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[4]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[5]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[6]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[7])
                                };
                                const vfloat32m1_t b0sv = __riscv_vle32_v_f32m1(b0_s, vl/4);
                                const vint16m4_t mac0 = __riscv_vwmul_vv_i16m4(rhs_lo_0, lhs_0, vl*2);
                                const vint16m4_t mac1 = __riscv_vwmacc_vv_i16m4(mac0, rhs_lo_1, lhs_1, vl*2);
                                const vint16m4_t mac2 = __riscv_vwmacc_vv_i16m4(mac1, rhs_hi_0, lhs_2, vl*2);
                                const vint16m4_t mac3 = __riscv_vwmacc_vv_i16m4(mac2, rhs_hi_1, lhs_3, vl*2);
                                const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(
                                    reduce_i16m4_to_i32m1(mac3, vl), vl/4);
                                sumf3 = __riscv_vfmacc_vv_f32m1(sumf3,
                                    __riscv_vfmul_vf_f32m1(facc, a_scales[3], vl/4),
                                    b0sv, vl/4);
                            }

                            // Pass 2 → sumf7
                            {
                                const vint8m4_t rhs_raw  = __riscv_vle8_v_i8m4(
                                    (const int8_t *)b_ptr1[l].qs, vl*4);
                                const vint8m4_t rhs_lo   = __riscv_vsra_vx_i8m4(
                                    __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                                const vint8m4_t rhs_hi   = __riscv_vsra_vx_i8m4(rhs_raw, 4, vl*4);
                                const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                                const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                                const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                                const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);
                                const float b1_s[8] = {
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[0]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[1]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[2]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[3]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[4]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[5]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[6]),
                                    GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[7])
                                };
                                const vfloat32m1_t b1sv = __riscv_vle32_v_f32m1(b1_s, vl/4);
                                const vint16m4_t mac0 = __riscv_vwmul_vv_i16m4(rhs_lo_0, lhs_0, vl*2);
                                const vint16m4_t mac1 = __riscv_vwmacc_vv_i16m4(mac0, rhs_lo_1, lhs_1, vl*2);
                                const vint16m4_t mac2 = __riscv_vwmacc_vv_i16m4(mac1, rhs_hi_0, lhs_2, vl*2);
                                const vint16m4_t mac3 = __riscv_vwmacc_vv_i16m4(mac2, rhs_hi_1, lhs_3, vl*2);
                                const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(
                                    reduce_i16m4_to_i32m1(mac3, vl), vl/4);
                                sumf7 = __riscv_vfmacc_vv_f32m1(sumf7,
                                    __riscv_vfmul_vf_f32m1(facc, a_scales[3], vl/4),
                                    b1sv, vl/4);
                            }
                        }

                    } // end K-loop (l)

                    // ── Store 4 rows × 16 columns ─────────────────────────
                    // Two vse32 per row: first 8 columns (sumf0-3),
                    // then next 8 columns (sumf4-7).
                    // bs = row stride of output matrix s.
                    __riscv_vse32_v_f32m1(&s[(y*4+0)*bs +  x    *ncols_interleaved], sumf0, vl/4);
                    __riscv_vse32_v_f32m1(&s[(y*4+0)*bs + (x+1) *ncols_interleaved], sumf4, vl/4);
                    __riscv_vse32_v_f32m1(&s[(y*4+1)*bs +  x    *ncols_interleaved], sumf1, vl/4);
                    __riscv_vse32_v_f32m1(&s[(y*4+1)*bs + (x+1) *ncols_interleaved], sumf5, vl/4);
                    __riscv_vse32_v_f32m1(&s[(y*4+2)*bs +  x    *ncols_interleaved], sumf2, vl/4);
                    __riscv_vse32_v_f32m1(&s[(y*4+2)*bs + (x+1) *ncols_interleaved], sumf6, vl/4);
                    __riscv_vse32_v_f32m1(&s[(y*4+3)*bs +  x    *ncols_interleaved], sumf3, vl/4);
                    __riscv_vse32_v_f32m1(&s[(y*4+3)*bs + (x+1) *ncols_interleaved], sumf7, vl/4);

                } // end x-loop
            } // end y-loop

            return;
        } // end nc%16 branch

        // ── Fallback: original 4×8 path when nc not divisible by 16 ──────
        for (int y = 0; y < nr / 4; y++) {
            const block_q8_0x4 * a_ptr = (const block_q8_0x4 *) vy + (y * nb);
            for (int x = 0; x < nc / ncols_interleaved; x++) {
                const block_q4_0x8 * b_ptr = (const block_q4_0x8 *) vx + (x * nb);
                vfloat32m1_t sumf0 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                vfloat32m1_t sumf1 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                vfloat32m1_t sumf2 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                vfloat32m1_t sumf3 = __riscv_vfmv_v_f_f32m1(0.0f, vl/4);
                for (int l = 0; l < nb; l++) {
                    const vint8m4_t rhs_raw = __riscv_vle8_v_i8m4(
                        (const int8_t *)b_ptr[l].qs, vl*4);
                    const vint8m4_t rhs_lo = __riscv_vsra_vx_i8m4(
                        __riscv_vsll_vx_i8m4(rhs_raw, 4, vl*4), 4, vl*4);
                    const vint8m4_t rhs_hi = __riscv_vsra_vx_i8m4(rhs_raw, 4, vl*4);
                    const vint8m2_t rhs_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 0);
                    const vint8m2_t rhs_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_lo, 1);
                    const vint8m2_t rhs_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 0);
                    const vint8m2_t rhs_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_hi, 1);
                    const float a_scales[4] = {
                        GGML_CPU_FP16_TO_FP32(a_ptr[l].d[0]),
                        GGML_CPU_FP16_TO_FP32(a_ptr[l].d[1]),
                        GGML_CPU_FP16_TO_FP32(a_ptr[l].d[2]),
                        GGML_CPU_FP16_TO_FP32(a_ptr[l].d[3])
                    };
                    const float b_s[8] = {
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[0]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[1]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[2]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[3]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[4]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[5]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[6]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[7])
                    };
                    const vfloat32m1_t bsv = __riscv_vle32_v_f32m1(b_s, vl/4);

                    #define DO_ROW(lhs_a, lhs_b, lhs_c, lhs_d, ascale, sumfN)          \
                    {                                                                    \
                        const vint8m2_t l0 = __riscv_vreinterpret_v_i64m2_i8m2(        \
                            __riscv_vmv_v_x_i64m2(lhs_a, vl/4));                       \
                        const vint8m2_t l1 = __riscv_vreinterpret_v_i64m2_i8m2(        \
                            __riscv_vmv_v_x_i64m2(lhs_b, vl/4));                       \
                        const vint8m2_t l2 = __riscv_vreinterpret_v_i64m2_i8m2(        \
                            __riscv_vmv_v_x_i64m2(lhs_c, vl/4));                       \
                        const vint8m2_t l3 = __riscv_vreinterpret_v_i64m2_i8m2(        \
                            __riscv_vmv_v_x_i64m2(lhs_d, vl/4));                       \
                        const vint16m4_t m0 = __riscv_vwmul_vv_i16m4(rhs_lo_0,l0,vl*2); \
                        const vint16m4_t m1 = __riscv_vwmacc_vv_i16m4(m0,rhs_lo_1,l1,vl*2); \
                        const vint16m4_t m2 = __riscv_vwmacc_vv_i16m4(m1,rhs_hi_0,l2,vl*2); \
                        const vint16m4_t m3 = __riscv_vwmacc_vv_i16m4(m2,rhs_hi_1,l3,vl*2); \
                        const vfloat32m1_t fa = __riscv_vfcvt_f_x_v_f32m1(             \
                            reduce_i16m4_to_i32m1(m3, vl), vl/4);                      \
                        sumfN = __riscv_vfmacc_vv_f32m1(sumfN,                          \
                            __riscv_vfmul_vf_f32m1(fa, ascale, vl/4), bsv, vl/4);      \
                    }

                    const int64_t A0 = *(const int64_t *)&a_ptr[l].qs[0];
                    const int64_t A4 = *(const int64_t *)&a_ptr[l].qs[32];
                    const int64_t A8 = *(const int64_t *)&a_ptr[l].qs[64];
                    const int64_t Ac = *(const int64_t *)&a_ptr[l].qs[96];
                    __asm__ __volatile__("" ::: "memory");
                    DO_ROW(A0, A4, A8, Ac, a_scales[0], sumf0);

                    const int64_t A1 = *(const int64_t *)&a_ptr[l].qs[8];
                    const int64_t A5 = *(const int64_t *)&a_ptr[l].qs[40];
                    const int64_t A9 = *(const int64_t *)&a_ptr[l].qs[72];
                    const int64_t Ad = *(const int64_t *)&a_ptr[l].qs[104];
                    __asm__ __volatile__("" ::: "memory");
                    DO_ROW(A1, A5, A9, Ad, a_scales[1], sumf1);

                    const int64_t A2 = *(const int64_t *)&a_ptr[l].qs[16];
                    const int64_t A6 = *(const int64_t *)&a_ptr[l].qs[48];
                    const int64_t Aa = *(const int64_t *)&a_ptr[l].qs[80];
                    const int64_t Ae = *(const int64_t *)&a_ptr[l].qs[112];
                    __asm__ __volatile__("" ::: "memory");
                    DO_ROW(A2, A6, Aa, Ae, a_scales[2], sumf2);

                    const int64_t A3 = *(const int64_t *)&a_ptr[l].qs[24];
                    const int64_t A7 = *(const int64_t *)&a_ptr[l].qs[56];
                    const int64_t Ab = *(const int64_t *)&a_ptr[l].qs[88];
                    const int64_t Af = *(const int64_t *)&a_ptr[l].qs[120];
                    __asm__ __volatile__("" ::: "memory");
                    DO_ROW(A3, A7, Ab, Af, a_scales[3], sumf3);

                    #undef DO_ROW
                }
                __riscv_vse32_v_f32m1(&s[(y*4+0)*bs + x*ncols_interleaved], sumf0, vl/4);
                __riscv_vse32_v_f32m1(&s[(y*4+1)*bs + x*ncols_interleaved], sumf1, vl/4);
                __riscv_vse32_v_f32m1(&s[(y*4+2)*bs + x*ncols_interleaved], sumf2, vl/4);
                __riscv_vse32_v_f32m1(&s[(y*4+3)*bs + x*ncols_interleaved], sumf3, vl/4);
            }
        }
        return;
    }
#endif
    ggml_gemm_q4_0_8x8_q8_0_generic(n, s, bs, vx, vy, nr, nc);
}

#ifdef __cplusplus
} // extern "C"
#endif