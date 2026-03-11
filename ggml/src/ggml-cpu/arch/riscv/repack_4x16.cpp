// repack_4x16.cpp
// Only include what we need — do NOT define GGML_COMMON_IMPL_CPP here.
// That macro causes ggml-common.h to emit full implementations which
// duplicate symbols already compiled from repack.cpp.
#include "ggml-impl.h"
#define GGML_CPU_CLANG_WORKAROUND
#include "../../repack.h"
#include "ggml-common.h"
#include "ggml-cpu-impl.h"
#include "repack_4x16.h" 

#include "ggml-cpu.h"        // ← adds GGML_CPU_FP16_TO_FP32
#include "simd-mappings.h"   // ← adds UNUSED

#ifndef UNUSED
#define UNUSED(x) (void)(x)
#endif

#ifdef __cplusplus
extern "C" {
#endif


void ggml_gemm_q4_0_8x8_q8_0_4x16(int n, float * GGML_RESTRICT s, size_t bs, const void * GGML_RESTRICT vx, const void * GGML_RESTRICT vy, int nr, int nc) {
    const int qk  = QK8_0;
    const int nb  = n / qk;
    const int ncols_interleaved = 8;   // block_q4_0x8 is still the unit
    const int blocklen = 8;

    assert (n % qk == 0);
    assert (nr % 4 == 0);
    assert (nc % ncols_interleaved == 0);

    UNUSED(s);
    UNUSED(bs);
    UNUSED(vx);
    UNUSED(vy);
    UNUSED(nr);
    UNUSED(nc);
    UNUSED(nb);
    UNUSED(ncols_interleaved);
    UNUSED(blocklen);

#if defined __riscv_v
    if (__riscv_vlenb() >= QK4_0) {
        const size_t vl = QK4_0;

        // ----------------------------------------------------------------
        // 4×16 TWO-PASS PATH
        // Requires nc divisible by 16 (two block_q4_0x8 tiles per x step).
        // Processes columns x and x+1 together, keeping sumf0-7 all live
        // across both passes to avoid reloading the output tile.
        // Register budget at VLEN=512:
        //   sumf0-7    (m1 × 8)  =  8 physical  (persistent both passes)
        //   rhs_vec_lo/hi (m2×4) =  8 physical  (reused each pass)
        //   b_scales_vec  (m1)   =  1 physical  (reloaded each pass)
        //   lhs_0_8..3    (m2×4) =  8 physical  (reused each row)
        //   sumi chain    (m4)   =  4 physical  (reused each step)
        //   bookkeeping         =  1 physical
        //   ─────────────────────────────────────
        //   Total               = 30 physical  (2 spare)
        // ----------------------------------------------------------------
        if (nc % 16 == 0) {
            for (int y = 0; y < nr / 4; y++) {
                const block_q8_0x4 * a_ptr = (const block_q8_0x4 *) vy + (y * nb);

                for (int x = 0; x < nc / ncols_interleaved; x += 2) {

                    // Two consecutive block_q4_0x8 column groups
                    const block_q4_0x8 * b_ptr0 = (const block_q4_0x8 *) vx + (x       * nb);
                    const block_q4_0x8 * b_ptr1 = (const block_q4_0x8 *) vx + ((x + 1) * nb);

                    // Accumulators for columns x (sumf0-3) and x+1 (sumf4-7)
                    // All 8 are kept in registers for the duration of both passes
                    vfloat32m1_t sumf0 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                    vfloat32m1_t sumf1 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                    vfloat32m1_t sumf2 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                    vfloat32m1_t sumf3 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                    vfloat32m1_t sumf4 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                    vfloat32m1_t sumf5 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                    vfloat32m1_t sumf6 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                    vfloat32m1_t sumf7 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);

                    // ------------------------------------------------
                    // PASS 1 — columns x (b_ptr0) → sumf0-3
                    // ------------------------------------------------
                    for (int l = 0; l < nb; l++) {
                        const vint8m4_t rhs_raw_vec  = __riscv_vle8_v_i8m4((const int8_t *)b_ptr0[l].qs, vl * 4);
                        const vint8m4_t rhs_vec_lo   = __riscv_vsra_vx_i8m4(__riscv_vsll_vx_i8m4(rhs_raw_vec, 4, vl * 4), 4, vl * 4);
                        const vint8m4_t rhs_vec_hi   = __riscv_vsra_vx_i8m4(rhs_raw_vec, 4, vl * 4);
                        const vint8m2_t rhs_vec_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_vec_lo, 0);
                        const vint8m2_t rhs_vec_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_vec_lo, 1);
                        const vint8m2_t rhs_vec_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_vec_hi, 0);
                        const vint8m2_t rhs_vec_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_vec_hi, 1);

                        const float a_scales[4] = {
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[0]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[1]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[2]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[3])
                        };
                        const float b_scales[8] = {
                            GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[0]),
                            GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[1]),
                            GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[2]),
                            GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[3]),
                            GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[4]),
                            GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[5]),
                            GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[6]),
                            GGML_CPU_FP16_TO_FP32(b_ptr0[l].d[7])
                        };
                        const vfloat32m1_t b_scales_vec = __riscv_vle32_v_f32m1(b_scales, vl / 4);

                        // -- Row 0 --
                        const int64_t A0 = *(const int64_t *)&a_ptr[l].qs[0];
                        const int64_t A4 = *(const int64_t *)&a_ptr[l].qs[32];
                        const int64_t A8 = *(const int64_t *)&a_ptr[l].qs[64];
                        const int64_t Ac = *(const int64_t *)&a_ptr[l].qs[96];
                        __asm__ __volatile__("" ::: "memory");
                        {
                            const vint8m2_t lhs_0_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A0, vl / 4));
                            const vint8m2_t lhs_1_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A4, vl / 4));
                            const vint8m2_t lhs_2_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A8, vl / 4));
                            const vint8m2_t lhs_3_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ac, vl / 4));
                            const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                            const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                            const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                            const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                            const vuint32m4_t sumi_i32   = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_hi_m));
                            const vuint16m2_t sumi_h2_0  = __riscv_vnsrl_wx_u16m2(sumi_i32, 0,  vl);
                            const vuint16m2_t sumi_h2_1  = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                            const vuint16m2_t sumi_h2    = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                            const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                            const vuint16m1_t sumi_h4_0  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0,  vl / 2);
                            const vuint16m1_t sumi_h4_1  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                            const vuint16m1_t sumi_h4    = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                            const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                            const vint16mf2_t sumi_h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0,  vl / 4));
                            const vint16mf2_t sumi_h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                            const vint32m1_t  sumi_h8    = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                            const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                            const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[0], vl / 4);
                            sumf0 = __riscv_vfmacc_vv_f32m1(sumf0, tmp1, b_scales_vec, vl / 4);
                        }

                        // -- Row 1 --
                        const int64_t A1 = *(const int64_t *)&a_ptr[l].qs[8];
                        const int64_t A5 = *(const int64_t *)&a_ptr[l].qs[40];
                        const int64_t A9 = *(const int64_t *)&a_ptr[l].qs[72];
                        const int64_t Ad = *(const int64_t *)&a_ptr[l].qs[104];
                        __asm__ __volatile__("" ::: "memory");
                        {
                            const vint8m2_t lhs_0_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A1, vl / 4));
                            const vint8m2_t lhs_1_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A5, vl / 4));
                            const vint8m2_t lhs_2_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A9, vl / 4));
                            const vint8m2_t lhs_3_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ad, vl / 4));
                            const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                            const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                            const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                            const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                            const vuint32m4_t sumi_i32   = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_hi_m));
                            const vuint16m2_t sumi_h2_0  = __riscv_vnsrl_wx_u16m2(sumi_i32, 0,  vl);
                            const vuint16m2_t sumi_h2_1  = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                            const vuint16m2_t sumi_h2    = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                            const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                            const vuint16m1_t sumi_h4_0  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0,  vl / 2);
                            const vuint16m1_t sumi_h4_1  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                            const vuint16m1_t sumi_h4    = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                            const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                            const vint16mf2_t sumi_h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0,  vl / 4));
                            const vint16mf2_t sumi_h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                            const vint32m1_t  sumi_h8    = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                            const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                            const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[1], vl / 4);
                            sumf1 = __riscv_vfmacc_vv_f32m1(sumf1, tmp1, b_scales_vec, vl / 4);
                        }

                        // -- Row 2 --
                        const int64_t A2 = *(const int64_t *)&a_ptr[l].qs[16];
                        const int64_t A6 = *(const int64_t *)&a_ptr[l].qs[48];
                        const int64_t Aa = *(const int64_t *)&a_ptr[l].qs[80];
                        const int64_t Ae = *(const int64_t *)&a_ptr[l].qs[112];
                        __asm__ __volatile__("" ::: "memory");
                        {
                            const vint8m2_t lhs_0_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A2, vl / 4));
                            const vint8m2_t lhs_1_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A6, vl / 4));
                            const vint8m2_t lhs_2_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Aa, vl / 4));
                            const vint8m2_t lhs_3_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ae, vl / 4));
                            const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                            const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                            const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                            const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                            const vuint32m4_t sumi_i32   = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_hi_m));
                            const vuint16m2_t sumi_h2_0  = __riscv_vnsrl_wx_u16m2(sumi_i32, 0,  vl);
                            const vuint16m2_t sumi_h2_1  = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                            const vuint16m2_t sumi_h2    = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                            const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                            const vuint16m1_t sumi_h4_0  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0,  vl / 2);
                            const vuint16m1_t sumi_h4_1  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                            const vuint16m1_t sumi_h4    = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                            const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                            const vint16mf2_t sumi_h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0,  vl / 4));
                            const vint16mf2_t sumi_h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                            const vint32m1_t  sumi_h8    = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                            const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                            const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[2], vl / 4);
                            sumf2 = __riscv_vfmacc_vv_f32m1(sumf2, tmp1, b_scales_vec, vl / 4);
                        }

                        // -- Row 3 --
                        const int64_t A3 = *(const int64_t *)&a_ptr[l].qs[24];
                        const int64_t A7 = *(const int64_t *)&a_ptr[l].qs[56];
                        const int64_t Ab = *(const int64_t *)&a_ptr[l].qs[88];
                        const int64_t Af = *(const int64_t *)&a_ptr[l].qs[120];
                        __asm__ __volatile__("" ::: "memory");
                        {
                            const vint8m2_t lhs_0_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A3, vl / 4));
                            const vint8m2_t lhs_1_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A7, vl / 4));
                            const vint8m2_t lhs_2_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ab, vl / 4));
                            const vint8m2_t lhs_3_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Af, vl / 4));
                            const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                            const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                            const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                            const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                            const vuint32m4_t sumi_i32   = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_hi_m));
                            const vuint16m2_t sumi_h2_0  = __riscv_vnsrl_wx_u16m2(sumi_i32, 0,  vl);
                            const vuint16m2_t sumi_h2_1  = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                            const vuint16m2_t sumi_h2    = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                            const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                            const vuint16m1_t sumi_h4_0  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0,  vl / 2);
                            const vuint16m1_t sumi_h4_1  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                            const vuint16m1_t sumi_h4    = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                            const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                            const vint16mf2_t sumi_h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0,  vl / 4));
                            const vint16mf2_t sumi_h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                            const vint32m1_t  sumi_h8    = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                            const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                            const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[3], vl / 4);
                            sumf3 = __riscv_vfmacc_vv_f32m1(sumf3, tmp1, b_scales_vec, vl / 4);
                        }
                    } // end pass 1

                    // ------------------------------------------------
                    // PASS 2 — columns x+1 (b_ptr1) → sumf4-7
                    // sumf0-3 remain untouched in registers.
                    // RHS register slots (rhs_vec_lo/hi, sumi) are
                    // reused since pass 1 no longer needs them.
                    // ------------------------------------------------
                    for (int l = 0; l < nb; l++) {
                        const vint8m4_t rhs_raw_vec  = __riscv_vle8_v_i8m4((const int8_t *)b_ptr1[l].qs, vl * 4);
                        const vint8m4_t rhs_vec_lo   = __riscv_vsra_vx_i8m4(__riscv_vsll_vx_i8m4(rhs_raw_vec, 4, vl * 4), 4, vl * 4);
                        const vint8m4_t rhs_vec_hi   = __riscv_vsra_vx_i8m4(rhs_raw_vec, 4, vl * 4);
                        const vint8m2_t rhs_vec_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_vec_lo, 0);
                        const vint8m2_t rhs_vec_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_vec_lo, 1);
                        const vint8m2_t rhs_vec_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_vec_hi, 0);
                        const vint8m2_t rhs_vec_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_vec_hi, 1);

                        const float a_scales[4] = {
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[0]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[1]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[2]),
                            GGML_CPU_FP16_TO_FP32(a_ptr[l].d[3])
                        };
                        const float b_scales[8] = {
                            GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[0]),
                            GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[1]),
                            GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[2]),
                            GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[3]),
                            GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[4]),
                            GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[5]),
                            GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[6]),
                            GGML_CPU_FP16_TO_FP32(b_ptr1[l].d[7])
                        };
                        const vfloat32m1_t b_scales_vec = __riscv_vle32_v_f32m1(b_scales, vl / 4);

                        // -- Row 0 --
                        const int64_t A0 = *(const int64_t *)&a_ptr[l].qs[0];
                        const int64_t A4 = *(const int64_t *)&a_ptr[l].qs[32];
                        const int64_t A8 = *(const int64_t *)&a_ptr[l].qs[64];
                        const int64_t Ac = *(const int64_t *)&a_ptr[l].qs[96];
                        __asm__ __volatile__("" ::: "memory");
                        {
                            const vint8m2_t lhs_0_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A0, vl / 4));
                            const vint8m2_t lhs_1_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A4, vl / 4));
                            const vint8m2_t lhs_2_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A8, vl / 4));
                            const vint8m2_t lhs_3_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ac, vl / 4));
                            const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                            const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                            const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                            const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                            const vuint32m4_t sumi_i32   = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_hi_m));
                            const vuint16m2_t sumi_h2_0  = __riscv_vnsrl_wx_u16m2(sumi_i32, 0,  vl);
                            const vuint16m2_t sumi_h2_1  = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                            const vuint16m2_t sumi_h2    = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                            const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                            const vuint16m1_t sumi_h4_0  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0,  vl / 2);
                            const vuint16m1_t sumi_h4_1  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                            const vuint16m1_t sumi_h4    = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                            const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                            const vint16mf2_t sumi_h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0,  vl / 4));
                            const vint16mf2_t sumi_h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                            const vint32m1_t  sumi_h8    = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                            const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                            const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[0], vl / 4);
                            sumf4 = __riscv_vfmacc_vv_f32m1(sumf4, tmp1, b_scales_vec, vl / 4);
                        }

                        // -- Row 1 --
                        const int64_t A1 = *(const int64_t *)&a_ptr[l].qs[8];
                        const int64_t A5 = *(const int64_t *)&a_ptr[l].qs[40];
                        const int64_t A9 = *(const int64_t *)&a_ptr[l].qs[72];
                        const int64_t Ad = *(const int64_t *)&a_ptr[l].qs[104];
                        __asm__ __volatile__("" ::: "memory");
                        {
                            const vint8m2_t lhs_0_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A1, vl / 4));
                            const vint8m2_t lhs_1_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A5, vl / 4));
                            const vint8m2_t lhs_2_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A9, vl / 4));
                            const vint8m2_t lhs_3_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ad, vl / 4));
                            const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                            const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                            const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                            const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                            const vuint32m4_t sumi_i32   = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_hi_m));
                            const vuint16m2_t sumi_h2_0  = __riscv_vnsrl_wx_u16m2(sumi_i32, 0,  vl);
                            const vuint16m2_t sumi_h2_1  = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                            const vuint16m2_t sumi_h2    = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                            const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                            const vuint16m1_t sumi_h4_0  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0,  vl / 2);
                            const vuint16m1_t sumi_h4_1  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                            const vuint16m1_t sumi_h4    = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                            const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                            const vint16mf2_t sumi_h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0,  vl / 4));
                            const vint16mf2_t sumi_h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                            const vint32m1_t  sumi_h8    = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                            const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                            const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[1], vl / 4);
                            sumf5 = __riscv_vfmacc_vv_f32m1(sumf5, tmp1, b_scales_vec, vl / 4);
                        }

                        // -- Row 2 --
                        const int64_t A2 = *(const int64_t *)&a_ptr[l].qs[16];
                        const int64_t A6 = *(const int64_t *)&a_ptr[l].qs[48];
                        const int64_t Aa = *(const int64_t *)&a_ptr[l].qs[80];
                        const int64_t Ae = *(const int64_t *)&a_ptr[l].qs[112];
                        __asm__ __volatile__("" ::: "memory");
                        {
                            const vint8m2_t lhs_0_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A2, vl / 4));
                            const vint8m2_t lhs_1_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A6, vl / 4));
                            const vint8m2_t lhs_2_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Aa, vl / 4));
                            const vint8m2_t lhs_3_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ae, vl / 4));
                            const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                            const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                            const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                            const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                            const vuint32m4_t sumi_i32   = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_hi_m));
                            const vuint16m2_t sumi_h2_0  = __riscv_vnsrl_wx_u16m2(sumi_i32, 0,  vl);
                            const vuint16m2_t sumi_h2_1  = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                            const vuint16m2_t sumi_h2    = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                            const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                            const vuint16m1_t sumi_h4_0  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0,  vl / 2);
                            const vuint16m1_t sumi_h4_1  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                            const vuint16m1_t sumi_h4    = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                            const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                            const vint16mf2_t sumi_h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0,  vl / 4));
                            const vint16mf2_t sumi_h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                            const vint32m1_t  sumi_h8    = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                            const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                            const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[2], vl / 4);
                            sumf6 = __riscv_vfmacc_vv_f32m1(sumf6, tmp1, b_scales_vec, vl / 4);
                        }

                        // -- Row 3 --
                        const int64_t A3 = *(const int64_t *)&a_ptr[l].qs[24];
                        const int64_t A7 = *(const int64_t *)&a_ptr[l].qs[56];
                        const int64_t Ab = *(const int64_t *)&a_ptr[l].qs[88];
                        const int64_t Af = *(const int64_t *)&a_ptr[l].qs[120];
                        __asm__ __volatile__("" ::: "memory");
                        {
                            const vint8m2_t lhs_0_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A3, vl / 4));
                            const vint8m2_t lhs_1_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A7, vl / 4));
                            const vint8m2_t lhs_2_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ab, vl / 4));
                            const vint8m2_t lhs_3_8 = __riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Af, vl / 4));
                            const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                            const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                            const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                            const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                            const vuint32m4_t sumi_i32   = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_hi_m));
                            const vuint16m2_t sumi_h2_0  = __riscv_vnsrl_wx_u16m2(sumi_i32, 0,  vl);
                            const vuint16m2_t sumi_h2_1  = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                            const vuint16m2_t sumi_h2    = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                            const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                            const vuint16m1_t sumi_h4_0  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0,  vl / 2);
                            const vuint16m1_t sumi_h4_1  = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                            const vuint16m1_t sumi_h4    = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                            const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                            const vint16mf2_t sumi_h8_0  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0,  vl / 4));
                            const vint16mf2_t sumi_h8_1  = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                            const vint32m1_t  sumi_h8    = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                            const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                            const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[3], vl / 4);
                            sumf7 = __riscv_vfmacc_vv_f32m1(sumf7, tmp1, b_scales_vec, vl / 4);
                        }
                    } // end pass 2

                    // ------------------------------------------------
                    // STORE — write 4 rows × 16 cols (two vse32 per row)
                    // ------------------------------------------------
                    __riscv_vse32_v_f32m1(&s[(y * 4 + 0) * bs +  x      * ncols_interleaved], sumf0, vl / 4);
                    __riscv_vse32_v_f32m1(&s[(y * 4 + 0) * bs + (x + 1) * ncols_interleaved], sumf4, vl / 4);
                    __riscv_vse32_v_f32m1(&s[(y * 4 + 1) * bs +  x      * ncols_interleaved], sumf1, vl / 4);
                    __riscv_vse32_v_f32m1(&s[(y * 4 + 1) * bs + (x + 1) * ncols_interleaved], sumf5, vl / 4);
                    __riscv_vse32_v_f32m1(&s[(y * 4 + 2) * bs +  x      * ncols_interleaved], sumf2, vl / 4);
                    __riscv_vse32_v_f32m1(&s[(y * 4 + 2) * bs + (x + 1) * ncols_interleaved], sumf6, vl / 4);
                    __riscv_vse32_v_f32m1(&s[(y * 4 + 3) * bs +  x      * ncols_interleaved], sumf3, vl / 4);
                    __riscv_vse32_v_f32m1(&s[(y * 4 + 3) * bs + (x + 1) * ncols_interleaved], sumf7, vl / 4);

                } // end x loop
            } // end y loop
            return;
        } // end nc%16 branch

        // ----------------------------------------------------------------
        // ORIGINAL 4×8 PATH — fallback when nc is not divisible by 16
        // ----------------------------------------------------------------
        for (int y = 0; y < nr / 4; y++) {
            const block_q8_0x4 * a_ptr = (const block_q8_0x4 *) vy + (y * nb);
            for (int x = 0; x < nc / ncols_interleaved; x++) {
                const block_q4_0x8 * b_ptr = (const block_q4_0x8 *) vx + (x * nb);
                vfloat32m1_t sumf0 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                vfloat32m1_t sumf1 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                vfloat32m1_t sumf2 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                vfloat32m1_t sumf3 = __riscv_vfmv_v_f_f32m1(0.0, vl / 4);
                for (int l = 0; l < nb; l++) {
                    const vint8m4_t rhs_raw_vec = __riscv_vle8_v_i8m4((const int8_t *)b_ptr[l].qs, vl * 4);
                    const vint8m4_t rhs_vec_lo = __riscv_vsra_vx_i8m4(__riscv_vsll_vx_i8m4(rhs_raw_vec, 4, vl * 4), 4, vl * 4);
                    const vint8m4_t rhs_vec_hi = __riscv_vsra_vx_i8m4(rhs_raw_vec, 4, vl * 4);
                    const vint8m2_t rhs_vec_lo_0 = __riscv_vget_v_i8m4_i8m2(rhs_vec_lo, 0);
                    const vint8m2_t rhs_vec_lo_1 = __riscv_vget_v_i8m4_i8m2(rhs_vec_lo, 1);
                    const vint8m2_t rhs_vec_hi_0 = __riscv_vget_v_i8m4_i8m2(rhs_vec_hi, 0);
                    const vint8m2_t rhs_vec_hi_1 = __riscv_vget_v_i8m4_i8m2(rhs_vec_hi, 1);
                    const float a_scales[4] = {
                        GGML_CPU_FP16_TO_FP32(a_ptr[l].d[0]),
                        GGML_CPU_FP16_TO_FP32(a_ptr[l].d[1]),
                        GGML_CPU_FP16_TO_FP32(a_ptr[l].d[2]),
                        GGML_CPU_FP16_TO_FP32(a_ptr[l].d[3])
                    };
                    const float b_scales[8] = {
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[0]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[1]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[2]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[3]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[4]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[5]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[6]),
                        GGML_CPU_FP16_TO_FP32(b_ptr[l].d[7])
                    };
                    const vfloat32m1_t b_scales_vec = __riscv_vle32_v_f32m1(b_scales, vl / 4);
                    const int64_t A0 = *(const int64_t *)&a_ptr[l].qs[0];
                    const int64_t A4 = *(const int64_t *)&a_ptr[l].qs[32];
                    const int64_t A8 = *(const int64_t *)&a_ptr[l].qs[64];
                    const int64_t Ac = *(const int64_t *)&a_ptr[l].qs[96];
                    __asm__ __volatile__("" ::: "memory");
                    vint16m4_t sumi_l0;
                    {
                        const vint8m2_t lhs_0_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A0, vl / 4));
                        const vint8m2_t lhs_1_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A4, vl / 4));
                        const vint8m2_t lhs_2_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A8, vl / 4));
                        const vint8m2_t lhs_3_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ac, vl / 4));
                        const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                        const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                        const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                        const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                        sumi_l0 = sumi_hi_m;
                    }
                    {
                        const vuint32m4_t sumi_i32 = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_l0));
                        const vuint16m2_t sumi_h2_0 = __riscv_vnsrl_wx_u16m2(sumi_i32, 0, vl);
                        const vuint16m2_t sumi_h2_1 = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                        const vuint16m2_t sumi_h2 = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                        const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                        const vuint16m1_t sumi_h4_0 = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0, vl / 2);
                        const vuint16m1_t sumi_h4_1 = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                        const vuint16m1_t sumi_h4 = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                        const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                        const vint16mf2_t sumi_h8_0 = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0, vl / 4));
                        const vint16mf2_t sumi_h8_1 = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                        const vint32m1_t sumi_h8 = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                        const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                        const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[0], vl / 4);
                        sumf0 = __riscv_vfmacc_vv_f32m1(sumf0, tmp1, b_scales_vec, vl / 4);
                    }
                    const int64_t A1 = *(const int64_t *)&a_ptr[l].qs[8];
                    const int64_t A5 = *(const int64_t *)&a_ptr[l].qs[40];
                    const int64_t A9 = *(const int64_t *)&a_ptr[l].qs[72];
                    const int64_t Ad = *(const int64_t *)&a_ptr[l].qs[104];
                    __asm__ __volatile__("" ::: "memory");
                    vint16m4_t sumi_l1;
                    {
                        const vint8m2_t lhs_0_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A1, vl / 4));
                        const vint8m2_t lhs_1_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A5, vl / 4));
                        const vint8m2_t lhs_2_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A9, vl / 4));
                        const vint8m2_t lhs_3_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ad, vl / 4));
                        const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                        const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                        const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                        const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                        sumi_l1 = sumi_hi_m;
                    }
                    {
                        const vuint32m4_t sumi_i32 = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_l1));
                        const vuint16m2_t sumi_h2_0 = __riscv_vnsrl_wx_u16m2(sumi_i32, 0, vl);
                        const vuint16m2_t sumi_h2_1 = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                        const vuint16m2_t sumi_h2 = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                        const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                        const vuint16m1_t sumi_h4_0 = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0, vl / 2);
                        const vuint16m1_t sumi_h4_1 = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                        const vuint16m1_t sumi_h4 = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                        const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                        const vint16mf2_t sumi_h8_0 = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0, vl / 4));
                        const vint16mf2_t sumi_h8_1 = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                        const vint32m1_t sumi_h8 = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                        const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                        const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[1], vl / 4);
                        sumf1 = __riscv_vfmacc_vv_f32m1(sumf1, tmp1, b_scales_vec, vl / 4);
                    }
                    const int64_t A2 = *(const int64_t *)&a_ptr[l].qs[16];
                    const int64_t A6 = *(const int64_t *)&a_ptr[l].qs[48];
                    const int64_t Aa = *(const int64_t *)&a_ptr[l].qs[80];
                    const int64_t Ae = *(const int64_t *)&a_ptr[l].qs[112];
                    __asm__ __volatile__("" ::: "memory");
                    vint16m4_t sumi_l2;
                    {
                        const vint8m2_t lhs_0_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A2, vl / 4));
                        const vint8m2_t lhs_1_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A6, vl / 4));
                        const vint8m2_t lhs_2_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Aa, vl / 4));
                        const vint8m2_t lhs_3_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ae, vl / 4));
                        const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                        const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                        const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                        const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                        sumi_l2 = sumi_hi_m;
                    }
                    {
                        const vuint32m4_t sumi_i32 = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_l2));
                        const vuint16m2_t sumi_h2_0 = __riscv_vnsrl_wx_u16m2(sumi_i32, 0, vl);
                        const vuint16m2_t sumi_h2_1 = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                        const vuint16m2_t sumi_h2 = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                        const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                        const vuint16m1_t sumi_h4_0 = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0, vl / 2);
                        const vuint16m1_t sumi_h4_1 = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                        const vuint16m1_t sumi_h4 = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                        const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                        const vint16mf2_t sumi_h8_0 = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0, vl / 4));
                        const vint16mf2_t sumi_h8_1 = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                        const vint32m1_t sumi_h8 = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                        const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                        const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[2], vl / 4);
                        sumf2 = __riscv_vfmacc_vv_f32m1(sumf2, tmp1, b_scales_vec, vl / 4);
                    }
                    const int64_t A3 = *(const int64_t *)&a_ptr[l].qs[24];
                    const int64_t A7 = *(const int64_t *)&a_ptr[l].qs[56];
                    const int64_t Ab = *(const int64_t *)&a_ptr[l].qs[88];
                    const int64_t Af = *(const int64_t *)&a_ptr[l].qs[120];
                    __asm__ __volatile__("" ::: "memory");
                    vint16m4_t sumi_l3;
                    {
                        const vint8m2_t lhs_0_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A3, vl / 4));
                        const vint8m2_t lhs_1_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(A7, vl / 4));
                        const vint8m2_t lhs_2_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Ab, vl / 4));
                        const vint8m2_t lhs_3_8 =__riscv_vreinterpret_v_i64m2_i8m2(__riscv_vmv_v_x_i64m2(Af, vl / 4));
                        const vint16m4_t sumi_lo_0 = __riscv_vwmul_vv_i16m4(rhs_vec_lo_0, lhs_0_8, vl * 2);
                        const vint16m4_t sumi_lo_1 = __riscv_vwmacc_vv_i16m4(sumi_lo_0, rhs_vec_lo_1, lhs_1_8, vl * 2);
                        const vint16m4_t sumi_hi_0 = __riscv_vwmacc_vv_i16m4(sumi_lo_1, rhs_vec_hi_0, lhs_2_8, vl * 2);
                        const vint16m4_t sumi_hi_m = __riscv_vwmacc_vv_i16m4(sumi_hi_0, rhs_vec_hi_1, lhs_3_8, vl * 2);
                        sumi_l3 = sumi_hi_m;
                    }
                    {
                        const vuint32m4_t sumi_i32 = __riscv_vreinterpret_v_i32m4_u32m4(__riscv_vreinterpret_v_i16m4_i32m4(sumi_l3));
                        const vuint16m2_t sumi_h2_0 = __riscv_vnsrl_wx_u16m2(sumi_i32, 0, vl);
                        const vuint16m2_t sumi_h2_1 = __riscv_vnsrl_wx_u16m2(sumi_i32, 16, vl);
                        const vuint16m2_t sumi_h2 = __riscv_vadd_vv_u16m2(sumi_h2_0, sumi_h2_1, vl);
                        const vuint32m2_t sumi_h2_i32 = __riscv_vreinterpret_v_u16m2_u32m2(sumi_h2);
                        const vuint16m1_t sumi_h4_0 = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 0, vl / 2);
                        const vuint16m1_t sumi_h4_1 = __riscv_vnsrl_wx_u16m1(sumi_h2_i32, 16, vl / 2);
                        const vuint16m1_t sumi_h4 = __riscv_vadd_vv_u16m1(sumi_h4_0, sumi_h4_1, vl / 2);
                        const vuint32m1_t sumi_h4_i32 = __riscv_vreinterpret_v_u16m1_u32m1(sumi_h4);
                        const vint16mf2_t sumi_h8_0 = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 0, vl / 4));
                        const vint16mf2_t sumi_h8_1 = __riscv_vreinterpret_v_u16mf2_i16mf2(__riscv_vnsrl_wx_u16mf2(sumi_h4_i32, 16, vl / 4));
                        const vint32m1_t sumi_h8 = __riscv_vwadd_vv_i32m1(sumi_h8_0, sumi_h8_1, vl / 4);
                        const vfloat32m1_t facc = __riscv_vfcvt_f_x_v_f32m1(sumi_h8, vl / 4);
                        const vfloat32m1_t tmp1 = __riscv_vfmul_vf_f32m1(facc, a_scales[3], vl / 4);
                        sumf3 = __riscv_vfmacc_vv_f32m1(sumf3, tmp1, b_scales_vec, vl / 4);
                    }
                }
                __riscv_vse32_v_f32m1(&s[(y * 4 + 0) * bs + x * ncols_interleaved], sumf0, vl / 4);
                __riscv_vse32_v_f32m1(&s[(y * 4 + 1) * bs + x * ncols_interleaved], sumf1, vl / 4);
                __riscv_vse32_v_f32m1(&s[(y * 4 + 2) * bs + x * ncols_interleaved], sumf2, vl / 4);
                __riscv_vse32_v_f32m1(&s[(y * 4 + 3) * bs + x * ncols_interleaved], sumf3, vl / 4);
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
