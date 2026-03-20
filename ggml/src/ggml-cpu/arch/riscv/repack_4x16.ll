; ModuleID = 'repack_4x16.cpp'
source_filename = "repack_4x16.cpp"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

%struct.block = type { [4 x i16], [128 x i8] }
%struct.block.0 = type { [8 x i16], [128 x i8] }

@.str = private unnamed_addr constant [12 x i8] c"n % qk == 0\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"repack_4x16.cpp\00", align 1
@__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16 = private unnamed_addr constant [124 x i8] c"void ggml_gemm_q4_0_8x8_q8_0_4x16(int, float *__restrict, size_t, const void *__restrict, const void *__restrict, int, int)\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"nr % 4 == 0\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"nc % ncols_interleaved == 0\00", align 1
@ggml_table_f32_f16 = external local_unnamed_addr global [65536 x float], align 4

; Function Attrs: mustprogress uwtable vscale_range(4,1024)
define dso_local void @ggml_gemm_q4_0_8x8_q8_0_4x16(i32 noundef signext %0, ptr noalias noundef %1, i64 noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef signext %5, i32 noundef signext %6) local_unnamed_addr #0 {
  %8 = alloca [8 x float], align 4
  %9 = alloca [8 x float], align 4
  %10 = alloca [8 x float], align 4
  %11 = alloca [8 x float], align 4
  %12 = alloca [8 x float], align 4
  %13 = alloca [8 x float], align 4
  %14 = alloca [8 x float], align 4
  %15 = alloca [8 x float], align 4
  %16 = sdiv i32 %0, 32
  %17 = and i32 %0, 31
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %20, label %19

19:                                               ; preds = %7
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef signext 87, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

20:                                               ; preds = %7
  %21 = and i32 %5, 3
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %24, label %23

23:                                               ; preds = %20
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef signext 88, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

24:                                               ; preds = %20
  %25 = and i32 %6, 7
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %28, label %27

27:                                               ; preds = %24
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef signext 89, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

28:                                               ; preds = %24
  %29 = tail call i64 @llvm.read_register.i64(metadata !9)
  %30 = icmp ugt i64 %29, 31
  %31 = and i32 %6, 8
  %32 = icmp eq i32 %31, 0
  %33 = and i1 %30, %32
  br i1 %33, label %34, label %771

34:                                               ; preds = %28
  %35 = ashr exact i32 %5, 2
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %772

37:                                               ; preds = %34
  %38 = ashr exact i32 %6, 3
  %39 = icmp sgt i32 %38, 0
  %40 = getelementptr inbounds float, ptr %8, i64 1
  %41 = getelementptr inbounds float, ptr %8, i64 2
  %42 = getelementptr inbounds float, ptr %8, i64 3
  %43 = getelementptr inbounds float, ptr %8, i64 4
  %44 = getelementptr inbounds float, ptr %8, i64 5
  %45 = getelementptr inbounds float, ptr %8, i64 6
  %46 = getelementptr inbounds float, ptr %8, i64 7
  %47 = getelementptr inbounds float, ptr %9, i64 1
  %48 = getelementptr inbounds float, ptr %9, i64 2
  %49 = getelementptr inbounds float, ptr %9, i64 3
  %50 = getelementptr inbounds float, ptr %9, i64 4
  %51 = getelementptr inbounds float, ptr %9, i64 5
  %52 = getelementptr inbounds float, ptr %9, i64 6
  %53 = getelementptr inbounds float, ptr %9, i64 7
  %54 = getelementptr inbounds float, ptr %10, i64 1
  %55 = getelementptr inbounds float, ptr %10, i64 2
  %56 = getelementptr inbounds float, ptr %10, i64 3
  %57 = getelementptr inbounds float, ptr %10, i64 4
  %58 = getelementptr inbounds float, ptr %10, i64 5
  %59 = getelementptr inbounds float, ptr %10, i64 6
  %60 = getelementptr inbounds float, ptr %10, i64 7
  %61 = getelementptr inbounds float, ptr %11, i64 1
  %62 = getelementptr inbounds float, ptr %11, i64 2
  %63 = getelementptr inbounds float, ptr %11, i64 3
  %64 = getelementptr inbounds float, ptr %11, i64 4
  %65 = getelementptr inbounds float, ptr %11, i64 5
  %66 = getelementptr inbounds float, ptr %11, i64 6
  %67 = getelementptr inbounds float, ptr %11, i64 7
  %68 = getelementptr inbounds float, ptr %12, i64 1
  %69 = getelementptr inbounds float, ptr %12, i64 2
  %70 = getelementptr inbounds float, ptr %12, i64 3
  %71 = getelementptr inbounds float, ptr %12, i64 4
  %72 = getelementptr inbounds float, ptr %12, i64 5
  %73 = getelementptr inbounds float, ptr %12, i64 6
  %74 = getelementptr inbounds float, ptr %12, i64 7
  %75 = getelementptr inbounds float, ptr %13, i64 1
  %76 = getelementptr inbounds float, ptr %13, i64 2
  %77 = getelementptr inbounds float, ptr %13, i64 3
  %78 = getelementptr inbounds float, ptr %13, i64 4
  %79 = getelementptr inbounds float, ptr %13, i64 5
  %80 = getelementptr inbounds float, ptr %13, i64 6
  %81 = getelementptr inbounds float, ptr %13, i64 7
  %82 = getelementptr inbounds float, ptr %14, i64 1
  %83 = getelementptr inbounds float, ptr %14, i64 2
  %84 = getelementptr inbounds float, ptr %14, i64 3
  %85 = getelementptr inbounds float, ptr %14, i64 4
  %86 = getelementptr inbounds float, ptr %14, i64 5
  %87 = getelementptr inbounds float, ptr %14, i64 6
  %88 = getelementptr inbounds float, ptr %14, i64 7
  %89 = getelementptr inbounds float, ptr %15, i64 1
  %90 = getelementptr inbounds float, ptr %15, i64 2
  %91 = getelementptr inbounds float, ptr %15, i64 3
  %92 = getelementptr inbounds float, ptr %15, i64 4
  %93 = getelementptr inbounds float, ptr %15, i64 5
  %94 = getelementptr inbounds float, ptr %15, i64 6
  %95 = getelementptr inbounds float, ptr %15, i64 7
  br i1 %39, label %96, label %772

96:                                               ; preds = %37
  %97 = icmp sgt i32 %0, 31
  %98 = tail call <vscale x 2 x float> @llvm.riscv.vfmv.v.f.nxv2f32.i64(<vscale x 2 x float> poison, float 0.000000e+00, i64 8)
  br i1 %97, label %102, label %99

99:                                               ; preds = %96
  %100 = zext nneg i32 %38 to i64
  %101 = zext nneg i32 %35 to i64
  br label %740

102:                                              ; preds = %96
  %103 = zext nneg i32 %16 to i64
  %104 = zext nneg i32 %38 to i64
  %105 = zext nneg i32 %35 to i64
  %106 = zext nneg i32 %16 to i64
  br label %107

107:                                              ; preds = %102, %737
  %108 = phi i64 [ 0, %102 ], [ %738, %737 ]
  %109 = mul nsw i64 %108, %103
  %110 = getelementptr inbounds %struct.block, ptr %4, i64 %109
  %111 = shl nsw i64 %108, 2
  %112 = mul i64 %111, %2
  %113 = getelementptr float, ptr %1, i64 %112
  %114 = or disjoint i64 %111, 1
  %115 = mul i64 %114, %2
  %116 = getelementptr float, ptr %1, i64 %115
  %117 = or disjoint i64 %111, 2
  %118 = mul i64 %117, %2
  %119 = getelementptr float, ptr %1, i64 %118
  %120 = or disjoint i64 %111, 3
  %121 = mul i64 %120, %2
  %122 = getelementptr float, ptr %1, i64 %121
  br label %123

123:                                              ; preds = %724, %107
  %124 = phi i64 [ %735, %724 ], [ 0, %107 ]
  %125 = mul nsw i64 %124, %103
  %126 = getelementptr inbounds %struct.block.0, ptr %3, i64 %125
  %127 = or disjoint i64 %124, 1
  %128 = mul nsw i64 %127, %103
  %129 = getelementptr inbounds %struct.block.0, ptr %3, i64 %128
  br label %130

130:                                              ; preds = %130, %123
  %131 = phi i64 [ %722, %130 ], [ 0, %123 ]
  %132 = phi <vscale x 2 x float> [ %244, %130 ], [ %98, %123 ]
  %133 = phi <vscale x 2 x float> [ %389, %130 ], [ %98, %123 ]
  %134 = phi <vscale x 2 x float> [ %525, %130 ], [ %98, %123 ]
  %135 = phi <vscale x 2 x float> [ %661, %130 ], [ %98, %123 ]
  %136 = phi <vscale x 2 x float> [ %313, %130 ], [ %98, %123 ]
  %137 = phi <vscale x 2 x float> [ %449, %130 ], [ %98, %123 ]
  %138 = phi <vscale x 2 x float> [ %585, %130 ], [ %98, %123 ]
  %139 = phi <vscale x 2 x float> [ %721, %130 ], [ %98, %123 ]
  %140 = getelementptr inbounds %struct.block, ptr %110, i64 %131
  %141 = load i16, ptr %140, align 2, !tbaa !10
  %142 = zext i16 %141 to i64
  %143 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %142
  %144 = load float, ptr %143, align 4, !tbaa !14
  %145 = getelementptr inbounds [4 x i16], ptr %140, i64 0, i64 1
  %146 = load i16, ptr %145, align 2, !tbaa !10
  %147 = zext i16 %146 to i64
  %148 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %147
  %149 = load float, ptr %148, align 4, !tbaa !14
  %150 = getelementptr inbounds [4 x i16], ptr %140, i64 0, i64 2
  %151 = load i16, ptr %150, align 2, !tbaa !10
  %152 = zext i16 %151 to i64
  %153 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %152
  %154 = load float, ptr %153, align 4, !tbaa !14
  %155 = getelementptr inbounds [4 x i16], ptr %140, i64 0, i64 3
  %156 = load i16, ptr %155, align 2, !tbaa !10
  %157 = zext i16 %156 to i64
  %158 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %157
  %159 = load float, ptr %158, align 4, !tbaa !14
  %160 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1
  %161 = load i64, ptr %160, align 2, !tbaa !16
  %162 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 32
  %163 = load i64, ptr %162, align 2, !tbaa !16
  %164 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 64
  %165 = load i64, ptr %164, align 2, !tbaa !16
  %166 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 96
  %167 = load i64, ptr %166, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !18
  %168 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %161, i64 8)
  %169 = bitcast <vscale x 2 x i64> %168 to <vscale x 16 x i8>
  %170 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %163, i64 8)
  %171 = bitcast <vscale x 2 x i64> %170 to <vscale x 16 x i8>
  %172 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %165, i64 8)
  %173 = bitcast <vscale x 2 x i64> %172 to <vscale x 16 x i8>
  %174 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %167, i64 8)
  %175 = bitcast <vscale x 2 x i64> %174 to <vscale x 16 x i8>
  %176 = getelementptr inbounds %struct.block.0, ptr %126, i64 %131
  %177 = getelementptr inbounds %struct.block.0, ptr %126, i64 %131, i32 1
  %178 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %177, i64 128)
  %179 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %178, i64 4, i64 128)
  %180 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %179, i64 4, i64 128)
  %181 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %178, i64 4, i64 128)
  %182 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %180, i64 0)
  %183 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %180, i64 16)
  %184 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %181, i64 0)
  %185 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %181, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #10
  %186 = load i16, ptr %176, align 2, !tbaa !10
  %187 = zext i16 %186 to i64
  %188 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %187
  %189 = load float, ptr %188, align 4, !tbaa !14
  store float %189, ptr %8, align 4, !tbaa !14
  %190 = getelementptr inbounds [8 x i16], ptr %176, i64 0, i64 1
  %191 = load i16, ptr %190, align 2, !tbaa !10
  %192 = zext i16 %191 to i64
  %193 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %192
  %194 = load float, ptr %193, align 4, !tbaa !14
  store float %194, ptr %40, align 4, !tbaa !14
  %195 = getelementptr inbounds [8 x i16], ptr %176, i64 0, i64 2
  %196 = load i16, ptr %195, align 2, !tbaa !10
  %197 = zext i16 %196 to i64
  %198 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %197
  %199 = load float, ptr %198, align 4, !tbaa !14
  store float %199, ptr %41, align 4, !tbaa !14
  %200 = getelementptr inbounds [8 x i16], ptr %176, i64 0, i64 3
  %201 = load i16, ptr %200, align 2, !tbaa !10
  %202 = zext i16 %201 to i64
  %203 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %202
  %204 = load float, ptr %203, align 4, !tbaa !14
  store float %204, ptr %42, align 4, !tbaa !14
  %205 = getelementptr inbounds [8 x i16], ptr %176, i64 0, i64 4
  %206 = load i16, ptr %205, align 2, !tbaa !10
  %207 = zext i16 %206 to i64
  %208 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %207
  %209 = load float, ptr %208, align 4, !tbaa !14
  store float %209, ptr %43, align 4, !tbaa !14
  %210 = getelementptr inbounds [8 x i16], ptr %176, i64 0, i64 5
  %211 = load i16, ptr %210, align 2, !tbaa !10
  %212 = zext i16 %211 to i64
  %213 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %212
  %214 = load float, ptr %213, align 4, !tbaa !14
  store float %214, ptr %44, align 4, !tbaa !14
  %215 = getelementptr inbounds [8 x i16], ptr %176, i64 0, i64 6
  %216 = load i16, ptr %215, align 2, !tbaa !10
  %217 = zext i16 %216 to i64
  %218 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %217
  %219 = load float, ptr %218, align 4, !tbaa !14
  store float %219, ptr %45, align 4, !tbaa !14
  %220 = getelementptr inbounds [8 x i16], ptr %176, i64 0, i64 7
  %221 = load i16, ptr %220, align 2, !tbaa !10
  %222 = zext i16 %221 to i64
  %223 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %222
  %224 = load float, ptr %223, align 4, !tbaa !14
  store float %224, ptr %46, align 4, !tbaa !14
  %225 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %8, i64 8)
  %226 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %182, <vscale x 16 x i8> %169, i64 64)
  %227 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %226, <vscale x 16 x i8> %183, <vscale x 16 x i8> %171, i64 64, i64 3)
  %228 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %227, <vscale x 16 x i8> %184, <vscale x 16 x i8> %173, i64 64, i64 3)
  %229 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %228, <vscale x 16 x i8> %185, <vscale x 16 x i8> %175, i64 64, i64 3)
  %230 = bitcast <vscale x 16 x i16> %229 to <vscale x 8 x i32>
  %231 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %230, i64 0, i64 32)
  %232 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %230, i64 16, i64 32)
  %233 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %231, <vscale x 8 x i16> %232, i64 32)
  %234 = bitcast <vscale x 8 x i16> %233 to <vscale x 4 x i32>
  %235 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %234, i64 0, i64 16)
  %236 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %234, i64 16, i64 16)
  %237 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %235, <vscale x 4 x i16> %236, i64 16)
  %238 = bitcast <vscale x 4 x i16> %237 to <vscale x 2 x i32>
  %239 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %238, i64 0, i64 8)
  %240 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %238, i64 16, i64 8)
  %241 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %239, <vscale x 2 x i16> %240, i64 8)
  %242 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %241, i64 7, i64 8)
  %243 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %242, float %144, i64 7, i64 8)
  %244 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %132, <vscale x 2 x float> %243, <vscale x 2 x float> %225, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #10
  %245 = getelementptr inbounds %struct.block.0, ptr %129, i64 %131
  %246 = getelementptr inbounds %struct.block.0, ptr %129, i64 %131, i32 1
  %247 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %246, i64 128)
  %248 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %247, i64 4, i64 128)
  %249 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %248, i64 4, i64 128)
  %250 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %247, i64 4, i64 128)
  %251 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %249, i64 0)
  %252 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %249, i64 16)
  %253 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %250, i64 0)
  %254 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %250, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %9) #10
  %255 = load i16, ptr %245, align 2, !tbaa !10
  %256 = zext i16 %255 to i64
  %257 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %256
  %258 = load float, ptr %257, align 4, !tbaa !14
  store float %258, ptr %9, align 4, !tbaa !14
  %259 = getelementptr inbounds [8 x i16], ptr %245, i64 0, i64 1
  %260 = load i16, ptr %259, align 2, !tbaa !10
  %261 = zext i16 %260 to i64
  %262 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %261
  %263 = load float, ptr %262, align 4, !tbaa !14
  store float %263, ptr %47, align 4, !tbaa !14
  %264 = getelementptr inbounds [8 x i16], ptr %245, i64 0, i64 2
  %265 = load i16, ptr %264, align 2, !tbaa !10
  %266 = zext i16 %265 to i64
  %267 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %266
  %268 = load float, ptr %267, align 4, !tbaa !14
  store float %268, ptr %48, align 4, !tbaa !14
  %269 = getelementptr inbounds [8 x i16], ptr %245, i64 0, i64 3
  %270 = load i16, ptr %269, align 2, !tbaa !10
  %271 = zext i16 %270 to i64
  %272 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %271
  %273 = load float, ptr %272, align 4, !tbaa !14
  store float %273, ptr %49, align 4, !tbaa !14
  %274 = getelementptr inbounds [8 x i16], ptr %245, i64 0, i64 4
  %275 = load i16, ptr %274, align 2, !tbaa !10
  %276 = zext i16 %275 to i64
  %277 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %276
  %278 = load float, ptr %277, align 4, !tbaa !14
  store float %278, ptr %50, align 4, !tbaa !14
  %279 = getelementptr inbounds [8 x i16], ptr %245, i64 0, i64 5
  %280 = load i16, ptr %279, align 2, !tbaa !10
  %281 = zext i16 %280 to i64
  %282 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %281
  %283 = load float, ptr %282, align 4, !tbaa !14
  store float %283, ptr %51, align 4, !tbaa !14
  %284 = getelementptr inbounds [8 x i16], ptr %245, i64 0, i64 6
  %285 = load i16, ptr %284, align 2, !tbaa !10
  %286 = zext i16 %285 to i64
  %287 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %286
  %288 = load float, ptr %287, align 4, !tbaa !14
  store float %288, ptr %52, align 4, !tbaa !14
  %289 = getelementptr inbounds [8 x i16], ptr %245, i64 0, i64 7
  %290 = load i16, ptr %289, align 2, !tbaa !10
  %291 = zext i16 %290 to i64
  %292 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %291
  %293 = load float, ptr %292, align 4, !tbaa !14
  store float %293, ptr %53, align 4, !tbaa !14
  %294 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %9, i64 8)
  %295 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %251, <vscale x 16 x i8> %169, i64 64)
  %296 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %295, <vscale x 16 x i8> %252, <vscale x 16 x i8> %171, i64 64, i64 3)
  %297 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %296, <vscale x 16 x i8> %253, <vscale x 16 x i8> %173, i64 64, i64 3)
  %298 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %297, <vscale x 16 x i8> %254, <vscale x 16 x i8> %175, i64 64, i64 3)
  %299 = bitcast <vscale x 16 x i16> %298 to <vscale x 8 x i32>
  %300 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %299, i64 0, i64 32)
  %301 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %299, i64 16, i64 32)
  %302 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %300, <vscale x 8 x i16> %301, i64 32)
  %303 = bitcast <vscale x 8 x i16> %302 to <vscale x 4 x i32>
  %304 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %303, i64 0, i64 16)
  %305 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %303, i64 16, i64 16)
  %306 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %304, <vscale x 4 x i16> %305, i64 16)
  %307 = bitcast <vscale x 4 x i16> %306 to <vscale x 2 x i32>
  %308 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %307, i64 0, i64 8)
  %309 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %307, i64 16, i64 8)
  %310 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %308, <vscale x 2 x i16> %309, i64 8)
  %311 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %310, i64 7, i64 8)
  %312 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %311, float %144, i64 7, i64 8)
  %313 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %136, <vscale x 2 x float> %312, <vscale x 2 x float> %294, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #10
  %314 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 8
  %315 = load i64, ptr %314, align 2, !tbaa !16
  %316 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 40
  %317 = load i64, ptr %316, align 2, !tbaa !16
  %318 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 72
  %319 = load i64, ptr %318, align 2, !tbaa !16
  %320 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 104
  %321 = load i64, ptr %320, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !19
  %322 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %315, i64 8)
  %323 = bitcast <vscale x 2 x i64> %322 to <vscale x 16 x i8>
  %324 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %317, i64 8)
  %325 = bitcast <vscale x 2 x i64> %324 to <vscale x 16 x i8>
  %326 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %319, i64 8)
  %327 = bitcast <vscale x 2 x i64> %326 to <vscale x 16 x i8>
  %328 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %321, i64 8)
  %329 = bitcast <vscale x 2 x i64> %328 to <vscale x 16 x i8>
  %330 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %177, i64 128)
  %331 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %330, i64 4, i64 128)
  %332 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %331, i64 4, i64 128)
  %333 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %330, i64 4, i64 128)
  %334 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %332, i64 0)
  %335 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %332, i64 16)
  %336 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %333, i64 0)
  %337 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %333, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %10) #10
  %338 = load i16, ptr %176, align 2, !tbaa !10
  %339 = zext i16 %338 to i64
  %340 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %339
  %341 = load float, ptr %340, align 4, !tbaa !14
  store float %341, ptr %10, align 4, !tbaa !14
  %342 = load i16, ptr %190, align 2, !tbaa !10
  %343 = zext i16 %342 to i64
  %344 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %343
  %345 = load float, ptr %344, align 4, !tbaa !14
  store float %345, ptr %54, align 4, !tbaa !14
  %346 = load i16, ptr %195, align 2, !tbaa !10
  %347 = zext i16 %346 to i64
  %348 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %347
  %349 = load float, ptr %348, align 4, !tbaa !14
  store float %349, ptr %55, align 4, !tbaa !14
  %350 = load i16, ptr %200, align 2, !tbaa !10
  %351 = zext i16 %350 to i64
  %352 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %351
  %353 = load float, ptr %352, align 4, !tbaa !14
  store float %353, ptr %56, align 4, !tbaa !14
  %354 = load i16, ptr %205, align 2, !tbaa !10
  %355 = zext i16 %354 to i64
  %356 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %355
  %357 = load float, ptr %356, align 4, !tbaa !14
  store float %357, ptr %57, align 4, !tbaa !14
  %358 = load i16, ptr %210, align 2, !tbaa !10
  %359 = zext i16 %358 to i64
  %360 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %359
  %361 = load float, ptr %360, align 4, !tbaa !14
  store float %361, ptr %58, align 4, !tbaa !14
  %362 = load i16, ptr %215, align 2, !tbaa !10
  %363 = zext i16 %362 to i64
  %364 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %363
  %365 = load float, ptr %364, align 4, !tbaa !14
  store float %365, ptr %59, align 4, !tbaa !14
  %366 = load i16, ptr %220, align 2, !tbaa !10
  %367 = zext i16 %366 to i64
  %368 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %367
  %369 = load float, ptr %368, align 4, !tbaa !14
  store float %369, ptr %60, align 4, !tbaa !14
  %370 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %10, i64 8)
  %371 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %334, <vscale x 16 x i8> %323, i64 64)
  %372 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %371, <vscale x 16 x i8> %335, <vscale x 16 x i8> %325, i64 64, i64 3)
  %373 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %372, <vscale x 16 x i8> %336, <vscale x 16 x i8> %327, i64 64, i64 3)
  %374 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %373, <vscale x 16 x i8> %337, <vscale x 16 x i8> %329, i64 64, i64 3)
  %375 = bitcast <vscale x 16 x i16> %374 to <vscale x 8 x i32>
  %376 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %375, i64 0, i64 32)
  %377 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %375, i64 16, i64 32)
  %378 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %376, <vscale x 8 x i16> %377, i64 32)
  %379 = bitcast <vscale x 8 x i16> %378 to <vscale x 4 x i32>
  %380 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %379, i64 0, i64 16)
  %381 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %379, i64 16, i64 16)
  %382 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %380, <vscale x 4 x i16> %381, i64 16)
  %383 = bitcast <vscale x 4 x i16> %382 to <vscale x 2 x i32>
  %384 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %383, i64 0, i64 8)
  %385 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %383, i64 16, i64 8)
  %386 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %384, <vscale x 2 x i16> %385, i64 8)
  %387 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %386, i64 7, i64 8)
  %388 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %387, float %149, i64 7, i64 8)
  %389 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %133, <vscale x 2 x float> %388, <vscale x 2 x float> %370, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %10) #10
  %390 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %246, i64 128)
  %391 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %390, i64 4, i64 128)
  %392 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %391, i64 4, i64 128)
  %393 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %390, i64 4, i64 128)
  %394 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %392, i64 0)
  %395 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %392, i64 16)
  %396 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %393, i64 0)
  %397 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %393, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %11) #10
  %398 = load i16, ptr %245, align 2, !tbaa !10
  %399 = zext i16 %398 to i64
  %400 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %399
  %401 = load float, ptr %400, align 4, !tbaa !14
  store float %401, ptr %11, align 4, !tbaa !14
  %402 = load i16, ptr %259, align 2, !tbaa !10
  %403 = zext i16 %402 to i64
  %404 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %403
  %405 = load float, ptr %404, align 4, !tbaa !14
  store float %405, ptr %61, align 4, !tbaa !14
  %406 = load i16, ptr %264, align 2, !tbaa !10
  %407 = zext i16 %406 to i64
  %408 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %407
  %409 = load float, ptr %408, align 4, !tbaa !14
  store float %409, ptr %62, align 4, !tbaa !14
  %410 = load i16, ptr %269, align 2, !tbaa !10
  %411 = zext i16 %410 to i64
  %412 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %411
  %413 = load float, ptr %412, align 4, !tbaa !14
  store float %413, ptr %63, align 4, !tbaa !14
  %414 = load i16, ptr %274, align 2, !tbaa !10
  %415 = zext i16 %414 to i64
  %416 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %415
  %417 = load float, ptr %416, align 4, !tbaa !14
  store float %417, ptr %64, align 4, !tbaa !14
  %418 = load i16, ptr %279, align 2, !tbaa !10
  %419 = zext i16 %418 to i64
  %420 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %419
  %421 = load float, ptr %420, align 4, !tbaa !14
  store float %421, ptr %65, align 4, !tbaa !14
  %422 = load i16, ptr %284, align 2, !tbaa !10
  %423 = zext i16 %422 to i64
  %424 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %423
  %425 = load float, ptr %424, align 4, !tbaa !14
  store float %425, ptr %66, align 4, !tbaa !14
  %426 = load i16, ptr %289, align 2, !tbaa !10
  %427 = zext i16 %426 to i64
  %428 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %427
  %429 = load float, ptr %428, align 4, !tbaa !14
  store float %429, ptr %67, align 4, !tbaa !14
  %430 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %11, i64 8)
  %431 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %394, <vscale x 16 x i8> %323, i64 64)
  %432 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %431, <vscale x 16 x i8> %395, <vscale x 16 x i8> %325, i64 64, i64 3)
  %433 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %432, <vscale x 16 x i8> %396, <vscale x 16 x i8> %327, i64 64, i64 3)
  %434 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %433, <vscale x 16 x i8> %397, <vscale x 16 x i8> %329, i64 64, i64 3)
  %435 = bitcast <vscale x 16 x i16> %434 to <vscale x 8 x i32>
  %436 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %435, i64 0, i64 32)
  %437 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %435, i64 16, i64 32)
  %438 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %436, <vscale x 8 x i16> %437, i64 32)
  %439 = bitcast <vscale x 8 x i16> %438 to <vscale x 4 x i32>
  %440 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %439, i64 0, i64 16)
  %441 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %439, i64 16, i64 16)
  %442 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %440, <vscale x 4 x i16> %441, i64 16)
  %443 = bitcast <vscale x 4 x i16> %442 to <vscale x 2 x i32>
  %444 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %443, i64 0, i64 8)
  %445 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %443, i64 16, i64 8)
  %446 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %444, <vscale x 2 x i16> %445, i64 8)
  %447 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %446, i64 7, i64 8)
  %448 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %447, float %149, i64 7, i64 8)
  %449 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %137, <vscale x 2 x float> %448, <vscale x 2 x float> %430, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %11) #10
  %450 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 16
  %451 = load i64, ptr %450, align 2, !tbaa !16
  %452 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 48
  %453 = load i64, ptr %452, align 2, !tbaa !16
  %454 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 80
  %455 = load i64, ptr %454, align 2, !tbaa !16
  %456 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 112
  %457 = load i64, ptr %456, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !20
  %458 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %451, i64 8)
  %459 = bitcast <vscale x 2 x i64> %458 to <vscale x 16 x i8>
  %460 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %453, i64 8)
  %461 = bitcast <vscale x 2 x i64> %460 to <vscale x 16 x i8>
  %462 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %455, i64 8)
  %463 = bitcast <vscale x 2 x i64> %462 to <vscale x 16 x i8>
  %464 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %457, i64 8)
  %465 = bitcast <vscale x 2 x i64> %464 to <vscale x 16 x i8>
  %466 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %177, i64 128)
  %467 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %466, i64 4, i64 128)
  %468 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %467, i64 4, i64 128)
  %469 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %466, i64 4, i64 128)
  %470 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %468, i64 0)
  %471 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %468, i64 16)
  %472 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %469, i64 0)
  %473 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %469, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %12) #10
  %474 = load i16, ptr %176, align 2, !tbaa !10
  %475 = zext i16 %474 to i64
  %476 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %475
  %477 = load float, ptr %476, align 4, !tbaa !14
  store float %477, ptr %12, align 4, !tbaa !14
  %478 = load i16, ptr %190, align 2, !tbaa !10
  %479 = zext i16 %478 to i64
  %480 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %479
  %481 = load float, ptr %480, align 4, !tbaa !14
  store float %481, ptr %68, align 4, !tbaa !14
  %482 = load i16, ptr %195, align 2, !tbaa !10
  %483 = zext i16 %482 to i64
  %484 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %483
  %485 = load float, ptr %484, align 4, !tbaa !14
  store float %485, ptr %69, align 4, !tbaa !14
  %486 = load i16, ptr %200, align 2, !tbaa !10
  %487 = zext i16 %486 to i64
  %488 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %487
  %489 = load float, ptr %488, align 4, !tbaa !14
  store float %489, ptr %70, align 4, !tbaa !14
  %490 = load i16, ptr %205, align 2, !tbaa !10
  %491 = zext i16 %490 to i64
  %492 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %491
  %493 = load float, ptr %492, align 4, !tbaa !14
  store float %493, ptr %71, align 4, !tbaa !14
  %494 = load i16, ptr %210, align 2, !tbaa !10
  %495 = zext i16 %494 to i64
  %496 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %495
  %497 = load float, ptr %496, align 4, !tbaa !14
  store float %497, ptr %72, align 4, !tbaa !14
  %498 = load i16, ptr %215, align 2, !tbaa !10
  %499 = zext i16 %498 to i64
  %500 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %499
  %501 = load float, ptr %500, align 4, !tbaa !14
  store float %501, ptr %73, align 4, !tbaa !14
  %502 = load i16, ptr %220, align 2, !tbaa !10
  %503 = zext i16 %502 to i64
  %504 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %503
  %505 = load float, ptr %504, align 4, !tbaa !14
  store float %505, ptr %74, align 4, !tbaa !14
  %506 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %12, i64 8)
  %507 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %470, <vscale x 16 x i8> %459, i64 64)
  %508 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %507, <vscale x 16 x i8> %471, <vscale x 16 x i8> %461, i64 64, i64 3)
  %509 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %508, <vscale x 16 x i8> %472, <vscale x 16 x i8> %463, i64 64, i64 3)
  %510 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %509, <vscale x 16 x i8> %473, <vscale x 16 x i8> %465, i64 64, i64 3)
  %511 = bitcast <vscale x 16 x i16> %510 to <vscale x 8 x i32>
  %512 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %511, i64 0, i64 32)
  %513 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %511, i64 16, i64 32)
  %514 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %512, <vscale x 8 x i16> %513, i64 32)
  %515 = bitcast <vscale x 8 x i16> %514 to <vscale x 4 x i32>
  %516 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %515, i64 0, i64 16)
  %517 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %515, i64 16, i64 16)
  %518 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %516, <vscale x 4 x i16> %517, i64 16)
  %519 = bitcast <vscale x 4 x i16> %518 to <vscale x 2 x i32>
  %520 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %519, i64 0, i64 8)
  %521 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %519, i64 16, i64 8)
  %522 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %520, <vscale x 2 x i16> %521, i64 8)
  %523 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %522, i64 7, i64 8)
  %524 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %523, float %154, i64 7, i64 8)
  %525 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %134, <vscale x 2 x float> %524, <vscale x 2 x float> %506, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %12) #10
  %526 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %246, i64 128)
  %527 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %526, i64 4, i64 128)
  %528 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %527, i64 4, i64 128)
  %529 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %526, i64 4, i64 128)
  %530 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %528, i64 0)
  %531 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %528, i64 16)
  %532 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %529, i64 0)
  %533 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %529, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %13) #10
  %534 = load i16, ptr %245, align 2, !tbaa !10
  %535 = zext i16 %534 to i64
  %536 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %535
  %537 = load float, ptr %536, align 4, !tbaa !14
  store float %537, ptr %13, align 4, !tbaa !14
  %538 = load i16, ptr %259, align 2, !tbaa !10
  %539 = zext i16 %538 to i64
  %540 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %539
  %541 = load float, ptr %540, align 4, !tbaa !14
  store float %541, ptr %75, align 4, !tbaa !14
  %542 = load i16, ptr %264, align 2, !tbaa !10
  %543 = zext i16 %542 to i64
  %544 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %543
  %545 = load float, ptr %544, align 4, !tbaa !14
  store float %545, ptr %76, align 4, !tbaa !14
  %546 = load i16, ptr %269, align 2, !tbaa !10
  %547 = zext i16 %546 to i64
  %548 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %547
  %549 = load float, ptr %548, align 4, !tbaa !14
  store float %549, ptr %77, align 4, !tbaa !14
  %550 = load i16, ptr %274, align 2, !tbaa !10
  %551 = zext i16 %550 to i64
  %552 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %551
  %553 = load float, ptr %552, align 4, !tbaa !14
  store float %553, ptr %78, align 4, !tbaa !14
  %554 = load i16, ptr %279, align 2, !tbaa !10
  %555 = zext i16 %554 to i64
  %556 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %555
  %557 = load float, ptr %556, align 4, !tbaa !14
  store float %557, ptr %79, align 4, !tbaa !14
  %558 = load i16, ptr %284, align 2, !tbaa !10
  %559 = zext i16 %558 to i64
  %560 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %559
  %561 = load float, ptr %560, align 4, !tbaa !14
  store float %561, ptr %80, align 4, !tbaa !14
  %562 = load i16, ptr %289, align 2, !tbaa !10
  %563 = zext i16 %562 to i64
  %564 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %563
  %565 = load float, ptr %564, align 4, !tbaa !14
  store float %565, ptr %81, align 4, !tbaa !14
  %566 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %13, i64 8)
  %567 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %530, <vscale x 16 x i8> %459, i64 64)
  %568 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %567, <vscale x 16 x i8> %531, <vscale x 16 x i8> %461, i64 64, i64 3)
  %569 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %568, <vscale x 16 x i8> %532, <vscale x 16 x i8> %463, i64 64, i64 3)
  %570 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %569, <vscale x 16 x i8> %533, <vscale x 16 x i8> %465, i64 64, i64 3)
  %571 = bitcast <vscale x 16 x i16> %570 to <vscale x 8 x i32>
  %572 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %571, i64 0, i64 32)
  %573 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %571, i64 16, i64 32)
  %574 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %572, <vscale x 8 x i16> %573, i64 32)
  %575 = bitcast <vscale x 8 x i16> %574 to <vscale x 4 x i32>
  %576 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %575, i64 0, i64 16)
  %577 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %575, i64 16, i64 16)
  %578 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %576, <vscale x 4 x i16> %577, i64 16)
  %579 = bitcast <vscale x 4 x i16> %578 to <vscale x 2 x i32>
  %580 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %579, i64 0, i64 8)
  %581 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %579, i64 16, i64 8)
  %582 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %580, <vscale x 2 x i16> %581, i64 8)
  %583 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %582, i64 7, i64 8)
  %584 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %583, float %154, i64 7, i64 8)
  %585 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %138, <vscale x 2 x float> %584, <vscale x 2 x float> %566, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %13) #10
  %586 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 24
  %587 = load i64, ptr %586, align 2, !tbaa !16
  %588 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 56
  %589 = load i64, ptr %588, align 2, !tbaa !16
  %590 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 88
  %591 = load i64, ptr %590, align 2, !tbaa !16
  %592 = getelementptr inbounds %struct.block, ptr %110, i64 %131, i32 1, i64 120
  %593 = load i64, ptr %592, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !21
  %594 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %587, i64 8)
  %595 = bitcast <vscale x 2 x i64> %594 to <vscale x 16 x i8>
  %596 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %589, i64 8)
  %597 = bitcast <vscale x 2 x i64> %596 to <vscale x 16 x i8>
  %598 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %591, i64 8)
  %599 = bitcast <vscale x 2 x i64> %598 to <vscale x 16 x i8>
  %600 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %593, i64 8)
  %601 = bitcast <vscale x 2 x i64> %600 to <vscale x 16 x i8>
  %602 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %177, i64 128)
  %603 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %602, i64 4, i64 128)
  %604 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %603, i64 4, i64 128)
  %605 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %602, i64 4, i64 128)
  %606 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %604, i64 0)
  %607 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %604, i64 16)
  %608 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %605, i64 0)
  %609 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %605, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %14) #10
  %610 = load i16, ptr %176, align 2, !tbaa !10
  %611 = zext i16 %610 to i64
  %612 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %611
  %613 = load float, ptr %612, align 4, !tbaa !14
  store float %613, ptr %14, align 4, !tbaa !14
  %614 = load i16, ptr %190, align 2, !tbaa !10
  %615 = zext i16 %614 to i64
  %616 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %615
  %617 = load float, ptr %616, align 4, !tbaa !14
  store float %617, ptr %82, align 4, !tbaa !14
  %618 = load i16, ptr %195, align 2, !tbaa !10
  %619 = zext i16 %618 to i64
  %620 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %619
  %621 = load float, ptr %620, align 4, !tbaa !14
  store float %621, ptr %83, align 4, !tbaa !14
  %622 = load i16, ptr %200, align 2, !tbaa !10
  %623 = zext i16 %622 to i64
  %624 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %623
  %625 = load float, ptr %624, align 4, !tbaa !14
  store float %625, ptr %84, align 4, !tbaa !14
  %626 = load i16, ptr %205, align 2, !tbaa !10
  %627 = zext i16 %626 to i64
  %628 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %627
  %629 = load float, ptr %628, align 4, !tbaa !14
  store float %629, ptr %85, align 4, !tbaa !14
  %630 = load i16, ptr %210, align 2, !tbaa !10
  %631 = zext i16 %630 to i64
  %632 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %631
  %633 = load float, ptr %632, align 4, !tbaa !14
  store float %633, ptr %86, align 4, !tbaa !14
  %634 = load i16, ptr %215, align 2, !tbaa !10
  %635 = zext i16 %634 to i64
  %636 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %635
  %637 = load float, ptr %636, align 4, !tbaa !14
  store float %637, ptr %87, align 4, !tbaa !14
  %638 = load i16, ptr %220, align 2, !tbaa !10
  %639 = zext i16 %638 to i64
  %640 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %639
  %641 = load float, ptr %640, align 4, !tbaa !14
  store float %641, ptr %88, align 4, !tbaa !14
  %642 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %14, i64 8)
  %643 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %606, <vscale x 16 x i8> %595, i64 64)
  %644 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %643, <vscale x 16 x i8> %607, <vscale x 16 x i8> %597, i64 64, i64 3)
  %645 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %644, <vscale x 16 x i8> %608, <vscale x 16 x i8> %599, i64 64, i64 3)
  %646 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %645, <vscale x 16 x i8> %609, <vscale x 16 x i8> %601, i64 64, i64 3)
  %647 = bitcast <vscale x 16 x i16> %646 to <vscale x 8 x i32>
  %648 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %647, i64 0, i64 32)
  %649 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %647, i64 16, i64 32)
  %650 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %648, <vscale x 8 x i16> %649, i64 32)
  %651 = bitcast <vscale x 8 x i16> %650 to <vscale x 4 x i32>
  %652 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %651, i64 0, i64 16)
  %653 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %651, i64 16, i64 16)
  %654 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %652, <vscale x 4 x i16> %653, i64 16)
  %655 = bitcast <vscale x 4 x i16> %654 to <vscale x 2 x i32>
  %656 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %655, i64 0, i64 8)
  %657 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %655, i64 16, i64 8)
  %658 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %656, <vscale x 2 x i16> %657, i64 8)
  %659 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %658, i64 7, i64 8)
  %660 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %659, float %159, i64 7, i64 8)
  %661 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %135, <vscale x 2 x float> %660, <vscale x 2 x float> %642, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %14) #10
  %662 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %246, i64 128)
  %663 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %662, i64 4, i64 128)
  %664 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %663, i64 4, i64 128)
  %665 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %662, i64 4, i64 128)
  %666 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %664, i64 0)
  %667 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %664, i64 16)
  %668 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %665, i64 0)
  %669 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %665, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %15) #10
  %670 = load i16, ptr %245, align 2, !tbaa !10
  %671 = zext i16 %670 to i64
  %672 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %671
  %673 = load float, ptr %672, align 4, !tbaa !14
  store float %673, ptr %15, align 4, !tbaa !14
  %674 = load i16, ptr %259, align 2, !tbaa !10
  %675 = zext i16 %674 to i64
  %676 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %675
  %677 = load float, ptr %676, align 4, !tbaa !14
  store float %677, ptr %89, align 4, !tbaa !14
  %678 = load i16, ptr %264, align 2, !tbaa !10
  %679 = zext i16 %678 to i64
  %680 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %679
  %681 = load float, ptr %680, align 4, !tbaa !14
  store float %681, ptr %90, align 4, !tbaa !14
  %682 = load i16, ptr %269, align 2, !tbaa !10
  %683 = zext i16 %682 to i64
  %684 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %683
  %685 = load float, ptr %684, align 4, !tbaa !14
  store float %685, ptr %91, align 4, !tbaa !14
  %686 = load i16, ptr %274, align 2, !tbaa !10
  %687 = zext i16 %686 to i64
  %688 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %687
  %689 = load float, ptr %688, align 4, !tbaa !14
  store float %689, ptr %92, align 4, !tbaa !14
  %690 = load i16, ptr %279, align 2, !tbaa !10
  %691 = zext i16 %690 to i64
  %692 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %691
  %693 = load float, ptr %692, align 4, !tbaa !14
  store float %693, ptr %93, align 4, !tbaa !14
  %694 = load i16, ptr %284, align 2, !tbaa !10
  %695 = zext i16 %694 to i64
  %696 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %695
  %697 = load float, ptr %696, align 4, !tbaa !14
  store float %697, ptr %94, align 4, !tbaa !14
  %698 = load i16, ptr %289, align 2, !tbaa !10
  %699 = zext i16 %698 to i64
  %700 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %699
  %701 = load float, ptr %700, align 4, !tbaa !14
  store float %701, ptr %95, align 4, !tbaa !14
  %702 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %15, i64 8)
  %703 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %666, <vscale x 16 x i8> %595, i64 64)
  %704 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %703, <vscale x 16 x i8> %667, <vscale x 16 x i8> %597, i64 64, i64 3)
  %705 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %704, <vscale x 16 x i8> %668, <vscale x 16 x i8> %599, i64 64, i64 3)
  %706 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %705, <vscale x 16 x i8> %669, <vscale x 16 x i8> %601, i64 64, i64 3)
  %707 = bitcast <vscale x 16 x i16> %706 to <vscale x 8 x i32>
  %708 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %707, i64 0, i64 32)
  %709 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %707, i64 16, i64 32)
  %710 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %708, <vscale x 8 x i16> %709, i64 32)
  %711 = bitcast <vscale x 8 x i16> %710 to <vscale x 4 x i32>
  %712 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %711, i64 0, i64 16)
  %713 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %711, i64 16, i64 16)
  %714 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %712, <vscale x 4 x i16> %713, i64 16)
  %715 = bitcast <vscale x 4 x i16> %714 to <vscale x 2 x i32>
  %716 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %715, i64 0, i64 8)
  %717 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %715, i64 16, i64 8)
  %718 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %716, <vscale x 2 x i16> %717, i64 8)
  %719 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %718, i64 7, i64 8)
  %720 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %719, float %159, i64 7, i64 8)
  %721 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %139, <vscale x 2 x float> %720, <vscale x 2 x float> %702, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %15) #10
  %722 = add nuw nsw i64 %131, 1
  %723 = icmp eq i64 %722, %106
  br i1 %723, label %724, label %130, !llvm.loop !22

724:                                              ; preds = %130
  %725 = shl nsw i64 %124, 3
  %726 = getelementptr float, ptr %113, i64 %725
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %244, ptr %726, i64 8)
  %727 = shl nsw i64 %127, 3
  %728 = getelementptr float, ptr %113, i64 %727
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %313, ptr %728, i64 8)
  %729 = getelementptr float, ptr %116, i64 %725
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %389, ptr %729, i64 8)
  %730 = getelementptr float, ptr %116, i64 %727
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %449, ptr %730, i64 8)
  %731 = getelementptr float, ptr %119, i64 %725
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %525, ptr %731, i64 8)
  %732 = getelementptr float, ptr %119, i64 %727
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %585, ptr %732, i64 8)
  %733 = getelementptr float, ptr %122, i64 %725
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %661, ptr %733, i64 8)
  %734 = getelementptr float, ptr %122, i64 %727
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %721, ptr %734, i64 8)
  %735 = add nuw nsw i64 %124, 2
  %736 = icmp ult i64 %735, %104
  br i1 %736, label %123, label %737, !llvm.loop !24

737:                                              ; preds = %724
  %738 = add nuw nsw i64 %108, 1
  %739 = icmp eq i64 %738, %105
  br i1 %739, label %772, label %107, !llvm.loop !25

740:                                              ; preds = %99, %768
  %741 = phi i64 [ 0, %99 ], [ %769, %768 ]
  %742 = shl nsw i64 %741, 2
  %743 = mul i64 %742, %2
  %744 = getelementptr float, ptr %1, i64 %743
  %745 = or disjoint i64 %742, 1
  %746 = mul i64 %745, %2
  %747 = getelementptr float, ptr %1, i64 %746
  %748 = or disjoint i64 %742, 2
  %749 = mul i64 %748, %2
  %750 = getelementptr float, ptr %1, i64 %749
  %751 = or disjoint i64 %742, 3
  %752 = mul i64 %751, %2
  %753 = getelementptr float, ptr %1, i64 %752
  br label %754

754:                                              ; preds = %740, %754
  %755 = phi i64 [ 0, %740 ], [ %766, %754 ]
  %756 = shl i64 %755, 3
  %757 = getelementptr float, ptr %744, i64 %756
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %98, ptr %757, i64 8)
  %758 = or disjoint i64 %756, 8
  %759 = getelementptr float, ptr %744, i64 %758
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %98, ptr %759, i64 8)
  %760 = getelementptr float, ptr %747, i64 %756
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %98, ptr %760, i64 8)
  %761 = getelementptr float, ptr %747, i64 %758
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %98, ptr %761, i64 8)
  %762 = getelementptr float, ptr %750, i64 %756
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %98, ptr %762, i64 8)
  %763 = getelementptr float, ptr %750, i64 %758
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %98, ptr %763, i64 8)
  %764 = getelementptr float, ptr %753, i64 %756
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %98, ptr %764, i64 8)
  %765 = getelementptr float, ptr %753, i64 %758
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %98, ptr %765, i64 8)
  %766 = add nuw nsw i64 %755, 2
  %767 = icmp ult i64 %766, %100
  br i1 %767, label %754, label %768, !llvm.loop !24

768:                                              ; preds = %754
  %769 = add nuw nsw i64 %741, 1
  %770 = icmp eq i64 %769, %101
  br i1 %770, label %772, label %740, !llvm.loop !25

771:                                              ; preds = %28
  tail call void @ggml_gemm_q4_0_8x8_q8_0_generic(i32 noundef signext %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef signext %5, i32 noundef signext %6)
  br label %772

772:                                              ; preds = %768, %737, %37, %34, %771
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef signext, ptr noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(read)
declare i64 @llvm.read_register.i64(metadata) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfmv.v.f.nxv2f32.i64(<vscale x 2 x float>, float, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64>, i64, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8>, ptr nocapture, i64) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8>, <vscale x 32 x i8>, i64, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8>, <vscale x 32 x i8>, i64, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8>, i64 immarg) #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float>, ptr nocapture, i64) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64, i64 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float>, <vscale x 2 x i32>, i64 immarg, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float>, <vscale x 2 x float>, float, i64 immarg, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, i64 immarg, i64, i64 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float>, ptr nocapture, i64) #7

declare void @ggml_gemm_q4_0_8x8_q8_0_generic(i32 noundef signext, ptr noundef, i64 noundef, ptr noundef, ptr noundef, i32 noundef signext, i32 noundef signext) local_unnamed_addr #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16>, <vscale x 8 x i32>, i64, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i16>, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16>, <vscale x 4 x i32>, i64, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i16>, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16>, <vscale x 2 x i32>, i64, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32>, <vscale x 2 x i16>, <vscale x 2 x i16>, i64) #4

attributes #0 = { mustprogress uwtable vscale_range(4,1024) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl64b,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl64b,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(read) }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #6 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #8 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl64b,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"PIE Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 2}
!7 = !{i32 8, !"SmallDataLimit", i32 8}
!8 = !{!"Ubuntu clang version 18.1.8 (++20240731025043+3b5b5c1ec4a3-1~exp1~20240731145144.92)"}
!9 = !{!"vlenb"}
!10 = !{!11, !11, i64 0}
!11 = !{!"short", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C++ TBAA"}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !12, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !12, i64 0}
!18 = !{i64 8600}
!19 = !{i64 18193}
!20 = !{i64 24855}
!21 = !{i64 31409}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
