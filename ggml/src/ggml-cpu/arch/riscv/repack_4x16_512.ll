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

; Function Attrs: mustprogress uwtable vscale_range(8,8)
define dso_local void @ggml_gemm_q4_0_8x8_q8_0_4x16(i32 noundef signext %0, ptr noalias noundef %1, i64 noundef %2, ptr noalias noundef %3, ptr noalias noundef %4, i32 noundef signext %5, i32 noundef signext %6) local_unnamed_addr #0 {
  %8 = alloca [8 x float], align 4
  %9 = alloca [8 x float], align 4
  %10 = alloca [8 x float], align 4
  %11 = sdiv i32 %0, 32
  %12 = and i32 %0, 31
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %15, label %14

14:                                               ; preds = %7
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef signext 30, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

15:                                               ; preds = %7
  %16 = and i32 %5, 3
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %19, label %18

18:                                               ; preds = %15
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef signext 31, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

19:                                               ; preds = %15
  %20 = and i32 %6, 7
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %23, label %22

22:                                               ; preds = %19
  tail call void @__assert_fail(ptr noundef nonnull @.str.3, ptr noundef nonnull @.str.1, i32 noundef signext 32, ptr noundef nonnull @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16) #9
  unreachable

23:                                               ; preds = %19
  %24 = tail call i64 @llvm.read_register.i64(metadata !9)
  %25 = icmp ugt i64 %24, 31
  br i1 %25, label %26, label %838

26:                                               ; preds = %23
  %27 = and i32 %6, 8
  %28 = icmp eq i32 %27, 0
  %29 = ashr exact i32 %5, 2
  %30 = icmp sgt i32 %29, 0
  br i1 %28, label %328, label %31

31:                                               ; preds = %26
  br i1 %30, label %32, label %839

32:                                               ; preds = %31
  %33 = ashr exact i32 %6, 3
  %34 = icmp sgt i32 %33, 0
  %35 = getelementptr inbounds float, ptr %10, i64 1
  %36 = getelementptr inbounds float, ptr %10, i64 2
  %37 = getelementptr inbounds float, ptr %10, i64 3
  %38 = getelementptr inbounds float, ptr %10, i64 4
  %39 = getelementptr inbounds float, ptr %10, i64 5
  %40 = getelementptr inbounds float, ptr %10, i64 6
  %41 = getelementptr inbounds float, ptr %10, i64 7
  br i1 %34, label %42, label %839

42:                                               ; preds = %32
  %43 = icmp sgt i32 %0, 31
  %44 = tail call <vscale x 2 x float> @llvm.riscv.vfmv.v.f.nxv2f32.i64(<vscale x 2 x float> poison, float 0.000000e+00, i64 8)
  br i1 %43, label %48, label %45

45:                                               ; preds = %42
  %46 = zext nneg i32 %29 to i64
  %47 = zext nneg i32 %33 to i64
  br label %302

48:                                               ; preds = %42
  %49 = zext nneg i32 %11 to i64
  %50 = zext nneg i32 %29 to i64
  %51 = zext nneg i32 %33 to i64
  %52 = zext nneg i32 %11 to i64
  br label %53

53:                                               ; preds = %48, %299
  %54 = phi i64 [ 0, %48 ], [ %300, %299 ]
  %55 = mul nsw i64 %54, %49
  %56 = getelementptr inbounds %struct.block, ptr %4, i64 %55
  %57 = shl nsw i64 %54, 2
  %58 = mul i64 %57, %2
  %59 = getelementptr float, ptr %1, i64 %58
  %60 = or disjoint i64 %57, 1
  %61 = mul i64 %60, %2
  %62 = getelementptr float, ptr %1, i64 %61
  %63 = or disjoint i64 %57, 2
  %64 = mul i64 %63, %2
  %65 = getelementptr float, ptr %1, i64 %64
  %66 = or disjoint i64 %57, 3
  %67 = mul i64 %66, %2
  %68 = getelementptr float, ptr %1, i64 %67
  br label %69

69:                                               ; preds = %291, %53
  %70 = phi i64 [ %297, %291 ], [ 0, %53 ]
  %71 = mul nsw i64 %70, %49
  %72 = getelementptr inbounds %struct.block.0, ptr %3, i64 %71
  br label %73

73:                                               ; preds = %73, %69
  %74 = phi i64 [ %289, %73 ], [ 0, %69 ]
  %75 = phi <vscale x 2 x float> [ %288, %73 ], [ %44, %69 ]
  %76 = phi <vscale x 2 x float> [ %253, %73 ], [ %44, %69 ]
  %77 = phi <vscale x 2 x float> [ %218, %73 ], [ %44, %69 ]
  %78 = phi <vscale x 2 x float> [ %183, %73 ], [ %44, %69 ]
  %79 = getelementptr inbounds %struct.block.0, ptr %72, i64 %74
  %80 = getelementptr inbounds %struct.block.0, ptr %72, i64 %74, i32 1
  %81 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %80, i64 128)
  %82 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %81, i64 4, i64 128)
  %83 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %82, i64 4, i64 128)
  %84 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %81, i64 4, i64 128)
  %85 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %83, i64 0)
  %86 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %83, i64 16)
  %87 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %84, i64 0)
  %88 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %84, i64 16)
  %89 = getelementptr inbounds %struct.block, ptr %56, i64 %74
  %90 = load i16, ptr %89, align 2, !tbaa !10
  %91 = zext i16 %90 to i64
  %92 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %91
  %93 = load float, ptr %92, align 4, !tbaa !14
  %94 = getelementptr inbounds [4 x i16], ptr %89, i64 0, i64 1
  %95 = load i16, ptr %94, align 2, !tbaa !10
  %96 = zext i16 %95 to i64
  %97 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %96
  %98 = load float, ptr %97, align 4, !tbaa !14
  %99 = getelementptr inbounds [4 x i16], ptr %89, i64 0, i64 2
  %100 = load i16, ptr %99, align 2, !tbaa !10
  %101 = zext i16 %100 to i64
  %102 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %101
  %103 = load float, ptr %102, align 4, !tbaa !14
  %104 = getelementptr inbounds [4 x i16], ptr %89, i64 0, i64 3
  %105 = load i16, ptr %104, align 2, !tbaa !10
  %106 = zext i16 %105 to i64
  %107 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %106
  %108 = load float, ptr %107, align 4, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %10) #10
  %109 = load i16, ptr %79, align 2, !tbaa !10
  %110 = zext i16 %109 to i64
  %111 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %110
  %112 = load float, ptr %111, align 4, !tbaa !14
  store float %112, ptr %10, align 4, !tbaa !14
  %113 = getelementptr inbounds [8 x i16], ptr %79, i64 0, i64 1
  %114 = load i16, ptr %113, align 2, !tbaa !10
  %115 = zext i16 %114 to i64
  %116 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %115
  %117 = load float, ptr %116, align 4, !tbaa !14
  store float %117, ptr %35, align 4, !tbaa !14
  %118 = getelementptr inbounds [8 x i16], ptr %79, i64 0, i64 2
  %119 = load i16, ptr %118, align 2, !tbaa !10
  %120 = zext i16 %119 to i64
  %121 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %120
  %122 = load float, ptr %121, align 4, !tbaa !14
  store float %122, ptr %36, align 4, !tbaa !14
  %123 = getelementptr inbounds [8 x i16], ptr %79, i64 0, i64 3
  %124 = load i16, ptr %123, align 2, !tbaa !10
  %125 = zext i16 %124 to i64
  %126 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %125
  %127 = load float, ptr %126, align 4, !tbaa !14
  store float %127, ptr %37, align 4, !tbaa !14
  %128 = getelementptr inbounds [8 x i16], ptr %79, i64 0, i64 4
  %129 = load i16, ptr %128, align 2, !tbaa !10
  %130 = zext i16 %129 to i64
  %131 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %130
  %132 = load float, ptr %131, align 4, !tbaa !14
  store float %132, ptr %38, align 4, !tbaa !14
  %133 = getelementptr inbounds [8 x i16], ptr %79, i64 0, i64 5
  %134 = load i16, ptr %133, align 2, !tbaa !10
  %135 = zext i16 %134 to i64
  %136 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %135
  %137 = load float, ptr %136, align 4, !tbaa !14
  store float %137, ptr %39, align 4, !tbaa !14
  %138 = getelementptr inbounds [8 x i16], ptr %79, i64 0, i64 6
  %139 = load i16, ptr %138, align 2, !tbaa !10
  %140 = zext i16 %139 to i64
  %141 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %140
  %142 = load float, ptr %141, align 4, !tbaa !14
  store float %142, ptr %40, align 4, !tbaa !14
  %143 = getelementptr inbounds [8 x i16], ptr %79, i64 0, i64 7
  %144 = load i16, ptr %143, align 2, !tbaa !10
  %145 = zext i16 %144 to i64
  %146 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %145
  %147 = load float, ptr %146, align 4, !tbaa !14
  store float %147, ptr %41, align 4, !tbaa !14
  %148 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %10, i64 8)
  %149 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1
  %150 = load i64, ptr %149, align 2, !tbaa !16
  %151 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 32
  %152 = load i64, ptr %151, align 2, !tbaa !16
  %153 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 64
  %154 = load i64, ptr %153, align 2, !tbaa !16
  %155 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 96
  %156 = load i64, ptr %155, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !18
  %157 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %150, i64 8)
  %158 = bitcast <vscale x 2 x i64> %157 to <vscale x 16 x i8>
  %159 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %152, i64 8)
  %160 = bitcast <vscale x 2 x i64> %159 to <vscale x 16 x i8>
  %161 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %154, i64 8)
  %162 = bitcast <vscale x 2 x i64> %161 to <vscale x 16 x i8>
  %163 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %156, i64 8)
  %164 = bitcast <vscale x 2 x i64> %163 to <vscale x 16 x i8>
  %165 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %85, <vscale x 16 x i8> %158, i64 64)
  %166 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %165, <vscale x 16 x i8> %86, <vscale x 16 x i8> %160, i64 64, i64 3)
  %167 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %166, <vscale x 16 x i8> %87, <vscale x 16 x i8> %162, i64 64, i64 3)
  %168 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %167, <vscale x 16 x i8> %88, <vscale x 16 x i8> %164, i64 64, i64 3)
  %169 = bitcast <vscale x 16 x i16> %168 to <vscale x 8 x i32>
  %170 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %169, i64 0, i64 32)
  %171 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %169, i64 16, i64 32)
  %172 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %170, <vscale x 8 x i16> %171, i64 32)
  %173 = bitcast <vscale x 8 x i16> %172 to <vscale x 4 x i32>
  %174 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %173, i64 0, i64 16)
  %175 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %173, i64 16, i64 16)
  %176 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %174, <vscale x 4 x i16> %175, i64 16)
  %177 = bitcast <vscale x 4 x i16> %176 to <vscale x 2 x i32>
  %178 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %177, i64 0, i64 8)
  %179 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %177, i64 16, i64 8)
  %180 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %178, <vscale x 2 x i16> %179, i64 8)
  %181 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %180, i64 7, i64 8)
  %182 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %181, float %93, i64 7, i64 8)
  %183 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %78, <vscale x 2 x float> %182, <vscale x 2 x float> %148, i64 7, i64 8, i64 3)
  %184 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 8
  %185 = load i64, ptr %184, align 2, !tbaa !16
  %186 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 40
  %187 = load i64, ptr %186, align 2, !tbaa !16
  %188 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 72
  %189 = load i64, ptr %188, align 2, !tbaa !16
  %190 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 104
  %191 = load i64, ptr %190, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !19
  %192 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %185, i64 8)
  %193 = bitcast <vscale x 2 x i64> %192 to <vscale x 16 x i8>
  %194 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %187, i64 8)
  %195 = bitcast <vscale x 2 x i64> %194 to <vscale x 16 x i8>
  %196 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %189, i64 8)
  %197 = bitcast <vscale x 2 x i64> %196 to <vscale x 16 x i8>
  %198 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %191, i64 8)
  %199 = bitcast <vscale x 2 x i64> %198 to <vscale x 16 x i8>
  %200 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %85, <vscale x 16 x i8> %193, i64 64)
  %201 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %200, <vscale x 16 x i8> %86, <vscale x 16 x i8> %195, i64 64, i64 3)
  %202 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %201, <vscale x 16 x i8> %87, <vscale x 16 x i8> %197, i64 64, i64 3)
  %203 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %202, <vscale x 16 x i8> %88, <vscale x 16 x i8> %199, i64 64, i64 3)
  %204 = bitcast <vscale x 16 x i16> %203 to <vscale x 8 x i32>
  %205 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %204, i64 0, i64 32)
  %206 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %204, i64 16, i64 32)
  %207 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %205, <vscale x 8 x i16> %206, i64 32)
  %208 = bitcast <vscale x 8 x i16> %207 to <vscale x 4 x i32>
  %209 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %208, i64 0, i64 16)
  %210 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %208, i64 16, i64 16)
  %211 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %209, <vscale x 4 x i16> %210, i64 16)
  %212 = bitcast <vscale x 4 x i16> %211 to <vscale x 2 x i32>
  %213 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %212, i64 0, i64 8)
  %214 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %212, i64 16, i64 8)
  %215 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %213, <vscale x 2 x i16> %214, i64 8)
  %216 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %215, i64 7, i64 8)
  %217 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %216, float %98, i64 7, i64 8)
  %218 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %77, <vscale x 2 x float> %217, <vscale x 2 x float> %148, i64 7, i64 8, i64 3)
  %219 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 16
  %220 = load i64, ptr %219, align 2, !tbaa !16
  %221 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 48
  %222 = load i64, ptr %221, align 2, !tbaa !16
  %223 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 80
  %224 = load i64, ptr %223, align 2, !tbaa !16
  %225 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 112
  %226 = load i64, ptr %225, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !20
  %227 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %220, i64 8)
  %228 = bitcast <vscale x 2 x i64> %227 to <vscale x 16 x i8>
  %229 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %222, i64 8)
  %230 = bitcast <vscale x 2 x i64> %229 to <vscale x 16 x i8>
  %231 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %224, i64 8)
  %232 = bitcast <vscale x 2 x i64> %231 to <vscale x 16 x i8>
  %233 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %226, i64 8)
  %234 = bitcast <vscale x 2 x i64> %233 to <vscale x 16 x i8>
  %235 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %85, <vscale x 16 x i8> %228, i64 64)
  %236 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %235, <vscale x 16 x i8> %86, <vscale x 16 x i8> %230, i64 64, i64 3)
  %237 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %236, <vscale x 16 x i8> %87, <vscale x 16 x i8> %232, i64 64, i64 3)
  %238 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %237, <vscale x 16 x i8> %88, <vscale x 16 x i8> %234, i64 64, i64 3)
  %239 = bitcast <vscale x 16 x i16> %238 to <vscale x 8 x i32>
  %240 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %239, i64 0, i64 32)
  %241 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %239, i64 16, i64 32)
  %242 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %240, <vscale x 8 x i16> %241, i64 32)
  %243 = bitcast <vscale x 8 x i16> %242 to <vscale x 4 x i32>
  %244 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %243, i64 0, i64 16)
  %245 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %243, i64 16, i64 16)
  %246 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %244, <vscale x 4 x i16> %245, i64 16)
  %247 = bitcast <vscale x 4 x i16> %246 to <vscale x 2 x i32>
  %248 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %247, i64 0, i64 8)
  %249 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %247, i64 16, i64 8)
  %250 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %248, <vscale x 2 x i16> %249, i64 8)
  %251 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %250, i64 7, i64 8)
  %252 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %251, float %103, i64 7, i64 8)
  %253 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %76, <vscale x 2 x float> %252, <vscale x 2 x float> %148, i64 7, i64 8, i64 3)
  %254 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 24
  %255 = load i64, ptr %254, align 2, !tbaa !16
  %256 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 56
  %257 = load i64, ptr %256, align 2, !tbaa !16
  %258 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 88
  %259 = load i64, ptr %258, align 2, !tbaa !16
  %260 = getelementptr inbounds %struct.block, ptr %56, i64 %74, i32 1, i64 120
  %261 = load i64, ptr %260, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !21
  %262 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %255, i64 8)
  %263 = bitcast <vscale x 2 x i64> %262 to <vscale x 16 x i8>
  %264 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %257, i64 8)
  %265 = bitcast <vscale x 2 x i64> %264 to <vscale x 16 x i8>
  %266 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %259, i64 8)
  %267 = bitcast <vscale x 2 x i64> %266 to <vscale x 16 x i8>
  %268 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %261, i64 8)
  %269 = bitcast <vscale x 2 x i64> %268 to <vscale x 16 x i8>
  %270 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %85, <vscale x 16 x i8> %263, i64 64)
  %271 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %270, <vscale x 16 x i8> %86, <vscale x 16 x i8> %265, i64 64, i64 3)
  %272 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %271, <vscale x 16 x i8> %87, <vscale x 16 x i8> %267, i64 64, i64 3)
  %273 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %272, <vscale x 16 x i8> %88, <vscale x 16 x i8> %269, i64 64, i64 3)
  %274 = bitcast <vscale x 16 x i16> %273 to <vscale x 8 x i32>
  %275 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %274, i64 0, i64 32)
  %276 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %274, i64 16, i64 32)
  %277 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %275, <vscale x 8 x i16> %276, i64 32)
  %278 = bitcast <vscale x 8 x i16> %277 to <vscale x 4 x i32>
  %279 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %278, i64 0, i64 16)
  %280 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %278, i64 16, i64 16)
  %281 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %279, <vscale x 4 x i16> %280, i64 16)
  %282 = bitcast <vscale x 4 x i16> %281 to <vscale x 2 x i32>
  %283 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %282, i64 0, i64 8)
  %284 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %282, i64 16, i64 8)
  %285 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %283, <vscale x 2 x i16> %284, i64 8)
  %286 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %285, i64 7, i64 8)
  %287 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %286, float %108, i64 7, i64 8)
  %288 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %75, <vscale x 2 x float> %287, <vscale x 2 x float> %148, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %10) #10
  %289 = add nuw nsw i64 %74, 1
  %290 = icmp eq i64 %289, %52
  br i1 %290, label %291, label %73, !llvm.loop !22

291:                                              ; preds = %73
  %292 = shl nsw i64 %70, 3
  %293 = getelementptr float, ptr %59, i64 %292
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %183, ptr %293, i64 8)
  %294 = getelementptr float, ptr %62, i64 %292
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %218, ptr %294, i64 8)
  %295 = getelementptr float, ptr %65, i64 %292
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %253, ptr %295, i64 8)
  %296 = getelementptr float, ptr %68, i64 %292
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %288, ptr %296, i64 8)
  %297 = add nuw nsw i64 %70, 1
  %298 = icmp eq i64 %297, %51
  br i1 %298, label %299, label %69, !llvm.loop !24

299:                                              ; preds = %291
  %300 = add nuw nsw i64 %54, 1
  %301 = icmp eq i64 %300, %50
  br i1 %301, label %839, label %53, !llvm.loop !25

302:                                              ; preds = %45, %325
  %303 = phi i64 [ 0, %45 ], [ %326, %325 ]
  %304 = shl nsw i64 %303, 2
  %305 = mul i64 %304, %2
  %306 = getelementptr float, ptr %1, i64 %305
  %307 = or disjoint i64 %304, 1
  %308 = mul i64 %307, %2
  %309 = getelementptr float, ptr %1, i64 %308
  %310 = or disjoint i64 %304, 2
  %311 = mul i64 %310, %2
  %312 = getelementptr float, ptr %1, i64 %311
  %313 = or disjoint i64 %304, 3
  %314 = mul i64 %313, %2
  %315 = getelementptr float, ptr %1, i64 %314
  br label %316

316:                                              ; preds = %302, %316
  %317 = phi i64 [ 0, %302 ], [ %323, %316 ]
  %318 = shl nsw i64 %317, 3
  %319 = getelementptr float, ptr %306, i64 %318
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %44, ptr %319, i64 8)
  %320 = getelementptr float, ptr %309, i64 %318
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %44, ptr %320, i64 8)
  %321 = getelementptr float, ptr %312, i64 %318
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %44, ptr %321, i64 8)
  %322 = getelementptr float, ptr %315, i64 %318
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %44, ptr %322, i64 8)
  %323 = add nuw nsw i64 %317, 1
  %324 = icmp eq i64 %323, %47
  br i1 %324, label %325, label %316, !llvm.loop !24

325:                                              ; preds = %316
  %326 = add nuw nsw i64 %303, 1
  %327 = icmp eq i64 %326, %46
  br i1 %327, label %839, label %302, !llvm.loop !25

328:                                              ; preds = %26
  br i1 %30, label %329, label %839

329:                                              ; preds = %328
  %330 = ashr exact i32 %6, 3
  %331 = icmp sgt i32 %330, 0
  %332 = icmp sgt i32 %0, 31
  %333 = getelementptr inbounds float, ptr %8, i64 1
  %334 = getelementptr inbounds float, ptr %8, i64 2
  %335 = getelementptr inbounds float, ptr %8, i64 3
  %336 = getelementptr inbounds float, ptr %8, i64 4
  %337 = getelementptr inbounds float, ptr %8, i64 5
  %338 = getelementptr inbounds float, ptr %8, i64 6
  %339 = getelementptr inbounds float, ptr %8, i64 7
  %340 = getelementptr inbounds float, ptr %9, i64 1
  %341 = getelementptr inbounds float, ptr %9, i64 2
  %342 = getelementptr inbounds float, ptr %9, i64 3
  %343 = getelementptr inbounds float, ptr %9, i64 4
  %344 = getelementptr inbounds float, ptr %9, i64 5
  %345 = getelementptr inbounds float, ptr %9, i64 6
  %346 = getelementptr inbounds float, ptr %9, i64 7
  br i1 %331, label %347, label %839

347:                                              ; preds = %329
  %348 = tail call <vscale x 2 x float> @llvm.riscv.vfmv.v.f.nxv2f32.i64(<vscale x 2 x float> poison, float 0.000000e+00, i64 8)
  %349 = sext i32 %11 to i64
  %350 = zext nneg i32 %330 to i64
  %351 = zext nneg i32 %29 to i64
  %352 = zext nneg i32 %11 to i64
  %353 = zext nneg i32 %11 to i64
  br label %354

354:                                              ; preds = %835, %347
  %355 = phi i64 [ %836, %835 ], [ 0, %347 ]
  %356 = mul nsw i64 %355, %349
  %357 = getelementptr inbounds %struct.block, ptr %4, i64 %356
  %358 = shl nsw i64 %355, 2
  %359 = mul i64 %358, %2
  %360 = getelementptr float, ptr %1, i64 %359
  %361 = or disjoint i64 %358, 1
  %362 = mul i64 %361, %2
  %363 = getelementptr float, ptr %1, i64 %362
  %364 = or disjoint i64 %358, 2
  %365 = mul i64 %364, %2
  %366 = getelementptr float, ptr %1, i64 %365
  %367 = or disjoint i64 %358, 3
  %368 = mul i64 %367, %2
  %369 = getelementptr float, ptr %1, i64 %368
  br label %370

370:                                              ; preds = %354, %377
  %371 = phi i64 [ 0, %354 ], [ %396, %377 ]
  %372 = mul nsw i64 %371, %349
  %373 = getelementptr inbounds %struct.block.0, ptr %3, i64 %372
  %374 = or disjoint i64 %371, 1
  %375 = mul nsw i64 %374, %349
  %376 = getelementptr inbounds %struct.block.0, ptr %3, i64 %375
  br i1 %332, label %616, label %377

377:                                              ; preds = %398, %370, %834
  %378 = phi <vscale x 2 x float> [ %726, %834 ], [ %348, %370 ], [ %726, %398 ]
  %379 = phi <vscale x 2 x float> [ %761, %834 ], [ %348, %370 ], [ %761, %398 ]
  %380 = phi <vscale x 2 x float> [ %796, %834 ], [ %348, %370 ], [ %796, %398 ]
  %381 = phi <vscale x 2 x float> [ %831, %834 ], [ %348, %370 ], [ %831, %398 ]
  %382 = phi <vscale x 2 x float> [ %348, %834 ], [ %348, %370 ], [ %613, %398 ]
  %383 = phi <vscale x 2 x float> [ %348, %834 ], [ %348, %370 ], [ %578, %398 ]
  %384 = phi <vscale x 2 x float> [ %348, %834 ], [ %348, %370 ], [ %543, %398 ]
  %385 = phi <vscale x 2 x float> [ %348, %834 ], [ %348, %370 ], [ %508, %398 ]
  %386 = shl nsw i64 %371, 3
  %387 = getelementptr float, ptr %360, i64 %386
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %378, ptr %387, i64 8)
  %388 = shl nsw i64 %374, 3
  %389 = getelementptr float, ptr %360, i64 %388
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %385, ptr %389, i64 8)
  %390 = getelementptr float, ptr %363, i64 %386
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %379, ptr %390, i64 8)
  %391 = getelementptr float, ptr %363, i64 %388
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %384, ptr %391, i64 8)
  %392 = getelementptr float, ptr %366, i64 %386
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %380, ptr %392, i64 8)
  %393 = getelementptr float, ptr %366, i64 %388
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %383, ptr %393, i64 8)
  %394 = getelementptr float, ptr %369, i64 %386
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %381, ptr %394, i64 8)
  %395 = getelementptr float, ptr %369, i64 %388
  tail call void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float> %382, ptr %395, i64 8)
  %396 = add nuw nsw i64 %371, 2
  %397 = icmp ult i64 %396, %350
  br i1 %397, label %370, label %835, !llvm.loop !26

398:                                              ; preds = %834, %398
  %399 = phi i64 [ %614, %398 ], [ 0, %834 ]
  %400 = phi <vscale x 2 x float> [ %508, %398 ], [ %348, %834 ]
  %401 = phi <vscale x 2 x float> [ %543, %398 ], [ %348, %834 ]
  %402 = phi <vscale x 2 x float> [ %578, %398 ], [ %348, %834 ]
  %403 = phi <vscale x 2 x float> [ %613, %398 ], [ %348, %834 ]
  %404 = getelementptr inbounds %struct.block.0, ptr %376, i64 %399
  %405 = getelementptr inbounds %struct.block.0, ptr %376, i64 %399, i32 1
  %406 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %405, i64 128)
  %407 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %406, i64 4, i64 128)
  %408 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %407, i64 4, i64 128)
  %409 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %406, i64 4, i64 128)
  %410 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %408, i64 0)
  %411 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %408, i64 16)
  %412 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %409, i64 0)
  %413 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %409, i64 16)
  %414 = getelementptr inbounds %struct.block, ptr %357, i64 %399
  %415 = load i16, ptr %414, align 2, !tbaa !10
  %416 = zext i16 %415 to i64
  %417 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %416
  %418 = load float, ptr %417, align 4, !tbaa !14
  %419 = getelementptr inbounds [4 x i16], ptr %414, i64 0, i64 1
  %420 = load i16, ptr %419, align 2, !tbaa !10
  %421 = zext i16 %420 to i64
  %422 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %421
  %423 = load float, ptr %422, align 4, !tbaa !14
  %424 = getelementptr inbounds [4 x i16], ptr %414, i64 0, i64 2
  %425 = load i16, ptr %424, align 2, !tbaa !10
  %426 = zext i16 %425 to i64
  %427 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %426
  %428 = load float, ptr %427, align 4, !tbaa !14
  %429 = getelementptr inbounds [4 x i16], ptr %414, i64 0, i64 3
  %430 = load i16, ptr %429, align 2, !tbaa !10
  %431 = zext i16 %430 to i64
  %432 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %431
  %433 = load float, ptr %432, align 4, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %9) #10
  %434 = load i16, ptr %404, align 2, !tbaa !10
  %435 = zext i16 %434 to i64
  %436 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %435
  %437 = load float, ptr %436, align 4, !tbaa !14
  store float %437, ptr %9, align 4, !tbaa !14
  %438 = getelementptr inbounds [8 x i16], ptr %404, i64 0, i64 1
  %439 = load i16, ptr %438, align 2, !tbaa !10
  %440 = zext i16 %439 to i64
  %441 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %440
  %442 = load float, ptr %441, align 4, !tbaa !14
  store float %442, ptr %340, align 4, !tbaa !14
  %443 = getelementptr inbounds [8 x i16], ptr %404, i64 0, i64 2
  %444 = load i16, ptr %443, align 2, !tbaa !10
  %445 = zext i16 %444 to i64
  %446 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %445
  %447 = load float, ptr %446, align 4, !tbaa !14
  store float %447, ptr %341, align 4, !tbaa !14
  %448 = getelementptr inbounds [8 x i16], ptr %404, i64 0, i64 3
  %449 = load i16, ptr %448, align 2, !tbaa !10
  %450 = zext i16 %449 to i64
  %451 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %450
  %452 = load float, ptr %451, align 4, !tbaa !14
  store float %452, ptr %342, align 4, !tbaa !14
  %453 = getelementptr inbounds [8 x i16], ptr %404, i64 0, i64 4
  %454 = load i16, ptr %453, align 2, !tbaa !10
  %455 = zext i16 %454 to i64
  %456 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %455
  %457 = load float, ptr %456, align 4, !tbaa !14
  store float %457, ptr %343, align 4, !tbaa !14
  %458 = getelementptr inbounds [8 x i16], ptr %404, i64 0, i64 5
  %459 = load i16, ptr %458, align 2, !tbaa !10
  %460 = zext i16 %459 to i64
  %461 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %460
  %462 = load float, ptr %461, align 4, !tbaa !14
  store float %462, ptr %344, align 4, !tbaa !14
  %463 = getelementptr inbounds [8 x i16], ptr %404, i64 0, i64 6
  %464 = load i16, ptr %463, align 2, !tbaa !10
  %465 = zext i16 %464 to i64
  %466 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %465
  %467 = load float, ptr %466, align 4, !tbaa !14
  store float %467, ptr %345, align 4, !tbaa !14
  %468 = getelementptr inbounds [8 x i16], ptr %404, i64 0, i64 7
  %469 = load i16, ptr %468, align 2, !tbaa !10
  %470 = zext i16 %469 to i64
  %471 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %470
  %472 = load float, ptr %471, align 4, !tbaa !14
  store float %472, ptr %346, align 4, !tbaa !14
  %473 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %9, i64 8)
  %474 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1
  %475 = load i64, ptr %474, align 2, !tbaa !16
  %476 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 32
  %477 = load i64, ptr %476, align 2, !tbaa !16
  %478 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 64
  %479 = load i64, ptr %478, align 2, !tbaa !16
  %480 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 96
  %481 = load i64, ptr %480, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !27
  %482 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %475, i64 8)
  %483 = bitcast <vscale x 2 x i64> %482 to <vscale x 16 x i8>
  %484 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %477, i64 8)
  %485 = bitcast <vscale x 2 x i64> %484 to <vscale x 16 x i8>
  %486 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %479, i64 8)
  %487 = bitcast <vscale x 2 x i64> %486 to <vscale x 16 x i8>
  %488 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %481, i64 8)
  %489 = bitcast <vscale x 2 x i64> %488 to <vscale x 16 x i8>
  %490 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %410, <vscale x 16 x i8> %483, i64 64)
  %491 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %490, <vscale x 16 x i8> %411, <vscale x 16 x i8> %485, i64 64, i64 3)
  %492 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %491, <vscale x 16 x i8> %412, <vscale x 16 x i8> %487, i64 64, i64 3)
  %493 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %492, <vscale x 16 x i8> %413, <vscale x 16 x i8> %489, i64 64, i64 3)
  %494 = bitcast <vscale x 16 x i16> %493 to <vscale x 8 x i32>
  %495 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %494, i64 0, i64 32)
  %496 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %494, i64 16, i64 32)
  %497 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %495, <vscale x 8 x i16> %496, i64 32)
  %498 = bitcast <vscale x 8 x i16> %497 to <vscale x 4 x i32>
  %499 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %498, i64 0, i64 16)
  %500 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %498, i64 16, i64 16)
  %501 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %499, <vscale x 4 x i16> %500, i64 16)
  %502 = bitcast <vscale x 4 x i16> %501 to <vscale x 2 x i32>
  %503 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %502, i64 0, i64 8)
  %504 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %502, i64 16, i64 8)
  %505 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %503, <vscale x 2 x i16> %504, i64 8)
  %506 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %505, i64 7, i64 8)
  %507 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %506, float %418, i64 7, i64 8)
  %508 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %400, <vscale x 2 x float> %507, <vscale x 2 x float> %473, i64 7, i64 8, i64 3)
  %509 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 8
  %510 = load i64, ptr %509, align 2, !tbaa !16
  %511 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 40
  %512 = load i64, ptr %511, align 2, !tbaa !16
  %513 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 72
  %514 = load i64, ptr %513, align 2, !tbaa !16
  %515 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 104
  %516 = load i64, ptr %515, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !28
  %517 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %510, i64 8)
  %518 = bitcast <vscale x 2 x i64> %517 to <vscale x 16 x i8>
  %519 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %512, i64 8)
  %520 = bitcast <vscale x 2 x i64> %519 to <vscale x 16 x i8>
  %521 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %514, i64 8)
  %522 = bitcast <vscale x 2 x i64> %521 to <vscale x 16 x i8>
  %523 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %516, i64 8)
  %524 = bitcast <vscale x 2 x i64> %523 to <vscale x 16 x i8>
  %525 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %410, <vscale x 16 x i8> %518, i64 64)
  %526 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %525, <vscale x 16 x i8> %411, <vscale x 16 x i8> %520, i64 64, i64 3)
  %527 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %526, <vscale x 16 x i8> %412, <vscale x 16 x i8> %522, i64 64, i64 3)
  %528 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %527, <vscale x 16 x i8> %413, <vscale x 16 x i8> %524, i64 64, i64 3)
  %529 = bitcast <vscale x 16 x i16> %528 to <vscale x 8 x i32>
  %530 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %529, i64 0, i64 32)
  %531 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %529, i64 16, i64 32)
  %532 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %530, <vscale x 8 x i16> %531, i64 32)
  %533 = bitcast <vscale x 8 x i16> %532 to <vscale x 4 x i32>
  %534 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %533, i64 0, i64 16)
  %535 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %533, i64 16, i64 16)
  %536 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %534, <vscale x 4 x i16> %535, i64 16)
  %537 = bitcast <vscale x 4 x i16> %536 to <vscale x 2 x i32>
  %538 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %537, i64 0, i64 8)
  %539 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %537, i64 16, i64 8)
  %540 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %538, <vscale x 2 x i16> %539, i64 8)
  %541 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %540, i64 7, i64 8)
  %542 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %541, float %423, i64 7, i64 8)
  %543 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %401, <vscale x 2 x float> %542, <vscale x 2 x float> %473, i64 7, i64 8, i64 3)
  %544 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 16
  %545 = load i64, ptr %544, align 2, !tbaa !16
  %546 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 48
  %547 = load i64, ptr %546, align 2, !tbaa !16
  %548 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 80
  %549 = load i64, ptr %548, align 2, !tbaa !16
  %550 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 112
  %551 = load i64, ptr %550, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !29
  %552 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %545, i64 8)
  %553 = bitcast <vscale x 2 x i64> %552 to <vscale x 16 x i8>
  %554 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %547, i64 8)
  %555 = bitcast <vscale x 2 x i64> %554 to <vscale x 16 x i8>
  %556 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %549, i64 8)
  %557 = bitcast <vscale x 2 x i64> %556 to <vscale x 16 x i8>
  %558 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %551, i64 8)
  %559 = bitcast <vscale x 2 x i64> %558 to <vscale x 16 x i8>
  %560 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %410, <vscale x 16 x i8> %553, i64 64)
  %561 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %560, <vscale x 16 x i8> %411, <vscale x 16 x i8> %555, i64 64, i64 3)
  %562 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %561, <vscale x 16 x i8> %412, <vscale x 16 x i8> %557, i64 64, i64 3)
  %563 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %562, <vscale x 16 x i8> %413, <vscale x 16 x i8> %559, i64 64, i64 3)
  %564 = bitcast <vscale x 16 x i16> %563 to <vscale x 8 x i32>
  %565 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %564, i64 0, i64 32)
  %566 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %564, i64 16, i64 32)
  %567 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %565, <vscale x 8 x i16> %566, i64 32)
  %568 = bitcast <vscale x 8 x i16> %567 to <vscale x 4 x i32>
  %569 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %568, i64 0, i64 16)
  %570 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %568, i64 16, i64 16)
  %571 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %569, <vscale x 4 x i16> %570, i64 16)
  %572 = bitcast <vscale x 4 x i16> %571 to <vscale x 2 x i32>
  %573 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %572, i64 0, i64 8)
  %574 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %572, i64 16, i64 8)
  %575 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %573, <vscale x 2 x i16> %574, i64 8)
  %576 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %575, i64 7, i64 8)
  %577 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %576, float %428, i64 7, i64 8)
  %578 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %402, <vscale x 2 x float> %577, <vscale x 2 x float> %473, i64 7, i64 8, i64 3)
  %579 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 24
  %580 = load i64, ptr %579, align 2, !tbaa !16
  %581 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 56
  %582 = load i64, ptr %581, align 2, !tbaa !16
  %583 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 88
  %584 = load i64, ptr %583, align 2, !tbaa !16
  %585 = getelementptr inbounds %struct.block, ptr %357, i64 %399, i32 1, i64 120
  %586 = load i64, ptr %585, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !30
  %587 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %580, i64 8)
  %588 = bitcast <vscale x 2 x i64> %587 to <vscale x 16 x i8>
  %589 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %582, i64 8)
  %590 = bitcast <vscale x 2 x i64> %589 to <vscale x 16 x i8>
  %591 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %584, i64 8)
  %592 = bitcast <vscale x 2 x i64> %591 to <vscale x 16 x i8>
  %593 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %586, i64 8)
  %594 = bitcast <vscale x 2 x i64> %593 to <vscale x 16 x i8>
  %595 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %410, <vscale x 16 x i8> %588, i64 64)
  %596 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %595, <vscale x 16 x i8> %411, <vscale x 16 x i8> %590, i64 64, i64 3)
  %597 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %596, <vscale x 16 x i8> %412, <vscale x 16 x i8> %592, i64 64, i64 3)
  %598 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %597, <vscale x 16 x i8> %413, <vscale x 16 x i8> %594, i64 64, i64 3)
  %599 = bitcast <vscale x 16 x i16> %598 to <vscale x 8 x i32>
  %600 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %599, i64 0, i64 32)
  %601 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %599, i64 16, i64 32)
  %602 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %600, <vscale x 8 x i16> %601, i64 32)
  %603 = bitcast <vscale x 8 x i16> %602 to <vscale x 4 x i32>
  %604 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %603, i64 0, i64 16)
  %605 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %603, i64 16, i64 16)
  %606 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %604, <vscale x 4 x i16> %605, i64 16)
  %607 = bitcast <vscale x 4 x i16> %606 to <vscale x 2 x i32>
  %608 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %607, i64 0, i64 8)
  %609 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %607, i64 16, i64 8)
  %610 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %608, <vscale x 2 x i16> %609, i64 8)
  %611 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %610, i64 7, i64 8)
  %612 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %611, float %433, i64 7, i64 8)
  %613 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %403, <vscale x 2 x float> %612, <vscale x 2 x float> %473, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #10
  %614 = add nuw nsw i64 %399, 1
  %615 = icmp eq i64 %614, %353
  br i1 %615, label %377, label %398, !llvm.loop !31

616:                                              ; preds = %370, %616
  %617 = phi i64 [ %832, %616 ], [ 0, %370 ]
  %618 = phi <vscale x 2 x float> [ %726, %616 ], [ %348, %370 ]
  %619 = phi <vscale x 2 x float> [ %761, %616 ], [ %348, %370 ]
  %620 = phi <vscale x 2 x float> [ %796, %616 ], [ %348, %370 ]
  %621 = phi <vscale x 2 x float> [ %831, %616 ], [ %348, %370 ]
  %622 = getelementptr inbounds %struct.block.0, ptr %373, i64 %617
  %623 = getelementptr inbounds %struct.block.0, ptr %373, i64 %617, i32 1
  %624 = tail call <vscale x 32 x i8> @llvm.riscv.vle.nxv32i8.i64(<vscale x 32 x i8> poison, ptr nonnull %623, i64 128)
  %625 = tail call <vscale x 32 x i8> @llvm.riscv.vsll.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %624, i64 4, i64 128)
  %626 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %625, i64 4, i64 128)
  %627 = tail call <vscale x 32 x i8> @llvm.riscv.vsra.nxv32i8.i64.i64(<vscale x 32 x i8> poison, <vscale x 32 x i8> %624, i64 4, i64 128)
  %628 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %626, i64 0)
  %629 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %626, i64 16)
  %630 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %627, i64 0)
  %631 = tail call <vscale x 16 x i8> @llvm.vector.extract.nxv16i8.nxv32i8(<vscale x 32 x i8> %627, i64 16)
  %632 = getelementptr inbounds %struct.block, ptr %357, i64 %617
  %633 = load i16, ptr %632, align 2, !tbaa !10
  %634 = zext i16 %633 to i64
  %635 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %634
  %636 = load float, ptr %635, align 4, !tbaa !14
  %637 = getelementptr inbounds [4 x i16], ptr %632, i64 0, i64 1
  %638 = load i16, ptr %637, align 2, !tbaa !10
  %639 = zext i16 %638 to i64
  %640 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %639
  %641 = load float, ptr %640, align 4, !tbaa !14
  %642 = getelementptr inbounds [4 x i16], ptr %632, i64 0, i64 2
  %643 = load i16, ptr %642, align 2, !tbaa !10
  %644 = zext i16 %643 to i64
  %645 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %644
  %646 = load float, ptr %645, align 4, !tbaa !14
  %647 = getelementptr inbounds [4 x i16], ptr %632, i64 0, i64 3
  %648 = load i16, ptr %647, align 2, !tbaa !10
  %649 = zext i16 %648 to i64
  %650 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %649
  %651 = load float, ptr %650, align 4, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %8) #10
  %652 = load i16, ptr %622, align 2, !tbaa !10
  %653 = zext i16 %652 to i64
  %654 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %653
  %655 = load float, ptr %654, align 4, !tbaa !14
  store float %655, ptr %8, align 4, !tbaa !14
  %656 = getelementptr inbounds [8 x i16], ptr %622, i64 0, i64 1
  %657 = load i16, ptr %656, align 2, !tbaa !10
  %658 = zext i16 %657 to i64
  %659 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %658
  %660 = load float, ptr %659, align 4, !tbaa !14
  store float %660, ptr %333, align 4, !tbaa !14
  %661 = getelementptr inbounds [8 x i16], ptr %622, i64 0, i64 2
  %662 = load i16, ptr %661, align 2, !tbaa !10
  %663 = zext i16 %662 to i64
  %664 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %663
  %665 = load float, ptr %664, align 4, !tbaa !14
  store float %665, ptr %334, align 4, !tbaa !14
  %666 = getelementptr inbounds [8 x i16], ptr %622, i64 0, i64 3
  %667 = load i16, ptr %666, align 2, !tbaa !10
  %668 = zext i16 %667 to i64
  %669 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %668
  %670 = load float, ptr %669, align 4, !tbaa !14
  store float %670, ptr %335, align 4, !tbaa !14
  %671 = getelementptr inbounds [8 x i16], ptr %622, i64 0, i64 4
  %672 = load i16, ptr %671, align 2, !tbaa !10
  %673 = zext i16 %672 to i64
  %674 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %673
  %675 = load float, ptr %674, align 4, !tbaa !14
  store float %675, ptr %336, align 4, !tbaa !14
  %676 = getelementptr inbounds [8 x i16], ptr %622, i64 0, i64 5
  %677 = load i16, ptr %676, align 2, !tbaa !10
  %678 = zext i16 %677 to i64
  %679 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %678
  %680 = load float, ptr %679, align 4, !tbaa !14
  store float %680, ptr %337, align 4, !tbaa !14
  %681 = getelementptr inbounds [8 x i16], ptr %622, i64 0, i64 6
  %682 = load i16, ptr %681, align 2, !tbaa !10
  %683 = zext i16 %682 to i64
  %684 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %683
  %685 = load float, ptr %684, align 4, !tbaa !14
  store float %685, ptr %338, align 4, !tbaa !14
  %686 = getelementptr inbounds [8 x i16], ptr %622, i64 0, i64 7
  %687 = load i16, ptr %686, align 2, !tbaa !10
  %688 = zext i16 %687 to i64
  %689 = getelementptr inbounds [65536 x float], ptr @ggml_table_f32_f16, i64 0, i64 %688
  %690 = load float, ptr %689, align 4, !tbaa !14
  store float %690, ptr %339, align 4, !tbaa !14
  %691 = call <vscale x 2 x float> @llvm.riscv.vle.nxv2f32.i64(<vscale x 2 x float> poison, ptr nonnull %8, i64 8)
  %692 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1
  %693 = load i64, ptr %692, align 2, !tbaa !16
  %694 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 32
  %695 = load i64, ptr %694, align 2, !tbaa !16
  %696 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 64
  %697 = load i64, ptr %696, align 2, !tbaa !16
  %698 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 96
  %699 = load i64, ptr %698, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !32
  %700 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %693, i64 8)
  %701 = bitcast <vscale x 2 x i64> %700 to <vscale x 16 x i8>
  %702 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %695, i64 8)
  %703 = bitcast <vscale x 2 x i64> %702 to <vscale x 16 x i8>
  %704 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %697, i64 8)
  %705 = bitcast <vscale x 2 x i64> %704 to <vscale x 16 x i8>
  %706 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %699, i64 8)
  %707 = bitcast <vscale x 2 x i64> %706 to <vscale x 16 x i8>
  %708 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %628, <vscale x 16 x i8> %701, i64 64)
  %709 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %708, <vscale x 16 x i8> %629, <vscale x 16 x i8> %703, i64 64, i64 3)
  %710 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %709, <vscale x 16 x i8> %630, <vscale x 16 x i8> %705, i64 64, i64 3)
  %711 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %710, <vscale x 16 x i8> %631, <vscale x 16 x i8> %707, i64 64, i64 3)
  %712 = bitcast <vscale x 16 x i16> %711 to <vscale x 8 x i32>
  %713 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %712, i64 0, i64 32)
  %714 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %712, i64 16, i64 32)
  %715 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %713, <vscale x 8 x i16> %714, i64 32)
  %716 = bitcast <vscale x 8 x i16> %715 to <vscale x 4 x i32>
  %717 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %716, i64 0, i64 16)
  %718 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %716, i64 16, i64 16)
  %719 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %717, <vscale x 4 x i16> %718, i64 16)
  %720 = bitcast <vscale x 4 x i16> %719 to <vscale x 2 x i32>
  %721 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %720, i64 0, i64 8)
  %722 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %720, i64 16, i64 8)
  %723 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %721, <vscale x 2 x i16> %722, i64 8)
  %724 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %723, i64 7, i64 8)
  %725 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %724, float %636, i64 7, i64 8)
  %726 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %618, <vscale x 2 x float> %725, <vscale x 2 x float> %691, i64 7, i64 8, i64 3)
  %727 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 8
  %728 = load i64, ptr %727, align 2, !tbaa !16
  %729 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 40
  %730 = load i64, ptr %729, align 2, !tbaa !16
  %731 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 72
  %732 = load i64, ptr %731, align 2, !tbaa !16
  %733 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 104
  %734 = load i64, ptr %733, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !33
  %735 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %728, i64 8)
  %736 = bitcast <vscale x 2 x i64> %735 to <vscale x 16 x i8>
  %737 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %730, i64 8)
  %738 = bitcast <vscale x 2 x i64> %737 to <vscale x 16 x i8>
  %739 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %732, i64 8)
  %740 = bitcast <vscale x 2 x i64> %739 to <vscale x 16 x i8>
  %741 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %734, i64 8)
  %742 = bitcast <vscale x 2 x i64> %741 to <vscale x 16 x i8>
  %743 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %628, <vscale x 16 x i8> %736, i64 64)
  %744 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %743, <vscale x 16 x i8> %629, <vscale x 16 x i8> %738, i64 64, i64 3)
  %745 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %744, <vscale x 16 x i8> %630, <vscale x 16 x i8> %740, i64 64, i64 3)
  %746 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %745, <vscale x 16 x i8> %631, <vscale x 16 x i8> %742, i64 64, i64 3)
  %747 = bitcast <vscale x 16 x i16> %746 to <vscale x 8 x i32>
  %748 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %747, i64 0, i64 32)
  %749 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %747, i64 16, i64 32)
  %750 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %748, <vscale x 8 x i16> %749, i64 32)
  %751 = bitcast <vscale x 8 x i16> %750 to <vscale x 4 x i32>
  %752 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %751, i64 0, i64 16)
  %753 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %751, i64 16, i64 16)
  %754 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %752, <vscale x 4 x i16> %753, i64 16)
  %755 = bitcast <vscale x 4 x i16> %754 to <vscale x 2 x i32>
  %756 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %755, i64 0, i64 8)
  %757 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %755, i64 16, i64 8)
  %758 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %756, <vscale x 2 x i16> %757, i64 8)
  %759 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %758, i64 7, i64 8)
  %760 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %759, float %641, i64 7, i64 8)
  %761 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %619, <vscale x 2 x float> %760, <vscale x 2 x float> %691, i64 7, i64 8, i64 3)
  %762 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 16
  %763 = load i64, ptr %762, align 2, !tbaa !16
  %764 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 48
  %765 = load i64, ptr %764, align 2, !tbaa !16
  %766 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 80
  %767 = load i64, ptr %766, align 2, !tbaa !16
  %768 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 112
  %769 = load i64, ptr %768, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !34
  %770 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %763, i64 8)
  %771 = bitcast <vscale x 2 x i64> %770 to <vscale x 16 x i8>
  %772 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %765, i64 8)
  %773 = bitcast <vscale x 2 x i64> %772 to <vscale x 16 x i8>
  %774 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %767, i64 8)
  %775 = bitcast <vscale x 2 x i64> %774 to <vscale x 16 x i8>
  %776 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %769, i64 8)
  %777 = bitcast <vscale x 2 x i64> %776 to <vscale x 16 x i8>
  %778 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %628, <vscale x 16 x i8> %771, i64 64)
  %779 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %778, <vscale x 16 x i8> %629, <vscale x 16 x i8> %773, i64 64, i64 3)
  %780 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %779, <vscale x 16 x i8> %630, <vscale x 16 x i8> %775, i64 64, i64 3)
  %781 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %780, <vscale x 16 x i8> %631, <vscale x 16 x i8> %777, i64 64, i64 3)
  %782 = bitcast <vscale x 16 x i16> %781 to <vscale x 8 x i32>
  %783 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %782, i64 0, i64 32)
  %784 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %782, i64 16, i64 32)
  %785 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %783, <vscale x 8 x i16> %784, i64 32)
  %786 = bitcast <vscale x 8 x i16> %785 to <vscale x 4 x i32>
  %787 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %786, i64 0, i64 16)
  %788 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %786, i64 16, i64 16)
  %789 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %787, <vscale x 4 x i16> %788, i64 16)
  %790 = bitcast <vscale x 4 x i16> %789 to <vscale x 2 x i32>
  %791 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %790, i64 0, i64 8)
  %792 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %790, i64 16, i64 8)
  %793 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %791, <vscale x 2 x i16> %792, i64 8)
  %794 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %793, i64 7, i64 8)
  %795 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %794, float %646, i64 7, i64 8)
  %796 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %620, <vscale x 2 x float> %795, <vscale x 2 x float> %691, i64 7, i64 8, i64 3)
  %797 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 24
  %798 = load i64, ptr %797, align 2, !tbaa !16
  %799 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 56
  %800 = load i64, ptr %799, align 2, !tbaa !16
  %801 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 88
  %802 = load i64, ptr %801, align 2, !tbaa !16
  %803 = getelementptr inbounds %struct.block, ptr %357, i64 %617, i32 1, i64 120
  %804 = load i64, ptr %803, align 2, !tbaa !16
  tail call void asm sideeffect "", "~{memory}"() #10, !srcloc !35
  %805 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %798, i64 8)
  %806 = bitcast <vscale x 2 x i64> %805 to <vscale x 16 x i8>
  %807 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %800, i64 8)
  %808 = bitcast <vscale x 2 x i64> %807 to <vscale x 16 x i8>
  %809 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %802, i64 8)
  %810 = bitcast <vscale x 2 x i64> %809 to <vscale x 16 x i8>
  %811 = tail call <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64> poison, i64 %804, i64 8)
  %812 = bitcast <vscale x 2 x i64> %811 to <vscale x 16 x i8>
  %813 = tail call <vscale x 16 x i16> @llvm.riscv.vwmul.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> poison, <vscale x 16 x i8> %628, <vscale x 16 x i8> %806, i64 64)
  %814 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %813, <vscale x 16 x i8> %629, <vscale x 16 x i8> %808, i64 64, i64 3)
  %815 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %814, <vscale x 16 x i8> %630, <vscale x 16 x i8> %810, i64 64, i64 3)
  %816 = tail call <vscale x 16 x i16> @llvm.riscv.vwmacc.nxv16i16.nxv16i8.nxv16i8.i64(<vscale x 16 x i16> %815, <vscale x 16 x i8> %631, <vscale x 16 x i8> %812, i64 64, i64 3)
  %817 = bitcast <vscale x 16 x i16> %816 to <vscale x 8 x i32>
  %818 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %817, i64 0, i64 32)
  %819 = tail call <vscale x 8 x i16> @llvm.riscv.vnsrl.nxv8i16.nxv8i32.i64.i64(<vscale x 8 x i16> poison, <vscale x 8 x i32> %817, i64 16, i64 32)
  %820 = tail call <vscale x 8 x i16> @llvm.riscv.vadd.nxv8i16.nxv8i16.i64(<vscale x 8 x i16> poison, <vscale x 8 x i16> %818, <vscale x 8 x i16> %819, i64 32)
  %821 = bitcast <vscale x 8 x i16> %820 to <vscale x 4 x i32>
  %822 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %821, i64 0, i64 16)
  %823 = tail call <vscale x 4 x i16> @llvm.riscv.vnsrl.nxv4i16.nxv4i32.i64.i64(<vscale x 4 x i16> poison, <vscale x 4 x i32> %821, i64 16, i64 16)
  %824 = tail call <vscale x 4 x i16> @llvm.riscv.vadd.nxv4i16.nxv4i16.i64(<vscale x 4 x i16> poison, <vscale x 4 x i16> %822, <vscale x 4 x i16> %823, i64 16)
  %825 = bitcast <vscale x 4 x i16> %824 to <vscale x 2 x i32>
  %826 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %825, i64 0, i64 8)
  %827 = tail call <vscale x 2 x i16> @llvm.riscv.vnsrl.nxv2i16.nxv2i32.i64.i64(<vscale x 2 x i16> poison, <vscale x 2 x i32> %825, i64 16, i64 8)
  %828 = tail call <vscale x 2 x i32> @llvm.riscv.vwadd.nxv2i32.nxv2i16.nxv2i16.i64(<vscale x 2 x i32> poison, <vscale x 2 x i16> %826, <vscale x 2 x i16> %827, i64 8)
  %829 = tail call <vscale x 2 x float> @llvm.riscv.vfcvt.f.x.v.nxv2f32.nxv2i32.i64(<vscale x 2 x float> poison, <vscale x 2 x i32> %828, i64 7, i64 8)
  %830 = tail call <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float> poison, <vscale x 2 x float> %829, float %651, i64 7, i64 8)
  %831 = tail call <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float> %621, <vscale x 2 x float> %830, <vscale x 2 x float> %691, i64 7, i64 8, i64 3)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %8) #10
  %832 = add nuw nsw i64 %617, 1
  %833 = icmp eq i64 %832, %352
  br i1 %833, label %834, label %616, !llvm.loop !36

834:                                              ; preds = %616
  br i1 %332, label %398, label %377

835:                                              ; preds = %377
  %836 = add nuw nsw i64 %355, 1
  %837 = icmp eq i64 %836, %351
  br i1 %837, label %839, label %354, !llvm.loop !37

838:                                              ; preds = %23
  tail call void @ggml_gemm_q4_0_8x8_q8_0_generic(i32 noundef signext %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef signext %5, i32 noundef signext %6)
  br label %839

839:                                              ; preds = %325, %299, %835, %329, %32, %31, %328, %838
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
declare <vscale x 2 x i64> @llvm.riscv.vmv.v.x.nxv2i64.i64(<vscale x 2 x i64>, i64, i64) #4

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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfmul.nxv2f32.f32.i64(<vscale x 2 x float>, <vscale x 2 x float>, float, i64 immarg, i64) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x float> @llvm.riscv.vfmacc.nxv2f32.nxv2f32.i64(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x float>, i64 immarg, i64, i64 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.riscv.vse.nxv2f32.i64(<vscale x 2 x float>, ptr nocapture, i64) #7

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
!11 = !{!"short", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C++ TBAA"}
!14 = !{!15, !15, i64 0}
!15 = !{!"float", !12, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"long", !12, i64 0}
!18 = !{i64 37157}
!19 = !{i64 40246}
!20 = !{i64 43336}
!21 = !{i64 46426}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !23}
!27 = !{i64 20863}
!28 = !{i64 24010}
!29 = !{i64 27158}
!30 = !{i64 30306}
!31 = distinct !{!31, !23}
!32 = !{i64 5991}
!33 = !{i64 9138}
!34 = !{i64 12286}
!35 = !{i64 15434}
!36 = distinct !{!36, !23}
!37 = distinct !{!37, !23}
