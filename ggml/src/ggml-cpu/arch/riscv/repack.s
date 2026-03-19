	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"repack.cpp"
	.globl	ggml_gemv_q4_0_8x8_q8_0         # -- Begin function ggml_gemv_q4_0_8x8_q8_0
	.p2align	1
	.type	ggml_gemv_q4_0_8x8_q8_0,@function
ggml_gemv_q4_0_8x8_q8_0:                # @ggml_gemv_q4_0_8x8_q8_0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	sd	s4, 48(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	andi	a7, a0, 31
	bnez	a7, .LBB0_12
# %bb.1:
	andi	a7, a6, 7
	bnez	a7, .LBB0_13
# %bb.2:
	li	a7, 32
	csrr	t0, vlenb
	bltu	t0, a7, .LBB0_11
# %bb.3:
	srai	a7, a6, 3
	blez	a7, .LBB0_10
# %bb.4:
	vsetivli	zero, 8, e32, m1, ta, ma
	li	a2, 31
	vmv.v.i	v8, 0
	bge	a2, a0, .LBB0_9
# %bb.5:
	li	t1, 0
	slli	a2, a0, 1
	srli	a2, a2, 59
	add	a0, a0, a2
	sraiw	a0, a0, 5
	addi	t0, a3, 16
	li	a2, 9
	slli	a2, a2, 36
	slli	a0, a0, 32
	mulhu	a6, a0, a2
	li	a2, 17
	slli	a2, a2, 33
	mulhu	a0, a0, a2
	add	t6, a4, a0
	li	t2, 128
.Lpcrel_hi6:
	auipc	a2, %got_pcrel_hi(ggml_table_f32_f16)
	ld	s2, %pcrel_lo(.Lpcrel_hi6)(a2)
	li	t3, 64
	li	t4, 32
	addi	t5, sp, 8
.LBB0_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	mv	a2, t0
	mv	a5, a4
	vmv1r.v	v9, v8
.LBB0_7:                                #   Parent Loop BB0_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lhu	a0, 4(a5)
	lhu	s0, 2(a5)
	lhu	s1, 6(a5)
	lhu	a3, 8(a5)
	slli	a0, a0, 16
	or	a0, a0, s0
	slli	s1, s1, 32
	slli	a3, a3, 48
	or	a3, a3, s1
	or	s3, a3, a0
	lhu	a3, 12(a5)
	lhu	s0, 10(a5)
	lhu	s1, 14(a5)
	lhu	a0, 16(a5)
	slli	a3, a3, 16
	or	a3, a3, s0
	slli	s1, s1, 32
	slli	a0, a0, 48
	or	a0, a0, s1
	or	s4, a0, a3
	lhu	a3, 20(a5)
	lhu	s0, 18(a5)
	lhu	s1, 22(a5)
	lhu	a0, 24(a5)
	slli	a3, a3, 16
	or	a3, a3, s0
	slli	s1, s1, 32
	slli	a0, a0, 48
	or	a0, a0, s1
	or	s5, a0, a3
	lhu	a3, 28(a5)
	lhu	s0, 26(a5)
	lhu	s1, 30(a5)
	lhu	a0, 32(a5)
	slli	a3, a3, 16
	or	a3, a3, s0
	slli	s1, s1, 32
	slli	a0, a0, 48
	or	a0, a0, s1
	or	a0, a0, a3
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v10, s3
	vmv.v.x	v12, s4
	vmv.v.x	v14, s5
	vmv.v.x	v16, a0
	vsetvli	zero, t2, e8, m4, ta, ma
	vle8.v	v20, (a2)
	vsll.vi	v24, v20, 4
	vsra.vi	v24, v24, 4
	vsra.vi	v20, v20, 4
	vsetvli	zero, t3, e8, m2, ta, ma
	vwmul.vv	v28, v24, v10
	vwmacc.vv	v28, v26, v12
	vwmacc.vv	v28, v20, v14
	vwmacc.vv	v28, v22, v16
	vsetvli	zero, t4, e16, m2, ta, ma
	vnsrl.wi	v10, v28, 0
	vnsrl.wi	v12, v28, 16
	vadd.vv	v10, v10, v12
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v12, v10, 0
	vnsrl.wi	v13, v10, 16
	vadd.vv	v10, v12, v13
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v11, v10, 0
	vnsrl.wi	v12, v10, 16
	vwadd.vv	v10, v11, v12
	vsetvli	zero, zero, e32, m1, ta, ma
	lhu	a0, -16(a2)
	lhu	a3, -14(a2)
	slli	a0, a0, 2
	add	a0, a0, s2
	flw	fa5, 0(a0)
	slli	a3, a3, 2
	add	a3, a3, s2
	flw	fa4, 0(a3)
	lhu	a0, -12(a2)
	fsw	fa5, 8(sp)
	fsw	fa4, 12(sp)
	lhu	a3, -10(a2)
	slli	a0, a0, 2
	add	a0, a0, s2
	flw	fa5, 0(a0)
	slli	a3, a3, 2
	add	a3, a3, s2
	flw	fa4, 0(a3)
	lhu	a0, 0(a5)
	lhu	a3, -8(a2)
	fsw	fa5, 16(sp)
	fsw	fa4, 20(sp)
	lhu	s0, -6(a2)
	slli	a3, a3, 2
	add	a3, a3, s2
	flw	fa5, 0(a3)
	slli	s0, s0, 2
	add	s0, s0, s2
	flw	fa4, 0(s0)
	slli	a0, a0, 2
	lhu	a3, -4(a2)
	fsw	fa5, 24(sp)
	fsw	fa4, 28(sp)
	lhu	s0, -2(a2)
	slli	a3, a3, 2
	add	a3, a3, s2
	flw	fa5, 0(a3)
	slli	s0, s0, 2
	add	s0, s0, s2
	flw	fa4, 0(s0)
	add	a0, a0, s2
	fsw	fa5, 32(sp)
	flw	fa5, 0(a0)
	fsw	fa4, 36(sp)
	vle32.v	v11, (t5)
	vfcvt.f.x.v	v10, v10
	vfmul.vf	v10, v10, fa5
	vfmacc.vv	v9, v11, v10
	addi	a5, a5, 34
	addi	a2, a2, 144
	bne	a5, t6, .LBB0_7
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=1
	slli	a0, t1, 5
	add	a0, a0, a1
	vse32.v	v9, (a0)
	addi	t1, t1, 1
	add	t0, t0, a6
	bne	t1, a7, .LBB0_6
	j	.LBB0_10
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	vse32.v	v8, (a1)
	addi	a7, a7, -1
	addi	a1, a1, 32
	bnez	a7, .LBB0_9
.LBB0_10:
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.LBB0_11:
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 96
	tail	ggml_gemv_q4_0_8x8_q8_0_generic
.LBB0_12:
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
.Lpcrel_hi1:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi1)
.Lpcrel_hi2:
	auipc	a2, %pcrel_hi(.L__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi2)
	li	a2, 33
	call	__assert_fail
.LBB0_13:
.Lpcrel_hi3:
	auipc	a0, %pcrel_hi(.L.str.2)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi3)
.Lpcrel_hi4:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi4)
.Lpcrel_hi5:
	auipc	a2, %pcrel_hi(.L__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi5)
	li	a2, 34
	call	__assert_fail
.Lfunc_end0:
	.size	ggml_gemv_q4_0_8x8_q8_0, .Lfunc_end0-ggml_gemv_q4_0_8x8_q8_0
	.cfi_endproc
                                        # -- End function
	.globl	ggml_gemm_q4_0_8x8_q8_0         # -- Begin function ggml_gemm_q4_0_8x8_q8_0
	.p2align	1
	.type	ggml_gemm_q4_0_8x8_q8_0,@function
ggml_gemm_q4_0_8x8_q8_0:                # @ggml_gemm_q4_0_8x8_q8_0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -176
	.cfi_def_cfa_offset 176
	sd	ra, 168(sp)                     # 8-byte Folded Spill
	sd	s0, 160(sp)                     # 8-byte Folded Spill
	sd	s1, 152(sp)                     # 8-byte Folded Spill
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s3, 136(sp)                     # 8-byte Folded Spill
	sd	s4, 128(sp)                     # 8-byte Folded Spill
	sd	s5, 120(sp)                     # 8-byte Folded Spill
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	sd	s7, 104(sp)                     # 8-byte Folded Spill
	sd	s8, 96(sp)                      # 8-byte Folded Spill
	sd	s9, 88(sp)                      # 8-byte Folded Spill
	sd	s10, 80(sp)                     # 8-byte Folded Spill
	sd	s11, 72(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset s8, -80
	.cfi_offset s9, -88
	.cfi_offset s10, -96
	.cfi_offset s11, -104
	andi	s1, a0, 31
	sd	a4, 32(sp)                      # 8-byte Folded Spill
	bnez	s1, .LBB1_19
# %bb.1:
	andi	s1, a5, 3
	bnez	s1, .LBB1_20
# %bb.2:
	andi	s1, a6, 7
	bnez	s1, .LBB1_21
# %bb.3:
	li	s1, 32
	csrr	s0, vlenb
	bltu	s0, s1, .LBB1_13
# %bb.4:
	srai	t0, a5, 2
	blez	t0, .LBB1_18
# %bb.5:
	srai	t3, a6, 3
	blez	t3, .LBB1_18
# %bb.6:
	vsetivli	zero, 8, e32, m1, ta, ma
	li	a5, 31
	vmv.v.i	v8, 0
	bge	a5, a0, .LBB1_14
# %bb.7:
	li	a6, 0
	slli	a5, a0, 1
	srli	a5, a5, 59
	add	a0, a0, a5
	sraiw	a0, a0, 5
	ld	a4, 32(sp)                      # 8-byte Folded Reload
	addi	t5, a4, 64
	li	a5, 17
	slli	a5, a5, 35
	slli	a0, a0, 32
	mulhu	a4, a0, a5
	addi	a3, a3, 16
	sd	a3, 8(sp)                       # 8-byte Folded Spill
	li	a3, 9
	slli	a3, a3, 36
	mulhu	a7, a0, a3
	addi	a0, a4, 64
	sd	a0, 0(sp)                       # 8-byte Folded Spill
	li	t6, 128
.Lpcrel_hi16:
	auipc	a0, %got_pcrel_hi(ggml_table_f32_f16)
	ld	ra, %pcrel_lo(.Lpcrel_hi16)(a0)
	addi	s8, sp, 40
	li	s10, 64
	li	s11, 32
	sd	t0, 24(sp)                      # 8-byte Folded Spill
	sd	a4, 16(sp)                      # 8-byte Folded Spill
.LBB1_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_9 Depth 2
                                        #       Child Loop BB1_10 Depth 3
	li	s2, 0
	mul	a0, a4, a6
	ld	a3, 0(sp)                       # 8-byte Folded Reload
	add	a0, a0, a3
	ld	s9, 32(sp)                      # 8-byte Folded Reload
	add	s9, s9, a0
	slli	a0, a6, 2
	mul	s1, a0, a2
	slli	s1, s1, 2
	add	s3, a1, s1
	addi	s1, a0, 1
	mul	s1, s1, a2
	slli	s1, s1, 2
	add	s4, a1, s1
	addi	s1, a0, 2
	mul	s1, s1, a2
	slli	s1, s1, 2
	add	s5, a1, s1
	addi	a0, a0, 3
	mul	a0, a0, a2
	slli	a0, a0, 2
	add	s6, a1, a0
	ld	t4, 8(sp)                       # 8-byte Folded Reload
.LBB1_9:                                #   Parent Loop BB1_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_10 Depth 3
	mv	s7, t4
	mv	s1, t5
	vmv1r.v	v12, v8
	vmv1r.v	v11, v8
	vmv1r.v	v10, v8
	vmv1r.v	v9, v8
.LBB1_10:                               #   Parent Loop BB1_8 Depth=1
                                        #     Parent Loop BB1_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vsetvli	zero, t6, e8, m4, ta, ma
	vle8.v	v16, (s7)
	vsll.vi	v20, v16, 4
	lhu	a5, -64(s1)
	vsra.vi	v20, v20, 4
	vsra.vi	v16, v16, 4
	lhu	s0, -62(s1)
	slli	a5, a5, 2
	add	a5, a5, ra
	flw	fa2, 0(a5)
	slli	s0, s0, 2
	lhu	a5, -60(s1)
	add	s0, s0, ra
	flw	fa3, 0(s0)
	lhu	s0, -16(s7)
	slli	a5, a5, 2
	add	a5, a5, ra
	lhu	a3, -14(s7)
	slli	s0, s0, 2
	add	s0, s0, ra
	flw	fa4, 0(s0)
	slli	a3, a3, 2
	add	a3, a3, ra
	flw	fa1, 0(a3)
	flw	fa5, 0(a5)
	lhu	a3, -12(s7)
	fsw	fa4, 40(sp)
	fsw	fa1, 44(sp)
	lhu	a5, -10(s7)
	slli	a3, a3, 2
	add	a3, a3, ra
	flw	fa4, 0(a3)
	slli	a5, a5, 2
	add	a5, a5, ra
	flw	fa1, 0(a5)
	lhu	a3, -58(s1)
	lhu	a5, -8(s7)
	fsw	fa4, 48(sp)
	fsw	fa1, 52(sp)
	lhu	s0, -6(s7)
	slli	a5, a5, 2
	add	a5, a5, ra
	flw	fa4, 0(a5)
	slli	s0, s0, 2
	add	s0, s0, ra
	flw	fa1, 0(s0)
	slli	a3, a3, 2
	lhu	a5, -4(s7)
	fsw	fa4, 56(sp)
	fsw	fa1, 60(sp)
	lhu	s0, -2(s7)
	slli	a5, a5, 2
	add	a5, a5, ra
	flw	fa4, 0(a5)
	slli	s0, s0, 2
	add	s0, s0, ra
	flw	fa1, 0(s0)
	add	a3, a3, ra
	fsw	fa4, 64(sp)
	flw	fa4, 0(a3)
	fsw	fa1, 68(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	lhu	a3, -54(s1)
	lhu	a5, -56(s1)
	lhu	s0, -52(s1)
	lhu	t2, -50(s1)
	slli	a3, a3, 16
	or	a3, a3, a5
	slli	s0, s0, 32
	slli	t2, t2, 48
	or	a5, t2, s0
	or	t2, a5, a3
	lhu	a5, -22(s1)
	lhu	s0, -24(s1)
	lhu	a3, -20(s1)
	lhu	t1, -18(s1)
	slli	a5, a5, 16
	or	a5, a5, s0
	slli	a3, a3, 32
	slli	t1, t1, 48
	or	a3, t1, a3
	or	t1, a3, a5
	lhu	a5, 10(s1)
	lhu	s0, 8(s1)
	lhu	a0, 12(s1)
	lhu	a3, 14(s1)
	slli	a5, a5, 16
	or	a5, a5, s0
	slli	a0, a0, 32
	slli	a3, a3, 48
	lhu	s0, 42(s1)
	or	a0, a0, a3
	or	a0, a0, a5
	lhu	a3, 40(s1)
	slli	s0, s0, 16
	lhu	a5, 44(s1)
	lhu	t0, 46(s1)
	or	a3, a3, s0
	vle32.v	v13, (s8)
	slli	a5, a5, 32
	slli	t0, t0, 48
	or	a5, t0, a5
	or	a3, a3, a5
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v14, t2
	vmv.v.x	v24, t1
	vmv.v.x	v26, a0
	vmv.v.x	v28, a3
	vsetvli	zero, s10, e8, m2, ta, ma
	vwmul.vv	v0, v20, v14
	vwmacc.vv	v0, v22, v24
	vwmacc.vv	v0, v16, v26
	vwmacc.vv	v0, v18, v28
	vsetvli	zero, s11, e16, m2, ta, ma
	vnsrl.wi	v14, v0, 0
	vnsrl.wi	v24, v0, 16
	vadd.vv	v14, v14, v24
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v24, v14, 0
	vnsrl.wi	v25, v14, 16
	vadd.vv	v14, v24, v25
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v15, v14, 0
	vnsrl.wi	v14, v14, 16
	vwadd.vv	v24, v15, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	lhu	a0, -46(s1)
	lhu	a3, -48(s1)
	lhu	a5, -44(s1)
	lhu	s0, -42(s1)
	slli	a0, a0, 16
	or	a0, a0, a3
	slli	a5, a5, 32
	slli	s0, s0, 48
	or	a5, a5, s0
	or	t0, a5, a0
	lhu	a3, -14(s1)
	lhu	a5, -16(s1)
	lhu	s0, -12(s1)
	lhu	a4, -10(s1)
	slli	a3, a3, 16
	or	a3, a3, a5
	slli	s0, s0, 32
	slli	a4, a4, 48
	or	a4, a4, s0
	or	a3, a3, a4
	lhu	a4, 18(s1)
	lhu	a5, 16(s1)
	lhu	s0, 20(s1)
	lhu	a0, 22(s1)
	slli	a4, a4, 16
	or	a4, a4, a5
	slli	s0, s0, 32
	slli	a0, a0, 48
	or	a0, a0, s0
	lhu	a5, 50(s1)
	lhu	s0, 48(s1)
	vfcvt.f.x.v	v14, v24
	or	a0, a0, a4
	slli	a5, a5, 16
	or	a5, a5, s0
	lhu	a4, 52(s1)
	lhu	s0, 54(s1)
	vfmul.vf	v14, v14, fa2
	vfmacc.vv	v12, v13, v14
	slli	a4, a4, 32
	slli	s0, s0, 48
	or	a4, a4, s0
	or	a4, a4, a5
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v14, t0
	vmv.v.x	v24, a3
	vmv.v.x	v26, a0
	vmv.v.x	v28, a4
	vsetvli	zero, s10, e8, m2, ta, ma
	vwmul.vv	v0, v20, v14
	vwmacc.vv	v0, v22, v24
	vwmacc.vv	v0, v16, v26
	vwmacc.vv	v0, v18, v28
	vsetvli	zero, s11, e16, m2, ta, ma
	vnsrl.wi	v14, v0, 0
	vnsrl.wi	v24, v0, 16
	vadd.vv	v14, v14, v24
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v24, v14, 0
	vnsrl.wi	v25, v14, 16
	vadd.vv	v14, v24, v25
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v15, v14, 0
	vnsrl.wi	v14, v14, 16
	vwadd.vv	v24, v15, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	lhu	a0, -38(s1)
	lhu	a3, -40(s1)
	lhu	a4, -36(s1)
	lhu	a5, -34(s1)
	slli	a0, a0, 16
	or	a0, a0, a3
	slli	a4, a4, 32
	slli	a5, a5, 48
	or	a4, a4, a5
	or	t0, a4, a0
	lhu	a3, -6(s1)
	lhu	a4, -8(s1)
	lhu	a5, -4(s1)
	lhu	s0, -2(s1)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	a5, a5, 32
	slli	s0, s0, 48
	or	a5, a5, s0
	or	a3, a3, a5
	lhu	a4, 26(s1)
	lhu	a5, 24(s1)
	lhu	s0, 28(s1)
	lhu	a0, 30(s1)
	slli	a4, a4, 16
	or	a4, a4, a5
	slli	s0, s0, 32
	slli	a0, a0, 48
	or	a0, a0, s0
	lhu	a5, 58(s1)
	lhu	s0, 56(s1)
	vfcvt.f.x.v	v14, v24
	or	a0, a0, a4
	slli	a5, a5, 16
	or	a5, a5, s0
	lhu	a4, 60(s1)
	lhu	s0, 62(s1)
	vfmul.vf	v14, v14, fa3
	vfmacc.vv	v11, v13, v14
	slli	a4, a4, 32
	slli	s0, s0, 48
	or	a4, a4, s0
	or	a4, a4, a5
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v14, t0
	vmv.v.x	v24, a3
	vmv.v.x	v26, a0
	vmv.v.x	v28, a4
	vsetvli	zero, s10, e8, m2, ta, ma
	vwmul.vv	v0, v20, v14
	vwmacc.vv	v0, v22, v24
	vwmacc.vv	v0, v16, v26
	vwmacc.vv	v0, v18, v28
	vsetvli	zero, s11, e16, m2, ta, ma
	vnsrl.wi	v14, v0, 0
	vnsrl.wi	v24, v0, 16
	vadd.vv	v14, v14, v24
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v24, v14, 0
	vnsrl.wi	v25, v14, 16
	vadd.vv	v14, v24, v25
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v15, v14, 0
	vnsrl.wi	v14, v14, 16
	vwadd.vv	v24, v15, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	lhu	a0, -30(s1)
	lhu	a3, -32(s1)
	lhu	a4, -28(s1)
	lhu	a5, -26(s1)
	slli	a0, a0, 16
	or	a0, a0, a3
	slli	a4, a4, 32
	slli	a5, a5, 48
	or	a4, a4, a5
	or	t0, a4, a0
	lhu	a3, 2(s1)
	lhu	a4, 0(s1)
	lhu	a5, 4(s1)
	lhu	s0, 6(s1)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	a5, a5, 32
	slli	s0, s0, 48
	or	a5, a5, s0
	or	a3, a3, a5
	lhu	a4, 34(s1)
	lhu	a5, 32(s1)
	lhu	s0, 36(s1)
	lhu	a0, 38(s1)
	slli	a4, a4, 16
	or	a4, a4, a5
	slli	s0, s0, 32
	slli	a0, a0, 48
	or	a0, a0, s0
	lhu	a5, 66(s1)
	lhu	s0, 64(s1)
	vfcvt.f.x.v	v14, v24
	or	a0, a0, a4
	slli	a5, a5, 16
	or	a5, a5, s0
	lhu	a4, 68(s1)
	lhu	s0, 70(s1)
	vfmul.vf	v14, v14, fa5
	vfmacc.vv	v10, v13, v14
	slli	a4, a4, 32
	slli	s0, s0, 48
	or	a4, a4, s0
	or	a4, a4, a5
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v14, t0
	vmv.v.x	v24, a3
	vmv.v.x	v26, a0
	vmv.v.x	v28, a4
	vsetvli	zero, s10, e8, m2, ta, ma
	vwmul.vv	v0, v20, v14
	vwmacc.vv	v0, v22, v24
	vwmacc.vv	v0, v16, v26
	vwmacc.vv	v0, v18, v28
	vsetvli	zero, s11, e16, m2, ta, ma
	vnsrl.wi	v14, v0, 0
	vnsrl.wi	v16, v0, 16
	vadd.vv	v14, v14, v16
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v16, v14, 0
	vnsrl.wi	v17, v14, 16
	vadd.vv	v14, v16, v17
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v15, v14, 0
	vnsrl.wi	v14, v14, 16
	vwadd.vv	v16, v15, v14
	vsetvli	zero, zero, e32, m1, ta, ma
	vfcvt.f.x.v	v14, v16
	vfmul.vf	v14, v14, fa4
	vfmacc.vv	v9, v13, v14
	addi	s1, s1, 136
	addi	s7, s7, 144
	bne	s1, s9, .LBB1_10
# %bb.11:                               #   in Loop: Header=BB1_9 Depth=2
	slli	a0, s2, 5
	add	a3, s3, a0
	vse32.v	v12, (a3)
	add	a3, s4, a0
	vse32.v	v11, (a3)
	add	a3, s5, a0
	vse32.v	v10, (a3)
	add	a0, a0, s6
	vse32.v	v9, (a0)
	addi	s2, s2, 1
	add	t4, t4, a7
	bne	s2, t3, .LBB1_9
# %bb.12:                               #   in Loop: Header=BB1_8 Depth=1
	addi	a6, a6, 1
	ld	a4, 16(sp)                      # 8-byte Folded Reload
	add	t5, t5, a4
	ld	t0, 24(sp)                      # 8-byte Folded Reload
	bne	a6, t0, .LBB1_8
	j	.LBB1_18
.LBB1_13:
	ld	a4, 32(sp)                      # 8-byte Folded Reload
	ld	ra, 168(sp)                     # 8-byte Folded Reload
	ld	s0, 160(sp)                     # 8-byte Folded Reload
	ld	s1, 152(sp)                     # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	ld	s3, 136(sp)                     # 8-byte Folded Reload
	ld	s4, 128(sp)                     # 8-byte Folded Reload
	ld	s5, 120(sp)                     # 8-byte Folded Reload
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	ld	s7, 104(sp)                     # 8-byte Folded Reload
	ld	s8, 96(sp)                      # 8-byte Folded Reload
	ld	s9, 88(sp)                      # 8-byte Folded Reload
	ld	s10, 80(sp)                     # 8-byte Folded Reload
	ld	s11, 72(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 176
	tail	ggml_gemm_q4_0_8x8_q8_0_generic
.LBB1_14:
	li	a0, 0
	slli	t3, t3, 32
	srli	a6, t3, 32
	slli	a7, a2, 4
	slli	a4, a2, 2
	li	a3, 12
	mul	s1, a2, a3
	slli	a2, a2, 3
.LBB1_15:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_16 Depth 2
	mv	a3, a6
	mv	s0, a1
.LBB1_16:                               #   Parent Loop BB1_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vse32.v	v8, (s0)
	add	a5, s0, a4
	vse32.v	v8, (a5)
	add	a5, s0, a2
	vse32.v	v8, (a5)
	add	a5, s0, s1
	vse32.v	v8, (a5)
	addi	a3, a3, -1
	addi	s0, s0, 32
	bnez	a3, .LBB1_16
# %bb.17:                               #   in Loop: Header=BB1_15 Depth=1
	addi	a0, a0, 1
	add	a1, a1, a7
	bne	a0, t0, .LBB1_15
.LBB1_18:
	ld	ra, 168(sp)                     # 8-byte Folded Reload
	ld	s0, 160(sp)                     # 8-byte Folded Reload
	ld	s1, 152(sp)                     # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	ld	s3, 136(sp)                     # 8-byte Folded Reload
	ld	s4, 128(sp)                     # 8-byte Folded Reload
	ld	s5, 120(sp)                     # 8-byte Folded Reload
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	ld	s7, 104(sp)                     # 8-byte Folded Reload
	ld	s8, 96(sp)                      # 8-byte Folded Reload
	ld	s9, 88(sp)                      # 8-byte Folded Reload
	ld	s10, 80(sp)                     # 8-byte Folded Reload
	ld	s11, 72(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 176
	ret
.LBB1_19:
.Lpcrel_hi7:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi7)
.Lpcrel_hi8:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi8)
.Lpcrel_hi9:
	auipc	a2, %pcrel_hi(.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi9)
	li	a2, 124
	call	__assert_fail
.LBB1_20:
.Lpcrel_hi10:
	auipc	a0, %pcrel_hi(.L.str.3)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi10)
.Lpcrel_hi11:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi11)
.Lpcrel_hi12:
	auipc	a2, %pcrel_hi(.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi12)
	li	a2, 125
	call	__assert_fail
.LBB1_21:
.Lpcrel_hi13:
	auipc	a0, %pcrel_hi(.L.str.2)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi13)
.Lpcrel_hi14:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi14)
.Lpcrel_hi15:
	auipc	a2, %pcrel_hi(.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi15)
	li	a2, 126
	call	__assert_fail
.Lfunc_end1:
	.size	ggml_gemm_q4_0_8x8_q8_0, .Lfunc_end1-ggml_gemm_q4_0_8x8_q8_0
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"n % qk == 0"
	.size	.L.str, 12

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"repack.cpp"
	.size	.L.str.1, 11

	.type	.L__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0,@object # @__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0
.L__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0:
	.asciz	"void ggml_gemv_q4_0_8x8_q8_0(int, float *__restrict, size_t, const void *__restrict, const void *__restrict, int, int)"
	.size	.L__PRETTY_FUNCTION__.ggml_gemv_q4_0_8x8_q8_0, 119

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"nc % ncols_interleaved == 0"
	.size	.L.str.2, 28

	.type	.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0,@object # @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0
.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0:
	.asciz	"void ggml_gemm_q4_0_8x8_q8_0(int, float *__restrict, size_t, const void *__restrict, const void *__restrict, int, int)"
	.size	.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0, 119

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"nr % 4 == 0"
	.size	.L.str.3, 12

	.ident	"Ubuntu clang version 18.1.8 (++20240731025043+3b5b5c1ec4a3-1~exp1~20240731145144.92)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
