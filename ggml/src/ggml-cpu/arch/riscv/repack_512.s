	.file	"repack.cpp"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"void ggml_gemv_q4_0_8x8_q8_0(int, float*, size_t, const void*, const void*, int, int)"
	.align	3
.LC1:
	.string	"repack.cpp"
	.align	3
.LC2:
	.string	"n % qk == 0"
	.align	3
.LC3:
	.string	"nc % ncols_interleaved == 0"
	.text
	.align	1
	.globl	ggml_gemv_q4_0_8x8_q8_0
	.type	ggml_gemv_q4_0_8x8_q8_0, @function
ggml_gemv_q4_0_8x8_q8_0:
.LFB2019:
	.cfi_startproc
	addi	sp,sp,-192
	.cfi_def_cfa_offset 192
	sd	s10,96(sp)
	.cfi_offset 26, -96
	la	s10,__stack_chk_guard
	sd	ra,184(sp)
	ld	a7, 0(s10)
	sd	a7, 72(sp)
	li	a7, 0
	andi	t1,a0,31
	vsetivli	zero,8,e32,m1,ta,ma
	.cfi_offset 1, -8
	bne	t1,zero,.L18
	andi	t1,a6,7
	bne	t1,zero,.L19
	csrr	t3,vlenb
	li	t1,31
	bleu	t3,t1,.L4
	sraiw	a5,a6,31
	srliw	a5,a5,29
	sd	s3,152(sp)
	addw	a5,a5,a6
	.cfi_offset 19, -40
	mv	s3,a4
	li	a4,7
	sraiw	t1,a5,3
	ble	a6,a4,.L1
	sd	s6,128(sp)
	.cfi_offset 22, -64
	sraiw	s6,a0,31
	srliw	s6,s6,27
	addw	s6,s6,a0
	sraiw	s6,s6,5
	slli	a5,s6,3
	add	a5,a5,s6
	sd	s0,176(sp)
	sd	s2,160(sp)
	sd	s4,144(sp)
	sd	s5,136(sp)
	sd	s7,120(sp)
	sd	s8,112(sp)
	sd	s9,104(sp)
	.cfi_offset 8, -16
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	mv	s4,a1
	sd	s1,168(sp)
	sd	s11,88(sp)
	mv	s2,a0
	slli	t3,a5,4
	addi	s5,a3,16
	li	s8,0
	li	s9,31
	la	a2,ggml_table_f32_f16
	addi	s7,sp,40
	li	a4,128
	li	a1,64
	li	s0,32
	sd	t1,24(sp)
	vmv.v.i	v26,0
	.cfi_offset 9, -24
	.cfi_offset 27, -104
.L9:
	vmv1r.v	v8,v26
	ble	s2,s9,.L7
	mv	a3,s3
	mv	a5,s5
	li	t2,0
	sd	s5,0(sp)
	sd	s8,8(sp)
	sd	s4,16(sp)
.L8:
	ld	s11,2(a3)
	ld	s8,10(a3)
	ld	s5,18(a3)
	ld	s4,26(a3)
	lhu	s1,-16(a5)
	lhu	t0,-14(a5)
	lhu	t6,-12(a5)
	lhu	t5,-10(a5)
	lhu	t4,-8(a5)
	lhu	t1,-6(a5)
	lhu	a7,-4(a5)
	lhu	a6,-2(a5)
	slli	s1,s1,2
	slli	t0,t0,2
	slli	t6,t6,2
	slli	t5,t5,2
	slli	t4,t4,2
	slli	t1,t1,2
	slli	a7,a7,2
	slli	a6,a6,2
	add	s1,a2,s1
	add	t0,a2,t0
	add	t6,a2,t6
	add	t5,a2,t5
	add	t4,a2,t4
	add	t1,a2,t1
	add	a7,a2,a7
	add	a6,a2,a6
	flw	ft2,0(s1)
	flw	ft1,0(t0)
	flw	ft0,0(t6)
	flw	fa0,0(t5)
	flw	fa1,0(t4)
	flw	fa2,0(t1)
	flw	fa3,0(a7)
	flw	fa4,0(a6)
	fsw	ft2,40(sp)
	fsw	ft1,44(sp)
	fsw	ft0,48(sp)
	fsw	fa0,52(sp)
	fsw	fa1,56(sp)
	fsw	fa2,60(sp)
	fsw	fa3,64(sp)
	fsw	fa4,68(sp)
	vsetvli	zero,a4,e8,m4,ta,ma
	vle8.v	v28,0(a5)
	vsetivli	zero,8,e64,m2,ta,ma
	vmv.v.x	v20,s11
	vsetvli	zero,a4,e8,m4,ta,ma
	lhu	a0,0(a3)
	vsra.vi	v12,v28,4
	vsetivli	zero,8,e64,m2,ta,ma
	vmv.v.x	v18,s8
	vmv.v.x	v16,s5
	vmv.v.x	v10,s4
	vsetvli	zero,a4,e8,m4,ta,ma
	vsll.vi	v28,v28,4
	vsetivli	zero,8,e32,m1,ta,ma
	slli	a0,a0,2
	vle32.v	v9,0(s7)
	vsetvli	zero,a4,e8,m4,ta,ma
	add	a0,a2,a0
	vsra.vi	v28,v28,4
	vsetvli	zero,a1,e8,m2,ta,ma
	flw	fa5,0(a0)
	vwmul.vv	v0,v28,v20
	vmv4r.v	v20,v0
	vwmacc.vv	v20,v30,v18
	vmv4r.v	v28,v20
	vwmacc.vv	v28,v12,v16
	vwmacc.vv	v28,v14,v10
	vsetvli	zero,s0,e16,m2,ta,ma
	vmv4r.v	v12,v28
	vnsrl.wi	v24,v12,16
	vnsrl.wi	v28,v12,0
	vadd.vv	v28,v28,v24
	vsetivli	zero,16,e16,m1,ta,ma
	addiw	t2,t2,1
	vnsrl.wi	v24,v28,0
	vnsrl.wi	v28,v28,16
	vadd.vv	v24,v24,v28
	vsetivli	zero,8,e16,mf2,ta,ma
	vnsrl.wi	v27,v24,0
	vnsrl.wi	v24,v24,16
	addi	a3,a3,34
	vwadd.vv	v25,v27,v24
	addi	a5,a5,144
	vsetvli	zero,zero,e32,m1,ta,ma
	vfcvt.f.x.v	v24,v25
	vfmul.vf	v24,v24,fa5
	vfmacc.vv	v8,v24,v9
	bgt	s6,t2,.L8
	ld	s5,0(sp)
	ld	s8,8(sp)
	ld	s4,16(sp)
.L7:
	vse32.v	v8,0(s4)
	ld	a5,24(sp)
	addiw	s8,s8,1
	addi	s4,s4,32
	add	s5,s5,t3
	blt	s8,a5,.L9
	ld	s0,176(sp)
	.cfi_restore 8
	ld	s1,168(sp)
	.cfi_restore 9
	ld	s2,160(sp)
	.cfi_restore 18
	ld	s4,144(sp)
	.cfi_restore 20
	ld	s5,136(sp)
	.cfi_restore 21
	ld	s6,128(sp)
	.cfi_restore 22
	ld	s7,120(sp)
	.cfi_restore 23
	ld	s8,112(sp)
	.cfi_restore 24
	ld	s9,104(sp)
	.cfi_restore 25
	ld	s11,88(sp)
	.cfi_restore 27
.L1:
	ld	a4, 72(sp)
	ld	a5, 0(s10)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L20
	ld	ra,184(sp)
	.cfi_restore 1
	ld	s3,152(sp)
	.cfi_restore 19
	ld	s10,96(sp)
	.cfi_restore 26
	addi	sp,sp,192
	.cfi_def_cfa_offset 0
	jr	ra
.L4:
	.cfi_def_cfa_offset 192
	.cfi_offset 1, -8
	.cfi_offset 26, -96
	ld	t1, 72(sp)
	ld	a7, 0(s10)
	xor	a7, t1, a7
	li	t1, 0
	bne	a7,zero,.L21
	ld	ra,184(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s10,96(sp)
	.cfi_restore 26
	addi	sp,sp,192
	.cfi_def_cfa_offset 0
	tail	ggml_gemv_q4_0_8x8_q8_0_generic@plt
.L21:
	.cfi_restore_state
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	s2,160(sp)
	sd	s3,152(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
.L16:
	sd	s4,144(sp)
	sd	s5,136(sp)
	sd	s6,128(sp)
	sd	s7,120(sp)
	sd	s8,112(sp)
	sd	s9,104(sp)
	sd	s11,88(sp)
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 27, -104
	call	__stack_chk_fail@plt
.L19:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 27
	lla	a3,.LC0
	li	a2,34
	lla	a1,.LC1
	lla	a0,.LC3
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	s2,160(sp)
	sd	s3,152(sp)
	sd	s4,144(sp)
	sd	s5,136(sp)
	sd	s6,128(sp)
	sd	s7,120(sp)
	sd	s8,112(sp)
	sd	s9,104(sp)
	sd	s11,88(sp)
	.cfi_remember_state
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L18:
	.cfi_restore_state
	lla	a3,.LC0
	li	a2,33
	lla	a1,.LC1
	lla	a0,.LC2
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	s2,160(sp)
	sd	s3,152(sp)
	sd	s4,144(sp)
	sd	s5,136(sp)
	sd	s6,128(sp)
	sd	s7,120(sp)
	sd	s8,112(sp)
	sd	s9,104(sp)
	sd	s11,88(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L20:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 27
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	s2,160(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	j	.L16
	.cfi_endproc
.LFE2019:
	.size	ggml_gemv_q4_0_8x8_q8_0, .-ggml_gemv_q4_0_8x8_q8_0
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"void ggml_gemm_q4_0_8x8_q8_0(int, float*, size_t, const void*, const void*, int, int)"
	.align	3
.LC5:
	.string	"nr % 4 == 0"
	.text
	.align	1
	.globl	ggml_gemm_q4_0_8x8_q8_0
	.type	ggml_gemm_q4_0_8x8_q8_0, @function
ggml_gemm_q4_0_8x8_q8_0:
.LFB2020:
	.cfi_startproc
	addi	sp,sp,-256
	.cfi_def_cfa_offset 256
	sd	s0,240(sp)
	.cfi_offset 8, -16
	la	s0,__stack_chk_guard
	sd	ra,248(sp)
	ld	a7, 0(s0)
	sd	a7, 136(sp)
	li	a7, 0
	andi	t1,a0,31
	vsetivli	zero,8,e32,m1,ta,ma
	.cfi_offset 1, -8
	bne	t1,zero,.L42
	andi	t1,a5,3
	mv	t4,a5
	bne	t1,zero,.L43
	andi	t1,a6,7
	mv	a7,a6
	bne	t1,zero,.L44
	csrr	t6,vlenb
	li	t1,31
	bleu	t6,t1,.L26
	sraiw	a5,a5,31
	srliw	a5,a5,30
	mv	s0,a4
	addw	a5,a5,t4
	li	a4,3
	sraiw	t1,a5,2
	ble	t4,a4,.L22
	sraiw	a5,a6,31
	sd	s4,208(sp)
	.cfi_offset 20, -48
	sraiw	s4,a0,31
	srliw	s4,s4,27
	srliw	a5,a5,29
	addw	s4,s4,a0
	addw	a5,a5,a6
	li	a4,7
	mv	t3,a0
	sraiw	s4,s4,5
	sraiw	a6,a5,3
	ble	a7,a4,.L40
	slli	a5,s4,3
	add	a5,a5,s4
	slli	a4,s4,4
	add	a4,a4,s4
	slli	a7,a2,2
	slli	t6,a2,4
	slli	t4,a5,4
	li	a0,0
	sd	s1,232(sp)
	sd	s2,224(sp)
	sd	s5,200(sp)
	sd	s11,152(sp)
	mv	t5,a2
	slli	t0,a4,3
	addi	t2,a3,16
	sd	a6,40(sp)
	sd	s3,216(sp)
	mv	a6,t3
	sd	s6,192(sp)
	sd	s7,184(sp)
	sd	s8,176(sp)
	sd	s9,168(sp)
	sd	s10,160(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 21, -56
	.cfi_offset 27, -104
	.cfi_offset 19, -40
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	mv	s11,s0
	li	s1,0
	la	a2,ggml_table_f32_f16
	addi	s5,sp,104
	li	s2,128
	li	a4,64
	li	a3,32
	sd	t1,80(sp)
	mv	a5,a0
	sd	t6,88(sp)
	sd	a7,48(sp)
	mv	t3,t4
	vmv.v.i	v25,0
.L33:
	add	s0,t5,s1
	add	s0,s0,t5
	add	t4,s0,t5
	sub	s0,s0,s1
	sub	s1,t4,s1
	slli	s9,s0,2
	slli	s10,s1,2
	mv	s8,t2
	mv	s6,a1
	li	s7,0
	sd	t4,56(sp)
	sd	a5,64(sp)
	sd	s11,32(sp)
	sd	a1,72(sp)
	sd	s10,16(sp)
	sd	s9,24(sp)
	mv	s0,t5
.L32:
	li	a5,31
	vmv1r.v	v12,v25
	vmv1r.v	v11,v25
	vmv1r.v	v10,v25
	vmv1r.v	v9,v25
	ble	a6,a5,.L30
	ld	a5,32(sp)
	mv	a1,s8
	li	s11,0
	sd	s7,0(sp)
	sd	s8,8(sp)
	vmv1r.v	v13,v25
.L31:
	lhu	s10,-16(a1)
	lhu	s9,-14(a1)
	lhu	s8,-12(a1)
	lhu	s7,-10(a1)
	lhu	s3,-8(a1)
	lhu	s1,-6(a1)
	lhu	t6,-4(a1)
	lhu	t5,-2(a1)
	slli	s10,s10,2
	slli	s9,s9,2
	slli	s8,s8,2
	slli	s7,s7,2
	slli	s3,s3,2
	slli	s1,s1,2
	slli	t6,t6,2
	lhu	t4,0(a5)
	lhu	t1,2(a5)
	lhu	a7,4(a5)
	lhu	a0,6(a5)
	add	s10,a2,s10
	add	s9,a2,s9
	add	s8,a2,s8
	add	s7,a2,s7
	add	s3,a2,s3
	add	s1,a2,s1
	add	t6,a2,t6
	slli	t5,t5,2
	flw	fa2,0(s7)
	flw	fa3,0(s3)
	flw	fa4,0(s1)
	flw	fa5,0(t6)
	flw	ft1,0(s10)
	flw	ft0,0(s9)
	flw	fa0,0(s8)
	add	t5,a2,t5
	flw	fa1,0(t5)
	slli	t4,t4,2
	slli	t1,t1,2
	slli	a7,a7,2
	slli	a0,a0,2
	vsetvli	zero,s2,e8,m4,ta,ma
	fsw	fa2,116(sp)
	fsw	fa3,120(sp)
	fsw	fa4,124(sp)
	fsw	fa5,128(sp)
	add	t4,a2,t4
	add	t1,a2,t1
	add	a7,a2,a7
	add	a0,a2,a0
	fsw	ft1,104(sp)
	fsw	ft0,108(sp)
	fsw	fa0,112(sp)
	vle8.v	v28,0(a1)
	flw	fa2,0(t4)
	vsll.vi	v16,v28,4
	flw	fa3,0(t1)
	flw	fa4,0(a7)
	flw	fa5,0(a0)
	vsra.vi	v16,v16,4
	fsw	fa1,132(sp)
	vsra.vi	v28,v28,4
	ld	t4,8(a5)
	vsetivli	zero,8,e64,m2,ta,ma
	ld	t1,40(a5)
	ld	a7,72(a5)
	ld	a0,104(a5)
	vle32.v	v8,0(s5)
	vmv.v.x	v14,a0
	vmv.v.x	v0,t4
	vmv.v.x	v22,t1
	vmv.v.x	v20,a7
	vsetvli	zero,a4,e8,m2,ta,ma
	vwmul.vv	v24,v16,v0
	vwmacc.vv	v24,v18,v22
	vwmacc.vv	v24,v28,v20
	vwmacc.vv	v24,v30,v14
	vsetvli	zero,a3,e16,m2,ta,ma
	vnsrl.wi	v14,v24,0
	vnsrl.wi	v24,v24,16
	vadd.vv	v26,v14,v24
	vsetivli	zero,16,e16,m1,ta,ma
	vnsrl.wi	v24,v26,0
	vnsrl.wi	v26,v26,16
	vadd.vv	v24,v24,v26
	vsetivli	zero,8,e16,mf2,ta,ma
	vnsrl.wi	v27,v24,0
	vnsrl.wi	v24,v24,16
	ld	t4,16(a5)
	vwadd.vv	v26,v27,v24
	ld	t1,48(a5)
	vsetvli	zero,zero,e32,m1,ta,ma
	ld	a7,80(a5)
	vfcvt.f.x.v	v24,v26
	ld	a0,112(a5)
	vfmul.vf	v24,v24,fa2
	vfmacc.vv	v12,v24,v8
	vsetvli	zero,zero,e64,m2,ta,ma
	vmv.v.x	v14,a0
	vmv.v.x	v0,t4
	vmv.v.x	v22,t1
	vmv.v.x	v20,a7
	vsetvli	zero,a4,e8,m2,ta,ma
	vwmul.vv	v24,v16,v0
	vwmacc.vv	v24,v18,v22
	vwmacc.vv	v24,v28,v20
	vwmacc.vv	v24,v30,v14
	vsetvli	zero,a3,e16,m2,ta,ma
	vnsrl.wi	v14,v24,0
	vnsrl.wi	v24,v24,16
	vadd.vv	v26,v14,v24
	vsetivli	zero,16,e16,m1,ta,ma
	vnsrl.wi	v24,v26,0
	vnsrl.wi	v26,v26,16
	vadd.vv	v24,v24,v26
	vsetivli	zero,8,e16,mf2,ta,ma
	vnsrl.wi	v27,v24,0
	vnsrl.wi	v24,v24,16
	ld	t4,24(a5)
	vwadd.vv	v26,v27,v24
	ld	t1,56(a5)
	vsetvli	zero,zero,e32,m1,ta,ma
	ld	a7,88(a5)
	vfcvt.f.x.v	v24,v26
	ld	a0,120(a5)
	vfmul.vf	v24,v24,fa3
	vfmacc.vv	v11,v24,v8
	vsetvli	zero,zero,e64,m2,ta,ma
	vmv.v.x	v14,a0
	vmv.v.x	v0,t4
	vmv.v.x	v22,t1
	vmv.v.x	v20,a7
	vsetvli	zero,a4,e8,m2,ta,ma
	vwmul.vv	v24,v16,v0
	vwmacc.vv	v24,v18,v22
	vwmacc.vv	v24,v28,v20
	vwmacc.vv	v24,v30,v14
	vsetvli	zero,a3,e16,m2,ta,ma
	vnsrl.wi	v14,v24,0
	vnsrl.wi	v24,v24,16
	vadd.vv	v26,v14,v24
	vsetivli	zero,16,e16,m1,ta,ma
	vnsrl.wi	v24,v26,0
	vnsrl.wi	v26,v26,16
	vadd.vv	v24,v24,v26
	vsetivli	zero,8,e16,mf2,ta,ma
	vnsrl.wi	v27,v24,0
	vnsrl.wi	v24,v24,16
	ld	t4,32(a5)
	vwadd.vv	v26,v27,v24
	ld	t1,64(a5)
	vsetvli	zero,zero,e32,m1,ta,ma
	ld	a7,96(a5)
	vfcvt.f.x.v	v24,v26
	ld	a0,128(a5)
	vfmul.vf	v24,v24,fa4
	vfmacc.vv	v10,v24,v8
	vsetvli	zero,zero,e64,m2,ta,ma
	vmv.v.x	v0,t4
	vmv.v.x	v22,t1
	vmv.v.x	v20,a7
	vmv.v.x	v14,a0
	vsetvli	zero,a4,e8,m2,ta,ma
	vwmul.vv	v24,v16,v0
	vwmacc.vv	v24,v18,v22
	vwmacc.vv	v24,v28,v20
	vwmacc.vv	v24,v30,v14
	vsetvli	zero,a3,e16,m2,ta,ma
	vnsrl.wi	v28,v24,0
	vnsrl.wi	v24,v24,16
	vadd.vv	v26,v28,v24
	vsetivli	zero,16,e16,m1,ta,ma
	addiw	s11,s11,1
	vnsrl.wi	v24,v26,0
	vnsrl.wi	v26,v26,16
	vadd.vv	v24,v24,v26
	vsetivli	zero,8,e16,mf2,ta,ma
	vnsrl.wi	v27,v24,0
	vnsrl.wi	v24,v24,16
	addi	a1,a1,144
	vwadd.vv	v26,v27,v24
	addi	a5,a5,136
	vsetvli	zero,zero,e32,m1,ta,ma
	vfcvt.f.x.v	v24,v26
	vfmul.vf	v24,v24,fa5
	vfmacc.vv	v9,v24,v8
	bgt	s4,s11,.L31
	ld	s7,0(sp)
	ld	s8,8(sp)
	vmv1r.v	v25,v13
.L30:
	ld	a5,48(sp)
	addiw	s7,s7,1
	add	s8,s8,t3
	add	a0,a5,s6
	ld	a5,24(sp)
	add	a1,a5,s6
	ld	a5,16(sp)
	vse32.v	v12,0(s6)
	vse32.v	v11,0(a0)
	add	a5,a5,s6
	vse32.v	v10,0(a1)
	vse32.v	v9,0(a5)
	ld	a5,40(sp)
	addi	s6,s6,32
	blt	s7,a5,.L32
	ld	a0,88(sp)
	ld	a1,72(sp)
	ld	a5,64(sp)
	ld	t4,56(sp)
	ld	s11,32(sp)
	add	a1,a1,a0
	ld	a0,80(sp)
	addiw	a5,a5,1
	mv	t5,s0
	add	s1,t4,s0
	add	s11,s11,t0
	bgt	a0,a5,.L33
	ld	s1,232(sp)
	.cfi_restore 9
	ld	s2,224(sp)
	.cfi_restore 18
	ld	s3,216(sp)
	.cfi_restore 19
	ld	s4,208(sp)
	.cfi_restore 20
	ld	s5,200(sp)
	.cfi_restore 21
	ld	s6,192(sp)
	.cfi_restore 22
	ld	s7,184(sp)
	.cfi_restore 23
	ld	s8,176(sp)
	.cfi_restore 24
	ld	s9,168(sp)
	.cfi_restore 25
	ld	s10,160(sp)
	.cfi_restore 26
	ld	s11,152(sp)
	.cfi_restore 27
.L22:
	la	a5,__stack_chk_guard
	ld	a4, 136(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L41
	ld	ra,248(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,240(sp)
	.cfi_restore 8
	addi	sp,sp,256
	.cfi_def_cfa_offset 0
	jr	ra
.L26:
	.cfi_restore_state
	la	s0,__stack_chk_guard
	ld	t1, 136(sp)
	ld	a7, 0(s0)
	xor	a7, t1, a7
	li	t1, 0
	bne	a7,zero,.L41
	ld	s0,240(sp)
	.cfi_restore 8
	ld	ra,248(sp)
	.cfi_restore 1
	addi	sp,sp,256
	.cfi_def_cfa_offset 0
	tail	ggml_gemm_q4_0_8x8_q8_0_generic@plt
.L40:
	.cfi_def_cfa_offset 256
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 20, -48
	ld	s4,208(sp)
	.cfi_restore 20
	j	.L22
.L44:
	lla	a3,.LC4
	li	a2,126
	lla	a1,.LC1
	lla	a0,.LC3
	sd	s1,232(sp)
	sd	s2,224(sp)
	sd	s3,216(sp)
	sd	s4,208(sp)
	sd	s5,200(sp)
	sd	s6,192(sp)
	sd	s7,184(sp)
	sd	s8,176(sp)
	sd	s9,168(sp)
	sd	s10,160(sp)
	sd	s11,152(sp)
	.cfi_remember_state
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L43:
	.cfi_restore_state
	lla	a3,.LC4
	li	a2,125
	lla	a1,.LC1
	lla	a0,.LC5
	sd	s1,232(sp)
	sd	s2,224(sp)
	sd	s3,216(sp)
	sd	s4,208(sp)
	sd	s5,200(sp)
	sd	s6,192(sp)
	sd	s7,184(sp)
	sd	s8,176(sp)
	sd	s9,168(sp)
	sd	s10,160(sp)
	sd	s11,152(sp)
	.cfi_remember_state
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L42:
	.cfi_restore_state
	lla	a3,.LC4
	li	a2,124
	lla	a1,.LC1
	lla	a0,.LC2
	sd	s1,232(sp)
	sd	s2,224(sp)
	sd	s3,216(sp)
	sd	s4,208(sp)
	sd	s5,200(sp)
	sd	s6,192(sp)
	sd	s7,184(sp)
	sd	s8,176(sp)
	sd	s9,168(sp)
	sd	s10,160(sp)
	sd	s11,152(sp)
	.cfi_remember_state
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L41:
	.cfi_restore_state
	sd	s1,232(sp)
	sd	s2,224(sp)
	sd	s3,216(sp)
	sd	s4,208(sp)
	sd	s5,200(sp)
	sd	s6,192(sp)
	sd	s7,184(sp)
	sd	s8,176(sp)
	sd	s9,168(sp)
	sd	s10,160(sp)
	sd	s11,152(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__stack_chk_fail@plt
	.cfi_endproc
.LFE2020:
	.size	ggml_gemm_q4_0_8x8_q8_0, .-ggml_gemm_q4_0_8x8_q8_0
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
