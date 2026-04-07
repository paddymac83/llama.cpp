#pragma once

#include "ggml.h"

#ifdef __cplusplus
extern "C" {
#endif

void ggml_gemm_q4_0_8x8_q8_0_4x16(int n, float * GGML_RESTRICT s, size_t bs,
                                    const void * GGML_RESTRICT vx,
                                    const void * GGML_RESTRICT vy,
                                    int nr, int nc);

#ifdef __cplusplus
}
#endif