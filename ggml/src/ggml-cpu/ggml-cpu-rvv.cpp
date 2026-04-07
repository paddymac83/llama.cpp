// In ggml-cpu/ops.cpp, replace ggml_compute_forward_ssm_conv_f32 with:

#if defined(__riscv_v)
#include <riscv_vector.h>

static void ggml_compute_forward_ssm_conv_f32_rvv(
        const ggml_compute_params * params,
        ggml_tensor * dst) {
    const ggml_tensor * src0 = dst->src[0];
    const ggml_tensor * src1 = dst->src[1];

    const int ith = params->ith;
    const int nth = params->nth;
    const int nc  = src1->ne[0];   // d_conv (kernel width, e.g. 4)
    const int ncs = src0->ne[0];   // d_conv - 1 + n_t
    const int nr  = src0->ne[1];   // d_inner (e.g. 1024 for 700M)
    const int n_t = dst->ne[1];    // tokens per sequence
    const int n_s = dst->ne[2];    // sequences in batch

    // Thread work partition — same as scalar
    const int dr  = (nr + nth - 1) / nth;
    const int ir0 = dr * ith;
    const int ir1 = MIN(ir0 + dr, nr);
    const int ir  = ir1 - ir0;     // rows this thread handles

    for (int i3 = 0; i3 < n_s; ++i3) {
        for (int i2 = 0; i2 < n_t; ++i2) {

            const float * s = (const float *)
                ((const char *) src0->data
                 + ir0*(src0->nb[1])
                 + i2*(src0->nb[0])
                 + i3*(src0->nb[2]));

            const float * c = (const float *)
                ((const char *) src1->data
                 + ir0*(src1->nb[1]));

            float * x = (float *)
                ((char *) dst->data
                 + ir0*(dst->nb[0])
                 + i2*(dst->nb[1])
                 + i3*(dst->nb[2]));

            // ── RVV vectorised across d_inner rows ────────────────────────────
            //
            // Strategy: process `vl` rows of d_inner simultaneously.
            // For each row i1, we need:
            //   x[i1] = sum_{i0=0}^{nc-1} s[i0 + i1*ncs] * c[i0 + i1*nc]
            //
            // We accumulate into a vector register `vsum` across the nc
            // iterations, gathering strided elements from s and c.

            int i1 = 0;
            int rows_left = ir;

            while (rows_left > 0) {
                // vl = number of rows to process this iteration
                size_t vl = __riscv_vsetvl_e32m4(rows_left);

                // Accumulator — zeroed for each new group of rows
                vfloat32m4_t vsum = __riscv_vfmv_v_f_f32m4(0.0f, vl);

                // Accumulate over d_conv (typically 4 iterations)
                for (int i0 = 0; i0 < nc; ++i0) {
                    // Load vl values of s column i0 across rows i1..i1+vl-1
                    // s[i0 + i1*ncs]: stride between rows is ncs floats
                    vfloat32m4_t vs = __riscv_vlse32_v_f32m4(
                        s + i0 + i1*ncs,        // base: first row, col i0
                        ncs * sizeof(float),     // stride in bytes between rows
                        vl
                    );

                    // Load vl values of c column i0 across rows i1..i1+vl-1
                    // c[i0 + i1*nc]: stride between rows is nc floats
                    vfloat32m4_t vc = __riscv_vlse32_v_f32m4(
                        c + i0 + i1*nc,          // base: first row, col i0
                        nc * sizeof(float),       // stride in bytes between rows
                        vl
                    );

                    // Fused multiply-accumulate: vsum += vs * vc
                    vsum = __riscv_vfmacc_vv_f32m4(vsum, vs, vc, vl);
                }

                // Store vl results into x[i1..i1+vl-1]
                // x is contiguous in d_inner dimension
                __riscv_vse32_v_f32m4(x + i1, vsum, vl);

                i1        += vl;
                rows_left -= vl;
            }
        }
    }
}
#endif

static void ggml_compute_forward_ssm_conv_f32(
        const ggml_compute_params * params,
        ggml_tensor * dst) {

#if defined(__riscv_v)
    ggml_compute_forward_ssm_conv_f32_rvv(params, dst);
    return;
#endif

    // ── Original scalar implementation ────────────────────────────────────────
    const ggml_tensor * src0 = dst->src[0];
    const ggml_tensor * src1 = dst->src[1];
    const int ith = params->ith;
    const int nth = params->nth;
    const int nc  = src1->ne[0];
    const int ncs = src0->ne[0];
    const int nr  = src0->ne[1];
    const int n_t = dst->ne[1];
    const int n_s = dst->ne[2];

    const int dr  = (nr + nth - 1) / nth;
    const int ir0 = dr * ith;
    const int ir1 = MIN(ir0 + dr, nr);
    const int ir  = ir1 - ir0;

    for (int i3 = 0; i3 < n_s; ++i3) {
        for (int i2 = 0; i2 < n_t; ++i2) {
            const float * s = (const float *)
                ((const char *) src0->data
                 + ir0*(src0->nb[1])
                 + i2*(src0->nb[0])
                 + i3*(src0->nb[2]));
            const float * c = (const float *)
                ((const char *) src1->data
                 + ir0*(src1->nb[1]));
            float * x = (float *)
                ((char *) dst->data
                 + ir0*(dst->nb[0])
                 + i2*(dst->nb[1])
                 + i3*(dst->nb[2]));

            for (int i1 = 0; i1 < ir; ++i1) {
                float sumf = 0.0f;
                for (int i0 = 0; i0 < nc; ++i0) {
                    sumf += s[i0 + i1*ncs] * c[i0 + i1*nc];
                }
                x[i1] = sumf;
            }
        }
    }
}