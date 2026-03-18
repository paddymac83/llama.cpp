; ModuleID = 'repack.cpp'
source_filename = "repack.cpp"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

%struct.block = type { [8 x i16], [128 x i8] }
%struct.block_q8_0 = type { i16, [32 x i8] }
%struct.block.0 = type { [4 x i16], [128 x i8] }

@.str = private unnamed_addr constant [12 x i8] c"n % qk == 0\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"repack.cpp\00", align 1
@__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0 = private unnamed_addr constant [119 x i8] c"void ggml_gemv_q4_0_8x8_q8_0(int, float *__restrict, size_t, const void *__restrict, const void *__restrict, int, int)\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"nc % ncols_interleaved == 0\00", align 1
@__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0 = private unnamed_addr constant [119 x i8] c"void ggml_gemm_q4_0_8x8_q8_0(int, float *__restrict, size_t, const void *__restrict, const void *__restrict, int, int)\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"nr % 4 == 0\00", align 1
@ggml_table_f32_f16 = external local_unnamed_addr global [65536 x float], align 4

; Function Attrs: mustprogress uwtable vscale_range(8,8)
define dso_local void @ggml_gemv_q4_0_8x8_q8_0(i32 noundef signext %0, ptr noalias noundef %1, i64 noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef signext %5, i32 noundef signext %6) local_unnamed_addr #0 {
  %8 = alloca [8 x float], align 4
  %9 = sdiv i32 %0, 32
  %10 = and i32 %0, 31
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %7
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef signext 33, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0) #9
  unreachable

13:                                               ; preds = %7
  %14 = and i32 %6, 7
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %17, label %16

16:                                               ; preds = %13
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef signext 34, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0) #9
  unreachable

17:                                               ; preds = %13
  %18 = tail call i64 @llvm.read_register.i64(metadata !9)
  %19 = icmp ugt i64 %18, 31
  br i1 %19, label %20, label %149

20:                                               ; preds = %17
  %21 = ashr exact i32 %6, 3
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %23, label %150

23:                                               ; preds = %20
  %24 = tail call <vscale x 2 x float> @llvm.riscv.vfmv.v.f.nxv2f32.i64(<vscale x 2 x float> poison, float 0.000000e+00, i64 8)
  %25 = icmp sgt i32 %0, 31
  %26 = getelementptr inbounds float, ptr %8, i64 1
  %27 = getelementptr inbounds float, ptr %8, i64 2
  %28 = getelementptr inbounds float, ptr %8, i64 3
  %29 = getelementptr inbounds float, ptr %8, i64 4
  %30 = getelementptr inbounds float, ptr %8, i64 5
  %31 = getelementptr inbounds float, ptr %8, i64 6
  %32 = getelementptr inbounds float, ptr %8, i64 7
  br i1 %25, label %35, label %33

33:                                               ; preds = %23
  %34 = zext nneg i32 %21 to i64
  br label %143

35:                                               ; preds = %23
  %36 = zext nneg i32 %9 to i64
  %37 = zext nneg i32 %21 to i64
  %38 = zext nneg i32 %9 to i64
  br label %39

39:                                               ; preds = %35, %138
  %40 = phi i64 [ 0, %35 ], [ %141, %138 ]
  %41 = mul nsw i64 %40, %36
  %42 = getelementptr inbounds %struct.block, ptr %3, i64 %41
  br label %43

43:                                               ; preds = %39, %43
  %44 = phi i64 [ 0, %39 ], [ %136, %43 ]
  %45 = phi <vscale x 2 x float> [ %24, %39 ], [ %135, %43 ]
  %46 = getelementptr inbounds %struct.block_q8_0, ptr %4, i64 %44
  %47 = getelementptr inbounds %struct.block_q8_0, ptr %4, i64 %44, i32 1
  %48 = load i64, ptr %47, align 2, !tbaa !10
  %49 = getelementptr inbounds %struct.block_q8_0, ptr %4, i64 %44, i32 1, i64 8
  %50 = load i64, ptr %49, align 2, !tbaa !10
  %51 = getelementptr inbounds %struct.block_q8_0, ptr %4, i64 %44, i32 1, i64 16
  %52 = load i64, ptr %51, align 2, !tbaa !10
  %53 = getelementptr inbounds %struct.block_q8_0, ptr %4, i64 %44, i32 1, i64 24
  %54 = load i64, ptr %53, align 2, !tbaa !10
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !14
  %55 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %48, i64 8)
  %56 = bitcast <vscale x 2 x i64> %55 to <vscale x 16 x i8>
  %57 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %50, i64 8)
  %58 = bitcast <vscale x 2 x i64> %57 to <vscale x 16 x i8>
  %59 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %52, i64 8)
  %60 = bitcast <vscale x 2 x i64> %59 to <vscale x 16 x i8>
  %61 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %54, i64 8)
  %62 = bitcast <vscale x 2 x i64> %61 to <vscale x 16 x i8>
  %63 = getelementptr inbounds %struct.block, ptr %42, i64 %44
  %64 = getelementptr inbounds %struct.block, ptr %42, i64 %44, i32 1
  %65 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %64, i64 128)
  %66 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %65, i64 4, i64 128)
  %67 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %66, i64 4, i64 128)
  %68 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %65, i64 4, i64 128)
  %69 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %67, i64 0)
  %70 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %67, i64 16)
  %71 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %68, i64 0)
  %72 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %68, i64 16)
  %73 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %69, <vscale x 16 x i8> %56, i64 64)
  %74 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %73, <vscale x 16 x i8> %70, <vscale x 16 x i8> %58, i64 64, i64 3)
  %75 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %74, <vscale x 16 x i8> %71, <vscale x 16 x i8> %60, i64 64, i64 3)
  %76 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %75, <vscale x 16 x i8> %72, <vscale x 16 x i8> %62, i64 64, i64 3)
  %77 = bitcast <vscale x 16 x i16> %76 to <vscale x 8 x i32>
  %78 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %77, i64 0, i64 32)
  %79 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %77, i64 16, i64 32)
  %80 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %78, <vscale x 8 x i16> %79, i64 32)
  %81 = bitcast <vscale x 8 x i16> %80 to <vscale x 4 x i32>
  %82 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %81, i64 0, i64 16)
  %83 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %81, i64 16, i64 16)
  %84 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %82, <vscale x 4 x i16> %83, i64 16)
  %85 = bitcast <vscale x 4 x i16> %84 to <vscale x 2 x i32>
  %86 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %85, i64 0, i64 8)
  %87 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %85, i64 16, i64 8)
  %88 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %86, <vscale x 2 x i16> %87, i64 8)
  %89 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %88, i64 7, i64 8)
  %90 = load i16, ptr %46, align 2, !tbaa !15
  %91 = zext i16 %90 to i64
  %92 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %91
  %93 = load float, ptr %92, align 4, !tbaa !18
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #10
  %94 = load i16, ptr %63, align 2, !tbaa !20
  %95 = zext i16 %94 to i64
  %96 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %95
  %97 = load float, ptr %96, align 4, !tbaa !18
  store float %97, ptr %8, align 4, !tbaa !18
  %98 = getelementptr inbounds [8 x i16], ptr %63, i64 0, i64 1
  %99 = load i16, ptr %98, align 2, !tbaa !20
  %100 = zext i16 %99 to i64
  %101 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %100
  %102 = load float, ptr %101, align 4, !tbaa !18
  store float %102, ptr %26, align 4, !tbaa !18
  %103 = getelementptr inbounds [8 x i16], ptr %63, i64 0, i64 2
  %104 = load i16, ptr %103, align 2, !tbaa !20
  %105 = zext i16 %104 to i64
  %106 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %105
  %107 = load float, ptr %106, align 4, !tbaa !18
  store float %107, ptr %27, align 4, !tbaa !18
  %108 = getelementptr inbounds [8 x i16], ptr %63, i64 0, i64 3
  %109 = load i16, ptr %108, align 2, !tbaa !20
  %110 = zext i16 %109 to i64
  %111 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %110
  %112 = load float, ptr %111, align 4, !tbaa !18
  store float %112, ptr %28, align 4, !tbaa !18
  %113 = getelementptr inbounds [8 x i16], ptr %63, i64 0, i64 4
  %114 = load i16, ptr %113, align 2, !tbaa !20
  %115 = zext i16 %114 to i64
  %116 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %115
  %117 = load float, ptr %116, align 4, !tbaa !18
  store float %117, ptr %29, align 4, !tbaa !18
  %118 = getelementptr inbounds [8 x i16], ptr %63, i64 0, i64 5
  %119 = load i16, ptr %118, align 2, !tbaa !20
  %120 = zext i16 %119 to i64
  %121 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %120
  %122 = load float, ptr %121, align 4, !tbaa !18
  store float %122, ptr %30, align 4, !tbaa !18
  %123 = getelementptr inbounds [8 x i16], ptr %63, i64 0, i64 6
  %124 = load i16, ptr %123, align 2, !tbaa !20
  %125 = zext i16 %124 to i64
  %126 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %125
  %127 = load float, ptr %126, align 4, !tbaa !18
  store float %127, ptr %31, align 4, !tbaa !18
  %128 = getelementptr inbounds [8 x i16], ptr %63, i64 0, i64 7
  %129 = load i16, ptr %128, align 2, !tbaa !20
  %130 = zext i16 %129 to i64
  %131 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %130
  %132 = load float, ptr %131, align 4, !tbaa !18
  store float %132, ptr %32, align 4, !tbaa !18
  %133 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %8, i64 8)
  %134 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %89, float %93, i64 7, i64 8)
  %135 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %45, <vscale x 2 x float> %134, <vscale x 2 x float> %133, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #10
  %136 = add nuw nsw i64 %44, 1
  %137 = icmp eq i64 %136, %38
  br i1 %137, label %138, label %43, !llvm.loop !21

138:                                              ; preds = %43
  %139 = shl nsw i64 %40, 3
  %140 = getelementptr inbounds float, ptr %1, i64 %139
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %135, ptr %140, i64 8)
  %141 = add nuw nsw i64 %40, 1
  %142 = icmp eq i64 %141, %37
  br i1 %142, label %150, label %39, !llvm.loop !23

143:                                              ; preds = %33, %143
  %144 = phi i64 [ 0, %33 ], [ %147, %143 ]
  %145 = shl nsw i64 %144, 3
  %146 = getelementptr inbounds float, ptr %1, i64 %145
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %24, ptr %146, i64 8)
  %147 = add nuw nsw i64 %144, 1
  %148 = icmp eq i64 %147, %34
  br i1 %148, label %150, label %143, !llvm.loop !23

149:                                              ; preds = %17
  tail call void @ggml_gemv_q4_0_8x8_q8_0_generic(i32 noundef signext %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef signext %5, i32 noundef signext %6)
  br label %150

150:                                              ; preds = %143, %138, %20, %149
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16>, <vscale x 16 x i8>, <vscale x 16 x i8>, i64, i64 immarg) #4

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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float>, <vscale x 2 x i32>, i64 immarg, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float>, ptr nocapture, i64) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float>, <vscale x 2 x float>, float, i64 immarg, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, i64 immarg, i64, i64 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float>, ptr nocapture, i64) #7

declare void @ggml_gemv_q4_0_8x8_q8_0_generic(i32 noundef signext, ptr noundef, i64 noundef, ptr noundef, ptr noundef, i32 noundef signext, i32 noundef signext) local_unnamed_addr #8

; Function Attrs: mustprogress uwtable vscale_range(8,8)
define dso_local void @ggml_gemm_q4_0_8x8_q8_0(i32 noundef signext %0, ptr noalias noundef %1, i64 noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef signext %5, i32 noundef signext %6) local_unnamed_addr #0 {
  %8 = alloca [8 x float], align 4
  %9 = sdiv i32 %0, 32
  %10 = and i32 %0, 31
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %7
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef signext 124, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0) #9
  unreachable

13:                                               ; preds = %7
  %14 = and i32 %5, 3
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %17, label %16

16:                                               ; preds = %13
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef signext 125, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0) #9
  unreachable

17:                                               ; preds = %13
  %18 = and i32 %6, 7
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %21, label %20

20:                                               ; preds = %17
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef signext 126, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0) #9
  unreachable

21:                                               ; preds = %17
  %22 = tail call i64 @llvm.read_register.i64(metadata !9)
  %23 = icmp ugt i64 %22, 31
  br i1 %23, label %24, label %323

24:                                               ; preds = %21
  %25 = ashr exact i32 %5, 2
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %324

27:                                               ; preds = %24
  %28 = ashr exact i32 %6, 3
  %29 = icmp sgt i32 %28, 0
  %30 = getelementptr inbounds float, ptr %8, i64 1
  %31 = getelementptr inbounds float, ptr %8, i64 2
  %32 = getelementptr inbounds float, ptr %8, i64 3
  %33 = getelementptr inbounds float, ptr %8, i64 4
  %34 = getelementptr inbounds float, ptr %8, i64 5
  %35 = getelementptr inbounds float, ptr %8, i64 6
  %36 = getelementptr inbounds float, ptr %8, i64 7
  br i1 %29, label %37, label %324

37:                                               ; preds = %27
  %38 = icmp sgt i32 %0, 31
  %39 = tail call <vscale x 2 x float> @llvm.riscv.vfmv.v.f.nxv2f32.i64(<vscale x 2 x float> poison, float 0.000000e+00, i64 8)
  br i1 %38, label %43, label %40

40:                                               ; preds = %37
  %41 = zext nneg i32 %25 to i64
  %42 = zext nneg i32 %28 to i64
  br label %297

43:                                               ; preds = %37
  %44 = zext nneg i32 %9 to i64
  %45 = zext nneg i32 %25 to i64
  %46 = zext nneg i32 %28 to i64
  %47 = zext nneg i32 %9 to i64
  br label %48

48:                                               ; preds = %43, %294
  %49 = phi i64 [ 0, %43 ], [ %295, %294 ]
  %50 = mul nsw i64 %49, %44
  %51 = getelementptr inbounds %struct.block.0, ptr %4, i64 %50
  %52 = shl nsw i64 %49, 2
  %53 = mul i64 %52, %2
  %54 = getelementptr float, ptr %1, i64 %53
  %55 = or disjoint i64 %52, 1
  %56 = mul i64 %55, %2
  %57 = getelementptr float, ptr %1, i64 %56
  %58 = or disjoint i64 %52, 2
  %59 = mul i64 %58, %2
  %60 = getelementptr float, ptr %1, i64 %59
  %61 = or disjoint i64 %52, 3
  %62 = mul i64 %61, %2
  %63 = getelementptr float, ptr %1, i64 %62
  br label %64

64:                                               ; preds = %286, %48
  %65 = phi i64 [ %292, %286 ], [ 0, %48 ]
  %66 = mul nsw i64 %65, %44
  %67 = getelementptr inbounds %struct.block, ptr %3, i64 %66
  br label %68

68:                                               ; preds = %68, %64
  %69 = phi i64 [ %284, %68 ], [ 0, %64 ]
  %70 = phi <vscale x 2 x float> [ %178, %68 ], [ %39, %64 ]
  %71 = phi <vscale x 2 x float> [ %213, %68 ], [ %39, %64 ]
  %72 = phi <vscale x 2 x float> [ %248, %68 ], [ %39, %64 ]
  %73 = phi <vscale x 2 x float> [ %283, %68 ], [ %39, %64 ]
  %74 = getelementptr inbounds %struct.block, ptr %67, i64 %69
  %75 = getelementptr inbounds %struct.block, ptr %67, i64 %69, i32 1
  %76 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %75, i64 128)
  %77 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %76, i64 4, i64 128)
  %78 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %77, i64 4, i64 128)
  %79 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %76, i64 4, i64 128)
  %80 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %78, i64 0)
  %81 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %78, i64 16)
  %82 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %79, i64 0)
  %83 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %79, i64 16)
  %84 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69
  %85 = load i16, ptr %84, align 2, !tbaa !20
  %86 = zext i16 %85 to i64
  %87 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %86
  %88 = load float, ptr %87, align 4, !tbaa !18
  %89 = getelementptr inbounds [4 x i16], ptr %84, i64 0, i64 1
  %90 = load i16, ptr %89, align 2, !tbaa !20
  %91 = zext i16 %90 to i64
  %92 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %91
  %93 = load float, ptr %92, align 4, !tbaa !18
  %94 = getelementptr inbounds [4 x i16], ptr %84, i64 0, i64 2
  %95 = load i16, ptr %94, align 2, !tbaa !20
  %96 = zext i16 %95 to i64
  %97 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %96
  %98 = load float, ptr %97, align 4, !tbaa !18
  %99 = getelementptr inbounds [4 x i16], ptr %84, i64 0, i64 3
  %100 = load i16, ptr %99, align 2, !tbaa !20
  %101 = zext i16 %100 to i64
  %102 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %101
  %103 = load float, ptr %102, align 4, !tbaa !18
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #10
  %104 = load i16, ptr %74, align 2, !tbaa !20
  %105 = zext i16 %104 to i64
  %106 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %105
  %107 = load float, ptr %106, align 4, !tbaa !18
  store float %107, ptr %8, align 4, !tbaa !18
  %108 = getelementptr inbounds [8 x i16], ptr %74, i64 0, i64 1
  %109 = load i16, ptr %108, align 2, !tbaa !20
  %110 = zext i16 %109 to i64
  %111 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %110
  %112 = load float, ptr %111, align 4, !tbaa !18
  store float %112, ptr %30, align 4, !tbaa !18
  %113 = getelementptr inbounds [8 x i16], ptr %74, i64 0, i64 2
  %114 = load i16, ptr %113, align 2, !tbaa !20
  %115 = zext i16 %114 to i64
  %116 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %115
  %117 = load float, ptr %116, align 4, !tbaa !18
  store float %117, ptr %31, align 4, !tbaa !18
  %118 = getelementptr inbounds [8 x i16], ptr %74, i64 0, i64 3
  %119 = load i16, ptr %118, align 2, !tbaa !20
  %120 = zext i16 %119 to i64
  %121 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %120
  %122 = load float, ptr %121, align 4, !tbaa !18
  store float %122, ptr %32, align 4, !tbaa !18
  %123 = getelementptr inbounds [8 x i16], ptr %74, i64 0, i64 4
  %124 = load i16, ptr %123, align 2, !tbaa !20
  %125 = zext i16 %124 to i64
  %126 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %125
  %127 = load float, ptr %126, align 4, !tbaa !18
  store float %127, ptr %33, align 4, !tbaa !18
  %128 = getelementptr inbounds [8 x i16], ptr %74, i64 0, i64 5
  %129 = load i16, ptr %128, align 2, !tbaa !20
  %130 = zext i16 %129 to i64
  %131 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %130
  %132 = load float, ptr %131, align 4, !tbaa !18
  store float %132, ptr %34, align 4, !tbaa !18
  %133 = getelementptr inbounds [8 x i16], ptr %74, i64 0, i64 6
  %134 = load i16, ptr %133, align 2, !tbaa !20
  %135 = zext i16 %134 to i64
  %136 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %135
  %137 = load float, ptr %136, align 4, !tbaa !18
  store float %137, ptr %35, align 4, !tbaa !18
  %138 = getelementptr inbounds [8 x i16], ptr %74, i64 0, i64 7
  %139 = load i16, ptr %138, align 2, !tbaa !20
  %140 = zext i16 %139 to i64
  %141 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %140
  %142 = load float, ptr %141, align 4, !tbaa !18
  store float %142, ptr %36, align 4, !tbaa !18
  %143 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %8, i64 8)
  %144 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1
  %145 = load i64, ptr %144, align 2, !tbaa !10
  %146 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 32
  %147 = load i64, ptr %146, align 2, !tbaa !10
  %148 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 64
  %149 = load i64, ptr %148, align 2, !tbaa !10
  %150 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 96
  %151 = load i64, ptr %150, align 2, !tbaa !10
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !24
  %152 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %145, i64 8)
  %153 = bitcast <vscale x 2 x i64> %152 to <vscale x 16 x i8>
  %154 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %147, i64 8)
  %155 = bitcast <vscale x 2 x i64> %154 to <vscale x 16 x i8>
  %156 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %149, i64 8)
  %157 = bitcast <vscale x 2 x i64> %156 to <vscale x 16 x i8>
  %158 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %151, i64 8)
  %159 = bitcast <vscale x 2 x i64> %158 to <vscale x 16 x i8>
  %160 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %80, <vscale x 16 x i8> %153, i64 64)
  %161 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %160, <vscale x 16 x i8> %81, <vscale x 16 x i8> %155, i64 64, i64 3)
  %162 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %161, <vscale x 16 x i8> %82, <vscale x 16 x i8> %157, i64 64, i64 3)
  %163 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %162, <vscale x 16 x i8> %83, <vscale x 16 x i8> %159, i64 64, i64 3)
  %164 = bitcast <vscale x 16 x i16> %163 to <vscale x 8 x i32>
  %165 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %164, i64 0, i64 32)
  %166 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %164, i64 16, i64 32)
  %167 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %165, <vscale x 8 x i16> %166, i64 32)
  %168 = bitcast <vscale x 8 x i16> %167 to <vscale x 4 x i32>
  %169 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %168, i64 0, i64 16)
  %170 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %168, i64 16, i64 16)
  %171 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %169, <vscale x 4 x i16> %170, i64 16)
  %172 = bitcast <vscale x 4 x i16> %171 to <vscale x 2 x i32>
  %173 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %172, i64 0, i64 8)
  %174 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %172, i64 16, i64 8)
  %175 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %173, <vscale x 2 x i16> %174, i64 8)
  %176 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %175, i64 7, i64 8)
  %177 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %176, float %88, i64 7, i64 8)
  %178 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %70, <vscale x 2 x float> %177, <vscale x 2 x float> %143, i64 7, i64 8, i64 3)
  %179 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 8
  %180 = load i64, ptr %179, align 2, !tbaa !10
  %181 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 40
  %182 = load i64, ptr %181, align 2, !tbaa !10
  %183 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 72
  %184 = load i64, ptr %183, align 2, !tbaa !10
  %185 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 104
  %186 = load i64, ptr %185, align 2, !tbaa !10
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !25
  %187 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %180, i64 8)
  %188 = bitcast <vscale x 2 x i64> %187 to <vscale x 16 x i8>
  %189 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %182, i64 8)
  %190 = bitcast <vscale x 2 x i64> %189 to <vscale x 16 x i8>
  %191 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %184, i64 8)
  %192 = bitcast <vscale x 2 x i64> %191 to <vscale x 16 x i8>
  %193 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %186, i64 8)
  %194 = bitcast <vscale x 2 x i64> %193 to <vscale x 16 x i8>
  %195 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %80, <vscale x 16 x i8> %188, i64 64)
  %196 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %195, <vscale x 16 x i8> %81, <vscale x 16 x i8> %190, i64 64, i64 3)
  %197 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %196, <vscale x 16 x i8> %82, <vscale x 16 x i8> %192, i64 64, i64 3)
  %198 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %197, <vscale x 16 x i8> %83, <vscale x 16 x i8> %194, i64 64, i64 3)
  %199 = bitcast <vscale x 16 x i16> %198 to <vscale x 8 x i32>
  %200 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %199, i64 0, i64 32)
  %201 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %199, i64 16, i64 32)
  %202 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %200, <vscale x 8 x i16> %201, i64 32)
  %203 = bitcast <vscale x 8 x i16> %202 to <vscale x 4 x i32>
  %204 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %203, i64 0, i64 16)
  %205 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %203, i64 16, i64 16)
  %206 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %204, <vscale x 4 x i16> %205, i64 16)
  %207 = bitcast <vscale x 4 x i16> %206 to <vscale x 2 x i32>
  %208 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %207, i64 0, i64 8)
  %209 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %207, i64 16, i64 8)
  %210 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %208, <vscale x 2 x i16> %209, i64 8)
  %211 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %210, i64 7, i64 8)
  %212 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %211, float %93, i64 7, i64 8)
  %213 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %71, <vscale x 2 x float> %212, <vscale x 2 x float> %143, i64 7, i64 8, i64 3)
  %214 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 16
  %215 = load i64, ptr %214, align 2, !tbaa !10
  %216 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 48
  %217 = load i64, ptr %216, align 2, !tbaa !10
  %218 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 80
  %219 = load i64, ptr %218, align 2, !tbaa !10
  %220 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 112
  %221 = load i64, ptr %220, align 2, !tbaa !10
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !26
  %222 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %215, i64 8)
  %223 = bitcast <vscale x 2 x i64> %222 to <vscale x 16 x i8>
  %224 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %217, i64 8)
  %225 = bitcast <vscale x 2 x i64> %224 to <vscale x 16 x i8>
  %226 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %219, i64 8)
  %227 = bitcast <vscale x 2 x i64> %226 to <vscale x 16 x i8>
  %228 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %221, i64 8)
  %229 = bitcast <vscale x 2 x i64> %228 to <vscale x 16 x i8>
  %230 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %80, <vscale x 16 x i8> %223, i64 64)
  %231 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %230, <vscale x 16 x i8> %81, <vscale x 16 x i8> %225, i64 64, i64 3)
  %232 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %231, <vscale x 16 x i8> %82, <vscale x 16 x i8> %227, i64 64, i64 3)
  %233 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %232, <vscale x 16 x i8> %83, <vscale x 16 x i8> %229, i64 64, i64 3)
  %234 = bitcast <vscale x 16 x i16> %233 to <vscale x 8 x i32>
  %235 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %234, i64 0, i64 32)
  %236 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %234, i64 16, i64 32)
  %237 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %235, <vscale x 8 x i16> %236, i64 32)
  %238 = bitcast <vscale x 8 x i16> %237 to <vscale x 4 x i32>
  %239 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %238, i64 0, i64 16)
  %240 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %238, i64 16, i64 16)
  %241 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %239, <vscale x 4 x i16> %240, i64 16)
  %242 = bitcast <vscale x 4 x i16> %241 to <vscale x 2 x i32>
  %243 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %242, i64 0, i64 8)
  %244 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %242, i64 16, i64 8)
  %245 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %243, <vscale x 2 x i16> %244, i64 8)
  %246 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %245, i64 7, i64 8)
  %247 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %246, float %98, i64 7, i64 8)
  %248 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %72, <vscale x 2 x float> %247, <vscale x 2 x float> %143, i64 7, i64 8, i64 3)
  %249 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 24
  %250 = load i64, ptr %249, align 2, !tbaa !10
  %251 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 56
  %252 = load i64, ptr %251, align 2, !tbaa !10
  %253 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 88
  %254 = load i64, ptr %253, align 2, !tbaa !10
  %255 = getelementptr inbounds %struct.block.0, ptr %51, i64 %69, i32 1, i64 120
  %256 = load i64, ptr %255, align 2, !tbaa !10
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !27
  %257 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %250, i64 8)
  %258 = bitcast <vscale x 2 x i64> %257 to <vscale x 16 x i8>
  %259 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %252, i64 8)
  %260 = bitcast <vscale x 2 x i64> %259 to <vscale x 16 x i8>
  %261 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %254, i64 8)
  %262 = bitcast <vscale x 2 x i64> %261 to <vscale x 16 x i8>
  %263 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %256, i64 8)
  %264 = bitcast <vscale x 2 x i64> %263 to <vscale x 16 x i8>
  %265 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %80, <vscale x 16 x i8> %258, i64 64)
  %266 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %265, <vscale x 16 x i8> %81, <vscale x 16 x i8> %260, i64 64, i64 3)
  %267 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %266, <vscale x 16 x i8> %82, <vscale x 16 x i8> %262, i64 64, i64 3)
  %268 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %267, <vscale x 16 x i8> %83, <vscale x 16 x i8> %264, i64 64, i64 3)
  %269 = bitcast <vscale x 16 x i16> %268 to <vscale x 8 x i32>
  %270 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %269, i64 0, i64 32)
  %271 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %269, i64 16, i64 32)
  %272 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %270, <vscale x 8 x i16> %271, i64 32)
  %273 = bitcast <vscale x 8 x i16> %272 to <vscale x 4 x i32>
  %274 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %273, i64 0, i64 16)
  %275 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %273, i64 16, i64 16)
  %276 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %274, <vscale x 4 x i16> %275, i64 16)
  %277 = bitcast <vscale x 4 x i16> %276 to <vscale x 2 x i32>
  %278 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %277, i64 0, i64 8)
  %279 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %277, i64 16, i64 8)
  %280 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %278, <vscale x 2 x i16> %279, i64 8)
  %281 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %280, i64 7, i64 8)
  %282 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %281, float %103, i64 7, i64 8)
  %283 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %73, <vscale x 2 x float> %282, <vscale x 2 x float> %143, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #10
  %284 = add nuw nsw i64 %69, 1
  %285 = icmp eq i64 %284, %47
  br i1 %285, label %286, label %68, !llvm.loop !28

286:                                              ; preds = %68
  %287 = shl nsw i64 %65, 3
  %288 = getelementptr float, ptr %54, i64 %287
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %178, ptr %288, i64 8)
  %289 = getelementptr float, ptr %57, i64 %287
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %213, ptr %289, i64 8)
  %290 = getelementptr float, ptr %60, i64 %287
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %248, ptr %290, i64 8)
  %291 = getelementptr float, ptr %63, i64 %287
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %283, ptr %291, i64 8)
  %292 = add nuw nsw i64 %65, 1
  %293 = icmp eq i64 %292, %46
  br i1 %293, label %294, label %64, !llvm.loop !29

294:                                              ; preds = %286
  %295 = add nuw nsw i64 %49, 1
  %296 = icmp eq i64 %295, %45
  br i1 %296, label %324, label %48, !llvm.loop !30

297:                                              ; preds = %40, %320
  %298 = phi i64 [ 0, %40 ], [ %321, %320 ]
  %299 = shl nsw i64 %298, 2
  %300 = mul i64 %299, %2
  %301 = getelementptr float, ptr %1, i64 %300
  %302 = or disjoint i64 %299, 1
  %303 = mul i64 %302, %2
  %304 = getelementptr float, ptr %1, i64 %303
  %305 = or disjoint i64 %299, 2
  %306 = mul i64 %305, %2
  %307 = getelementptr float, ptr %1, i64 %306
  %308 = or disjoint i64 %299, 3
  %309 = mul i64 %308, %2
  %310 = getelementptr float, ptr %1, i64 %309
  br label %311

311:                                              ; preds = %297, %311
  %312 = phi i64 [ 0, %297 ], [ %318, %311 ]
  %313 = shl nsw i64 %312, 3
  %314 = getelementptr float, ptr %301, i64 %313
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %39, ptr %314, i64 8)
  %315 = getelementptr float, ptr %304, i64 %313
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %39, ptr %315, i64 8)
  %316 = getelementptr float, ptr %307, i64 %313
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %39, ptr %316, i64 8)
  %317 = getelementptr float, ptr %310, i64 %313
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %39, ptr %317, i64 8)
  %318 = add nuw nsw i64 %312, 1
  %319 = icmp eq i64 %318, %42
  br i1 %319, label %320, label %311, !llvm.loop !29

320:                                              ; preds = %311
  %321 = add nuw nsw i64 %298, 1
  %322 = icmp eq i64 %321, %41
  br i1 %322, label %324, label %297, !llvm.loop !30

323:                                              ; preds = %21
  tail call void @ggml_gemm_q4_0_8x8_q8_0_generic(i32 noundef signext %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef signext %5, i32 noundef signext %6)
  br label %324

324:                                              ; preds = %320, %294, %27, %24, %323
  ret void
}

declare void @ggml_gemm_q4_0_8x8_q8_0_generic(i32 noundef signext, ptr noundef, i64 noundef, ptr noundef, ptr noundef, i32 noundef signext, i32 noundef signext) local_unnamed_addr #8

attributes #0 = { mustprogress uwtable vscale_range(8,8) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(read) }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #5 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #6 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #8 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zicsr,+zifencei,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"PIE Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 2}
!7 = !{i32 8, !"SmallDataLimit", i32 8}
!8 = !{!"Ubuntu clang version 18.1.8 (++20240731025043+3b5b5c1ec4a3-1~exp1~20240731145144.92)"}
!9 = !{!"vlenb"}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C++ TBAA"}
!14 = !{i64 1763}
!15 = !{!16, !17, i64 0}
!16 = !{!"_ZTS10block_q8_0", !17, i64 0, !12, i64 2}
!17 = !{!"short", !12, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !12, i64 0}
!20 = !{!17, !17, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
!24 = !{i64 9160}
!25 = !{i64 12316}
!26 = !{i64 15473}
!27 = !{i64 18630}
!28 = distinct !{!28, !22}
!29 = distinct !{!29, !22}
!30 = distinct !{!30, !22}
