	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"repack_4x16.cpp"
	.globl	ggml_gemm_q4_0_8x8_q8_0_4x16    # -- Begin function ggml_gemm_q4_0_8x8_q8_0_4x16
	.p2align	1
	.type	ggml_gemm_q4_0_8x8_q8_0_4x16,@function
ggml_gemm_q4_0_8x8_q8_0_4x16:           # @ggml_gemm_q4_0_8x8_q8_0_4x16
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -208
	.cfi_def_cfa_offset 208
	sd	ra, 200(sp)                     # 8-byte Folded Spill
	sd	s0, 192(sp)                     # 8-byte Folded Spill
	sd	s1, 184(sp)                     # 8-byte Folded Spill
	sd	s2, 176(sp)                     # 8-byte Folded Spill
	sd	s3, 168(sp)                     # 8-byte Folded Spill
	sd	s4, 160(sp)                     # 8-byte Folded Spill
	sd	s5, 152(sp)                     # 8-byte Folded Spill
	sd	s6, 144(sp)                     # 8-byte Folded Spill
	sd	s7, 136(sp)                     # 8-byte Folded Spill
	sd	s8, 128(sp)                     # 8-byte Folded Spill
	sd	s9, 120(sp)                     # 8-byte Folded Spill
	sd	s10, 112(sp)                    # 8-byte Folded Spill
	sd	s11, 104(sp)                    # 8-byte Folded Spill
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
	sd	a4, 56(sp)                      # 8-byte Folded Spill
	sd	a3, 32(sp)                      # 8-byte Folded Spill
	beqz	s1, .LBB0_1
	j	.LBB0_33
.LBB0_1:
	andi	a3, a5, 3
	beqz	a3, .LBB0_2
	j	.LBB0_34
.LBB0_2:
	andi	a3, a6, 7
	beqz	a3, .LBB0_3
	j	.LBB0_35
.LBB0_3:
	li	a3, 32
	csrr	s1, vlenb
	bltu	s1, a3, .LBB0_14
# %bb.4:
	slli	a3, a0, 1
	srli	a3, a3, 59
	add	a3, a3, a0
	sraiw	a3, a3, 5
	andi	s1, a6, 8
	srai	t0, a5, 2
	sd	t0, 48(sp)                      # 8-byte Folded Spill
	bnez	s1, .LBB0_15
# %bb.5:
	bgtz	t0, .LBB0_6
	j	.LBB0_32
.LBB0_6:
	srai	t4, a6, 3
	bgtz	t4, .LBB0_7
	j	.LBB0_32
.LBB0_7:
	vsetivli	zero, 8, e32, m1, ta, ma
	li	a4, 31
	vmv.v.i	v8, 0
	blt	a4, a0, .LBB0_8
	j	.LBB0_24
.LBB0_8:
	li	s1, 0
	ld	a0, 56(sp)                      # 8-byte Folded Reload
	addi	t1, a0, 64
	li	a0, 17
	slli	a0, a0, 35
	slli	a4, a3, 32
	mulhu	a3, a4, a0
	li	a0, 9
	slli	a5, a0, 36
	mulhu	t5, a4, a5
	slli	a0, a0, 37
	mulhu	a0, a4, a0
	sd	a0, 64(sp)                      # 8-byte Folded Spill
	addi	a0, a3, 64
	sd	a0, 0(sp)                       # 8-byte Folded Spill
.Lpcrel_hi10:
	auipc	a0, %got_pcrel_hi(ggml_table_f32_f16)
	ld	a5, %pcrel_lo(.Lpcrel_hi10)(a0)
	li	t6, 128
	addi	s10, sp, 72
	li	s11, 64
	li	ra, 32
	sd	a1, 24(sp)                      # 8-byte Folded Spill
	sd	a2, 16(sp)                      # 8-byte Folded Spill
	sd	a3, 8(sp)                       # 8-byte Folded Spill
.LBB0_9:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_10 Depth 2
                                        #       Child Loop BB0_11 Depth 3
	li	s2, 0
	mul	a0, a3, s1
	ld	a3, 0(sp)                       # 8-byte Folded Reload
	add	a0, a0, a3
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	add	s3, s3, a0
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	slli	a0, s1, 2
	mul	a4, a0, a2
	slli	a4, a4, 2
	add	s4, a1, a4
	addi	a4, a0, 1
	mul	a4, a4, a2
	slli	a4, a4, 2
	add	s5, a1, a4
	addi	a4, a0, 2
	mul	a4, a4, a2
	slli	a4, a4, 2
	add	s6, a1, a4
	addi	a0, a0, 3
	mul	a0, a0, a2
	slli	a0, a0, 2
	add	s7, a1, a0
	ld	t2, 32(sp)                      # 8-byte Folded Reload
.LBB0_10:                               #   Parent Loop BB0_9 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
	ori	s9, s2, 1
	mv	s8, t2
	mv	s0, t1
	vmv1r.v	v15, v8
	vmv1r.v	v13, v8
	vmv1r.v	v11, v8
	vmv1r.v	v9, v8
	vmv1r.v	v16, v8
	vmv1r.v	v14, v8
	vmv1r.v	v12, v8
	vmv1r.v	v10, v8
.LBB0_11:                               #   Parent Loop BB0_9 Depth=1
                                        #     Parent Loop BB0_10 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lhu	a0, -64(s0)
	lhu	a4, -62(s0)
	slli	a0, a0, 2
	add	a0, a0, a5
	flw	fa2, 0(a0)
	slli	a4, a4, 2
	lhu	a0, -60(s0)
	add	a4, a4, a5
	flw	fa3, 0(a4)
	lhu	a4, -58(s0)
	slli	a0, a0, 2
	add	a0, a0, a5
	flw	fa4, 0(a0)
	slli	a4, a4, 2
	add	a4, a4, a5
	flw	fa5, 0(a4)
	lhu	a0, -54(s0)
	lhu	a4, -56(s0)
	lhu	a3, -52(s0)
	lhu	s1, -50(s0)
	slli	a0, a0, 16
	or	a0, a0, a4
	slli	a3, a3, 32
	slli	s1, s1, 48
	or	a3, a3, s1
	or	t0, a3, a0
	lhu	a3, -22(s0)
	lhu	a4, -24(s0)
	lhu	s1, -20(s0)
	lhu	a0, -18(s0)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	s1, s1, 32
	slli	a0, a0, 48
	or	a0, a0, s1
	or	t3, a0, a3
	lhu	a3, 10(s0)
	lhu	a4, 8(s0)
	lhu	s1, 12(s0)
	lhu	a0, 14(s0)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	s1, s1, 32
	slli	a0, a0, 48
	or	a0, a0, s1
	or	a0, a0, a3
	lhu	a3, 42(s0)
	lhu	a4, 40(s0)
	lhu	s1, 44(s0)
	lhu	a6, 46(s0)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	s1, s1, 32
	slli	a6, a6, 48
	or	a4, a6, s1
	or	a3, a3, a4
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v24, t0
	vmv.v.x	v22, t3
	vmv.v.x	v20, a0
	vmv.v.x	v18, a3
	addi	t3, s8, 16
	vsetvli	zero, t6, e8, m4, ta, ma
	vle8.v	v28, (t3)
	lhu	a0, 0(s8)
	vsll.vi	v0, v28, 4
	lhu	a3, 2(s8)
	slli	a0, a0, 2
	add	a0, a0, a5
	flw	fa1, 0(a0)
	slli	a3, a3, 2
	add	a3, a3, a5
	flw	fa0, 0(a3)
	lhu	a0, 4(s8)
	vsra.vi	v0, v0, 4
	fsw	fa1, 72(sp)
	fsw	fa0, 76(sp)
	slli	a0, a0, 2
	lhu	a3, 6(s8)
	add	a0, a0, a5
	flw	fa1, 0(a0)
	lhu	a0, 8(s8)
	slli	a3, a3, 2
	add	a3, a3, a5
	flw	fa0, 0(a3)
	slli	a0, a0, 2
	add	a0, a0, a5
	flw	ft0, 0(a0)
	lhu	a0, 10(s8)
	fsw	fa1, 80(sp)
	fsw	fa0, 84(sp)
	fsw	ft0, 88(sp)
	slli	a0, a0, 2
	lhu	a3, 12(s8)
	add	a0, a0, a5
	flw	fa1, 0(a0)
	lhu	a0, 14(s8)
	slli	a3, a3, 2
	add	a3, a3, a5
	flw	fa0, 0(a3)
	slli	a0, a0, 2
	add	a0, a0, a5
	flw	ft0, 0(a0)
	vsra.vi	v28, v28, 4
	fsw	fa1, 92(sp)
	fsw	fa0, 96(sp)
	fsw	ft0, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v17, (s10)
	vsetvli	zero, s11, e8, m2, ta, ma
	vwmul.vv	v4, v0, v24
	vwmacc.vv	v4, v2, v22
	vwmacc.vv	v4, v28, v20
	vwmacc.vv	v4, v30, v18
	vsetvli	zero, ra, e16, m2, ta, ma
	vnsrl.wi	v26, v4, 0
	vnsrl.wi	v28, v4, 16
	vadd.vv	v26, v26, v28
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v28, v26, 0
	vnsrl.wi	v29, v26, 16
	vadd.vv	v26, v28, v29
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v27, v26, 0
	vnsrl.wi	v26, v26, 16
	vwadd.vv	v28, v27, v26
	vsetvli	zero, zero, e32, m1, ta, ma
	vfcvt.f.x.v	v26, v28
	vfmul.vf	v26, v26, fa2
	vfmacc.vv	v15, v17, v26
	add	a0, s8, t5
	vsetvli	zero, t6, e8, m4, ta, ma
	lhu	a3, 0(a0)
	slli	a3, a3, 2
	lhu	a4, 2(a0)
	add	a3, a3, a5
	flw	fa1, 0(a3)
	lhu	a3, 4(a0)
	slli	a4, a4, 2
	add	a4, a4, a5
	flw	fa0, 0(a4)
	slli	a3, a3, 2
	add	a3, a3, a5
	flw	ft0, 0(a3)
	lhu	a3, 6(a0)
	fsw	fa1, 72(sp)
	fsw	fa0, 76(sp)
	fsw	ft0, 80(sp)
	slli	a3, a3, 2
	lhu	a4, 8(a0)
	add	a3, a3, a5
	flw	fa1, 0(a3)
	lhu	a3, 10(a0)
	slli	a4, a4, 2
	add	a4, a4, a5
	flw	fa0, 0(a4)
	slli	a3, a3, 2
	add	a3, a3, a5
	flw	ft0, 0(a3)
	lhu	a3, 12(a0)
	fsw	fa1, 84(sp)
	fsw	fa0, 88(sp)
	fsw	ft0, 92(sp)
	slli	a3, a3, 2
	add	a3, a3, a5
	flw	fa1, 0(a3)
	lhu	a3, 14(a0)
	addi	t0, a0, 16
	vle8.v	v28, (t0)
	fsw	fa1, 96(sp)
	slli	a3, a3, 2
	add	a3, a3, a5
	flw	fa1, 0(a3)
	vsll.vi	v0, v28, 4
	vsra.vi	v0, v0, 4
	vsra.vi	v28, v28, 4
	fsw	fa1, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v17, (s10)
	vsetvli	zero, s11, e8, m2, ta, ma
	vwmul.vv	v4, v0, v24
	vwmacc.vv	v4, v2, v22
	vwmacc.vv	v4, v28, v20
	vwmacc.vv	v4, v30, v18
	vsetvli	zero, ra, e16, m2, ta, ma
	vnsrl.wi	v18, v4, 0
	vnsrl.wi	v20, v4, 16
	vadd.vv	v18, v18, v20
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v20, v18, 0
	vnsrl.wi	v21, v18, 16
	vadd.vv	v18, v20, v21
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v19, v18, 0
	vnsrl.wi	v18, v18, 16
	vwadd.vv	v20, v19, v18
	vsetvli	zero, zero, e32, m1, ta, ma
	lhu	a3, -46(s0)
	lhu	a4, -48(s0)
	lhu	s1, -44(s0)
	lhu	a2, -42(s0)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	s1, s1, 32
	slli	a2, a2, 48
	or	a2, a2, s1
	or	a6, a2, a3
	lhu	a3, -14(s0)
	lhu	a4, -16(s0)
	lhu	s1, -12(s0)
	lhu	a2, -10(s0)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	s1, s1, 32
	slli	a2, a2, 48
	or	a2, a2, s1
	or	a2, a2, a3
	lhu	a3, 18(s0)
	lhu	a4, 16(s0)
	lhu	s1, 20(s0)
	lhu	a7, 22(s0)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	s1, s1, 32
	slli	a7, a7, 48
	or	a4, a7, s1
	lhu	s1, 50(s0)
	lhu	a1, 48(s0)
	vfcvt.f.x.v	v18, v20
	or	a3, a3, a4
	slli	s1, s1, 16
	or	a1, a1, s1
	lhu	a4, 52(s0)
	lhu	s1, 54(s0)
	vfmul.vf	v18, v18, fa2
	vfmacc.vv	v16, v17, v18
	slli	a4, a4, 32
	slli	s1, s1, 48
	or	a4, a4, s1
	or	a1, a1, a4
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v24, a6
	vmv.v.x	v22, a2
	vmv.v.x	v20, a3
	vmv.v.x	v18, a1
	vsetvli	zero, t6, e8, m4, ta, ma
	lhu	a1, 0(s8)
	lhu	a2, 2(s8)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	lhu	a1, 4(s8)
	fsw	fa2, 72(sp)
	fsw	fa1, 76(sp)
	lhu	a2, 6(s8)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	vle8.v	v28, (t3)
	lhu	a1, 8(s8)
	fsw	fa2, 80(sp)
	fsw	fa1, 84(sp)
	lhu	a2, 10(s8)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	vsll.vi	v0, v28, 4
	lhu	a1, 12(s8)
	fsw	fa2, 88(sp)
	fsw	fa1, 92(sp)
	lhu	a2, 14(s8)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	vsra.vi	v0, v0, 4
	vsra.vi	v28, v28, 4
	fsw	fa2, 96(sp)
	fsw	fa1, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v17, (s10)
	vsetvli	zero, s11, e8, m2, ta, ma
	vwmul.vv	v4, v0, v24
	vwmacc.vv	v4, v2, v22
	vwmacc.vv	v4, v28, v20
	vwmacc.vv	v4, v30, v18
	vsetvli	zero, ra, e16, m2, ta, ma
	vnsrl.wi	v26, v4, 0
	vnsrl.wi	v28, v4, 16
	vadd.vv	v26, v26, v28
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v28, v26, 0
	vnsrl.wi	v29, v26, 16
	vadd.vv	v26, v28, v29
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v27, v26, 0
	vnsrl.wi	v26, v26, 16
	vwadd.vv	v28, v27, v26
	vsetvli	zero, zero, e32, m1, ta, ma
	vfcvt.f.x.v	v26, v28
	vfmul.vf	v26, v26, fa3
	vfmacc.vv	v13, v17, v26
	vsetvli	zero, t6, e8, m4, ta, ma
	lhu	a1, 0(a0)
	lhu	a2, 2(a0)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	lhu	a1, 4(a0)
	fsw	fa2, 72(sp)
	fsw	fa1, 76(sp)
	lhu	a2, 6(a0)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	vle8.v	v28, (t0)
	lhu	a1, 8(a0)
	fsw	fa2, 80(sp)
	fsw	fa1, 84(sp)
	lhu	a2, 10(a0)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	vsll.vi	v0, v28, 4
	lhu	a1, 12(a0)
	fsw	fa2, 88(sp)
	fsw	fa1, 92(sp)
	lhu	a2, 14(a0)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	vsra.vi	v0, v0, 4
	vsra.vi	v28, v28, 4
	fsw	fa2, 96(sp)
	fsw	fa1, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v17, (s10)
	vsetvli	zero, s11, e8, m2, ta, ma
	vwmul.vv	v4, v0, v24
	vwmacc.vv	v4, v2, v22
	vwmacc.vv	v4, v28, v20
	vwmacc.vv	v4, v30, v18
	vsetvli	zero, ra, e16, m2, ta, ma
	vnsrl.wi	v18, v4, 0
	vnsrl.wi	v20, v4, 16
	vadd.vv	v18, v18, v20
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v20, v18, 0
	vnsrl.wi	v21, v18, 16
	vadd.vv	v18, v20, v21
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v19, v18, 0
	vnsrl.wi	v18, v18, 16
	vwadd.vv	v20, v19, v18
	vsetvli	zero, zero, e32, m1, ta, ma
	lhu	a1, -38(s0)
	lhu	a2, -40(s0)
	lhu	a3, -36(s0)
	lhu	a4, -34(s0)
	slli	a1, a1, 16
	or	a1, a1, a2
	slli	a3, a3, 32
	slli	a4, a4, 48
	or	a3, a3, a4
	or	a6, a3, a1
	lhu	a2, -6(s0)
	lhu	a3, -8(s0)
	lhu	a4, -4(s0)
	lhu	s1, -2(s0)
	slli	a2, a2, 16
	or	a2, a2, a3
	slli	a4, a4, 32
	slli	s1, s1, 48
	or	a4, a4, s1
	or	a2, a2, a4
	lhu	a3, 26(s0)
	lhu	a4, 24(s0)
	lhu	s1, 28(s0)
	lhu	a1, 30(s0)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	s1, s1, 32
	slli	a1, a1, 48
	or	a1, a1, s1
	lhu	a4, 58(s0)
	lhu	s1, 56(s0)
	vfcvt.f.x.v	v18, v20
	or	a1, a1, a3
	slli	a4, a4, 16
	or	a4, a4, s1
	lhu	a3, 60(s0)
	lhu	s1, 62(s0)
	vfmul.vf	v18, v18, fa3
	vfmacc.vv	v14, v17, v18
	slli	a3, a3, 32
	slli	s1, s1, 48
	or	a3, a3, s1
	or	a3, a3, a4
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v24, a6
	vmv.v.x	v22, a2
	vmv.v.x	v20, a1
	vmv.v.x	v18, a3
	vsetvli	zero, t6, e8, m4, ta, ma
	vle8.v	v28, (t3)
	lhu	a1, 0(s8)
	vsll.vi	v0, v28, 4
	lhu	a2, 2(s8)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa3, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa2, 0(a2)
	lhu	a1, 4(s8)
	vsra.vi	v0, v0, 4
	fsw	fa3, 72(sp)
	fsw	fa2, 76(sp)
	slli	a1, a1, 2
	lhu	a2, 6(s8)
	add	a1, a1, a5
	flw	fa3, 0(a1)
	lhu	a1, 8(s8)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa2, 0(a2)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa1, 0(a1)
	lhu	a1, 10(s8)
	fsw	fa3, 80(sp)
	fsw	fa2, 84(sp)
	fsw	fa1, 88(sp)
	slli	a1, a1, 2
	lhu	a2, 12(s8)
	add	a1, a1, a5
	flw	fa3, 0(a1)
	lhu	a1, 14(s8)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa2, 0(a2)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa1, 0(a1)
	vsra.vi	v28, v28, 4
	fsw	fa3, 92(sp)
	fsw	fa2, 96(sp)
	fsw	fa1, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v17, (s10)
	vsetvli	zero, s11, e8, m2, ta, ma
	vwmul.vv	v4, v0, v24
	vwmacc.vv	v4, v2, v22
	vwmacc.vv	v4, v28, v20
	vwmacc.vv	v4, v30, v18
	vsetvli	zero, ra, e16, m2, ta, ma
	vnsrl.wi	v26, v4, 0
	vnsrl.wi	v28, v4, 16
	vadd.vv	v26, v26, v28
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v28, v26, 0
	vnsrl.wi	v29, v26, 16
	vadd.vv	v26, v28, v29
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v27, v26, 0
	vnsrl.wi	v26, v26, 16
	vwadd.vv	v28, v27, v26
	vsetvli	zero, zero, e32, m1, ta, ma
	vfcvt.f.x.v	v26, v28
	vfmul.vf	v26, v26, fa4
	vfmacc.vv	v11, v17, v26
	vsetvli	zero, t6, e8, m4, ta, ma
	vle8.v	v28, (t0)
	lhu	a1, 0(a0)
	vsll.vi	v0, v28, 4
	lhu	a2, 2(a0)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa3, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa2, 0(a2)
	lhu	a1, 4(a0)
	vsra.vi	v0, v0, 4
	fsw	fa3, 72(sp)
	fsw	fa2, 76(sp)
	slli	a1, a1, 2
	lhu	a2, 6(a0)
	add	a1, a1, a5
	flw	fa3, 0(a1)
	lhu	a1, 8(a0)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa2, 0(a2)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa1, 0(a1)
	lhu	a1, 10(a0)
	fsw	fa3, 80(sp)
	fsw	fa2, 84(sp)
	fsw	fa1, 88(sp)
	slli	a1, a1, 2
	lhu	a2, 12(a0)
	add	a1, a1, a5
	flw	fa3, 0(a1)
	lhu	a1, 14(a0)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa2, 0(a2)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa1, 0(a1)
	vsra.vi	v28, v28, 4
	fsw	fa3, 92(sp)
	fsw	fa2, 96(sp)
	fsw	fa1, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v17, (s10)
	vsetvli	zero, s11, e8, m2, ta, ma
	vwmul.vv	v4, v0, v24
	vwmacc.vv	v4, v2, v22
	vwmacc.vv	v4, v28, v20
	vwmacc.vv	v4, v30, v18
	vsetvli	zero, ra, e16, m2, ta, ma
	vnsrl.wi	v18, v4, 0
	vnsrl.wi	v20, v4, 16
	vadd.vv	v18, v18, v20
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v20, v18, 0
	vnsrl.wi	v21, v18, 16
	vadd.vv	v18, v20, v21
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v19, v18, 0
	vnsrl.wi	v18, v18, 16
	vwadd.vv	v20, v19, v18
	vsetvli	zero, zero, e32, m1, ta, ma
	lhu	a1, -30(s0)
	lhu	a2, -32(s0)
	lhu	a3, -28(s0)
	lhu	a4, -26(s0)
	slli	a1, a1, 16
	or	a1, a1, a2
	slli	a3, a3, 32
	slli	a4, a4, 48
	or	a3, a3, a4
	or	a6, a3, a1
	lhu	a2, 2(s0)
	lhu	a3, 0(s0)
	lhu	a4, 4(s0)
	lhu	s1, 6(s0)
	slli	a2, a2, 16
	or	a2, a2, a3
	slli	a4, a4, 32
	slli	s1, s1, 48
	or	a4, a4, s1
	or	a2, a2, a4
	lhu	a3, 34(s0)
	lhu	a4, 32(s0)
	lhu	s1, 36(s0)
	lhu	a1, 38(s0)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	s1, s1, 32
	slli	a1, a1, 48
	or	a1, a1, s1
	lhu	a4, 66(s0)
	lhu	s1, 64(s0)
	vfcvt.f.x.v	v18, v20
	or	a1, a1, a3
	slli	a4, a4, 16
	or	a4, a4, s1
	lhu	a3, 68(s0)
	lhu	s1, 70(s0)
	vfmul.vf	v18, v18, fa4
	vfmacc.vv	v12, v17, v18
	slli	a3, a3, 32
	slli	s1, s1, 48
	or	a3, a3, s1
	or	a3, a3, a4
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v24, a6
	vmv.v.x	v22, a2
	vmv.v.x	v20, a1
	vmv.v.x	v18, a3
	vsetvli	zero, t6, e8, m4, ta, ma
	vle8.v	v28, (t3)
	lhu	a1, 0(s8)
	vsll.vi	v0, v28, 4
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa4, 0(a1)
	lhu	a1, 2(s8)
	vsra.vi	v0, v0, 4
	vsra.vi	v28, v28, 4
	fsw	fa4, 72(sp)
	slli	a1, a1, 2
	lhu	a2, 4(s8)
	add	a1, a1, a5
	flw	fa4, 0(a1)
	lhu	a1, 6(s8)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa3, 0(a2)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	fsw	fa4, 76(sp)
	lhu	a1, 8(s8)
	fsw	fa3, 80(sp)
	fsw	fa2, 84(sp)
	lhu	a2, 10(s8)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa4, 0(a1)
	slli	a2, a2, 2
	lhu	a1, 12(s8)
	add	a2, a2, a5
	flw	fa3, 0(a2)
	lhu	a2, 14(s8)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa1, 0(a2)
	fsw	fa4, 88(sp)
	fsw	fa3, 92(sp)
	fsw	fa2, 96(sp)
	fsw	fa1, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v17, (s10)
	vsetvli	zero, s11, e8, m2, ta, ma
	vwmul.vv	v4, v0, v24
	vwmacc.vv	v4, v2, v22
	vwmacc.vv	v4, v28, v20
	vwmacc.vv	v4, v30, v18
	vsetvli	zero, ra, e16, m2, ta, ma
	vnsrl.wi	v26, v4, 0
	vnsrl.wi	v28, v4, 16
	vadd.vv	v26, v26, v28
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v28, v26, 0
	vnsrl.wi	v29, v26, 16
	vadd.vv	v26, v28, v29
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v27, v26, 0
	vnsrl.wi	v26, v26, 16
	vwadd.vv	v28, v27, v26
	vsetvli	zero, zero, e32, m1, ta, ma
	vfcvt.f.x.v	v26, v28
	vfmul.vf	v26, v26, fa5
	vfmacc.vv	v9, v17, v26
	vsetvli	zero, t6, e8, m4, ta, ma
	vle8.v	v28, (t0)
	lhu	a1, 0(a0)
	vsll.vi	v0, v28, 4
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa4, 0(a1)
	lhu	a1, 2(a0)
	vsra.vi	v0, v0, 4
	vsra.vi	v28, v28, 4
	fsw	fa4, 72(sp)
	slli	a1, a1, 2
	lhu	a2, 4(a0)
	add	a1, a1, a5
	flw	fa4, 0(a1)
	lhu	a1, 6(a0)
	slli	a2, a2, 2
	add	a2, a2, a5
	flw	fa3, 0(a2)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	fsw	fa4, 76(sp)
	lhu	a1, 8(a0)
	fsw	fa3, 80(sp)
	fsw	fa2, 84(sp)
	lhu	a2, 10(a0)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa4, 0(a1)
	slli	a2, a2, 2
	lhu	a1, 12(a0)
	add	a2, a2, a5
	flw	fa3, 0(a2)
	lhu	a0, 14(a0)
	slli	a1, a1, 2
	add	a1, a1, a5
	flw	fa2, 0(a1)
	slli	a0, a0, 2
	add	a0, a0, a5
	flw	fa1, 0(a0)
	fsw	fa4, 88(sp)
	fsw	fa3, 92(sp)
	fsw	fa2, 96(sp)
	fsw	fa1, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	vle32.v	v17, (s10)
	vsetvli	zero, s11, e8, m2, ta, ma
	vwmul.vv	v4, v0, v24
	vwmacc.vv	v4, v2, v22
	vwmacc.vv	v4, v28, v20
	vwmacc.vv	v4, v30, v18
	vsetvli	zero, ra, e16, m2, ta, ma
	vnsrl.wi	v18, v4, 0
	vnsrl.wi	v20, v4, 16
	vadd.vv	v18, v18, v20
	vsetivli	zero, 16, e16, m1, ta, ma
	vnsrl.wi	v20, v18, 0
	vnsrl.wi	v21, v18, 16
	vadd.vv	v18, v20, v21
	vsetivli	zero, 8, e16, mf2, ta, ma
	vnsrl.wi	v19, v18, 0
	vnsrl.wi	v18, v18, 16
	vwadd.vv	v20, v19, v18
	vsetvli	zero, zero, e32, m1, ta, ma
	vfcvt.f.x.v	v18, v20
	vfmul.vf	v18, v18, fa5
	vfmacc.vv	v10, v17, v18
	addi	s0, s0, 136
	addi	s8, s8, 144
	bne	s0, s3, .LBB0_11
# %bb.12:                               #   in Loop: Header=BB0_10 Depth=2
	slli	a0, s2, 5
	add	a1, s4, a0
	vse32.v	v15, (a1)
	slli	s9, s9, 5
	add	a1, s4, s9
	vse32.v	v16, (a1)
	add	a1, s5, a0
	vse32.v	v13, (a1)
	add	a1, s5, s9
	vse32.v	v14, (a1)
	add	a1, s6, a0
	vse32.v	v11, (a1)
	add	a1, s6, s9
	vse32.v	v12, (a1)
	add	a0, a0, s7
	vse32.v	v9, (a0)
	add	s9, s9, s7
	vse32.v	v10, (s9)
	addi	s2, s2, 2
	ld	a0, 64(sp)                      # 8-byte Folded Reload
	add	t2, t2, a0
	bltu	s2, t4, .LBB0_10
# %bb.13:                               #   in Loop: Header=BB0_9 Depth=1
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	addi	s1, s1, 1
	ld	a3, 8(sp)                       # 8-byte Folded Reload
	add	t1, t1, a3
	ld	a1, 24(sp)                      # 8-byte Folded Reload
	ld	a0, 48(sp)                      # 8-byte Folded Reload
	ld	a2, 16(sp)                      # 8-byte Folded Reload
	bne	s1, a0, .LBB0_9
	j	.LBB0_32
.LBB0_14:
	ld	a3, 32(sp)                      # 8-byte Folded Reload
	ld	a4, 56(sp)                      # 8-byte Folded Reload
	ld	ra, 200(sp)                     # 8-byte Folded Reload
	ld	s0, 192(sp)                     # 8-byte Folded Reload
	ld	s1, 184(sp)                     # 8-byte Folded Reload
	ld	s2, 176(sp)                     # 8-byte Folded Reload
	ld	s3, 168(sp)                     # 8-byte Folded Reload
	ld	s4, 160(sp)                     # 8-byte Folded Reload
	ld	s5, 152(sp)                     # 8-byte Folded Reload
	ld	s6, 144(sp)                     # 8-byte Folded Reload
	ld	s7, 136(sp)                     # 8-byte Folded Reload
	ld	s8, 128(sp)                     # 8-byte Folded Reload
	ld	s9, 120(sp)                     # 8-byte Folded Reload
	ld	s10, 112(sp)                    # 8-byte Folded Reload
	ld	s11, 104(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 208
	tail	ggml_gemm_q4_0_8x8_q8_0_generic
.LBB0_15:
	blez	t0, .LBB0_32
# %bb.16:
	srai	t3, a6, 3
	blez	t3, .LBB0_32
# %bb.17:
	vsetivli	zero, 8, e32, m1, ta, ma
	li	a5, 31
	vmv.v.i	v8, 0
	bge	a5, a0, .LBB0_28
# %bb.18:
	li	t2, 0
	ld	a0, 56(sp)                      # 8-byte Folded Reload
	addi	t5, a0, 64
	li	a0, 17
	slli	a0, a0, 35
	slli	a3, a3, 32
	mulhu	t1, a3, a0
	ld	a0, 32(sp)                      # 8-byte Folded Reload
	addi	a0, a0, 16
	sd	a0, 64(sp)                      # 8-byte Folded Spill
	li	a0, 9
	slli	a0, a0, 36
	mulhu	a7, a3, a0
	addi	a0, t1, 64
	sd	a0, 40(sp)                      # 8-byte Folded Spill
	li	s2, 128
.Lpcrel_hi9:
	auipc	a0, %got_pcrel_hi(ggml_table_f32_f16)
	ld	ra, %pcrel_lo(.Lpcrel_hi9)(a0)
	addi	s8, sp, 72
	li	s10, 64
	li	s11, 32
.LBB0_19:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_20 Depth 2
                                        #       Child Loop BB0_21 Depth 3
	li	t6, 0
	mul	a3, t1, t2
	ld	a0, 40(sp)                      # 8-byte Folded Reload
	add	a3, a3, a0
	ld	s9, 56(sp)                      # 8-byte Folded Reload
	add	s9, s9, a3
	slli	a3, t2, 2
	mul	s1, a3, a2
	slli	s1, s1, 2
	add	s3, a1, s1
	addi	s1, a3, 1
	mul	s1, s1, a2
	slli	s1, s1, 2
	add	s4, a1, s1
	addi	s1, a3, 2
	mul	s1, s1, a2
	slli	s1, s1, 2
	add	s5, a1, s1
	addi	a3, a3, 3
	mul	a3, a3, a2
	slli	a3, a3, 2
	add	s6, a1, a3
	ld	t4, 64(sp)                      # 8-byte Folded Reload
.LBB0_20:                               #   Parent Loop BB0_19 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_21 Depth 3
	mv	s7, t4
	mv	s1, t5
	vmv1r.v	v9, v8
	vmv1r.v	v10, v8
	vmv1r.v	v11, v8
	vmv1r.v	v12, v8
.LBB0_21:                               #   Parent Loop BB0_19 Depth=1
                                        #     Parent Loop BB0_20 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vsetvli	zero, s2, e8, m4, ta, ma
	vle8.v	v16, (s7)
	vsll.vi	v20, v16, 4
	lhu	s0, -64(s1)
	vsra.vi	v20, v20, 4
	vsra.vi	v16, v16, 4
	lhu	a5, -62(s1)
	slli	s0, s0, 2
	add	s0, s0, ra
	flw	fa2, 0(s0)
	slli	a5, a5, 2
	lhu	s0, -60(s1)
	add	a5, a5, ra
	flw	fa3, 0(a5)
	lhu	a5, -16(s7)
	slli	s0, s0, 2
	add	s0, s0, ra
	lhu	a0, -14(s7)
	slli	a5, a5, 2
	add	a5, a5, ra
	flw	fa4, 0(a5)
	slli	a0, a0, 2
	add	a0, a0, ra
	flw	fa1, 0(a0)
	flw	fa5, 0(s0)
	lhu	a0, -12(s7)
	fsw	fa4, 72(sp)
	fsw	fa1, 76(sp)
	lhu	a5, -10(s7)
	slli	a0, a0, 2
	add	a0, a0, ra
	flw	fa4, 0(a0)
	slli	a5, a5, 2
	add	a5, a5, ra
	flw	fa1, 0(a5)
	lhu	a0, -58(s1)
	lhu	a5, -8(s7)
	fsw	fa4, 80(sp)
	fsw	fa1, 84(sp)
	lhu	s0, -6(s7)
	slli	a5, a5, 2
	add	a5, a5, ra
	flw	fa4, 0(a5)
	slli	s0, s0, 2
	add	s0, s0, ra
	flw	fa1, 0(s0)
	slli	a0, a0, 2
	lhu	a5, -4(s7)
	fsw	fa4, 88(sp)
	fsw	fa1, 92(sp)
	lhu	s0, -2(s7)
	slli	a5, a5, 2
	add	a5, a5, ra
	flw	fa4, 0(a5)
	slli	s0, s0, 2
	add	s0, s0, ra
	flw	fa1, 0(s0)
	add	a0, a0, ra
	fsw	fa4, 96(sp)
	flw	fa4, 0(a0)
	fsw	fa1, 100(sp)
	vsetivli	zero, 8, e32, m1, ta, ma
	lhu	a0, -54(s1)
	lhu	a5, -56(s1)
	lhu	s0, -52(s1)
	lhu	t0, -50(s1)
	slli	a0, a0, 16
	or	a0, a0, a5
	slli	s0, s0, 32
	slli	t0, t0, 48
	or	a5, t0, s0
	or	t0, a5, a0
	lhu	a5, -22(s1)
	lhu	s0, -24(s1)
	lhu	a4, -20(s1)
	lhu	a0, -18(s1)
	slli	a5, a5, 16
	or	a5, a5, s0
	slli	a4, a4, 32
	slli	a0, a0, 48
	or	a0, a0, a4
	or	a0, a0, a5
	lhu	a4, 10(s1)
	lhu	a5, 8(s1)
	lhu	s0, 12(s1)
	lhu	a6, 14(s1)
	slli	a4, a4, 16
	or	a4, a4, a5
	slli	s0, s0, 32
	slli	a6, a6, 48
	lhu	a5, 42(s1)
	or	s0, a6, s0
	or	a6, s0, a4
	lhu	s0, 40(s1)
	slli	a5, a5, 16
	lhu	a3, 44(s1)
	lhu	a4, 46(s1)
	or	a5, a5, s0
	vle32.v	v13, (s8)
	slli	a3, a3, 32
	slli	a4, a4, 48
	or	a3, a3, a4
	or	a3, a3, a5
	#APP
	#NO_APP
	vsetivli	zero, 8, e64, m2, ta, ma
	vmv.v.x	v14, t0
	vmv.v.x	v24, a0
	vmv.v.x	v26, a6
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
	lhu	a4, -44(s1)
	lhu	a5, -42(s1)
	slli	a0, a0, 16
	or	a0, a0, a3
	slli	a4, a4, 32
	slli	a5, a5, 48
	or	a4, a4, a5
	or	a6, a4, a0
	lhu	a3, -14(s1)
	lhu	a4, -16(s1)
	lhu	a5, -12(s1)
	lhu	s0, -10(s1)
	slli	a3, a3, 16
	or	a3, a3, a4
	slli	a5, a5, 32
	slli	s0, s0, 48
	or	a5, a5, s0
	or	a3, a3, a5
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
	vmv.v.x	v14, a6
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
	or	a6, a4, a0
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
	vmv.v.x	v14, a6
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
	or	a6, a4, a0
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
	vmv.v.x	v14, a6
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
	bne	s1, s9, .LBB0_21
# %bb.22:                               #   in Loop: Header=BB0_20 Depth=2
	slli	a0, t6, 5
	add	a3, s3, a0
	vse32.v	v12, (a3)
	add	a3, s4, a0
	vse32.v	v11, (a3)
	add	a3, s5, a0
	vse32.v	v10, (a3)
	add	a0, a0, s6
	vse32.v	v9, (a0)
	addi	t6, t6, 1
	add	t4, t4, a7
	bne	t6, t3, .LBB0_20
# %bb.23:                               #   in Loop: Header=BB0_19 Depth=1
	addi	t2, t2, 1
	add	t5, t5, t1
	ld	a0, 48(sp)                      # 8-byte Folded Reload
	bne	t2, a0, .LBB0_19
	j	.LBB0_32
.LBB0_24:
	li	a0, 0
	slli	a3, a2, 4
	slli	a2, a2, 2
	addi	a2, a2, -32
.LBB0_25:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_26 Depth 2
	li	a4, 0
	mv	s1, a1
	mv	a5, a1
.LBB0_26:                               #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vse32.v	v8, (a5)
	addi	a1, a5, 32
	vse32.v	v8, (a1)
	add	a1, a1, a2
	vse32.v	v8, (a1)
	addi	a1, a1, 32
	vse32.v	v8, (a1)
	add	a1, a1, a2
	vse32.v	v8, (a1)
	addi	a1, a1, 32
	vse32.v	v8, (a1)
	add	a1, a1, a2
	vse32.v	v8, (a1)
	addi	a1, a1, 32
	vse32.v	v8, (a1)
	addi	a4, a4, 2
	addi	a5, a5, 64
	bltu	a4, t4, .LBB0_26
# %bb.27:                               #   in Loop: Header=BB0_25 Depth=1
	addi	a0, a0, 1
	mv	a1, s1
	add	a1, s1, a3
	bne	a0, t0, .LBB0_25
	j	.LBB0_32
.LBB0_28:
	li	a0, 0
	slli	t3, t3, 32
	srli	a6, t3, 32
	slli	a7, a2, 4
	slli	a4, a2, 2
	li	a3, 12
	mul	s1, a2, a3
	slli	a2, a2, 3
.LBB0_29:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_30 Depth 2
	mv	a3, a6
	mv	s0, a1
.LBB0_30:                               #   Parent Loop BB0_29 Depth=1
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
	bnez	a3, .LBB0_30
# %bb.31:                               #   in Loop: Header=BB0_29 Depth=1
	addi	a0, a0, 1
	add	a1, a1, a7
	bne	a0, t0, .LBB0_29
.LBB0_32:
	ld	ra, 200(sp)                     # 8-byte Folded Reload
	ld	s0, 192(sp)                     # 8-byte Folded Reload
	ld	s1, 184(sp)                     # 8-byte Folded Reload
	ld	s2, 176(sp)                     # 8-byte Folded Reload
	ld	s3, 168(sp)                     # 8-byte Folded Reload
	ld	s4, 160(sp)                     # 8-byte Folded Reload
	ld	s5, 152(sp)                     # 8-byte Folded Reload
	ld	s6, 144(sp)                     # 8-byte Folded Reload
	ld	s7, 136(sp)                     # 8-byte Folded Reload
	ld	s8, 128(sp)                     # 8-byte Folded Reload
	ld	s9, 120(sp)                     # 8-byte Folded Reload
	ld	s10, 112(sp)                    # 8-byte Folded Reload
	ld	s11, 104(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 208
	ret
.LBB0_33:
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
.Lpcrel_hi1:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi1)
.Lpcrel_hi2:
	auipc	a2, %pcrel_hi(.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi2)
	li	a2, 87
	call	__assert_fail
.LBB0_34:
.Lpcrel_hi3:
	auipc	a0, %pcrel_hi(.L.str.2)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi3)
.Lpcrel_hi4:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi4)
.Lpcrel_hi5:
	auipc	a2, %pcrel_hi(.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi5)
	li	a2, 88
	call	__assert_fail
.LBB0_35:
.Lpcrel_hi6:
	auipc	a0, %pcrel_hi(.L.str.3)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi6)
.Lpcrel_hi7:
	auipc	a1, %pcrel_hi(.L.str.1)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi7)
.Lpcrel_hi8:
	auipc	a2, %pcrel_hi(.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi8)
	li	a2, 89
	call	__assert_fail
.Lfunc_end0:
	.size	ggml_gemm_q4_0_8x8_q8_0_4x16, .Lfunc_end0-ggml_gemm_q4_0_8x8_q8_0_4x16
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"n % qk == 0"
	.size	.L.str, 12

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"repack_4x16.cpp"
	.size	.L.str.1, 16

	.type	.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16,@object # @__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16
.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16:
	.asciz	"void ggml_gemm_q4_0_8x8_q8_0_4x16(int, float *__restrict, size_t, const void *__restrict, const void *__restrict, int, int)"
	.size	.L__PRETTY_FUNCTION__.ggml_gemm_q4_0_8x8_q8_0_4x16, 124

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"nr % 4 == 0"
	.size	.L.str.2, 12

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"nc % ncols_interleaved == 0"
	.size	.L.str.3, 28

	.ident	"Ubuntu clang version 18.1.8 (++20240731025043+3b5b5c1ec4a3-1~exp1~20240731145144.92)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
