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
  %16 = alloca [8 x float], align 4
  %17 = sdiv i32 %0, 32
  %18 = and i32 %0, 31
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %21, label %20

20:                                               ; preds = %7
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef signext 87, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

21:                                               ; preds = %7
  %22 = and i32 %5, 3
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %25, label %24

24:                                               ; preds = %21
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef signext 88, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

25:                                               ; preds = %21
  %26 = and i32 %6, 7
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %29, label %28

28:                                               ; preds = %25
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef signext 89, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

29:                                               ; preds = %25
  %30 = tail call i64 @llvm.read_register.i64(metadata !9)
  %31 = icmp ugt i64 %30, 31
  br i1 %31, label %32, label %1069

32:                                               ; preds = %29
  %33 = and i32 %6, 8
  %34 = icmp eq i32 %33, 0
  %35 = ashr exact i32 %5, 2
  %36 = icmp sgt i32 %35, 0
  br i1 %34, label %334, label %37

37:                                               ; preds = %32
  br i1 %36, label %38, label %1070

38:                                               ; preds = %37
  %39 = ashr exact i32 %6, 3
  %40 = icmp sgt i32 %39, 0
  %41 = getelementptr inbounds float, ptr %16, i64 1
  %42 = getelementptr inbounds float, ptr %16, i64 2
  %43 = getelementptr inbounds float, ptr %16, i64 3
  %44 = getelementptr inbounds float, ptr %16, i64 4
  %45 = getelementptr inbounds float, ptr %16, i64 5
  %46 = getelementptr inbounds float, ptr %16, i64 6
  %47 = getelementptr inbounds float, ptr %16, i64 7
  br i1 %40, label %48, label %1070

48:                                               ; preds = %38
  %49 = icmp sgt i32 %0, 31
  %50 = tail call <vscale x 2 x float> @llvm.riscv.vfmv.v.f.nxv2f32.i64(<vscale x 2 x float> poison, float 0.000000e+00, i64 8)
  br i1 %49, label %54, label %51

51:                                               ; preds = %48
  %52 = zext nneg i32 %35 to i64
  %53 = zext nneg i32 %39 to i64
  br label %308

54:                                               ; preds = %48
  %55 = zext nneg i32 %17 to i64
  %56 = zext nneg i32 %35 to i64
  %57 = zext nneg i32 %39 to i64
  %58 = zext nneg i32 %17 to i64
  br label %59

59:                                               ; preds = %54, %305
  %60 = phi i64 [ 0, %54 ], [ %306, %305 ]
  %61 = mul nsw i64 %60, %55
  %62 = getelementptr inbounds %struct.block, ptr %4, i64 %61
  %63 = shl nsw i64 %60, 2
  %64 = mul i64 %63, %2
  %65 = getelementptr float, ptr %1, i64 %64
  %66 = or disjoint i64 %63, 1
  %67 = mul i64 %66, %2
  %68 = getelementptr float, ptr %1, i64 %67
  %69 = or disjoint i64 %63, 2
  %70 = mul i64 %69, %2
  %71 = getelementptr float, ptr %1, i64 %70
  %72 = or disjoint i64 %63, 3
  %73 = mul i64 %72, %2
  %74 = getelementptr float, ptr %1, i64 %73
  br label %75

75:                                               ; preds = %297, %59
  %76 = phi i64 [ %303, %297 ], [ 0, %59 ]
  %77 = mul nsw i64 %76, %55
  %78 = getelementptr inbounds %struct.block.0, ptr %3, i64 %77
  br label %79

79:                                               ; preds = %79, %75
  %80 = phi i64 [ %295, %79 ], [ 0, %75 ]
  %81 = phi <vscale x 2 x float> [ %294, %79 ], [ %50, %75 ]
  %82 = phi <vscale x 2 x float> [ %259, %79 ], [ %50, %75 ]
  %83 = phi <vscale x 2 x float> [ %224, %79 ], [ %50, %75 ]
  %84 = phi <vscale x 2 x float> [ %189, %79 ], [ %50, %75 ]
  %85 = getelementptr inbounds %struct.block.0, ptr %78, i64 %80
  %86 = getelementptr inbounds %struct.block.0, ptr %78, i64 %80, i32 1
  %87 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %86, i64 128)
  %88 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %87, i64 4, i64 128)
  %89 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %88, i64 4, i64 128)
  %90 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %87, i64 4, i64 128)
  %91 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %89, i64 0)
  %92 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %89, i64 16)
  %93 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %90, i64 0)
  %94 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %90, i64 16)
  %95 = getelementptr inbounds %struct.block, ptr %62, i64 %80
  %96 = load i16, ptr %95, align 2, !tbaa !10
  %97 = zext i16 %96 to i64
  %98 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %97
  %99 = load float, ptr %98, align 4, !tbaa !14
  %100 = getelementptr inbounds [4 x i16], ptr %95, i64 0, i64 1
  %101 = load i16, ptr %100, align 2, !tbaa !10
  %102 = zext i16 %101 to i64
  %103 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %102
  %104 = load float, ptr %103, align 4, !tbaa !14
  %105 = getelementptr inbounds [4 x i16], ptr %95, i64 0, i64 2
  %106 = load i16, ptr %105, align 2, !tbaa !10
  %107 = zext i16 %106 to i64
  %108 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %107
  %109 = load float, ptr %108, align 4, !tbaa !14
  %110 = getelementptr inbounds [4 x i16], ptr %95, i64 0, i64 3
  %111 = load i16, ptr %110, align 2, !tbaa !10
  %112 = zext i16 %111 to i64
  %113 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %112
  %114 = load float, ptr %113, align 4, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %16) #10
  %115 = load i16, ptr %85, align 2, !tbaa !10
  %116 = zext i16 %115 to i64
  %117 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %116
  %118 = load float, ptr %117, align 4, !tbaa !14
  store float %118, ptr %16, align 4, !tbaa !14
  %119 = getelementptr inbounds [8 x i16], ptr %85, i64 0, i64 1
  %120 = load i16, ptr %119, align 2, !tbaa !10
  %121 = zext i16 %120 to i64
  %122 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %121
  %123 = load float, ptr %122, align 4, !tbaa !14
  store float %123, ptr %41, align 4, !tbaa !14
  %124 = getelementptr inbounds [8 x i16], ptr %85, i64 0, i64 2
  %125 = load i16, ptr %124, align 2, !tbaa !10
  %126 = zext i16 %125 to i64
  %127 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %126
  %128 = load float, ptr %127, align 4, !tbaa !14
  store float %128, ptr %42, align 4, !tbaa !14
  %129 = getelementptr inbounds [8 x i16], ptr %85, i64 0, i64 3
  %130 = load i16, ptr %129, align 2, !tbaa !10
  %131 = zext i16 %130 to i64
  %132 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %131
  %133 = load float, ptr %132, align 4, !tbaa !14
  store float %133, ptr %43, align 4, !tbaa !14
  %134 = getelementptr inbounds [8 x i16], ptr %85, i64 0, i64 4
  %135 = load i16, ptr %134, align 2, !tbaa !10
  %136 = zext i16 %135 to i64
  %137 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %136
  %138 = load float, ptr %137, align 4, !tbaa !14
  store float %138, ptr %44, align 4, !tbaa !14
  %139 = getelementptr inbounds [8 x i16], ptr %85, i64 0, i64 5
  %140 = load i16, ptr %139, align 2, !tbaa !10
  %141 = zext i16 %140 to i64
  %142 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %141
  %143 = load float, ptr %142, align 4, !tbaa !14
  store float %143, ptr %45, align 4, !tbaa !14
  %144 = getelementptr inbounds [8 x i16], ptr %85, i64 0, i64 6
  %145 = load i16, ptr %144, align 2, !tbaa !10
  %146 = zext i16 %145 to i64
  %147 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %146
  %148 = load float, ptr %147, align 4, !tbaa !14
  store float %148, ptr %46, align 4, !tbaa !14
  %149 = getelementptr inbounds [8 x i16], ptr %85, i64 0, i64 7
  %150 = load i16, ptr %149, align 2, !tbaa !10
  %151 = zext i16 %150 to i64
  %152 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %151
  %153 = load float, ptr %152, align 4, !tbaa !14
  store float %153, ptr %47, align 4, !tbaa !14
  %154 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %16, i64 8)
  %155 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1
  %156 = load i64, ptr %155, align 2, !tbaa !16
  %157 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 32
  %158 = load i64, ptr %157, align 2, !tbaa !16
  %159 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 64
  %160 = load i64, ptr %159, align 2, !tbaa !16
  %161 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 96
  %162 = load i64, ptr %161, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !18
  %163 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %156, i64 8)
  %164 = bitcast <vscale x 2 x i64> %163 to <vscale x 16 x i8>
  %165 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %158, i64 8)
  %166 = bitcast <vscale x 2 x i64> %165 to <vscale x 16 x i8>
  %167 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %160, i64 8)
  %168 = bitcast <vscale x 2 x i64> %167 to <vscale x 16 x i8>
  %169 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %162, i64 8)
  %170 = bitcast <vscale x 2 x i64> %169 to <vscale x 16 x i8>
  %171 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %91, <vscale x 16 x i8> %164, i64 64)
  %172 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %171, <vscale x 16 x i8> %92, <vscale x 16 x i8> %166, i64 64, i64 3)
  %173 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %172, <vscale x 16 x i8> %93, <vscale x 16 x i8> %168, i64 64, i64 3)
  %174 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %173, <vscale x 16 x i8> %94, <vscale x 16 x i8> %170, i64 64, i64 3)
  %175 = bitcast <vscale x 16 x i16> %174 to <vscale x 8 x i32>
  %176 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %175, i64 0, i64 32)
  %177 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %175, i64 16, i64 32)
  %178 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %176, <vscale x 8 x i16> %177, i64 32)
  %179 = bitcast <vscale x 8 x i16> %178 to <vscale x 4 x i32>
  %180 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %179, i64 0, i64 16)
  %181 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %179, i64 16, i64 16)
  %182 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %180, <vscale x 4 x i16> %181, i64 16)
  %183 = bitcast <vscale x 4 x i16> %182 to <vscale x 2 x i32>
  %184 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %183, i64 0, i64 8)
  %185 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %183, i64 16, i64 8)
  %186 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %184, <vscale x 2 x i16> %185, i64 8)
  %187 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %186, i64 7, i64 8)
  %188 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %187, float %99, i64 7, i64 8)
  %189 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %84, <vscale x 2 x float> %188, <vscale x 2 x float> %154, i64 7, i64 8, i64 3)
  %190 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 8
  %191 = load i64, ptr %190, align 2, !tbaa !16
  %192 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 40
  %193 = load i64, ptr %192, align 2, !tbaa !16
  %194 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 72
  %195 = load i64, ptr %194, align 2, !tbaa !16
  %196 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 104
  %197 = load i64, ptr %196, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !19
  %198 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %191, i64 8)
  %199 = bitcast <vscale x 2 x i64> %198 to <vscale x 16 x i8>
  %200 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %193, i64 8)
  %201 = bitcast <vscale x 2 x i64> %200 to <vscale x 16 x i8>
  %202 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %195, i64 8)
  %203 = bitcast <vscale x 2 x i64> %202 to <vscale x 16 x i8>
  %204 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %197, i64 8)
  %205 = bitcast <vscale x 2 x i64> %204 to <vscale x 16 x i8>
  %206 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %91, <vscale x 16 x i8> %199, i64 64)
  %207 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %206, <vscale x 16 x i8> %92, <vscale x 16 x i8> %201, i64 64, i64 3)
  %208 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %207, <vscale x 16 x i8> %93, <vscale x 16 x i8> %203, i64 64, i64 3)
  %209 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %208, <vscale x 16 x i8> %94, <vscale x 16 x i8> %205, i64 64, i64 3)
  %210 = bitcast <vscale x 16 x i16> %209 to <vscale x 8 x i32>
  %211 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %210, i64 0, i64 32)
  %212 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %210, i64 16, i64 32)
  %213 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %211, <vscale x 8 x i16> %212, i64 32)
  %214 = bitcast <vscale x 8 x i16> %213 to <vscale x 4 x i32>
  %215 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %214, i64 0, i64 16)
  %216 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %214, i64 16, i64 16)
  %217 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %215, <vscale x 4 x i16> %216, i64 16)
  %218 = bitcast <vscale x 4 x i16> %217 to <vscale x 2 x i32>
  %219 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %218, i64 0, i64 8)
  %220 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %218, i64 16, i64 8)
  %221 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %219, <vscale x 2 x i16> %220, i64 8)
  %222 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %221, i64 7, i64 8)
  %223 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %222, float %104, i64 7, i64 8)
  %224 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %83, <vscale x 2 x float> %223, <vscale x 2 x float> %154, i64 7, i64 8, i64 3)
  %225 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 16
  %226 = load i64, ptr %225, align 2, !tbaa !16
  %227 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 48
  %228 = load i64, ptr %227, align 2, !tbaa !16
  %229 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 80
  %230 = load i64, ptr %229, align 2, !tbaa !16
  %231 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 112
  %232 = load i64, ptr %231, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !20
  %233 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %226, i64 8)
  %234 = bitcast <vscale x 2 x i64> %233 to <vscale x 16 x i8>
  %235 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %228, i64 8)
  %236 = bitcast <vscale x 2 x i64> %235 to <vscale x 16 x i8>
  %237 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %230, i64 8)
  %238 = bitcast <vscale x 2 x i64> %237 to <vscale x 16 x i8>
  %239 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %232, i64 8)
  %240 = bitcast <vscale x 2 x i64> %239 to <vscale x 16 x i8>
  %241 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %91, <vscale x 16 x i8> %234, i64 64)
  %242 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %241, <vscale x 16 x i8> %92, <vscale x 16 x i8> %236, i64 64, i64 3)
  %243 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %242, <vscale x 16 x i8> %93, <vscale x 16 x i8> %238, i64 64, i64 3)
  %244 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %243, <vscale x 16 x i8> %94, <vscale x 16 x i8> %240, i64 64, i64 3)
  %245 = bitcast <vscale x 16 x i16> %244 to <vscale x 8 x i32>
  %246 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %245, i64 0, i64 32)
  %247 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %245, i64 16, i64 32)
  %248 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %246, <vscale x 8 x i16> %247, i64 32)
  %249 = bitcast <vscale x 8 x i16> %248 to <vscale x 4 x i32>
  %250 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %249, i64 0, i64 16)
  %251 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %249, i64 16, i64 16)
  %252 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %250, <vscale x 4 x i16> %251, i64 16)
  %253 = bitcast <vscale x 4 x i16> %252 to <vscale x 2 x i32>
  %254 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %253, i64 0, i64 8)
  %255 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %253, i64 16, i64 8)
  %256 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %254, <vscale x 2 x i16> %255, i64 8)
  %257 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %256, i64 7, i64 8)
  %258 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %257, float %109, i64 7, i64 8)
  %259 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %82, <vscale x 2 x float> %258, <vscale x 2 x float> %154, i64 7, i64 8, i64 3)
  %260 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 24
  %261 = load i64, ptr %260, align 2, !tbaa !16
  %262 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 56
  %263 = load i64, ptr %262, align 2, !tbaa !16
  %264 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 88
  %265 = load i64, ptr %264, align 2, !tbaa !16
  %266 = getelementptr inbounds %struct.block, ptr %62, i64 %80, i32 1, i64 120
  %267 = load i64, ptr %266, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !21
  %268 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %261, i64 8)
  %269 = bitcast <vscale x 2 x i64> %268 to <vscale x 16 x i8>
  %270 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %263, i64 8)
  %271 = bitcast <vscale x 2 x i64> %270 to <vscale x 16 x i8>
  %272 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %265, i64 8)
  %273 = bitcast <vscale x 2 x i64> %272 to <vscale x 16 x i8>
  %274 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %267, i64 8)
  %275 = bitcast <vscale x 2 x i64> %274 to <vscale x 16 x i8>
  %276 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %91, <vscale x 16 x i8> %269, i64 64)
  %277 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %276, <vscale x 16 x i8> %92, <vscale x 16 x i8> %271, i64 64, i64 3)
  %278 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %277, <vscale x 16 x i8> %93, <vscale x 16 x i8> %273, i64 64, i64 3)
  %279 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %278, <vscale x 16 x i8> %94, <vscale x 16 x i8> %275, i64 64, i64 3)
  %280 = bitcast <vscale x 16 x i16> %279 to <vscale x 8 x i32>
  %281 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %280, i64 0, i64 32)
  %282 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %280, i64 16, i64 32)
  %283 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %281, <vscale x 8 x i16> %282, i64 32)
  %284 = bitcast <vscale x 8 x i16> %283 to <vscale x 4 x i32>
  %285 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %284, i64 0, i64 16)
  %286 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %284, i64 16, i64 16)
  %287 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %285, <vscale x 4 x i16> %286, i64 16)
  %288 = bitcast <vscale x 4 x i16> %287 to <vscale x 2 x i32>
  %289 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %288, i64 0, i64 8)
  %290 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %288, i64 16, i64 8)
  %291 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %289, <vscale x 2 x i16> %290, i64 8)
  %292 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %291, i64 7, i64 8)
  %293 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %292, float %114, i64 7, i64 8)
  %294 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %81, <vscale x 2 x float> %293, <vscale x 2 x float> %154, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %16) #10
  %295 = add nuw nsw i64 %80, 1
  %296 = icmp eq i64 %295, %58
  br i1 %296, label %297, label %79, !llvm.loop !22

297:                                              ; preds = %79
  %298 = shl nsw i64 %76, 3
  %299 = getelementptr float, ptr %65, i64 %298
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %189, ptr %299, i64 8)
  %300 = getelementptr float, ptr %68, i64 %298
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %224, ptr %300, i64 8)
  %301 = getelementptr float, ptr %71, i64 %298
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %259, ptr %301, i64 8)
  %302 = getelementptr float, ptr %74, i64 %298
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %294, ptr %302, i64 8)
  %303 = add nuw nsw i64 %76, 1
  %304 = icmp eq i64 %303, %57
  br i1 %304, label %305, label %75, !llvm.loop !24

305:                                              ; preds = %297
  %306 = add nuw nsw i64 %60, 1
  %307 = icmp eq i64 %306, %56
  br i1 %307, label %1070, label %59, !llvm.loop !25

308:                                              ; preds = %51, %331
  %309 = phi i64 [ 0, %51 ], [ %332, %331 ]
  %310 = shl nsw i64 %309, 2
  %311 = mul i64 %310, %2
  %312 = getelementptr float, ptr %1, i64 %311
  %313 = or disjoint i64 %310, 1
  %314 = mul i64 %313, %2
  %315 = getelementptr float, ptr %1, i64 %314
  %316 = or disjoint i64 %310, 2
  %317 = mul i64 %316, %2
  %318 = getelementptr float, ptr %1, i64 %317
  %319 = or disjoint i64 %310, 3
  %320 = mul i64 %319, %2
  %321 = getelementptr float, ptr %1, i64 %320
  br label %322

322:                                              ; preds = %308, %322
  %323 = phi i64 [ 0, %308 ], [ %329, %322 ]
  %324 = shl nsw i64 %323, 3
  %325 = getelementptr float, ptr %312, i64 %324
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %50, ptr %325, i64 8)
  %326 = getelementptr float, ptr %315, i64 %324
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %50, ptr %326, i64 8)
  %327 = getelementptr float, ptr %318, i64 %324
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %50, ptr %327, i64 8)
  %328 = getelementptr float, ptr %321, i64 %324
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %50, ptr %328, i64 8)
  %329 = add nuw nsw i64 %323, 1
  %330 = icmp eq i64 %329, %53
  br i1 %330, label %331, label %322, !llvm.loop !24

331:                                              ; preds = %322
  %332 = add nuw nsw i64 %309, 1
  %333 = icmp eq i64 %332, %52
  br i1 %333, label %1070, label %308, !llvm.loop !25

334:                                              ; preds = %32
  br i1 %36, label %335, label %1070

335:                                              ; preds = %334
  %336 = ashr exact i32 %6, 3
  %337 = icmp sgt i32 %336, 0
  %338 = getelementptr inbounds float, ptr %8, i64 1
  %339 = getelementptr inbounds float, ptr %8, i64 2
  %340 = getelementptr inbounds float, ptr %8, i64 3
  %341 = getelementptr inbounds float, ptr %8, i64 4
  %342 = getelementptr inbounds float, ptr %8, i64 5
  %343 = getelementptr inbounds float, ptr %8, i64 6
  %344 = getelementptr inbounds float, ptr %8, i64 7
  %345 = getelementptr inbounds float, ptr %9, i64 1
  %346 = getelementptr inbounds float, ptr %9, i64 2
  %347 = getelementptr inbounds float, ptr %9, i64 3
  %348 = getelementptr inbounds float, ptr %9, i64 4
  %349 = getelementptr inbounds float, ptr %9, i64 5
  %350 = getelementptr inbounds float, ptr %9, i64 6
  %351 = getelementptr inbounds float, ptr %9, i64 7
  %352 = getelementptr inbounds float, ptr %10, i64 1
  %353 = getelementptr inbounds float, ptr %10, i64 2
  %354 = getelementptr inbounds float, ptr %10, i64 3
  %355 = getelementptr inbounds float, ptr %10, i64 4
  %356 = getelementptr inbounds float, ptr %10, i64 5
  %357 = getelementptr inbounds float, ptr %10, i64 6
  %358 = getelementptr inbounds float, ptr %10, i64 7
  %359 = getelementptr inbounds float, ptr %11, i64 1
  %360 = getelementptr inbounds float, ptr %11, i64 2
  %361 = getelementptr inbounds float, ptr %11, i64 3
  %362 = getelementptr inbounds float, ptr %11, i64 4
  %363 = getelementptr inbounds float, ptr %11, i64 5
  %364 = getelementptr inbounds float, ptr %11, i64 6
  %365 = getelementptr inbounds float, ptr %11, i64 7
  %366 = getelementptr inbounds float, ptr %12, i64 1
  %367 = getelementptr inbounds float, ptr %12, i64 2
  %368 = getelementptr inbounds float, ptr %12, i64 3
  %369 = getelementptr inbounds float, ptr %12, i64 4
  %370 = getelementptr inbounds float, ptr %12, i64 5
  %371 = getelementptr inbounds float, ptr %12, i64 6
  %372 = getelementptr inbounds float, ptr %12, i64 7
  %373 = getelementptr inbounds float, ptr %13, i64 1
  %374 = getelementptr inbounds float, ptr %13, i64 2
  %375 = getelementptr inbounds float, ptr %13, i64 3
  %376 = getelementptr inbounds float, ptr %13, i64 4
  %377 = getelementptr inbounds float, ptr %13, i64 5
  %378 = getelementptr inbounds float, ptr %13, i64 6
  %379 = getelementptr inbounds float, ptr %13, i64 7
  %380 = getelementptr inbounds float, ptr %14, i64 1
  %381 = getelementptr inbounds float, ptr %14, i64 2
  %382 = getelementptr inbounds float, ptr %14, i64 3
  %383 = getelementptr inbounds float, ptr %14, i64 4
  %384 = getelementptr inbounds float, ptr %14, i64 5
  %385 = getelementptr inbounds float, ptr %14, i64 6
  %386 = getelementptr inbounds float, ptr %14, i64 7
  %387 = getelementptr inbounds float, ptr %15, i64 1
  %388 = getelementptr inbounds float, ptr %15, i64 2
  %389 = getelementptr inbounds float, ptr %15, i64 3
  %390 = getelementptr inbounds float, ptr %15, i64 4
  %391 = getelementptr inbounds float, ptr %15, i64 5
  %392 = getelementptr inbounds float, ptr %15, i64 6
  %393 = getelementptr inbounds float, ptr %15, i64 7
  br i1 %337, label %394, label %1070

394:                                              ; preds = %335
  %395 = icmp sgt i32 %0, 31
  %396 = tail call <vscale x 2 x float> @llvm.riscv.vfmv.v.f.nxv2f32.i64(<vscale x 2 x float> poison, float 0.000000e+00, i64 8)
  br i1 %395, label %400, label %397

397:                                              ; preds = %394
  %398 = zext nneg i32 %336 to i64
  %399 = zext nneg i32 %35 to i64
  br label %1038

400:                                              ; preds = %394
  %401 = zext nneg i32 %17 to i64
  %402 = zext nneg i32 %336 to i64
  %403 = zext nneg i32 %35 to i64
  %404 = zext nneg i32 %17 to i64
  br label %405

405:                                              ; preds = %400, %1035
  %406 = phi i64 [ 0, %400 ], [ %1036, %1035 ]
  %407 = mul nsw i64 %406, %401
  %408 = getelementptr inbounds %struct.block, ptr %4, i64 %407
  %409 = shl nsw i64 %406, 2
  %410 = mul i64 %409, %2
  %411 = getelementptr float, ptr %1, i64 %410
  %412 = or disjoint i64 %409, 1
  %413 = mul i64 %412, %2
  %414 = getelementptr float, ptr %1, i64 %413
  %415 = or disjoint i64 %409, 2
  %416 = mul i64 %415, %2
  %417 = getelementptr float, ptr %1, i64 %416
  %418 = or disjoint i64 %409, 3
  %419 = mul i64 %418, %2
  %420 = getelementptr float, ptr %1, i64 %419
  br label %421

421:                                              ; preds = %1022, %405
  %422 = phi i64 [ %1033, %1022 ], [ 0, %405 ]
  %423 = mul nsw i64 %422, %401
  %424 = getelementptr inbounds %struct.block.0, ptr %3, i64 %423
  %425 = or disjoint i64 %422, 1
  %426 = mul nsw i64 %425, %401
  %427 = getelementptr inbounds %struct.block.0, ptr %3, i64 %426
  br label %428

428:                                              ; preds = %428, %421
  %429 = phi i64 [ %1020, %428 ], [ 0, %421 ]
  %430 = phi <vscale x 2 x float> [ %542, %428 ], [ %396, %421 ]
  %431 = phi <vscale x 2 x float> [ %687, %428 ], [ %396, %421 ]
  %432 = phi <vscale x 2 x float> [ %823, %428 ], [ %396, %421 ]
  %433 = phi <vscale x 2 x float> [ %959, %428 ], [ %396, %421 ]
  %434 = phi <vscale x 2 x float> [ %611, %428 ], [ %396, %421 ]
  %435 = phi <vscale x 2 x float> [ %747, %428 ], [ %396, %421 ]
  %436 = phi <vscale x 2 x float> [ %883, %428 ], [ %396, %421 ]
  %437 = phi <vscale x 2 x float> [ %1019, %428 ], [ %396, %421 ]
  %438 = getelementptr inbounds %struct.block, ptr %408, i64 %429
  %439 = load i16, ptr %438, align 2, !tbaa !10
  %440 = zext i16 %439 to i64
  %441 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %440
  %442 = load float, ptr %441, align 4, !tbaa !14
  %443 = getelementptr inbounds [4 x i16], ptr %438, i64 0, i64 1
  %444 = load i16, ptr %443, align 2, !tbaa !10
  %445 = zext i16 %444 to i64
  %446 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %445
  %447 = load float, ptr %446, align 4, !tbaa !14
  %448 = getelementptr inbounds [4 x i16], ptr %438, i64 0, i64 2
  %449 = load i16, ptr %448, align 2, !tbaa !10
  %450 = zext i16 %449 to i64
  %451 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %450
  %452 = load float, ptr %451, align 4, !tbaa !14
  %453 = getelementptr inbounds [4 x i16], ptr %438, i64 0, i64 3
  %454 = load i16, ptr %453, align 2, !tbaa !10
  %455 = zext i16 %454 to i64
  %456 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %455
  %457 = load float, ptr %456, align 4, !tbaa !14
  %458 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1
  %459 = load i64, ptr %458, align 2, !tbaa !16
  %460 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 32
  %461 = load i64, ptr %460, align 2, !tbaa !16
  %462 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 64
  %463 = load i64, ptr %462, align 2, !tbaa !16
  %464 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 96
  %465 = load i64, ptr %464, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !26
  %466 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %459, i64 8)
  %467 = bitcast <vscale x 2 x i64> %466 to <vscale x 16 x i8>
  %468 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %461, i64 8)
  %469 = bitcast <vscale x 2 x i64> %468 to <vscale x 16 x i8>
  %470 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %463, i64 8)
  %471 = bitcast <vscale x 2 x i64> %470 to <vscale x 16 x i8>
  %472 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %465, i64 8)
  %473 = bitcast <vscale x 2 x i64> %472 to <vscale x 16 x i8>
  %474 = getelementptr inbounds %struct.block.0, ptr %424, i64 %429
  %475 = getelementptr inbounds %struct.block.0, ptr %424, i64 %429, i32 1
  %476 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %475, i64 128)
  %477 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %476, i64 4, i64 128)
  %478 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %477, i64 4, i64 128)
  %479 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %476, i64 4, i64 128)
  %480 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %478, i64 0)
  %481 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %478, i64 16)
  %482 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %479, i64 0)
  %483 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %479, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #10
  %484 = load i16, ptr %474, align 2, !tbaa !10
  %485 = zext i16 %484 to i64
  %486 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %485
  %487 = load float, ptr %486, align 4, !tbaa !14
  store float %487, ptr %8, align 4, !tbaa !14
  %488 = getelementptr inbounds [8 x i16], ptr %474, i64 0, i64 1
  %489 = load i16, ptr %488, align 2, !tbaa !10
  %490 = zext i16 %489 to i64
  %491 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %490
  %492 = load float, ptr %491, align 4, !tbaa !14
  store float %492, ptr %338, align 4, !tbaa !14
  %493 = getelementptr inbounds [8 x i16], ptr %474, i64 0, i64 2
  %494 = load i16, ptr %493, align 2, !tbaa !10
  %495 = zext i16 %494 to i64
  %496 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %495
  %497 = load float, ptr %496, align 4, !tbaa !14
  store float %497, ptr %339, align 4, !tbaa !14
  %498 = getelementptr inbounds [8 x i16], ptr %474, i64 0, i64 3
  %499 = load i16, ptr %498, align 2, !tbaa !10
  %500 = zext i16 %499 to i64
  %501 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %500
  %502 = load float, ptr %501, align 4, !tbaa !14
  store float %502, ptr %340, align 4, !tbaa !14
  %503 = getelementptr inbounds [8 x i16], ptr %474, i64 0, i64 4
  %504 = load i16, ptr %503, align 2, !tbaa !10
  %505 = zext i16 %504 to i64
  %506 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %505
  %507 = load float, ptr %506, align 4, !tbaa !14
  store float %507, ptr %341, align 4, !tbaa !14
  %508 = getelementptr inbounds [8 x i16], ptr %474, i64 0, i64 5
  %509 = load i16, ptr %508, align 2, !tbaa !10
  %510 = zext i16 %509 to i64
  %511 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %510
  %512 = load float, ptr %511, align 4, !tbaa !14
  store float %512, ptr %342, align 4, !tbaa !14
  %513 = getelementptr inbounds [8 x i16], ptr %474, i64 0, i64 6
  %514 = load i16, ptr %513, align 2, !tbaa !10
  %515 = zext i16 %514 to i64
  %516 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %515
  %517 = load float, ptr %516, align 4, !tbaa !14
  store float %517, ptr %343, align 4, !tbaa !14
  %518 = getelementptr inbounds [8 x i16], ptr %474, i64 0, i64 7
  %519 = load i16, ptr %518, align 2, !tbaa !10
  %520 = zext i16 %519 to i64
  %521 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %520
  %522 = load float, ptr %521, align 4, !tbaa !14
  store float %522, ptr %344, align 4, !tbaa !14
  %523 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %8, i64 8)
  %524 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %480, <vscale x 16 x i8> %467, i64 64)
  %525 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %524, <vscale x 16 x i8> %481, <vscale x 16 x i8> %469, i64 64, i64 3)
  %526 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %525, <vscale x 16 x i8> %482, <vscale x 16 x i8> %471, i64 64, i64 3)
  %527 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %526, <vscale x 16 x i8> %483, <vscale x 16 x i8> %473, i64 64, i64 3)
  %528 = bitcast <vscale x 16 x i16> %527 to <vscale x 8 x i32>
  %529 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %528, i64 0, i64 32)
  %530 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %528, i64 16, i64 32)
  %531 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %529, <vscale x 8 x i16> %530, i64 32)
  %532 = bitcast <vscale x 8 x i16> %531 to <vscale x 4 x i32>
  %533 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %532, i64 0, i64 16)
  %534 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %532, i64 16, i64 16)
  %535 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %533, <vscale x 4 x i16> %534, i64 16)
  %536 = bitcast <vscale x 4 x i16> %535 to <vscale x 2 x i32>
  %537 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %536, i64 0, i64 8)
  %538 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %536, i64 16, i64 8)
  %539 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %537, <vscale x 2 x i16> %538, i64 8)
  %540 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %539, i64 7, i64 8)
  %541 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %540, float %442, i64 7, i64 8)
  %542 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %430, <vscale x 2 x float> %541, <vscale x 2 x float> %523, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #10
  %543 = getelementptr inbounds %struct.block.0, ptr %427, i64 %429
  %544 = getelementptr inbounds %struct.block.0, ptr %427, i64 %429, i32 1
  %545 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %544, i64 128)
  %546 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %545, i64 4, i64 128)
  %547 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %546, i64 4, i64 128)
  %548 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %545, i64 4, i64 128)
  %549 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %547, i64 0)
  %550 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %547, i64 16)
  %551 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %548, i64 0)
  %552 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %548, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %9) #10
  %553 = load i16, ptr %543, align 2, !tbaa !10
  %554 = zext i16 %553 to i64
  %555 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %554
  %556 = load float, ptr %555, align 4, !tbaa !14
  store float %556, ptr %9, align 4, !tbaa !14
  %557 = getelementptr inbounds [8 x i16], ptr %543, i64 0, i64 1
  %558 = load i16, ptr %557, align 2, !tbaa !10
  %559 = zext i16 %558 to i64
  %560 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %559
  %561 = load float, ptr %560, align 4, !tbaa !14
  store float %561, ptr %345, align 4, !tbaa !14
  %562 = getelementptr inbounds [8 x i16], ptr %543, i64 0, i64 2
  %563 = load i16, ptr %562, align 2, !tbaa !10
  %564 = zext i16 %563 to i64
  %565 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %564
  %566 = load float, ptr %565, align 4, !tbaa !14
  store float %566, ptr %346, align 4, !tbaa !14
  %567 = getelementptr inbounds [8 x i16], ptr %543, i64 0, i64 3
  %568 = load i16, ptr %567, align 2, !tbaa !10
  %569 = zext i16 %568 to i64
  %570 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %569
  %571 = load float, ptr %570, align 4, !tbaa !14
  store float %571, ptr %347, align 4, !tbaa !14
  %572 = getelementptr inbounds [8 x i16], ptr %543, i64 0, i64 4
  %573 = load i16, ptr %572, align 2, !tbaa !10
  %574 = zext i16 %573 to i64
  %575 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %574
  %576 = load float, ptr %575, align 4, !tbaa !14
  store float %576, ptr %348, align 4, !tbaa !14
  %577 = getelementptr inbounds [8 x i16], ptr %543, i64 0, i64 5
  %578 = load i16, ptr %577, align 2, !tbaa !10
  %579 = zext i16 %578 to i64
  %580 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %579
  %581 = load float, ptr %580, align 4, !tbaa !14
  store float %581, ptr %349, align 4, !tbaa !14
  %582 = getelementptr inbounds [8 x i16], ptr %543, i64 0, i64 6
  %583 = load i16, ptr %582, align 2, !tbaa !10
  %584 = zext i16 %583 to i64
  %585 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %584
  %586 = load float, ptr %585, align 4, !tbaa !14
  store float %586, ptr %350, align 4, !tbaa !14
  %587 = getelementptr inbounds [8 x i16], ptr %543, i64 0, i64 7
  %588 = load i16, ptr %587, align 2, !tbaa !10
  %589 = zext i16 %588 to i64
  %590 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %589
  %591 = load float, ptr %590, align 4, !tbaa !14
  store float %591, ptr %351, align 4, !tbaa !14
  %592 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %9, i64 8)
  %593 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %549, <vscale x 16 x i8> %467, i64 64)
  %594 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %593, <vscale x 16 x i8> %550, <vscale x 16 x i8> %469, i64 64, i64 3)
  %595 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %594, <vscale x 16 x i8> %551, <vscale x 16 x i8> %471, i64 64, i64 3)
  %596 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %595, <vscale x 16 x i8> %552, <vscale x 16 x i8> %473, i64 64, i64 3)
  %597 = bitcast <vscale x 16 x i16> %596 to <vscale x 8 x i32>
  %598 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %597, i64 0, i64 32)
  %599 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %597, i64 16, i64 32)
  %600 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %598, <vscale x 8 x i16> %599, i64 32)
  %601 = bitcast <vscale x 8 x i16> %600 to <vscale x 4 x i32>
  %602 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %601, i64 0, i64 16)
  %603 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %601, i64 16, i64 16)
  %604 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %602, <vscale x 4 x i16> %603, i64 16)
  %605 = bitcast <vscale x 4 x i16> %604 to <vscale x 2 x i32>
  %606 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %605, i64 0, i64 8)
  %607 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %605, i64 16, i64 8)
  %608 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %606, <vscale x 2 x i16> %607, i64 8)
  %609 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %608, i64 7, i64 8)
  %610 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %609, float %442, i64 7, i64 8)
  %611 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %434, <vscale x 2 x float> %610, <vscale x 2 x float> %592, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #10
  %612 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 8
  %613 = load i64, ptr %612, align 2, !tbaa !16
  %614 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 40
  %615 = load i64, ptr %614, align 2, !tbaa !16
  %616 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 72
  %617 = load i64, ptr %616, align 2, !tbaa !16
  %618 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 104
  %619 = load i64, ptr %618, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !27
  %620 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %613, i64 8)
  %621 = bitcast <vscale x 2 x i64> %620 to <vscale x 16 x i8>
  %622 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %615, i64 8)
  %623 = bitcast <vscale x 2 x i64> %622 to <vscale x 16 x i8>
  %624 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %617, i64 8)
  %625 = bitcast <vscale x 2 x i64> %624 to <vscale x 16 x i8>
  %626 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %619, i64 8)
  %627 = bitcast <vscale x 2 x i64> %626 to <vscale x 16 x i8>
  %628 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %475, i64 128)
  %629 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %628, i64 4, i64 128)
  %630 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %629, i64 4, i64 128)
  %631 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %628, i64 4, i64 128)
  %632 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %630, i64 0)
  %633 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %630, i64 16)
  %634 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %631, i64 0)
  %635 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %631, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %10) #10
  %636 = load i16, ptr %474, align 2, !tbaa !10
  %637 = zext i16 %636 to i64
  %638 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %637
  %639 = load float, ptr %638, align 4, !tbaa !14
  store float %639, ptr %10, align 4, !tbaa !14
  %640 = load i16, ptr %488, align 2, !tbaa !10
  %641 = zext i16 %640 to i64
  %642 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %641
  %643 = load float, ptr %642, align 4, !tbaa !14
  store float %643, ptr %352, align 4, !tbaa !14
  %644 = load i16, ptr %493, align 2, !tbaa !10
  %645 = zext i16 %644 to i64
  %646 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %645
  %647 = load float, ptr %646, align 4, !tbaa !14
  store float %647, ptr %353, align 4, !tbaa !14
  %648 = load i16, ptr %498, align 2, !tbaa !10
  %649 = zext i16 %648 to i64
  %650 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %649
  %651 = load float, ptr %650, align 4, !tbaa !14
  store float %651, ptr %354, align 4, !tbaa !14
  %652 = load i16, ptr %503, align 2, !tbaa !10
  %653 = zext i16 %652 to i64
  %654 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %653
  %655 = load float, ptr %654, align 4, !tbaa !14
  store float %655, ptr %355, align 4, !tbaa !14
  %656 = load i16, ptr %508, align 2, !tbaa !10
  %657 = zext i16 %656 to i64
  %658 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %657
  %659 = load float, ptr %658, align 4, !tbaa !14
  store float %659, ptr %356, align 4, !tbaa !14
  %660 = load i16, ptr %513, align 2, !tbaa !10
  %661 = zext i16 %660 to i64
  %662 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %661
  %663 = load float, ptr %662, align 4, !tbaa !14
  store float %663, ptr %357, align 4, !tbaa !14
  %664 = load i16, ptr %518, align 2, !tbaa !10
  %665 = zext i16 %664 to i64
  %666 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %665
  %667 = load float, ptr %666, align 4, !tbaa !14
  store float %667, ptr %358, align 4, !tbaa !14
  %668 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %10, i64 8)
  %669 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %632, <vscale x 16 x i8> %621, i64 64)
  %670 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %669, <vscale x 16 x i8> %633, <vscale x 16 x i8> %623, i64 64, i64 3)
  %671 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %670, <vscale x 16 x i8> %634, <vscale x 16 x i8> %625, i64 64, i64 3)
  %672 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %671, <vscale x 16 x i8> %635, <vscale x 16 x i8> %627, i64 64, i64 3)
  %673 = bitcast <vscale x 16 x i16> %672 to <vscale x 8 x i32>
  %674 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %673, i64 0, i64 32)
  %675 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %673, i64 16, i64 32)
  %676 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %674, <vscale x 8 x i16> %675, i64 32)
  %677 = bitcast <vscale x 8 x i16> %676 to <vscale x 4 x i32>
  %678 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %677, i64 0, i64 16)
  %679 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %677, i64 16, i64 16)
  %680 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %678, <vscale x 4 x i16> %679, i64 16)
  %681 = bitcast <vscale x 4 x i16> %680 to <vscale x 2 x i32>
  %682 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %681, i64 0, i64 8)
  %683 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %681, i64 16, i64 8)
  %684 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %682, <vscale x 2 x i16> %683, i64 8)
  %685 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %684, i64 7, i64 8)
  %686 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %685, float %447, i64 7, i64 8)
  %687 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %431, <vscale x 2 x float> %686, <vscale x 2 x float> %668, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %10) #10
  %688 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %544, i64 128)
  %689 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %688, i64 4, i64 128)
  %690 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %689, i64 4, i64 128)
  %691 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %688, i64 4, i64 128)
  %692 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %690, i64 0)
  %693 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %690, i64 16)
  %694 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %691, i64 0)
  %695 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %691, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %11) #10
  %696 = load i16, ptr %543, align 2, !tbaa !10
  %697 = zext i16 %696 to i64
  %698 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %697
  %699 = load float, ptr %698, align 4, !tbaa !14
  store float %699, ptr %11, align 4, !tbaa !14
  %700 = load i16, ptr %557, align 2, !tbaa !10
  %701 = zext i16 %700 to i64
  %702 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %701
  %703 = load float, ptr %702, align 4, !tbaa !14
  store float %703, ptr %359, align 4, !tbaa !14
  %704 = load i16, ptr %562, align 2, !tbaa !10
  %705 = zext i16 %704 to i64
  %706 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %705
  %707 = load float, ptr %706, align 4, !tbaa !14
  store float %707, ptr %360, align 4, !tbaa !14
  %708 = load i16, ptr %567, align 2, !tbaa !10
  %709 = zext i16 %708 to i64
  %710 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %709
  %711 = load float, ptr %710, align 4, !tbaa !14
  store float %711, ptr %361, align 4, !tbaa !14
  %712 = load i16, ptr %572, align 2, !tbaa !10
  %713 = zext i16 %712 to i64
  %714 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %713
  %715 = load float, ptr %714, align 4, !tbaa !14
  store float %715, ptr %362, align 4, !tbaa !14
  %716 = load i16, ptr %577, align 2, !tbaa !10
  %717 = zext i16 %716 to i64
  %718 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %717
  %719 = load float, ptr %718, align 4, !tbaa !14
  store float %719, ptr %363, align 4, !tbaa !14
  %720 = load i16, ptr %582, align 2, !tbaa !10
  %721 = zext i16 %720 to i64
  %722 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %721
  %723 = load float, ptr %722, align 4, !tbaa !14
  store float %723, ptr %364, align 4, !tbaa !14
  %724 = load i16, ptr %587, align 2, !tbaa !10
  %725 = zext i16 %724 to i64
  %726 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %725
  %727 = load float, ptr %726, align 4, !tbaa !14
  store float %727, ptr %365, align 4, !tbaa !14
  %728 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %11, i64 8)
  %729 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %692, <vscale x 16 x i8> %621, i64 64)
  %730 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %729, <vscale x 16 x i8> %693, <vscale x 16 x i8> %623, i64 64, i64 3)
  %731 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %730, <vscale x 16 x i8> %694, <vscale x 16 x i8> %625, i64 64, i64 3)
  %732 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %731, <vscale x 16 x i8> %695, <vscale x 16 x i8> %627, i64 64, i64 3)
  %733 = bitcast <vscale x 16 x i16> %732 to <vscale x 8 x i32>
  %734 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %733, i64 0, i64 32)
  %735 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %733, i64 16, i64 32)
  %736 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %734, <vscale x 8 x i16> %735, i64 32)
  %737 = bitcast <vscale x 8 x i16> %736 to <vscale x 4 x i32>
  %738 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %737, i64 0, i64 16)
  %739 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %737, i64 16, i64 16)
  %740 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %738, <vscale x 4 x i16> %739, i64 16)
  %741 = bitcast <vscale x 4 x i16> %740 to <vscale x 2 x i32>
  %742 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %741, i64 0, i64 8)
  %743 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %741, i64 16, i64 8)
  %744 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %742, <vscale x 2 x i16> %743, i64 8)
  %745 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %744, i64 7, i64 8)
  %746 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %745, float %447, i64 7, i64 8)
  %747 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %435, <vscale x 2 x float> %746, <vscale x 2 x float> %728, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %11) #10
  %748 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 16
  %749 = load i64, ptr %748, align 2, !tbaa !16
  %750 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 48
  %751 = load i64, ptr %750, align 2, !tbaa !16
  %752 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 80
  %753 = load i64, ptr %752, align 2, !tbaa !16
  %754 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 112
  %755 = load i64, ptr %754, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !28
  %756 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %749, i64 8)
  %757 = bitcast <vscale x 2 x i64> %756 to <vscale x 16 x i8>
  %758 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %751, i64 8)
  %759 = bitcast <vscale x 2 x i64> %758 to <vscale x 16 x i8>
  %760 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %753, i64 8)
  %761 = bitcast <vscale x 2 x i64> %760 to <vscale x 16 x i8>
  %762 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %755, i64 8)
  %763 = bitcast <vscale x 2 x i64> %762 to <vscale x 16 x i8>
  %764 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %475, i64 128)
  %765 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %764, i64 4, i64 128)
  %766 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %765, i64 4, i64 128)
  %767 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %764, i64 4, i64 128)
  %768 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %766, i64 0)
  %769 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %766, i64 16)
  %770 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %767, i64 0)
  %771 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %767, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %12) #10
  %772 = load i16, ptr %474, align 2, !tbaa !10
  %773 = zext i16 %772 to i64
  %774 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %773
  %775 = load float, ptr %774, align 4, !tbaa !14
  store float %775, ptr %12, align 4, !tbaa !14
  %776 = load i16, ptr %488, align 2, !tbaa !10
  %777 = zext i16 %776 to i64
  %778 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %777
  %779 = load float, ptr %778, align 4, !tbaa !14
  store float %779, ptr %366, align 4, !tbaa !14
  %780 = load i16, ptr %493, align 2, !tbaa !10
  %781 = zext i16 %780 to i64
  %782 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %781
  %783 = load float, ptr %782, align 4, !tbaa !14
  store float %783, ptr %367, align 4, !tbaa !14
  %784 = load i16, ptr %498, align 2, !tbaa !10
  %785 = zext i16 %784 to i64
  %786 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %785
  %787 = load float, ptr %786, align 4, !tbaa !14
  store float %787, ptr %368, align 4, !tbaa !14
  %788 = load i16, ptr %503, align 2, !tbaa !10
  %789 = zext i16 %788 to i64
  %790 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %789
  %791 = load float, ptr %790, align 4, !tbaa !14
  store float %791, ptr %369, align 4, !tbaa !14
  %792 = load i16, ptr %508, align 2, !tbaa !10
  %793 = zext i16 %792 to i64
  %794 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %793
  %795 = load float, ptr %794, align 4, !tbaa !14
  store float %795, ptr %370, align 4, !tbaa !14
  %796 = load i16, ptr %513, align 2, !tbaa !10
  %797 = zext i16 %796 to i64
  %798 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %797
  %799 = load float, ptr %798, align 4, !tbaa !14
  store float %799, ptr %371, align 4, !tbaa !14
  %800 = load i16, ptr %518, align 2, !tbaa !10
  %801 = zext i16 %800 to i64
  %802 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %801
  %803 = load float, ptr %802, align 4, !tbaa !14
  store float %803, ptr %372, align 4, !tbaa !14
  %804 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %12, i64 8)
  %805 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %768, <vscale x 16 x i8> %757, i64 64)
  %806 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %805, <vscale x 16 x i8> %769, <vscale x 16 x i8> %759, i64 64, i64 3)
  %807 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %806, <vscale x 16 x i8> %770, <vscale x 16 x i8> %761, i64 64, i64 3)
  %808 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %807, <vscale x 16 x i8> %771, <vscale x 16 x i8> %763, i64 64, i64 3)
  %809 = bitcast <vscale x 16 x i16> %808 to <vscale x 8 x i32>
  %810 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %809, i64 0, i64 32)
  %811 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %809, i64 16, i64 32)
  %812 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %810, <vscale x 8 x i16> %811, i64 32)
  %813 = bitcast <vscale x 8 x i16> %812 to <vscale x 4 x i32>
  %814 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %813, i64 0, i64 16)
  %815 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %813, i64 16, i64 16)
  %816 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %814, <vscale x 4 x i16> %815, i64 16)
  %817 = bitcast <vscale x 4 x i16> %816 to <vscale x 2 x i32>
  %818 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %817, i64 0, i64 8)
  %819 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %817, i64 16, i64 8)
  %820 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %818, <vscale x 2 x i16> %819, i64 8)
  %821 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %820, i64 7, i64 8)
  %822 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %821, float %452, i64 7, i64 8)
  %823 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %432, <vscale x 2 x float> %822, <vscale x 2 x float> %804, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %12) #10
  %824 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %544, i64 128)
  %825 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %824, i64 4, i64 128)
  %826 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %825, i64 4, i64 128)
  %827 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %824, i64 4, i64 128)
  %828 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %826, i64 0)
  %829 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %826, i64 16)
  %830 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %827, i64 0)
  %831 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %827, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %13) #10
  %832 = load i16, ptr %543, align 2, !tbaa !10
  %833 = zext i16 %832 to i64
  %834 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %833
  %835 = load float, ptr %834, align 4, !tbaa !14
  store float %835, ptr %13, align 4, !tbaa !14
  %836 = load i16, ptr %557, align 2, !tbaa !10
  %837 = zext i16 %836 to i64
  %838 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %837
  %839 = load float, ptr %838, align 4, !tbaa !14
  store float %839, ptr %373, align 4, !tbaa !14
  %840 = load i16, ptr %562, align 2, !tbaa !10
  %841 = zext i16 %840 to i64
  %842 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %841
  %843 = load float, ptr %842, align 4, !tbaa !14
  store float %843, ptr %374, align 4, !tbaa !14
  %844 = load i16, ptr %567, align 2, !tbaa !10
  %845 = zext i16 %844 to i64
  %846 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %845
  %847 = load float, ptr %846, align 4, !tbaa !14
  store float %847, ptr %375, align 4, !tbaa !14
  %848 = load i16, ptr %572, align 2, !tbaa !10
  %849 = zext i16 %848 to i64
  %850 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %849
  %851 = load float, ptr %850, align 4, !tbaa !14
  store float %851, ptr %376, align 4, !tbaa !14
  %852 = load i16, ptr %577, align 2, !tbaa !10
  %853 = zext i16 %852 to i64
  %854 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %853
  %855 = load float, ptr %854, align 4, !tbaa !14
  store float %855, ptr %377, align 4, !tbaa !14
  %856 = load i16, ptr %582, align 2, !tbaa !10
  %857 = zext i16 %856 to i64
  %858 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %857
  %859 = load float, ptr %858, align 4, !tbaa !14
  store float %859, ptr %378, align 4, !tbaa !14
  %860 = load i16, ptr %587, align 2, !tbaa !10
  %861 = zext i16 %860 to i64
  %862 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %861
  %863 = load float, ptr %862, align 4, !tbaa !14
  store float %863, ptr %379, align 4, !tbaa !14
  %864 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %13, i64 8)
  %865 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %828, <vscale x 16 x i8> %757, i64 64)
  %866 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %865, <vscale x 16 x i8> %829, <vscale x 16 x i8> %759, i64 64, i64 3)
  %867 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %866, <vscale x 16 x i8> %830, <vscale x 16 x i8> %761, i64 64, i64 3)
  %868 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %867, <vscale x 16 x i8> %831, <vscale x 16 x i8> %763, i64 64, i64 3)
  %869 = bitcast <vscale x 16 x i16> %868 to <vscale x 8 x i32>
  %870 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %869, i64 0, i64 32)
  %871 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %869, i64 16, i64 32)
  %872 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %870, <vscale x 8 x i16> %871, i64 32)
  %873 = bitcast <vscale x 8 x i16> %872 to <vscale x 4 x i32>
  %874 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %873, i64 0, i64 16)
  %875 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %873, i64 16, i64 16)
  %876 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %874, <vscale x 4 x i16> %875, i64 16)
  %877 = bitcast <vscale x 4 x i16> %876 to <vscale x 2 x i32>
  %878 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %877, i64 0, i64 8)
  %879 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %877, i64 16, i64 8)
  %880 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %878, <vscale x 2 x i16> %879, i64 8)
  %881 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %880, i64 7, i64 8)
  %882 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %881, float %452, i64 7, i64 8)
  %883 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %436, <vscale x 2 x float> %882, <vscale x 2 x float> %864, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %13) #10
  %884 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 24
  %885 = load i64, ptr %884, align 2, !tbaa !16
  %886 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 56
  %887 = load i64, ptr %886, align 2, !tbaa !16
  %888 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 88
  %889 = load i64, ptr %888, align 2, !tbaa !16
  %890 = getelementptr inbounds %struct.block, ptr %408, i64 %429, i32 1, i64 120
  %891 = load i64, ptr %890, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !29
  %892 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %885, i64 8)
  %893 = bitcast <vscale x 2 x i64> %892 to <vscale x 16 x i8>
  %894 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %887, i64 8)
  %895 = bitcast <vscale x 2 x i64> %894 to <vscale x 16 x i8>
  %896 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %889, i64 8)
  %897 = bitcast <vscale x 2 x i64> %896 to <vscale x 16 x i8>
  %898 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %891, i64 8)
  %899 = bitcast <vscale x 2 x i64> %898 to <vscale x 16 x i8>
  %900 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %475, i64 128)
  %901 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %900, i64 4, i64 128)
  %902 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %901, i64 4, i64 128)
  %903 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %900, i64 4, i64 128)
  %904 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %902, i64 0)
  %905 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %902, i64 16)
  %906 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %903, i64 0)
  %907 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %903, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %14) #10
  %908 = load i16, ptr %474, align 2, !tbaa !10
  %909 = zext i16 %908 to i64
  %910 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %909
  %911 = load float, ptr %910, align 4, !tbaa !14
  store float %911, ptr %14, align 4, !tbaa !14
  %912 = load i16, ptr %488, align 2, !tbaa !10
  %913 = zext i16 %912 to i64
  %914 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %913
  %915 = load float, ptr %914, align 4, !tbaa !14
  store float %915, ptr %380, align 4, !tbaa !14
  %916 = load i16, ptr %493, align 2, !tbaa !10
  %917 = zext i16 %916 to i64
  %918 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %917
  %919 = load float, ptr %918, align 4, !tbaa !14
  store float %919, ptr %381, align 4, !tbaa !14
  %920 = load i16, ptr %498, align 2, !tbaa !10
  %921 = zext i16 %920 to i64
  %922 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %921
  %923 = load float, ptr %922, align 4, !tbaa !14
  store float %923, ptr %382, align 4, !tbaa !14
  %924 = load i16, ptr %503, align 2, !tbaa !10
  %925 = zext i16 %924 to i64
  %926 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %925
  %927 = load float, ptr %926, align 4, !tbaa !14
  store float %927, ptr %383, align 4, !tbaa !14
  %928 = load i16, ptr %508, align 2, !tbaa !10
  %929 = zext i16 %928 to i64
  %930 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %929
  %931 = load float, ptr %930, align 4, !tbaa !14
  store float %931, ptr %384, align 4, !tbaa !14
  %932 = load i16, ptr %513, align 2, !tbaa !10
  %933 = zext i16 %932 to i64
  %934 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %933
  %935 = load float, ptr %934, align 4, !tbaa !14
  store float %935, ptr %385, align 4, !tbaa !14
  %936 = load i16, ptr %518, align 2, !tbaa !10
  %937 = zext i16 %936 to i64
  %938 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %937
  %939 = load float, ptr %938, align 4, !tbaa !14
  store float %939, ptr %386, align 4, !tbaa !14
  %940 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %14, i64 8)
  %941 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %904, <vscale x 16 x i8> %893, i64 64)
  %942 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %941, <vscale x 16 x i8> %905, <vscale x 16 x i8> %895, i64 64, i64 3)
  %943 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %942, <vscale x 16 x i8> %906, <vscale x 16 x i8> %897, i64 64, i64 3)
  %944 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %943, <vscale x 16 x i8> %907, <vscale x 16 x i8> %899, i64 64, i64 3)
  %945 = bitcast <vscale x 16 x i16> %944 to <vscale x 8 x i32>
  %946 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %945, i64 0, i64 32)
  %947 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %945, i64 16, i64 32)
  %948 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %946, <vscale x 8 x i16> %947, i64 32)
  %949 = bitcast <vscale x 8 x i16> %948 to <vscale x 4 x i32>
  %950 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %949, i64 0, i64 16)
  %951 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %949, i64 16, i64 16)
  %952 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %950, <vscale x 4 x i16> %951, i64 16)
  %953 = bitcast <vscale x 4 x i16> %952 to <vscale x 2 x i32>
  %954 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %953, i64 0, i64 8)
  %955 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %953, i64 16, i64 8)
  %956 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %954, <vscale x 2 x i16> %955, i64 8)
  %957 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %956, i64 7, i64 8)
  %958 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %957, float %457, i64 7, i64 8)
  %959 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %433, <vscale x 2 x float> %958, <vscale x 2 x float> %940, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %14) #10
  %960 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %544, i64 128)
  %961 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %960, i64 4, i64 128)
  %962 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %961, i64 4, i64 128)
  %963 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %960, i64 4, i64 128)
  %964 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %962, i64 0)
  %965 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %962, i64 16)
  %966 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %963, i64 0)
  %967 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %963, i64 16)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %15) #10
  %968 = load i16, ptr %543, align 2, !tbaa !10
  %969 = zext i16 %968 to i64
  %970 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %969
  %971 = load float, ptr %970, align 4, !tbaa !14
  store float %971, ptr %15, align 4, !tbaa !14
  %972 = load i16, ptr %557, align 2, !tbaa !10
  %973 = zext i16 %972 to i64
  %974 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %973
  %975 = load float, ptr %974, align 4, !tbaa !14
  store float %975, ptr %387, align 4, !tbaa !14
  %976 = load i16, ptr %562, align 2, !tbaa !10
  %977 = zext i16 %976 to i64
  %978 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %977
  %979 = load float, ptr %978, align 4, !tbaa !14
  store float %979, ptr %388, align 4, !tbaa !14
  %980 = load i16, ptr %567, align 2, !tbaa !10
  %981 = zext i16 %980 to i64
  %982 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %981
  %983 = load float, ptr %982, align 4, !tbaa !14
  store float %983, ptr %389, align 4, !tbaa !14
  %984 = load i16, ptr %572, align 2, !tbaa !10
  %985 = zext i16 %984 to i64
  %986 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %985
  %987 = load float, ptr %986, align 4, !tbaa !14
  store float %987, ptr %390, align 4, !tbaa !14
  %988 = load i16, ptr %577, align 2, !tbaa !10
  %989 = zext i16 %988 to i64
  %990 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %989
  %991 = load float, ptr %990, align 4, !tbaa !14
  store float %991, ptr %391, align 4, !tbaa !14
  %992 = load i16, ptr %582, align 2, !tbaa !10
  %993 = zext i16 %992 to i64
  %994 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %993
  %995 = load float, ptr %994, align 4, !tbaa !14
  store float %995, ptr %392, align 4, !tbaa !14
  %996 = load i16, ptr %587, align 2, !tbaa !10
  %997 = zext i16 %996 to i64
  %998 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %997
  %999 = load float, ptr %998, align 4, !tbaa !14
  store float %999, ptr %393, align 4, !tbaa !14
  %1000 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %15, i64 8)
  %1001 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %964, <vscale x 16 x i8> %893, i64 64)
  %1002 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %1001, <vscale x 16 x i8> %965, <vscale x 16 x i8> %895, i64 64, i64 3)
  %1003 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %1002, <vscale x 16 x i8> %966, <vscale x 16 x i8> %897, i64 64, i64 3)
  %1004 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %1003, <vscale x 16 x i8> %967, <vscale x 16 x i8> %899, i64 64, i64 3)
  %1005 = bitcast <vscale x 16 x i16> %1004 to <vscale x 8 x i32>
  %1006 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %1005, i64 0, i64 32)
  %1007 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %1005, i64 16, i64 32)
  %1008 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %1006, <vscale x 8 x i16> %1007, i64 32)
  %1009 = bitcast <vscale x 8 x i16> %1008 to <vscale x 4 x i32>
  %1010 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %1009, i64 0, i64 16)
  %1011 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %1009, i64 16, i64 16)
  %1012 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %1010, <vscale x 4 x i16> %1011, i64 16)
  %1013 = bitcast <vscale x 4 x i16> %1012 to <vscale x 2 x i32>
  %1014 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %1013, i64 0, i64 8)
  %1015 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %1013, i64 16, i64 8)
  %1016 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %1014, <vscale x 2 x i16> %1015, i64 8)
  %1017 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %1016, i64 7, i64 8)
  %1018 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %1017, float %457, i64 7, i64 8)
  %1019 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %437, <vscale x 2 x float> %1018, <vscale x 2 x float> %1000, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %15) #10
  %1020 = add nuw nsw i64 %429, 1
  %1021 = icmp eq i64 %1020, %404
  br i1 %1021, label %1022, label %428, !llvm.loop !30

1022:                                             ; preds = %428
  %1023 = shl nsw i64 %422, 3
  %1024 = getelementptr float, ptr %411, i64 %1023
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %542, ptr %1024, i64 8)
  %1025 = shl nsw i64 %425, 3
  %1026 = getelementptr float, ptr %411, i64 %1025
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %611, ptr %1026, i64 8)
  %1027 = getelementptr float, ptr %414, i64 %1023
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %687, ptr %1027, i64 8)
  %1028 = getelementptr float, ptr %414, i64 %1025
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %747, ptr %1028, i64 8)
  %1029 = getelementptr float, ptr %417, i64 %1023
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %823, ptr %1029, i64 8)
  %1030 = getelementptr float, ptr %417, i64 %1025
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %883, ptr %1030, i64 8)
  %1031 = getelementptr float, ptr %420, i64 %1023
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %959, ptr %1031, i64 8)
  %1032 = getelementptr float, ptr %420, i64 %1025
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %1019, ptr %1032, i64 8)
  %1033 = add nuw nsw i64 %422, 2
  %1034 = icmp ult i64 %1033, %402
  br i1 %1034, label %421, label %1035, !llvm.loop !31

1035:                                             ; preds = %1022
  %1036 = add nuw nsw i64 %406, 1
  %1037 = icmp eq i64 %1036, %403
  br i1 %1037, label %1070, label %405, !llvm.loop !32

1038:                                             ; preds = %397, %1066
  %1039 = phi i64 [ 0, %397 ], [ %1067, %1066 ]
  %1040 = shl nsw i64 %1039, 2
  %1041 = mul i64 %1040, %2
  %1042 = getelementptr float, ptr %1, i64 %1041
  %1043 = or disjoint i64 %1040, 1
  %1044 = mul i64 %1043, %2
  %1045 = getelementptr float, ptr %1, i64 %1044
  %1046 = or disjoint i64 %1040, 2
  %1047 = mul i64 %1046, %2
  %1048 = getelementptr float, ptr %1, i64 %1047
  %1049 = or disjoint i64 %1040, 3
  %1050 = mul i64 %1049, %2
  %1051 = getelementptr float, ptr %1, i64 %1050
  br label %1052

1052:                                             ; preds = %1038, %1052
  %1053 = phi i64 [ 0, %1038 ], [ %1064, %1052 ]
  %1054 = shl i64 %1053, 3
  %1055 = getelementptr float, ptr %1042, i64 %1054
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %396, ptr %1055, i64 8)
  %1056 = or disjoint i64 %1054, 8
  %1057 = getelementptr float, ptr %1042, i64 %1056
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %396, ptr %1057, i64 8)
  %1058 = getelementptr float, ptr %1045, i64 %1054
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %396, ptr %1058, i64 8)
  %1059 = getelementptr float, ptr %1045, i64 %1056
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %396, ptr %1059, i64 8)
  %1060 = getelementptr float, ptr %1048, i64 %1054
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %396, ptr %1060, i64 8)
  %1061 = getelementptr float, ptr %1048, i64 %1056
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %396, ptr %1061, i64 8)
  %1062 = getelementptr float, ptr %1051, i64 %1054
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %396, ptr %1062, i64 8)
  %1063 = getelementptr float, ptr %1051, i64 %1056
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %396, ptr %1063, i64 8)
  %1064 = add nuw nsw i64 %1053, 2
  %1065 = icmp ult i64 %1064, %398
  br i1 %1065, label %1052, label %1066, !llvm.loop !31

1066:                                             ; preds = %1052
  %1067 = add nuw nsw i64 %1039, 1
  %1068 = icmp eq i64 %1067, %399
  br i1 %1068, label %1070, label %1038, !llvm.loop !32

1069:                                             ; preds = %29
  tail call void @ggml_gemm_q4_0_8x8_q8_0_generic(i32 noundef signext %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef signext %5, i32 noundef signext %6)
  br label %1070

1070:                                             ; preds = %331, %305, %1066, %1035, %335, %38, %37, %334, %1069
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
!18 = !{i64 42733}
!19 = !{i64 43157}
!20 = !{i64 43582}
!21 = !{i64 44007}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
!26 = !{i64 8600}
!27 = !{i64 18193}
!28 = !{i64 24855}
!29 = !{i64 31409}
!30 = distinct !{!30, !23}
!31 = distinct !{!31, !23}
!32 = distinct !{!32, !23}
