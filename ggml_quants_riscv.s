	.file	"quants.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC4:
	.string	"/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c"
	.align	3
.LC5:
	.string	"k % QK8_0 == 0"
	.text
	.align	1
	.globl	quantize_row_q8_0
	.type	quantize_row_q8_0, @function
quantize_row_q8_0:
.LFB89:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	la	t0,__stack_chk_guard
	ld	a5, 0(t0)
	sd	a5, 8(sp)
	li	a5, 0
	sd	ra,40(sp)
	andi	a5,a2,31
	.cfi_offset 1, -8
	bne	a5,zero,.L15
	srai	a6,a2,63
	andi	a6,a6,31
	add	a6,a6,a2
	srai	a6,a6,5
	sext.w	a5,a6
	ble	a5,zero,.L1
	addiw	a6,a6,-1
	slli	a5,a6,32
	fmv.s.x	fa2,zero
	srli	a6,a5,25
	li	t5,32768
	addi	a5,a0,128
	li	t4,32768
	li	t3,4096
	add	a6,a6,a5
	sd	s0,32(sp)
	li	a2,32
	sd	s1,24(sp)
	addi	a1,a1,2
	flw	fa3,.LC6,a5
	flw	ft0,.LC7,a5
	li	t1,32768
	li	a7,-16777216
	addi	t5,t5,-512
	flw	fa0,.LC8,a5
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	li	s0,-16777216
	li	t2,1895825408
	li	t6,125829120
	flw	fa1,.LC9,a5
	addi	t4,t4,-1024
	addi	t3,t3,-1
	vsetvli	zero,a2,e32,m1,ta,ma
	vmv.v.i	v8,0
.L9:
	vsetvli	zero,a2,e32,m8,ta,ma
	vle32.v	v24,0(a0)
	vfabs.v	v16,v24
	vfredmax.vs	v16,v16,v8
	vfmv.f.s	fa5,v16
	fdiv.s	fa5,fa5,fa3
	fmv.s.x	fa4,zero
	feq.s	a4,fa5,fa2
	fmv.x.s	a5,fa5
	bne	a4,zero,.L4
	fdiv.s	fa4,ft0,fa5
.L4:
	srliw	a4,a5,16
	slliw	a3,a5,1
	and	a4,a4,t1
	slli	a4,a4,48
	sext.w	s1,a3
	srli	a4,a4,48
	bgtu	s1,a7,.L5
	fmv.s.x	fa5,a5
	and	a3,a3,s0
	sext.w	a5,a3
	fabs.s	fa5,fa5
	fmul.s	fa5,fa5,fa0
	bgeu	a5,t2,.L6
	li	a3,1895825408
.L6:
	srliw	a3,a3,1
	addw	a3,a3,t6
	fmv.s.x	ft1,a3
	vfmul.vf	v24,v24,fa4
	vsetvli	zero,zero,e16,m4,ta,ma
	fmadd.s	fa5,fa5,fa1,ft1
	vfncvt.x.f.w	v24,v24
	addi	a0,a0,128
	vsetvli	zero,zero,e8,m2,ta,ma
	vncvt.x.x.w	v24,v24
	fmv.x.s	a5,fa5
	vse8.v	v24,0(a1)
	addi	a1,a1,34
	srliw	a3,a5,13
	and	a3,a3,t4
	and	a5,t3,a5
	addw	a5,a5,a3
	or	a4,a4,a5
	sh	a4,-36(a1)
	bne	a6,a0,.L9
.L13:
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
.L1:
	ld	a4, 8(sp)
	ld	a5, 0(t0)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L16
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L5:
	.cfi_def_cfa_offset 48
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	vfmul.vf	v24,v24,fa4
	or	a4,a4,t5
	vsetvli	zero,zero,e16,m4,ta,ma
	sh	a4,-2(a1)
	vfncvt.x.f.w	v24,v24
	addi	a0,a0,128
	vsetvli	zero,zero,e8,m2,ta,ma
	vncvt.x.x.w	v24,v24
	vse8.v	v24,0(a1)
	addi	a1,a1,34
	bne	a6,a0,.L9
	j	.L13
.L15:
	.cfi_restore 8
	.cfi_restore 9
	lla	a3,.LANCHOR0
	li	a2,28
	lla	a1,.LC4
	lla	a0,.LC5
	sd	s0,32(sp)
	sd	s1,24(sp)
	.cfi_remember_state
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	call	__assert_fail@plt
.L16:
	.cfi_restore_state
	sd	s0,32(sp)
	sd	s1,24(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	call	__stack_chk_fail@plt
	.cfi_endproc
.LFE89:
	.size	quantize_row_q8_0, .-quantize_row_q8_0
	.section	.rodata.str1.8
	.align	3
.LC10:
	.string	"k % QK8_1 == 0"
	.text
	.align	1
	.globl	quantize_row_q8_1
	.type	quantize_row_q8_1, @function
quantize_row_q8_1:
.LFB90:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	la	t6,__stack_chk_guard
	ld	a5, 0(t6)
	sd	a5, 8(sp)
	li	a5, 0
	sd	ra,40(sp)
	andi	a5,a2,31
	.cfi_offset 1, -8
	bne	a5,zero,.L33
	srai	a5,a2,63
	andi	a5,a5,31
	add	a5,a5,a2
	srai	a5,a5,5
	sext.w	a4,a5
	ble	a4,zero,.L17
	addiw	a5,a5,-1
	slli	a4,a5,32
	srli	a5,a4,25
	fmv.s.x	fa0,zero
	li	a4,32
	vsetvli	zero,a4,e32,m1,ta,ma
	addi	a3,a0,128
	li	t1,32768
	li	t4,32768
	li	t3,4096
	addi	a2,a1,4
	vmv.v.i	v17,0
	add	a1,a5,a3
	vsetvli	zero,a4,e16,m1,ta,ma
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	flw	fa1,.LC6,a5
	flw	ft0,.LC7,a5
	li	a7,32768
	li	a6,-16777216
	addi	t1,t1,-512
	flw	fa2,.LC8,a5
	li	t2,-16777216
	li	t0,1895825408
	li	t5,125829120
	flw	fa3,.LC9,a5
	addi	t4,t4,-1024
	addi	t3,t3,-1
	vmv.v.i	v16,0
	vsetvli	zero,a4,e32,m8,ta,ma
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
.L27:
	vle32.v	v24,0(a0)
	vfabs.v	v8,v24
	vfredmax.vs	v8,v8,v17
	vfmv.f.s	fa5,v8
	fdiv.s	fa5,fa5,fa1
	fmv.s.x	fa4,zero
	feq.s	a5,fa5,fa0
	fmv.x.s	a3,fa5
	bne	a5,zero,.L20
	fdiv.s	fa4,ft0,fa5
.L20:
	srliw	a5,a3,16
	and	a5,a5,a7
	slliw	s0,a3,1
	slli	s1,a5,48
	sext.w	s2,s0
	srli	s1,s1,48
	mv	a5,t1
	bgtu	s2,a6,.L21
	fmv.s.x	fa5,a3
	and	s0,s0,t2
	sext.w	a5,s0
	fabs.s	fa5,fa5
	fmul.s	fa5,fa5,fa2
	bgeu	a5,t0,.L22
	li	s0,1895825408
.L22:
	srliw	s0,s0,1
	addw	s0,s0,t5
	fmv.s.x	ft1,s0
	fmadd.s	fa5,fa5,fa3,ft1
	fmv.x.s	a5,fa5
	srliw	s0,a5,13
	and	s0,s0,t4
	and	a5,t3,a5
	addw	a5,a5,s0
	slli	a5,a5,48
	srli	a5,a5,48
.L21:
	vfmul.vf	v24,v24,fa4
	vsetvli	zero,zero,e16,m4,ta,ma
	vfncvt.x.f.w	v24,v24
	vsetvli	zero,zero,e8,m2,ta,ma
	vncvt.x.x.w	v24,v24
	vwredsum.vs	v26,v24,v16
	vsetvli	zero,zero,e16,m4,ta,ma
	vmv.x.s	s0,v26
	slliw	s0,s0,16
	sraiw	s0,s0,16
	fcvt.s.w	fa5,s0
	fmv.s.x	fa4,a3
	or	a5,s1,a5
	sh	a5,-4(a2)
	fmul.s	fa5,fa5,fa4
	vse8.v	v24,0(a2)
	fmv.x.s	a5,fa5
	srliw	a3,a5,16
	slliw	s0,a5,1
	and	a3,a3,a7
	slli	a3,a3,48
	sext.w	s1,s0
	srli	a3,a3,48
	bgtu	s1,a6,.L23
	fabs.s	fa5,fa5
	and	s0,s0,t2
	sext.w	a5,s0
	fmul.s	fa5,fa5,fa2
	vsetvli	zero,zero,e32,m8,ta,ma
	bgeu	a5,t0,.L24
	li	s0,1895825408
.L24:
	srliw	s0,s0,1
	addw	s0,s0,t5
	fmv.s.x	fa4,s0
	addi	a2,a2,36
	addi	a0,a0,128
	fmadd.s	fa5,fa5,fa3,fa4
	fmv.x.s	a5,fa5
	srliw	s0,a5,13
	and	s0,s0,t4
	and	a5,t3,a5
	addw	a5,a5,s0
	or	a3,a3,a5
	sh	a3,-38(a2)
	bne	a0,a1,.L27
.L32:
	ld	s0,32(sp)
	.cfi_restore 8
	ld	s1,24(sp)
	.cfi_restore 9
	ld	s2,16(sp)
	.cfi_restore 18
.L17:
	ld	a4, 8(sp)
	ld	a5, 0(t6)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L34
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L23:
	.cfi_def_cfa_offset 48
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	or	a3,a3,t1
	sh	a3,-2(a2)
	addi	a0,a0,128
	addi	a2,a2,36
	vsetvli	zero,zero,e32,m8,ta,ma
	bne	a1,a0,.L27
	j	.L32
.L33:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	lla	a3,.LANCHOR0+24
	li	a2,68
	lla	a1,.LC4
	lla	a0,.LC10
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	.cfi_remember_state
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	call	__assert_fail@plt
.L34:
	.cfi_restore_state
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	call	__stack_chk_fail@plt
	.cfi_endproc
.LFE90:
	.size	quantize_row_q8_1, .-quantize_row_q8_1
	.section	.rodata.str1.8
	.align	3
.LC11:
	.string	"n % qk == 0"
	.align	3
.LC12:
	.string	"nrc == 1"
	.text
	.align	1
	.globl	ggml_vec_dot_q4_0_q8_0
	.type	ggml_vec_dot_q4_0_q8_0, @function
ggml_vec_dot_q4_0_q8_0:
.LFB91:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sraiw	t1,a0,31
	la	t3,__stack_chk_guard
	srliw	t1,t1,27
	sd	ra,24(sp)
	.cfi_offset 1, -8
	ld	a4, 0(t3)
	sd	a4, 8(sp)
	li	a4, 0
	andi	a6,a0,31
	addw	t1,t1,a0
	vsetivli	zero,16,e32,m1,ta,ma
	bne	a6,zero,.L44
	li	a4,1
	bne	a7,a4,.L37
	li	a4,31
	fmv.s.x	fa4,zero
	ble	a0,a4,.L39
	fmv.s.x	fa4,zero
	sraiw	t1,t1,5
	addi	a3,a3,2
	addi	a5,a5,2
	la	a0,ggml_table_f32_f16
	vmv.v.i	v30,0
.L40:
	lhu	a2,-2(a3)
	vsetivli	zero,16,e8,m1,ta,ma
	addi	a7,a5,16
	slli	a2,a2,2
	vle8.v	v24,0(a3)
	vle8.v	v29,0(a5)
	vand.vi	v25,v24,15
	vle8.v	v28,0(a7)
	vsrl.vi	v24,v24,4
	vadd.vi	v25,v25,-8
	vadd.vi	v24,v24,-8
	vwmul.vv	v26,v25,v29
	add	a2,a0,a2
	vwmacc.vv	v26,v24,v28
	vsetvli	zero,zero,e16,m2,ta,ma
	flw	fa3,0(a2)
	lhu	a4,-2(a5)
	vwredsum.vs	v24,v26,v30
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a2,v24
	fcvt.s.w	fa5,a2
	slli	a4,a4,2
	add	a4,a0,a4
	fmul.s	fa5,fa5,fa3
	flw	fa3,0(a4)
	addiw	a6,a6,1
	addi	a3,a3,18
	addi	a5,a5,34
	fmadd.s	fa4,fa5,fa3,fa4
	bgt	t1,a6,.L40
.L39:
	fsw	fa4,0(a1)
	ld	a4, 8(sp)
	ld	a5, 0(t3)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L45
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L44:
	.cfi_restore_state
	lla	a3,.LANCHOR0+48
	li	a2,123
	lla	a1,.LC4
	lla	a0,.LC11
	call	__assert_fail@plt
.L45:
	call	__stack_chk_fail@plt
.L37:
	lla	a3,.LANCHOR0+48
	li	a2,124
	lla	a1,.LC4
	lla	a0,.LC12
	call	__assert_fail@plt
	.cfi_endproc
.LFE91:
	.size	ggml_vec_dot_q4_0_q8_0, .-ggml_vec_dot_q4_0_q8_0
	.align	1
	.globl	ggml_vec_dot_q4_1_q8_1
	.type	ggml_vec_dot_q4_1_q8_1, @function
ggml_vec_dot_q4_1_q8_1:
.LFB92:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sraiw	t4,a0,31
	la	t3,__stack_chk_guard
	srliw	t4,t4,27
	sd	ra,24(sp)
	.cfi_offset 1, -8
	ld	a4, 0(t3)
	sd	a4, 8(sp)
	li	a4, 0
	andi	t1,a0,31
	addw	t4,t4,a0
	vsetivli	zero,16,e32,m1,ta,ma
	bne	t1,zero,.L55
	li	a4,1
	bne	a7,a4,.L48
	li	a4,31
	fmv.s.x	fa3,zero
	ble	a0,a4,.L50
	fmv.s.x	fa3,zero
	sraiw	t4,t4,5
	addi	a3,a3,4
	addi	a5,a5,4
	la	a7,ggml_table_f32_f16
	vmv.v.i	v30,0
.L51:
	lhu	a6,-4(a5)
	lhu	a0,-4(a3)
	lhu	a2,-2(a3)
	lhu	a4,-2(a5)
	slli	a6,a6,2
	slli	a0,a0,2
	slli	a2,a2,2
	slli	a4,a4,2
	add	a4,a7,a4
	add	a6,a7,a6
	add	a0,a7,a0
	add	a2,a7,a2
	flw	fa2,0(a4)
	flw	fa5,0(a6)
	flw	fa1,0(a0)
	flw	fa4,0(a2)
	vsetivli	zero,16,e8,m1,ta,ma
	addi	a4,a5,16
	vle8.v	v24,0(a3)
	fmul.s	fa4,fa4,fa2
	fmul.s	fa5,fa5,fa1
	vsrl.vi	v26,v24,4
	vle8.v	v28,0(a5)
	vle8.v	v27,0(a4)
	vand.vi	v29,v24,15
	vwmul.vv	v24,v29,v28
	vwmacc.vv	v24,v26,v27
	vsetvli	zero,zero,e16,m2,ta,ma
	vwredsum.vs	v26,v24,v30
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a4,v26
	fcvt.s.w	fa2,a4
	addiw	t1,t1,1
	addi	a3,a3,20
	fmadd.s	fa5,fa5,fa2,fa4
	addi	a5,a5,36
	fadd.s	fa3,fa3,fa5
	bgt	t4,t1,.L51
.L50:
	fsw	fa3,0(a1)
	ld	a4, 8(sp)
	ld	a5, 0(t3)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L56
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L55:
	.cfi_restore_state
	lla	a3,.LANCHOR0+72
	li	a2,178
	lla	a1,.LC4
	lla	a0,.LC11
	call	__assert_fail@plt
.L56:
	call	__stack_chk_fail@plt
.L48:
	lla	a3,.LANCHOR0+72
	li	a2,179
	lla	a1,.LC4
	lla	a0,.LC12
	call	__assert_fail@plt
	.cfi_endproc
.LFE92:
	.size	ggml_vec_dot_q4_1_q8_1, .-ggml_vec_dot_q4_1_q8_1
	.align	1
	.globl	ggml_vec_dot_q5_0_q8_0
	.type	ggml_vec_dot_q5_0_q8_0, @function
ggml_vec_dot_q5_0_q8_0:
.LFB93:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sraiw	t3,a0,31
	la	t1,__stack_chk_guard
	srliw	t3,t3,27
	sd	ra,24(sp)
	.cfi_offset 1, -8
	ld	a4, 0(t1)
	sd	a4, 8(sp)
	li	a4, 0
	andi	a6,a0,31
	addw	t3,t3,a0
	bne	a6,zero,.L70
	li	a4,1
	bne	a7,a4,.L71
	li	a4,31
	csrr	a2,vlenb
	ble	a0,a4,.L66
	li	a0,32
	li	a4,16
	vsetvli	zero,a0,e32,m1,ta,ma
	fmv.s.x	fa4,zero
	sraiw	t3,t3,5
	addi	a3,a3,6
	addi	a5,a5,2
	vmv.v.i	v8,0
	beq	a2,a4,.L61
	la	a7,ggml_table_f32_f16
	li	a4,32
	vsetivli	zero,16,e8,m1,ta,ma
.L62:
	lhu	a0,-6(a3)
	lhu	a2,-2(a5)
	vle8.v	v25,0(a3)
	slli	a0,a0,2
	slli	a2,a2,2
	add	a2,a7,a2
	vsetvli	zero,a4,e8,m2,ta,ma
	add	a0,a7,a0
	flw	fa3,0(a2)
	vle8.v	v26,0(a5)
	flw	fa5,0(a0)
	vsetivli	zero,16,e8,m1,ta,ma
	addi	t4,a3,-4
	vand.vi	v24,v25,15
	vsrl.vi	v25,v25,4
	vsetvli	zero,a4,e8,m2,ta,ma
	vlm.v	v0,0(t4)
	vsetvli	zero,a4,e8,m1,ta,ma
	fmul.s	fa5,fa5,fa3
	vslideup.vi	v24,v25,16
	vsetvli	zero,a4,e8,m2,ta,mu
	vmnot.m	v0,v0
	vadd.vi	v24,v24,-16,v0.t
	vwmul.vv	v28,v24,v26
	vsetvli	zero,zero,e16,m4,ta,ma
	vwredsum.vs	v24,v28,v8
	vsetivli	zero,16,e32,m4,ta,ma
	vmv.x.s	a2,v24
	fcvt.s.w	fa3,a2
	addiw	a6,a6,1
	addi	a3,a3,22
	fmadd.s	fa4,fa5,fa3,fa4
	addi	a5,a5,34
	bgt	t3,a6,.L62
.L60:
	fsw	fa4,0(a1)
	ld	a4, 8(sp)
	ld	a5, 0(t1)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L72
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L61:
	.cfi_restore_state
	la	a7,ggml_table_f32_f16
	li	a4,32
	vsetivli	zero,16,e8,m1,ta,ma
.L64:
	lhu	a0,-2(a5)
	lhu	a2,-6(a3)
	vle8.v	v26,0(a3)
	slli	a0,a0,2
	slli	a2,a2,2
	vsetvli	zero,a4,e8,m2,ta,ma
	addi	t4,a3,-4
	add	a2,a7,a2
	add	a0,a7,a0
	flw	fa3,0(a2)
	vle8.v	v10,0(a5)
	vlm.v	v0,0(t4)
	flw	fa5,0(a0)
	vsetivli	zero,16,e8,m1,ta,ma
	vand.vi	v24,v26,15
	vsetvli	zero,a4,e8,m2,ta,ma
	vmnot.m	v0,v0
	vsetivli	zero,16,e8,m1,ta,ma
	fmul.s	fa5,fa5,fa3
	vsrl.vi	v25,v26,4
	vsetvli	zero,a4,e8,m2,ta,mu
	vadd.vi	v24,v24,-16,v0.t
	vwmul.vv	v28,v24,v10
	vsetvli	zero,zero,e16,m4,ta,ma
	vwredsum.vs	v24,v28,v8
	vsetivli	zero,16,e32,m4,ta,ma
	vmv.x.s	a2,v24
	fcvt.s.w	fa3,a2
	addiw	a6,a6,1
	addi	a3,a3,22
	fmadd.s	fa4,fa5,fa3,fa4
	addi	a5,a5,34
	bgt	t3,a6,.L64
	j	.L60
.L66:
	fmv.s.x	fa4,zero
	j	.L60
.L72:
	call	__stack_chk_fail@plt
.L71:
	lla	a3,.LANCHOR0+96
	li	a2,234
	lla	a1,.LC4
	lla	a0,.LC12
	call	__assert_fail@plt
.L70:
	lla	a3,.LANCHOR0+96
	li	a2,232
	lla	a1,.LC4
	lla	a0,.LC11
	call	__assert_fail@plt
	.cfi_endproc
.LFE93:
	.size	ggml_vec_dot_q5_0_q8_0, .-ggml_vec_dot_q5_0_q8_0
	.align	1
	.globl	ggml_vec_dot_q5_1_q8_1
	.type	ggml_vec_dot_q5_1_q8_1, @function
ggml_vec_dot_q5_1_q8_1:
.LFB94:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sraiw	t5,a0,31
	la	t3,__stack_chk_guard
	srliw	t5,t5,27
	sd	ra,24(sp)
	.cfi_offset 1, -8
	ld	a4, 0(t3)
	sd	a4, 8(sp)
	li	a4, 0
	andi	t4,a0,31
	addw	t5,t5,a0
	bne	t4,zero,.L86
	li	a4,1
	bne	a7,a4,.L87
	li	a4,31
	csrr	a2,vlenb
	ble	a0,a4,.L82
	li	a0,32
	li	a4,16
	vsetvli	zero,a0,e32,m1,ta,ma
	fmv.s.x	fa3,zero
	sraiw	t5,t5,5
	addi	a3,a3,8
	addi	a5,a5,4
	vmv.v.i	v8,0
	beq	a2,a4,.L77
	la	a4,ggml_table_f32_f16
	li	a2,32
	li	t6,16
	vsetivli	zero,16,e8,m1,ta,ma
.L78:
	lhu	t1,-8(a3)
	lhu	a7,-4(a5)
	lhu	a6,-6(a3)
	lhu	a0,-2(a5)
	slli	t1,t1,2
	slli	a7,a7,2
	slli	a6,a6,2
	slli	a0,a0,2
	vle8.v	v25,0(a3)
	add	a0,a4,a0
	vsetvli	zero,a2,e8,m2,ta,ma
	add	t1,a4,t1
	add	a7,a4,a7
	add	a6,a4,a6
	flw	fa2,0(a0)
	vle8.v	v26,0(a5)
	flw	fa5,0(t1)
	vsetivli	zero,16,e8,m1,ta,ma
	flw	fa1,0(a7)
	flw	fa4,0(a6)
	addi	a0,a3,-4
	vand.vi	v24,v25,15
	vsrl.vi	v25,v25,4
	vsetvli	zero,a2,e8,m2,ta,ma
	vlm.v	v0,0(a0)
	vsetvli	zero,a2,e8,m1,ta,ma
	fmul.s	fa4,fa4,fa2
	vslideup.vi	v24,v25,16
	fmul.s	fa5,fa5,fa1
	vsetvli	zero,a2,e8,m2,ta,mu
	vor.vx	v24,v24,t6,v0.t
	vwmul.vv	v28,v24,v26
	vsetvli	zero,zero,e16,m4,ta,ma
	vwredsum.vs	v24,v28,v8
	vsetivli	zero,16,e32,m4,ta,ma
	vmv.x.s	a0,v24
	fcvt.s.w	fa2,a0
	addiw	t4,t4,1
	addi	a3,a3,24
	fmadd.s	fa5,fa5,fa2,fa4
	addi	a5,a5,36
	fadd.s	fa3,fa3,fa5
	bgt	t5,t4,.L78
.L76:
	fsw	fa3,0(a1)
	ld	a4, 8(sp)
	ld	a5, 0(t3)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L88
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L77:
	.cfi_restore_state
	la	a4,ggml_table_f32_f16
	li	t1,32
	li	t6,16
	vsetivli	zero,16,e8,m1,ta,ma
.L80:
	lhu	a7,-4(a5)
	lhu	a6,-8(a3)
	lhu	a0,-6(a3)
	lhu	a2,-2(a5)
	slli	a7,a7,2
	slli	a6,a6,2
	slli	a0,a0,2
	slli	a2,a2,2
	add	a2,a4,a2
	add	a7,a4,a7
	add	a6,a4,a6
	add	a0,a4,a0
	flw	fa2,0(a2)
	flw	fa5,0(a7)
	flw	fa1,0(a6)
	flw	fa4,0(a0)
	vle8.v	v26,0(a3)
	addi	a2,a3,-4
	vsetvli	zero,t1,e8,m2,ta,ma
	vle8.v	v10,0(a5)
	vlm.v	v0,0(a2)
	vsetivli	zero,16,e8,m1,ta,ma
	fmul.s	fa4,fa4,fa2
	vand.vi	v24,v26,15
	vsrl.vi	v25,v26,4
	fmul.s	fa5,fa5,fa1
	vsetvli	zero,t1,e8,m2,ta,mu
	vor.vx	v24,v24,t6,v0.t
	vwmul.vv	v28,v24,v10
	vsetvli	zero,zero,e16,m4,ta,ma
	vwredsum.vs	v24,v28,v8
	vsetivli	zero,16,e32,m4,ta,ma
	vmv.x.s	a2,v24
	fcvt.s.w	fa2,a2
	addiw	t4,t4,1
	addi	a3,a3,24
	fmadd.s	fa5,fa5,fa2,fa4
	addi	a5,a5,36
	fadd.s	fa3,fa3,fa5
	bgt	t5,t4,.L80
	j	.L76
.L82:
	fmv.s.x	fa3,zero
	j	.L76
.L88:
	call	__stack_chk_fail@plt
.L87:
	lla	a3,.LANCHOR0+120
	li	a2,288
	lla	a1,.LC4
	lla	a0,.LC12
	call	__assert_fail@plt
.L86:
	lla	a3,.LANCHOR0+120
	li	a2,286
	lla	a1,.LC4
	lla	a0,.LC11
	call	__assert_fail@plt
	.cfi_endproc
.LFE94:
	.size	ggml_vec_dot_q5_1_q8_1, .-ggml_vec_dot_q5_1_q8_1
	.align	1
	.globl	ggml_vec_dot_q8_0_q8_0
	.type	ggml_vec_dot_q8_0_q8_0, @function
ggml_vec_dot_q8_0_q8_0:
.LFB95:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sraiw	t1,a0,31
	la	t3,__stack_chk_guard
	srliw	t1,t1,27
	sd	ra,24(sp)
	.cfi_offset 1, -8
	ld	a4, 0(t3)
	sd	a4, 8(sp)
	li	a4, 0
	andi	a6,a0,31
	addw	t1,t1,a0
	bne	a6,zero,.L98
	li	a4,1
	bne	a7,a4,.L91
	li	a4,31
	fmv.s.x	fa4,zero
	ble	a0,a4,.L93
	fmv.s.x	fa4,zero
	li	a4,32
	sraiw	t1,t1,5
	addi	a3,a3,2
	addi	a5,a5,2
	la	a7,ggml_table_f32_f16
	li	a0,32
	vsetvli	zero,a4,e32,m1,ta,ma
	vmv.v.i	v8,0
.L94:
	lhu	a2,-2(a5)
	lhu	a4,-2(a3)
	vsetvli	zero,a0,e8,m2,ta,ma
	slli	a2,a2,2
	slli	a4,a4,2
	add	a4,a7,a4
	add	a2,a7,a2
	flw	fa3,0(a4)
	flw	fa5,0(a2)
	vle8.v	v24,0(a5)
	vle8.v	v26,0(a3)
	fmul.s	fa5,fa5,fa3
	vwmul.vv	v28,v26,v24
	vsetvli	zero,zero,e16,m4,ta,ma
	vwredsum.vs	v24,v28,v8
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a4,v24
	fcvt.s.w	fa3,a4
	addiw	a6,a6,1
	addi	a3,a3,34
	fmadd.s	fa4,fa3,fa5,fa4
	addi	a5,a5,34
	bgt	t1,a6,.L94
.L93:
	fsw	fa4,0(a1)
	ld	a4, 8(sp)
	ld	a5, 0(t3)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L99
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L98:
	.cfi_restore_state
	lla	a3,.LANCHOR0+144
	li	a2,335
	lla	a1,.LC4
	lla	a0,.LC11
	call	__assert_fail@plt
.L99:
	call	__stack_chk_fail@plt
.L91:
	lla	a3,.LANCHOR0+144
	li	a2,336
	lla	a1,.LC4
	lla	a0,.LC12
	call	__assert_fail@plt
	.cfi_endproc
.LFE95:
	.size	ggml_vec_dot_q8_0_q8_0, .-ggml_vec_dot_q8_0_q8_0
	.section	.rodata.str1.8
	.align	3
.LC14:
	.string	"false && \"Unsupported vector length\""
	.text
	.align	1
	.globl	ggml_vec_dot_q2_K_q8_K
	.type	ggml_vec_dot_q2_K_q8_K, @function
ggml_vec_dot_q2_K_q8_K:
.LFB96:
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	la	t1,__stack_chk_guard
	ld	a4, 0(t1)
	sd	a4, 56(sp)
	li	a4, 0
	sd	ra,120(sp)
	li	a4,1
	.cfi_offset 1, -8
	bne	a7,a4,.L114
	lla	a4,.LANCHOR0
	ld	a2,216(a4)
	ld	t4,192(a4)
	ld	a7,200(a4)
	ld	a6,208(a4)
	sraiw	t3,a0,31
	srliw	t3,t3,24
	csrr	a4,vlenb
	addw	t3,t3,a0
	sd	a2,48(sp)
	slliw	a4,a4,3
	sd	t4,24(sp)
	sd	a7,32(sp)
	sd	a6,40(sp)
	li	a2,128
	sraiw	t3,t3,8
	beq	a4,a2,.L102
	li	a2,256
	bne	a4,a2,.L103
	li	a4,255
	ble	a0,a4,.L113
	li	a2,32
	fmv.s.x	fa5,zero
	vsetvli	zero,a2,e8,m1,ta,ma
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	addi	a0,sp,24
	vle8.v	v9,0(a0)
	addi	a4,a5,260
	vsetivli	zero,1,e32,m1,ta,ma
	li	a6,0
	la	t4,ggml_table_f32_f16
	li	a5,32
	vmv.v.i	v8,0
	vsetvli	zero,a2,e8,m1,ta,ma
	vmv.v.v	v16,v9
	vadd.vi	v15,v9,2
	vadd.vi	v14,v9,4
	vadd.vi	v13,v9,6
	vadd.vi	v12,v9,8
	vadd.vi	v11,v9,10
	vadd.vi	v10,v9,12
	vadd.vi	v9,v9,14
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
.L107:
	lhu	a0,82(a3)
	lhu	a2,80(a3)
	vsetivli	zero,16,e8,mf2,ta,ma
	flw	fa4,-260(a4)
	vle16.v	v27,0(a4)
	vle8.v	v24,0(a3)
	vsrl.vi	v24,v24,4
	vsetvli	zero,zero,e16,m1,ta,ma
	slli	a0,a0,2
	vzext.vf2	v26,v24
	slli	a2,a2,2
	vwmul.vv	v24,v27,v26
	vsetvli	zero,zero,e32,m2,ta,ma
	add	a0,t4,a0
	vredsum.vs	v24,v24,v8
	add	a2,t4,a2
	vsetvli	zero,a5,e32,m4,ta,ma
	addi	s2,a3,16
	addi	s1,a3,48
	vle8.v	v26,0(s2)
	vle8.v	v25,0(s1)
	flw	fa2,0(a0)
	fneg.s	fa3,fa4
	flw	fa1,0(a2)
	vmv.x.s	a2,v24
	vsetivli	zero,16,e8,m1,ta,ma
	vle8.v	v24,0(a3)
	vsetvli	zero,a5,e8,m1,ta,ma
	vand.vi	v18,v26,3
	vsetivli	zero,16,e8,m1,ta,ma
	fmul.s	fa3,fa3,fa2
	vand.vi	v24,v24,15
	fcvt.s.w	fa2,a2
	vsetvli	zero,a5,e8,m1,ta,ma
	addi	a2,a4,-160
	vrgather.vv	v31,v24,v15
	vrgather.vv	v30,v24,v14
	vrgather.vv	v29,v24,v13
	vsrl.vi	v28,v26,2
	vsrl.vi	v27,v26,4
	vand.vi	v28,v28,3
	vand.vi	v27,v27,3
	vsrl.vi	v26,v26,6
	addi	s0,a4,-256
	vand.vi	v26,v26,3
	addi	t2,a4,-224
	addi	t0,a4,-192
	vwmulu.vv	v2,v28,v31
	vwmulu.vv	v0,v27,v30
	vrgather.vv	v17,v24,v16
	vle8.v	v28,0(a2)
	vwmulu.vv	v6,v18,v17
	vle8.v	v27,0(t2)
	vwmulu.vv	v18,v26,v29
	vwcvt.x.x.v	v30,v27
	vle8.v	v29,0(s0)
	vle8.v	v26,0(t0)
	vwcvt.x.x.v	v4,v29
	vsetvli	zero,zero,e16,m2,ta,ma
	vwmul.vv	v20,v6,v4
	vwmul.vv	v4,v2,v30
	vsetvli	zero,zero,e8,m1,ta,ma
	vwcvt.x.x.v	v2,v26
	vwcvt.x.x.v	v26,v28
	vsetvli	zero,zero,e16,m2,ta,ma
	vwmul.vv	v28,v0,v2
	vwmul.vv	v0,v18,v26
	vsetvli	zero,zero,e32,m4,ta,ma
	vadd.vv	v28,v28,v0
	vadd.vv	v20,v20,v4
	vredsum.vs	v20,v20,v8
	vsetvli	zero,zero,e8,m1,ta,ma
	vand.vi	v17,v25,3
	vsetvli	zero,zero,e32,m4,ta,ma
	vredsum.vs	v28,v28,v20
	vsetvli	zero,zero,e8,m1,ta,ma
	vsrl.vi	v27,v25,2
	vsetivli	zero,0,e32,m1,ta,ma
	addi	t6,a4,-128
	vmv.x.s	a2,v28
	vsetvli	zero,a5,e8,m1,ta,ma
	vsrl.vi	v26,v25,4
	vand.vi	v26,v26,3
	vrgather.vv	v29,v24,v10
	vrgather.vv	v28,v24,v9
	vwmulu.vv	v22,v26,v29
	addi	a0,a4,-32
	vand.vi	v27,v27,3
	vle8.v	v26,0(t6)
	addi	t5,a4,-96
	addi	a7,a4,-64
	vsrl.vi	v25,v25,6
	vand.vi	v25,v25,3
	vrgather.vv	v31,v24,v12
	vrgather.vv	v30,v24,v11
	vwmulu.vv	v4,v25,v28
	vwmulu.vv	v18,v27,v30
	vle8.v	v24,0(a0)
	vwcvt.x.x.v	v20,v26
	vwmulu.vv	v0,v17,v31
	vle8.v	v28,0(t5)
	vle8.v	v25,0(a7)
	vwcvt.x.x.v	v26,v28
	vsetvli	zero,zero,e16,m2,ta,ma
	vwmul.vv	v28,v0,v20
	vwmul.vv	v0,v18,v26
	vsetvli	zero,zero,e8,m1,ta,ma
	fmadd.s	fa5,fa2,fa3,fa5
	vwcvt.x.x.v	v20,v25
	vwcvt.x.x.v	v18,v24
	fmul.s	fa4,fa4,fa1
	vsetvli	zero,zero,e16,m2,ta,ma
	vwmul.vv	v24,v22,v20
	vwmul.vv	v20,v4,v18
	vsetvli	zero,zero,e32,m4,ta,ma
	vadd.vv	v28,v28,v0
	vadd.vv	v24,v24,v20
	vredsum.vs	v28,v28,v8
	vredsum.vs	v24,v24,v28
	vmv.x.s	a0,v24
	addw	a2,a2,a0
	fcvt.s.w	fa3,a2
	addiw	a6,a6,1
	addi	a3,a3,84
	fmadd.s	fa5,fa3,fa4,fa5
	addi	a4,a4,292
	bgt	t3,a6,.L107
	ld	s0,112(sp)
	.cfi_restore 8
	ld	s1,104(sp)
	.cfi_restore 9
	ld	s2,96(sp)
	.cfi_restore 18
.L105:
	fsw	fa5,0(a1)
	ld	a4, 56(sp)
	ld	a5, 0(t1)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L115
	ld	ra,120(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
.L102:
	.cfi_restore_state
	li	a4,255
	ble	a0,a4,.L113
	fmv.s.x	fa5,zero
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	s5,72(sp)
	addi	a4,a5,260
	li	t5,0
	la	t4,ggml_table_f32_f16
	addi	a2,sp,8
	addi	a7,sp,16
	li	t6,0
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
.L108:
	lhu	a0,80(a3)
	lhu	a5,82(a3)
	flw	fa4,-260(a4)
	slli	a0,a0,2
	slli	a5,a5,2
	add	a0,t4,a0
	add	a5,t4,a5
	flw	fa1,0(a0)
	fneg.s	fa3,fa4
	flw	fa2,0(a5)
	fmul.s	fa4,fa4,fa1
	fmul.s	fa3,fa3,fa2
#APP
# 584 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	vsetivli zero, 16, e8, m1
	vmv.v.x v8, zero
	lb zero, 15(a3)
	vle8.v v1, (a3)
	vle8.v v2, (a4)
	addi a0, a4, 16
	vand.vi v0, v1, 0xF
	vsrl.vi v1, v1, 4
	vle8.v v3, (a0)
	vse8.v v0, (a2)
	vsetivli zero, 16, e16, m2
	vzext.vf2 v0, v1
	vwmul.vv v4, v0, v2
	vsetivli zero, 16, e32, m4
	vredsum.vs v8, v4, v8
	vmv.x.s a5, v8
# 0 "" 2
#NO_APP
	fcvt.s.w	fa2,a5
	addi	a0,a3,16
	addi	a6,a4,-256
	fmadd.s	fa5,fa2,fa3,fa5
	mv	a5,t6
#APP
# 613 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	lb zero, 31(a0)
	addi t0, a0, 16
	addi t2, a6, 16
	vsetivli zero, 16, e8, m1
	vle8.v v0, (a0)
	vle8.v v1, (t0)
	vsrl.vi v2, v0, 2
	vsrl.vi v3, v1, 2
	vsrl.vi v4, v0, 4
	addi t0, a6, 32
	vle8.v v8, (a6)
	vle8.v v9, (t2)
	addi t2, t2, 32
	vsrl.vi v5, v1, 4
	vsrl.vi v6, v0, 6
	vsrl.vi v7, v1, 6
	vle8.v v10, (t0)
	vle8.v v11, (t2)
	addi t0, t0, 32
	addi t2, t2, 32
	vand.vi v0, v0, 0x3
	vand.vi v1, v1, 0x3
	vand.vi v2, v2, 0x3
	vle8.v v12, (t0)
	vle8.v v13, (t2)
	addi t0, t0, 32
	addi t2, t2, 32
	vand.vi v3, v3, 0x3
	vand.vi v4, v4, 0x3
	vand.vi v5, v5, 0x3
	vle8.v v14, (t0)
	vle8.v v15, (t2)
	vwmul.vv v16, v0, v8
	vwmul.vv v18, v1, v9
	vwmul.vv v20, v2, v10
	vwmul.vv v22, v3, v11
	vwmul.vv v24, v4, v12
	vwmul.vv v26, v5, v13
	vwmul.vv v28, v6, v14
	vwmul.vv v30, v7, v15
	vsetivli zero, 8, e16, m1
	vmv.v.x v0, zero
	lbu t0, 0(a2)
	vwredsum.vs v8, v16, v0
	vwredsum.vs v9, v18, v0
	lbu t2, 1(a2)
	vwredsum.vs v10, v20, v0
	vwredsum.vs v11, v22, v0
	lbu s0, 2(a2)
	vwredsum.vs v12, v24, v0
	vwredsum.vs v13, v26, v0
	lbu s1, 3(a2)
	vwredsum.vs v14, v28, v0
	vwredsum.vs v15, v30, v0
	lbu s2, 4(a2)
	vwredsum.vs v8, v17, v8
	vwredsum.vs v9, v19, v9
	lbu s3, 5(a2)
	vwredsum.vs v10, v21, v10
	vwredsum.vs v11, v23, v11
	lbu s4, 6(a2)
	vwredsum.vs v12, v25, v12
	vwredsum.vs v13, v27, v13
	lbu s5, 7(a2)
	vwredsum.vs v14, v29, v14
	vwredsum.vs v15, v31, v15
	vsetivli zero, 4, e32, m1
	vmul.vx v0, v8, t0
	vmul.vx v1, v9, t2
	vmacc.vx v0, s0, v10
	vmacc.vx v1, s1, v11
	vmacc.vx v0, s2, v12
	vmacc.vx v1, s3, v13
	vmacc.vx v0, s4, v14
	vmacc.vx v1, s5, v15
	vmv.x.s t0, v0
	vmv.x.s t2, v1
	add a5, a5, t0
	add a5, a5, t2
# 0 "" 2
#NO_APP
	addi	a0,a3,48
	addi	a6,a4,-128
#APP
# 613 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	lb zero, 31(a0)
	addi t0, a0, 16
	addi t2, a6, 16
	vsetivli zero, 16, e8, m1
	vle8.v v0, (a0)
	vle8.v v1, (t0)
	vsrl.vi v2, v0, 2
	vsrl.vi v3, v1, 2
	vsrl.vi v4, v0, 4
	addi t0, a6, 32
	vle8.v v8, (a6)
	vle8.v v9, (t2)
	addi t2, t2, 32
	vsrl.vi v5, v1, 4
	vsrl.vi v6, v0, 6
	vsrl.vi v7, v1, 6
	vle8.v v10, (t0)
	vle8.v v11, (t2)
	addi t0, t0, 32
	addi t2, t2, 32
	vand.vi v0, v0, 0x3
	vand.vi v1, v1, 0x3
	vand.vi v2, v2, 0x3
	vle8.v v12, (t0)
	vle8.v v13, (t2)
	addi t0, t0, 32
	addi t2, t2, 32
	vand.vi v3, v3, 0x3
	vand.vi v4, v4, 0x3
	vand.vi v5, v5, 0x3
	vle8.v v14, (t0)
	vle8.v v15, (t2)
	vwmul.vv v16, v0, v8
	vwmul.vv v18, v1, v9
	vwmul.vv v20, v2, v10
	vwmul.vv v22, v3, v11
	vwmul.vv v24, v4, v12
	vwmul.vv v26, v5, v13
	vwmul.vv v28, v6, v14
	vwmul.vv v30, v7, v15
	vsetivli zero, 8, e16, m1
	vmv.v.x v0, zero
	lbu t0, 0(a7)
	vwredsum.vs v8, v16, v0
	vwredsum.vs v9, v18, v0
	lbu t2, 1(a7)
	vwredsum.vs v10, v20, v0
	vwredsum.vs v11, v22, v0
	lbu s0, 2(a7)
	vwredsum.vs v12, v24, v0
	vwredsum.vs v13, v26, v0
	lbu s1, 3(a7)
	vwredsum.vs v14, v28, v0
	vwredsum.vs v15, v30, v0
	lbu s2, 4(a7)
	vwredsum.vs v8, v17, v8
	vwredsum.vs v9, v19, v9
	lbu s3, 5(a7)
	vwredsum.vs v10, v21, v10
	vwredsum.vs v11, v23, v11
	lbu s4, 6(a7)
	vwredsum.vs v12, v25, v12
	vwredsum.vs v13, v27, v13
	lbu s5, 7(a7)
	vwredsum.vs v14, v29, v14
	vwredsum.vs v15, v31, v15
	vsetivli zero, 4, e32, m1
	vmul.vx v0, v8, t0
	vmul.vx v1, v9, t2
	vmacc.vx v0, s0, v10
	vmacc.vx v1, s1, v11
	vmacc.vx v0, s2, v12
	vmacc.vx v1, s3, v13
	vmacc.vx v0, s4, v14
	vmacc.vx v1, s5, v15
	vmv.x.s t0, v0
	vmv.x.s t2, v1
	add a5, a5, t0
	add a5, a5, t2
# 0 "" 2
#NO_APP
	fcvt.s.w	fa3,a5
	addiw	t5,t5,1
	addi	a3,a3,84
	fmadd.s	fa5,fa3,fa4,fa5
	addi	a4,a4,292
	bgt	t3,t5,.L108
	ld	s0,112(sp)
	.cfi_restore 8
	ld	s1,104(sp)
	.cfi_restore 9
	ld	s2,96(sp)
	.cfi_restore 18
	ld	s3,88(sp)
	.cfi_restore 19
	ld	s4,80(sp)
	.cfi_restore 20
	ld	s5,72(sp)
	.cfi_restore 21
	j	.L105
.L113:
	fmv.s.x	fa5,zero
	j	.L105
.L114:
	lla	a3,.LANCHOR0+168
	li	a2,380
	lla	a1,.LC4
	lla	a0,.LC12
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	s5,72(sp)
	.cfi_remember_state
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	call	__assert_fail@plt
.L115:
	.cfi_restore_state
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	s5,72(sp)
	.cfi_remember_state
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	call	__stack_chk_fail@plt
.L103:
	.cfi_restore_state
	lla	a3,.LANCHOR0+168
	li	a2,710
	lla	a1,.LC4
	lla	a0,.LC14
	sd	s0,112(sp)
	sd	s1,104(sp)
	sd	s2,96(sp)
	sd	s3,88(sp)
	sd	s4,80(sp)
	sd	s5,72(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	call	__assert_fail@plt
	.cfi_endproc
.LFE96:
	.size	ggml_vec_dot_q2_K_q8_K, .-ggml_vec_dot_q2_K_q8_K
	.section	.rodata.str1.8
	.align	3
.LC15:
	.string	"n % QK_K == 0"
	.text
	.align	1
	.globl	ggml_vec_dot_q3_K_q8_K
	.type	ggml_vec_dot_q3_K_q8_K, @function
ggml_vec_dot_q3_K_q8_K:
.LFB97:
	.cfi_startproc
	addi	sp,sp,-192
	.cfi_def_cfa_offset 192
	la	a2,__stack_chk_guard
	sd	s11,88(sp)
	sd	ra,184(sp)
	ld	a4, 0(a2)
	sd	a4, 72(sp)
	li	a4, 0
	.cfi_offset 27, -104
	.cfi_offset 1, -8
	andi	s11,a0,0xff
	vsetivli	zero,1,e32,m1,ta,ma
	bne	s11,zero,.L132
	li	a4,1
	bne	a7,a4,.L133
	sraiw	a4,a0,31
	srliw	a4,a4,24
	csrr	a2,vlenb
	sd	s10,96(sp)
	mv	t3,a1
	addw	a4,a4,a0
	slliw	a2,a2,3
	li	a1,128
	.cfi_offset 26, -96
	sraiw	s10,a4,8
	beq	a2,a1,.L119
	li	a4,256
	bne	a2,a4,.L120
	li	a4,255
	ble	a0,a4,.L130
	fmv.s.x	fa5,zero
	sd	s2,160(sp)
	sd	s3,152(sp)
	sd	s5,136(sp)
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 21, -56
	li	s3,808464384
	li	s2,252645376
	addi	s5,a5,4
	la	a5,ggml_table_f32_f16
	sd	s4,144(sp)
	sd	s6,128(sp)
	sd	a5,8(sp)
	sd	s0,176(sp)
	sd	s1,168(sp)
	sd	s7,120(sp)
	sd	s8,112(sp)
	sd	s9,104(sp)
	.cfi_offset 20, -48
	.cfi_offset 22, -64
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	addi	s6,a3,96
	addi	s4,sp,40
	addi	s3,s3,48
	addi	s2,s2,-241
	li	a5,32
	sd	s10,16(sp)
	sd	t3,24(sp)
	vmv.v.i	v29,0
.L124:
	lbu	t6,8(s6)
	lbu	t5,9(s6)
	lbu	t4,10(s6)
	lbu	a0,11(s6)
	lbu	t3,0(s6)
	lbu	t1,1(s6)
	lbu	a7,2(s6)
	lbu	a3,3(s6)
	lbu	a6,4(s6)
	lbu	a1,5(s6)
	lbu	a2,6(s6)
	lbu	a4,7(s6)
	sb	t6,8(s4)
	sb	t5,9(s4)
	sb	t4,10(s4)
	sb	a0,11(s4)
	lw	a0,48(sp)
	sb	t3,0(s4)
	sb	t1,1(s4)
	sb	a7,2(s4)
	sb	a3,3(s4)
	lw	a3,40(sp)
	sb	a1,5(s4)
	sb	a2,6(s4)
	sb	a4,7(s4)
	sb	a6,4(s4)
	lw	a6,44(sp)
	srliw	a4,a0,2
	slliw	a1,a0,4
	and	a2,a3,s2
	slliw	a4,a4,4
	and	a1,a1,s3
	or	a1,a1,a2
	and	a4,a4,s3
	and	a2,a6,s2
	or	a4,a4,a2
	slliw	t4,a1,16
	slliw	t3,a1,8
	slliw	t1,a4,16
	sraiw	t4,t4,16
	sraiw	t0,a1,24
	sraiw	t4,t4,8
	sraiw	t3,t3,24
	sraiw	t1,t1,16
	addiw	t2,a4,-32
	addiw	a1,a1,-32
	addiw	t4,t4,-32
	addiw	t3,t3,-32
	addiw	t0,t0,-32
	sraiw	t1,t1,8
	slliw	a1,a1,24
	slliw	t4,t4,24
	slliw	t3,t3,24
	slliw	t0,t0,24
	slliw	t2,t2,24
	addiw	t1,t1,-32
	sraiw	a1,a1,24
	sraiw	t4,t4,24
	sraiw	t3,t3,24
	sraiw	t0,t0,24
	sraiw	t2,t2,24
	slliw	t1,t1,24
	sraiw	t1,t1,24
	sb	a1,56(sp)
	srliw	a2,a0,6
	sb	t4,57(sp)
	sb	t3,58(sp)
	sb	t0,59(sp)
	sb	t2,60(sp)
	sb	t1,61(sp)
	slliw	a2,a2,4
	lhu	a7,12(s6)
	srliw	a6,a6,4
	srliw	a3,a3,4
	ld	t6,8(sp)
	and	a6,a6,s2
	and	a0,a0,s3
	and	a2,a2,s3
	and	a3,a3,s2
	or	a3,a3,a0
	or	a2,a2,a6
	slli	t5,a7,2
	slliw	s1,a3,16
	slliw	a6,a2,16
	add	t5,t6,t5
	slliw	a7,a4,8
	slliw	s0,a3,8
	slliw	a0,a2,8
	sraiw	s1,s1,16
	sraiw	a6,a6,16
	flw	fa4,0(t5)
	sraiw	t6,a3,24
	sraiw	t5,a2,24
	sraiw	a7,a7,24
	sraiw	a4,a4,24
	sraiw	s1,s1,8
	sraiw	s0,s0,24
	sraiw	a6,a6,8
	sraiw	a0,a0,24
	addiw	a7,a7,-32
	addiw	a4,a4,-32
	addiw	a3,a3,-32
	addiw	s1,s1,-32
	addiw	s0,s0,-32
	addiw	t6,t6,-32
	addiw	a2,a2,-32
	addiw	a6,a6,-32
	addiw	a0,a0,-32
	addiw	t5,t5,-32
	slliw	a7,a7,24
	slliw	a4,a4,24
	slliw	a3,a3,24
	slliw	s1,s1,24
	slliw	s0,s0,24
	slliw	t6,t6,24
	slliw	a2,a2,24
	slliw	a6,a6,24
	slliw	a0,a0,24
	slliw	t5,t5,24
	sraiw	a4,a4,24
	sraiw	a3,a3,24
	sraiw	a7,a7,24
	sraiw	s1,s1,24
	sraiw	s0,s0,24
	sraiw	t6,t6,24
	sraiw	a2,a2,24
	sraiw	a6,a6,24
	sraiw	a0,a0,24
	sraiw	t5,t5,24
	sb	a4,63(sp)
	sb	a3,64(sp)
	sb	a7,62(sp)
	sb	s1,65(sp)
	sb	s0,66(sp)
	sb	t6,67(sp)
	sb	a2,68(sp)
	sb	a6,69(sp)
	sb	a0,70(sp)
	sb	t5,71(sp)
	addi	s10,s6,-96
	vsetvli	zero,a5,e8,m1,ta,mu
	addi	s8,s6,-32
	vle8.v	v24,0(s10)
	addi	s9,s6,-64
	vand.vi	v0,v24,1
	vmseq.vi	v0,v0,0
	vle8.v	v25,0(s8)
	vle8.v	v26,0(s9)
	vle8.v	v10,0(s5)
	vand.vi	v31,v24,2
	addi	s8,s5,64
	vand.vi	v30,v26,3
	vadd.vi	v30,v30,-4,v0.t
	vmseq.vi	v0,v31,0
	vwmul.vv	v8,v30,v10
	addi	s7,s5,32
	vle8.v	v10,0(s8)
	vsrl.vi	v28,v26,2
	vsrl.vi	v27,v26,4
	vand.vi	v30,v24,8
	addi	s8,s5,96
	vmseq.vi	v30,v30,0
	vand.vi	v28,v28,3
	vand.vi	v27,v27,3
	vadd.vi	v28,v28,-4,v0.t
	vand.vi	v0,v24,4
	vmseq.vi	v0,v0,0
	vadd.vi	v27,v27,-4,v0.t
	vle8.v	v11,0(s7)
	vwmul.vv	v14,v27,v10
	vmv1r.v	v0,v30
	vle8.v	v27,0(s8)
	vwmul.vv	v30,v28,v11
	vsrl.vi	v26,v26,6
	vand.vi	v26,v26,3
	vadd.vi	v26,v26,-4,v0.t
	vsetivli	zero,16,e16,m1,ta,ma
	vwmul.vx	v10,v8,a1
	vsetvli	zero,a5,e8,m1,ta,ma
	vwmul.vv	v12,v26,v27
	vsetivli	zero,16,e16,m1,ta,ma
	vwmul.vx	v18,v31,t0
	vwmul.vx	v16,v15,t1
	vwmul.vx	v20,v9,t4
	vwmul.vx	v26,v12,a7
	vwmul.vx	v8,v30,t3
	vwmul.vx	v30,v14,t2
	vwmul.vx	v14,v13,a4
	vsetvli	zero,zero,e32,m2,ta,ma
	vadd.vv	v8,v8,v18
	vadd.vv	v30,v30,v16
	vadd.vv	v26,v26,v14
	vadd.vv	v10,v10,v20
	vredsum.vs	v10,v10,v29
	vredsum.vs	v8,v8,v10
	vredsum.vs	v30,v30,v8
	vsetvli	zero,a5,e8,m1,ta,ma
	vand.vi	v28,v25,3
	vsetivli	zero,16,e32,m2,ta,ma
	vredsum.vs	v26,v26,v30
	vsetvli	zero,a5,e8,m1,ta,ma
	li	a1,16
	vsrl.vi	v27,v25,2
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a4,v26
	vsetvli	zero,a5,e8,m1,ta,mu
	vand.vx	v0,v24,a1
	li	a1,32
	vmseq.vi	v0,v0,0
	vand.vx	v30,v24,a1
	vadd.vi	v28,v28,-4,v0.t
	vmseq.vi	v30,v30,0
	li	a1,64
	vmv1r.v	v0,v30
	addi	s7,s5,128
	vand.vi	v27,v27,3
	vadd.vi	v27,v27,-4,v0.t
	vand.vx	v0,v24,a1
	li	a1,-128
	vle8.v	v8,0(s7)
	flw	fa3,-4(s5)
	addi	s7,s5,160
	vmseq.vi	v0,v0,0
	vand.vx	v24,v24,a1
	vmseq.vi	v24,v24,0
	vsrl.vi	v26,v25,4
	vand.vi	v26,v26,3
	vadd.vi	v26,v26,-4,v0.t
	vmv1r.v	v0,v24
	vle8.v	v24,0(s7)
	addi	s7,s5,192
	vwmul.vv	v14,v27,v24
	vle8.v	v27,0(s7)
	addi	s7,s5,224
	vwmul.vv	v30,v28,v8
	vwmul.vv	v12,v26,v27
	vle8.v	v24,0(s7)
	fmul.s	fa4,fa4,fa3
	vsrl.vi	v25,v25,6
	vand.vi	v25,v25,3
	vadd.vi	v25,v25,-4,v0.t
	vwmul.vv	v10,v25,v24
	vsetivli	zero,16,e16,m1,ta,ma
	vwmul.vx	v8,v30,a3
	vwmul.vx	v18,v31,s1
	vwmul.vx	v16,v15,t6
	vwmul.vx	v30,v14,s0
	vwmul.vx	v26,v12,a2
	vwmul.vx	v14,v13,a6
	vwmul.vx	v24,v10,a0
	vwmul.vx	v12,v11,t5
	vsetvli	zero,zero,e32,m2,ta,ma
	vadd.vv	v8,v8,v18
	vadd.vv	v30,v30,v16
	vredsum.vs	v8,v8,v29
	vadd.vv	v26,v26,v14
	vredsum.vs	v30,v30,v8
	vadd.vv	v24,v24,v12
	vredsum.vs	v26,v26,v30
	vredsum.vs	v24,v24,v26
	vmv.x.s	a3,v24
	addw	a4,a4,a3
	fcvt.s.w	fa3,a4
	ld	a4,16(sp)
	addiw	s11,s11,1
	fmadd.s	fa5,fa3,fa4,fa5
	addi	s6,s6,110
	addi	s5,s5,292
	bgt	a4,s11,.L124
	ld	t3,24(sp)
.L131:
	ld	s0,176(sp)
	.cfi_restore 8
	ld	s1,168(sp)
	.cfi_restore 9
	ld	s2,160(sp)
	.cfi_restore 18
	ld	s3,152(sp)
	.cfi_restore 19
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
.L122:
	la	a5,__stack_chk_guard
	fsw	fa5,0(t3)
	ld	a4, 72(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L134
	ld	ra,184(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s10,96(sp)
	.cfi_restore 26
	ld	s11,88(sp)
	.cfi_restore 27
	addi	sp,sp,192
	.cfi_def_cfa_offset 0
	jr	ra
.L119:
	.cfi_restore_state
	li	a4,255
	ble	a0,a4,.L130
	li	t6,1
	fmv.s.x	fa5,zero
	slli	t6,t6,34
	li	t2,50528256
	li	t0,252645376
	addi	a4,a3,96
	la	a3,ggml_table_f32_f16
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
	addi	a5,a5,4
	sd	a3,8(sp)
	addi	t1,sp,56
	addi	t5,sp,64
	addi	t6,t6,4
	li	a1,32
	addiw	t2,t2,771
	addiw	t0,t0,-241
	li	a7,128
	li	a6,64
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
	li	s1,1
	li	s0,0
	sd	t3,16(sp)
.L125:
	addi	a0,a4,-96
#APP
# 979 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	vsetivli zero, 12, e8, m1
	vle8.v v0, (a4)
	vmv1r.v v2, v0
	vsetivli zero, 2, e64, m1
	vmv.v.x v9, t6
	vslidedown.vi v1, v0, 1
	vslide1up.vx v8, v9, zero
	vslideup.vi v0, v2, 1
	vsetivli zero, 4, e32, m1
	vid.v v9
	vmv.x.s a3, v1
	vsll.vi v9, v9, 1
	vmv.v.x v1, a3
	vsrl.vv v4, v1, v9
	vsrl.vv v2, v0, v8
	vand.vx v5, v4, t2
	vand.vx v3, v2, t0
	vsll.vi v6, v5, 4
	vor.vv v7, v6, v3
	vsetivli zero, 16, e8, m1
	vsub.vx v0, v7, a1
	vse8.v v0, (t1)
# 0 "" 2
#NO_APP
	addi	t3,a4,-64
	mv	a2,s1
	mv	a3,s0
#APP
# 1015 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	lb zero, 31(t3)
	vsetvli zero, a1, e8, m2, ta, mu
	vle8.v v8, (t3)
	vsrl.vi v10, v8, 2
	vsrl.vi v12, v8, 4
	vsrl.vi v14, v8, 6
	lb zero, 64(a5)
	vand.vi v8, v8, 3
	vand.vi v10, v10, 3
	vand.vi v12, v12, 3
	vle8.v v2, (a0)
	lb zero, 127(a5)
	vand.vx v4, v2, a2
	slli a2, a2, 1
	vmseq.vx v0, v4, zero
	vadd.vi v8, v8, -4, v0.t
	lb zero, 0(a5)
	vand.vx v4, v2, a2
	slli a2, a2, 1
	vmseq.vx v0, v4, zero
	vadd.vi v10, v10, -4, v0.t
	vand.vx v4, v2, a2
	slli a2, a2, 1
	vmseq.vx v0, v4, zero
	vadd.vi v12, v12, -4, v0.t
	vand.vx v4, v2, a2
	slli a2, a2, 1
	vmseq.vx v0, v4, zero
	vadd.vi v14, v14, -4, v0.t
	vsetvli zero, a7, e8, m8
	vle8.v v0, (a5)
	lb t4, 0(t1)
	lb s2, 1(t1)
	lb s3, 2(t1)
	lb s4, 3(t1)
	vsetvli zero, a6, e8, m4
	vwmul.vv v16, v0, v8
	vwmul.vv v24, v4, v12
	vsetivli zero, 16, e16, m2
	vmv.v.x v0, zero
	vwredsum.vs v8, v16, v0
	lb s5, 4(t1)
	lb s6, 5(t1)
	vwredsum.vs v9, v18, v0
	vwredsum.vs v10, v20, v0
	vwredsum.vs v11, v22, v0
	vwredsum.vs v12, v24, v0
	lb s7, 6(t1)
	lb s8, 7(t1)
	vwredsum.vs v13, v26, v0
	vwredsum.vs v14, v28, v0
	vwredsum.vs v15, v30, v0
	vsetivli zero, 4, e32, m1
	vmul.vx v0, v8, t4
	vmul.vx v1, v9, s2
	vmacc.vx v0, s3, v10
	vmacc.vx v1, s4, v11
	vmacc.vx v0, s5, v12
	vmacc.vx v1, s6, v13
	vmacc.vx v0, s7, v14
	vmacc.vx v1, s8, v15
	vmv.x.s t4, v0
	vmv.x.s s2, v1
	add a3, a3, t4
	add a3, a3, s2
# 0 "" 2
#NO_APP
	addi	t3,a4,-32
	addi	t4,a5,128
#APP
# 1015 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	lb zero, 31(t3)
	vsetvli zero, a1, e8, m2, ta, mu
	vle8.v v8, (t3)
	vsrl.vi v10, v8, 2
	vsrl.vi v12, v8, 4
	vsrl.vi v14, v8, 6
	lb zero, 64(t4)
	vand.vi v8, v8, 3
	vand.vi v10, v10, 3
	vand.vi v12, v12, 3
	vle8.v v2, (a0)
	lb zero, 127(t4)
	vand.vx v4, v2, a2
	slli a2, a2, 1
	vmseq.vx v0, v4, zero
	vadd.vi v8, v8, -4, v0.t
	lb zero, 0(t4)
	vand.vx v4, v2, a2
	slli a2, a2, 1
	vmseq.vx v0, v4, zero
	vadd.vi v10, v10, -4, v0.t
	vand.vx v4, v2, a2
	slli a2, a2, 1
	vmseq.vx v0, v4, zero
	vadd.vi v12, v12, -4, v0.t
	vand.vx v4, v2, a2
	slli a2, a2, 1
	vmseq.vx v0, v4, zero
	vadd.vi v14, v14, -4, v0.t
	vsetvli zero, a7, e8, m8
	vle8.v v0, (t4)
	lb s2, 0(t5)
	lb s3, 1(t5)
	lb s4, 2(t5)
	lb s5, 3(t5)
	vsetvli zero, a6, e8, m4
	vwmul.vv v16, v0, v8
	vwmul.vv v24, v4, v12
	vsetivli zero, 16, e16, m2
	vmv.v.x v0, zero
	vwredsum.vs v8, v16, v0
	lb s6, 4(t5)
	lb s7, 5(t5)
	vwredsum.vs v9, v18, v0
	vwredsum.vs v10, v20, v0
	vwredsum.vs v11, v22, v0
	vwredsum.vs v12, v24, v0
	lb s8, 6(t5)
	lb s9, 7(t5)
	vwredsum.vs v13, v26, v0
	vwredsum.vs v14, v28, v0
	vwredsum.vs v15, v30, v0
	vsetivli zero, 4, e32, m1
	vmul.vx v0, v8, s2
	vmul.vx v1, v9, s3
	vmacc.vx v0, s4, v10
	vmacc.vx v1, s5, v11
	vmacc.vx v0, s6, v12
	vmacc.vx v1, s7, v13
	vmacc.vx v0, s8, v14
	vmacc.vx v1, s9, v15
	vmv.x.s s2, v0
	vmv.x.s s3, v1
	add a3, a3, s2
	add a3, a3, s3
# 0 "" 2
#NO_APP
	lhu	a2,12(a4)
	fcvt.s.w	fa3,a3
	flw	fa2,-4(a5)
	slli	a3,a2,2
	ld	a2,8(sp)
	addiw	s11,s11,1
	addi	a4,a4,110
	add	a3,a2,a3
	flw	fa4,0(a3)
	addi	a5,a5,292
	fmul.s	fa4,fa4,fa2
	fmadd.s	fa5,fa3,fa4,fa5
	bgt	s10,s11,.L125
	ld	t3,16(sp)
	j	.L131
.L130:
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
	fmv.s.x	fa5,zero
	j	.L122
.L132:
	.cfi_restore 26
	lla	a3,.LANCHOR0+224
	li	a2,727
	lla	a1,.LC4
	lla	a0,.LC15
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
	sd	s10,96(sp)
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
	.cfi_offset 26, -96
	call	__assert_fail@plt
.L120:
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
	lla	a3,.LANCHOR0+224
	li	a2,1100
	lla	a1,.LC4
	lla	a0,.LC14
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
	call	__assert_fail@plt
.L134:
	.cfi_restore_state
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
	call	__stack_chk_fail@plt
.L133:
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
	.cfi_restore 26
	lla	a3,.LANCHOR0+224
	li	a2,728
	lla	a1,.LC4
	lla	a0,.LC12
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
	sd	s10,96(sp)
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
	.cfi_offset 26, -96
	call	__assert_fail@plt
	.cfi_endproc
.LFE97:
	.size	ggml_vec_dot_q3_K_q8_K, .-ggml_vec_dot_q3_K_q8_K
	.align	1
	.globl	ggml_vec_dot_q4_K_q8_K
	.type	ggml_vec_dot_q4_K_q8_K, @function
ggml_vec_dot_q4_K_q8_K:
.LFB98:
	.cfi_startproc
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	la	a2,__stack_chk_guard
	sd	ra,152(sp)
	ld	a4, 0(a2)
	sd	a4, 40(sp)
	li	a4, 0
	andi	t4,a0,0xff
	vsetivli	zero,1,e32,m1,ta,ma
	.cfi_offset 1, -8
	bne	t4,zero,.L150
	li	a4,1
	bne	a7,a4,.L151
	sd	s2,128(sp)
	.cfi_offset 18, -32
	sraiw	s2,a0,31
	srliw	s2,s2,24
	csrr	a4,vlenb
	addw	s2,s2,a0
	slliw	a4,a4,3
	li	a2,128
	mv	t0,a1
	sraiw	s2,s2,8
	beq	a4,a2,.L138
	li	a2,256
	bne	a4,a2,.L139
	li	a4,255
	ble	a0,a4,.L149
	fmv.s.x	fa5,zero
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	li	s4,252645376
	li	s5,808464384
	li	s3,1061109760
	addi	a4,a3,4
	li	a3,-1
	sd	s11,56(sp)
	addi	a2,a5,260
	.cfi_offset 27, -104
	srli	s11,a3,32
	vmv.v.i	v30,0
	sd	s0,144(sp)
	vsetivli	zero,1,e16,m1,ta,ma
	sd	s1,136(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	la	t2,ggml_table_f32_f16
	addi	a5,sp,24
	addi	a0,sp,32
	addi	s5,s5,48
	addi	s4,s4,-241
	addi	s3,s3,-193
	li	a3,32
	sd	s2,0(sp)
	sd	a1,8(sp)
	vmv.v.i	v24,0
	vsetivli	zero,8,e16,mf2,ta,ma
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
.L143:
	lhu	a6,-4(a4)
	lhu	a1,-2(a4)
	lbu	s8,0(a4)
	lbu	s7,1(a4)
	lbu	s6,2(a4)
	lbu	s2,3(a4)
	lbu	s1,4(a4)
	lbu	s0,5(a4)
	lbu	t0,6(a4)
	lbu	t6,7(a4)
	lbu	t5,8(a4)
	lbu	t3,9(a4)
	lbu	a7,11(a4)
	lbu	t1,10(a4)
	addi	s9,a2,2
	li	s10,4
	slli	a6,a6,2
	slli	a1,a1,2
	vlse16.v	v31,0(s9),s10
	add	a6,t2,a6
	sb	s8,0(a5)
	sb	s7,1(a5)
	sb	s6,2(a5)
	sb	s2,3(a5)
	sb	s1,4(a5)
	sb	s0,5(a5)
	sb	t0,6(a5)
	sb	t6,7(a5)
	sb	t5,8(a5)
	sb	a7,11(a5)
	sb	t3,9(a5)
	sb	t1,10(a5)
	add	a1,t2,a1
	vlse16.v	v27,0(a2),s10
	flw	fa3,-260(a2)
	lw	t3,32(sp)
	flw	fa1,0(a6)
	flw	fa2,0(a1)
	lw	t1,28(sp)
	lw	a6,24(sp)
	srliw	t0,t3,4
	srliw	a7,t1,6
	srliw	a1,a6,6
	slliw	a1,a1,4
	slliw	a7,a7,4
	and	t3,t3,s4
	and	a1,a1,s5
	and	t0,t0,s4
	and	a7,a7,s5
	or	t6,a1,t3
	and	t5,a6,s3
	or	a7,a7,t0
	and	t1,t1,s3
	slli	t6,t6,32
	slli	a7,a7,32
	and	t5,t5,s11
	and	t1,t1,s11
	or	t5,t5,t6
	or	t1,t1,a7
	vsetvli	zero,a3,e8,m1,ta,ma
	sd	t5,24(sp)
	sd	t1,32(sp)
	or	a1,a1,t3
	addi	s6,a4,12
	addi	t3,a2,-256
	addi	a7,a2,-224
	addi	t1,a4,44
	vle8.v	v26,0(s6)
	vle8.v	v25,0(t1)
	vle8.v	v8,0(t3)
	vle8.v	v9,0(a7)
	vand.vi	v10,v26,15
	vsrl.vi	v26,v26,4
	vwmul.vv	v28,v10,v8
	vsetvli	zero,zero,e16,m2,ta,ma
	vredsum.vs	v8,v28,v24
	vsetvli	zero,zero,e8,m1,ta,ma
	vwmul.vv	v28,v26,v9
	vsetvli	zero,zero,e16,m2,ta,ma
	addi	t6,a2,-192
	vredsum.vs	v28,v28,v24
	addi	t5,a2,-160
	vmv.x.s	a7,v8
	vmv.x.s	t3,v28
	vsetvli	zero,zero,e8,m1,ta,ma
	vle8.v	v26,0(t6)
	vand.vi	v9,v25,15
	vle8.v	v8,0(t5)
	vwmul.vv	v28,v9,v26
	vsrl.vi	v25,v25,4
	vsetvli	zero,zero,e16,m2,ta,ma
	vredsum.vs	v26,v28,v24
	vsetvli	zero,zero,e8,m1,ta,ma
	and	t0,a6,s3
	vwmul.vv	v28,v25,v8
	vsetvli	zero,zero,e16,m2,ta,ma
	addi	s2,a4,76
	vredsum.vs	v28,v28,v24
	addi	s9,a2,-96
	vmv.x.s	t6,v26
	vmv.x.s	t5,v28
	srli	s1,t0,16
	vsetvli	zero,zero,e8,m1,ta,ma
	addi	s10,a2,-128
	slliw	t6,t6,16
	vle8.v	v25,0(s2)
	vle8.v	v26,0(s9)
	vand.vi	v9,v25,15
	vle8.v	v8,0(s10)
	vsrl.vi	v25,v25,4
	vwmul.vv	v28,v9,v8
	andi	s1,s1,0xff
	vsetvli	zero,zero,e16,m2,ta,ma
	sraiw	t6,t6,16
	vredsum.vs	v28,v28,v24
	mulw	t6,s1,t6
	vmv.x.s	s1,v28
	vsetvli	zero,zero,e8,m1,ta,ma
	vwmul.vv	v28,v25,v26
	vsetvli	zero,zero,e16,m2,ta,ma
	addi	s8,a4,108
	vredsum.vs	v28,v28,v24
	addi	s7,a2,-64
	vmv.x.s	s9,v28
	addi	s6,a2,-32
	vsetvli	zero,zero,e8,m1,ta,ma
	slliw	a7,a7,16
	vle8.v	v25,0(s8)
	vle8.v	v26,0(s7)
	vand.vi	v9,v25,15
	vle8.v	v8,0(s6)
	vwmul.vv	v28,v9,v26
	vsrl.vi	v25,v25,4
	vsetvli	zero,zero,e16,m2,ta,ma
	srli	s0,t0,8
	vredsum.vs	v26,v28,v24
	sraiw	a7,a7,16
	vsetvli	zero,zero,e8,m1,ta,ma
	andi	a6,a6,63
	slliw	t3,t3,16
	slliw	t5,t5,16
	vwmul.vv	v28,v25,v8
	mulw	a6,a6,a7
	vsetvli	zero,zero,e16,m2,ta,ma
	andi	s0,s0,0xff
	srli	t0,t0,24
	srli	t1,a1,8
	andi	s2,a1,255
	srli	a7,a1,16
	srli	s8,a1,24
	sraiw	t3,t3,16
	vmv.x.s	a1,v26
	sraiw	t5,t5,16
	slliw	s1,s1,16
	slliw	s9,s9,16
	mulw	t3,s0,t3
	vredsum.vs	v28,v28,v24
	andi	t1,t1,0xff
	vsetivli	zero,8,e16,mf2,ta,ma
	sraiw	s1,s1,16
	sraiw	s9,s9,16
	andi	a7,a7,0xff
	fmul.s	fa2,fa3,fa2
	vle8.v	v25,0(a0)
	vadd.vv	v26,v27,v31
	mulw	t5,t0,t5
	slliw	t0,a1,16
	vmv.x.s	a1,v28
	slliw	a1,a1,16
	sraiw	a1,a1,16
	sraiw	t0,t0,16
	vzext.vf2	v27,v25
	vwmul.vv	v25,v26,v27
	vsetvli	zero,zero,e32,m1,ta,ma
	vredsum.vs	v25,v25,v30
	mulw	s1,s2,s1
	vmv.x.s	s0,v25
	fcvt.s.w	fa4,s0
	addw	a6,a6,t6
	addw	t3,t3,t5
	fnmsub.s	fa5,fa4,fa2,fa5
	fmul.s	fa3,fa3,fa1
	addiw	t4,t4,1
	addi	a2,a2,292
	addi	a4,a4,144
	mulw	t1,t1,s9
	addw	s1,s1,a6
	mulw	s8,s8,a1
	addw	t1,t1,t3
	mulw	a7,a7,t0
	addw	s8,s8,t1
	addw	a1,a7,s1
	addw	a1,a1,s8
	fcvt.s.w	fa4,a1
	ld	a1,0(sp)
	fmadd.s	fa5,fa4,fa3,fa5
	bgt	a1,t4,.L143
	ld	t0,8(sp)
	ld	s0,144(sp)
	.cfi_restore 8
	ld	s1,136(sp)
	.cfi_restore 9
	ld	s3,120(sp)
	.cfi_restore 19
	ld	s4,112(sp)
	.cfi_restore 20
	ld	s5,104(sp)
	.cfi_restore 21
	ld	s6,96(sp)
	.cfi_restore 22
	ld	s7,88(sp)
	.cfi_restore 23
	ld	s8,80(sp)
	.cfi_restore 24
	ld	s9,72(sp)
	.cfi_restore 25
	ld	s10,64(sp)
	.cfi_restore 26
	ld	s11,56(sp)
	.cfi_restore 27
.L141:
	la	a5,__stack_chk_guard
	fsw	fa5,0(t0)
	ld	a4, 40(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L152
	ld	ra,152(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s2,128(sp)
	.cfi_restore 18
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
.L138:
	.cfi_restore_state
	li	a4,255
	ble	a0,a4,.L149
	fmv.s.x	fa5,zero
	li	t1,1061109760
	li	a7,252645376
	li	a6,50528256
	addi	a2,a5,4
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	mv	a4,a3
	la	t2,ggml_table_f32_f16
	addi	a5,sp,24
	addi	a0,sp,32
	addiw	t1,t1,-193
	addiw	a7,a7,-241
	addiw	a6,a6,771
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
.L144:
	lhu	a1,0(a4)
	lhu	a3,2(a4)
	flw	fa4,-4(a2)
	slli	a1,a1,2
	slli	a3,a3,2
	add	a1,t2,a1
	add	a3,t2,a3
	flw	fa3,0(a1)
	flw	fa2,0(a3)
	addi	a1,a2,256
	fmul.s	fa3,fa4,fa3
	addi	a3,a4,16
	fmul.s	fa4,fa4,fa2
#APP
# 1343 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	li t5, 8
	vsetivli zero, 4, e32, m1, ta, ma
	vle32.v v1, (a4)
	vslide1down.vx v1, v1, zero
	vmv.v.x v16, zero
	vslidedown.vi v2, v1, 2
	vmv1r.v v3, v2
	vslideup.vi v2, v3, 1
	vsetivli zero, 2, e32, m1, ta, ma
	vmv.v.i v4, 4
	vand.vx v8, v1, t1
	vslide1up.vx v5, v4, zero
	vsrl.vi v6, v1, 6
	vsrl.vv v7, v2, v5
	vsse32.v v8, (a5), t5
	vand.vx v0, v6, a6
	vand.vx v2, v7, a7
	vsll.vi v6, v0, 4
	addi t3, a5, 4
	vor.vv v1, v6, v2
	vsse32.v v1, (t3), t5
	vsetivli zero, 8, e16, m1, ta, ma
	vle32.v v2, (a1)
	vnsrl.wi v0, v2, 0
	vnsrl.wi v1, v2, 16
	vadd.vv v2, v0, v1
	vle8.v v3, (a0)
	vzext.vf2 v4, v3
	vwmul.vv v6, v4, v2
	vsetivli zero, 4, e32, m1, ta, ma
	vredsum.vs v0, v6, v16
	vredsum.vs v0, v7, v0
	vfcvt.f.x.v v0, v0
	vfmv.f.s fa2, v0
	vsetivli zero, 16, e8, m1, ta, ma
	vle8.v v0, (a3)
	fnmsub.s fa5, fa4, fa2, fa5
	addi s1, a3, 64
	addi s3, a3, 16
	addi s4, a3, 32
	addi s5, a3, 48
	addi s6, a2, 64
	vle8.v v1, (s3)
	vle8.v v2, (s4)
	addi s7, a2, 16
	addi s3, s3, 64
	addi s8, a2, 32
	vle8.v v3, (s5)
	vle8.v v8, (a2)
	addi s4, s4, 64
	addi s9, a2, 48
	addi s5, s5, 64
	vsrl.vi v4, v0, 4
	vle8.v v9, (s7)
	vle8.v v10, (s8)
	vand.vi v0, v0, 0xF
	addi s7, s7, 64
	vsrl.vi v5, v1, 4
	addi s8, s8, 64
	vle8.v v11, (s9)
	vle8.v v12, (s6)
	vand.vi v1, v1, 0xF
	addi s9, s9, 64
	vsrl.vi v6, v2, 4
	addi s6, s6, 64
	vle8.v v13, (s7)
	vle8.v v14, (s8)
	vand.vi v2, v2, 0xF
	addi s7, s7, 64
	vsrl.vi v7, v3, 4
	addi s8, s8, 64
	vwmul.vv v16, v0, v8
	vle8.v v15, (s9)
	vle8.v v0, (s1)
	vand.vi v3, v3, 0xF
	addi s9, s9, 64
	vwmul.vv v24, v2, v12
	vwmul.vv v20, v4, v10
	vwmul.vv v28, v6, v14
	vwmacc.vv v16, v1, v9
	vle8.v v1, (s3)
	vle8.v v2, (s4)
	vwmacc.vv v24, v3, v13
	vwmacc.vv v20, v5, v11
	vwmacc.vv v28, v7, v15
	addi s1, s6, 64
	addi s3, s7, 64
	vle8.v v3, (s5)
	vle8.v v8, (s6)
	addi s4, s8, 64
	addi s5, s9, 64
	vsrl.vi v4, v0, 4
	vle8.v v9, (s7)
	vle8.v v10, (s8)
	vand.vi v0, v0, 0xF
	vsrl.vi v5, v1, 4
	vsrl.vi v7, v3, 4
	vand.vi v3, v3, 0xF
	vle8.v v11, (s9)
	vle8.v v12, (s1)
	vand.vi v1, v1, 0xF
	vsrl.vi v6, v2, 4
	vand.vi v2, v2, 0xF
	vwmul.vv v18, v0, v8
	vle8.v v13, (s3)
	vle8.v v14, (s4)
	vwmul.vv v26, v2, v12
	vwmul.vv v22, v4, v10
	vwmul.vv v30, v6, v14
	vwmacc.vv v18, v1, v9
	vle8.v v15, (s5)
	vwmacc.vv v26, v3, v13
	vwmacc.vv v22, v5, v11
	vwmacc.vv v30, v7, v15
	vmv.v.x v0, zero
	vsetivli zero, 16, e16, m2, ta, ma
	vwredsum.vs v4, v16, v0
	lbu t3, 0(a5)
	vwredsum.vs v5, v20, v0
	lbu t5, 1(a5)
	vwredsum.vs v6, v24, v0
	lbu t6, 2(a5)
	vwredsum.vs v7, v28, v0
	lbu s0, 3(a5)
	vwredsum.vs v8, v18, v0
	lbu s1, 4(a5)
	vwredsum.vs v9, v22, v0
	lbu s3, 5(a5)
	vwredsum.vs v10, v26, v0
	lbu s4, 6(a5)
	vwredsum.vs v11, v30, v0
	lbu s5, 7(a5)
	vsetivli zero, 4, e32, m1, ta, ma
	vmul.vx v0, v4, t3
	vmul.vx v1, v8, s1
	vmacc.vx v0, t5, v5
	vmacc.vx v1, s3, v9
	vmacc.vx v0, t6, v6
	vmacc.vx v1, s4, v10
	vmacc.vx v0, s0, v7
	vmacc.vx v1, s5, v11
	vfcvt.f.x.v v0, v0
	vfcvt.f.x.v v1, v1
	vfmv.f.s fa1, v0
	vfmv.f.s fa2, v1
	fadd.s fa1, fa1, fa2
	fmadd.s fa5, fa3, fa1, fa5
# 0 "" 2
#NO_APP
	addiw	t4,t4,1
	addi	a4,a4,144
	addi	a2,a2,292
	bgt	s2,t4,.L144
	ld	s0,144(sp)
	.cfi_restore 8
	ld	s1,136(sp)
	.cfi_restore 9
	ld	s3,120(sp)
	.cfi_restore 19
	ld	s4,112(sp)
	.cfi_restore 20
	ld	s5,104(sp)
	.cfi_restore 21
	ld	s6,96(sp)
	.cfi_restore 22
	ld	s7,88(sp)
	.cfi_restore 23
	ld	s8,80(sp)
	.cfi_restore 24
	ld	s9,72(sp)
	.cfi_restore 25
	j	.L141
.L149:
	fmv.s.x	fa5,zero
	j	.L141
.L150:
	.cfi_restore 18
	lla	a3,.LANCHOR0+248
	li	a2,1120
	lla	a1,.LC4
	lla	a0,.LC15
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
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
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L139:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	lla	a3,.LANCHOR0+248
	li	a2,1508
	lla	a1,.LC4
	lla	a0,.LC14
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	.cfi_remember_state
	.cfi_offset 8, -16
	.cfi_offset 9, -24
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
.L152:
	.cfi_restore_state
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
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
.L151:
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
	.cfi_restore 26
	.cfi_restore 27
	lla	a3,.LANCHOR0+248
	li	a2,1121
	lla	a1,.LC4
	lla	a0,.LC12
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
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
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
	.cfi_endproc
.LFE98:
	.size	ggml_vec_dot_q4_K_q8_K, .-ggml_vec_dot_q4_K_q8_K
	.align	1
	.globl	ggml_vec_dot_q5_K_q8_K
	.type	ggml_vec_dot_q5_K_q8_K, @function
ggml_vec_dot_q5_K_q8_K:
.LFB99:
	.cfi_startproc
	addi	sp,sp,-176
	.cfi_def_cfa_offset 176
	la	a2,__stack_chk_guard
	sd	ra,168(sp)
	ld	a4, 0(a2)
	sd	a4, 56(sp)
	li	a4, 0
	andi	t0,a0,0xff
	vsetivli	zero,1,e32,m1,ta,ma
	.cfi_offset 1, -8
	bne	t0,zero,.L162
	li	a4,1
	bne	a7,a4,.L163
	mv	t5,a1
	sraiw	a1,a0,31
	srliw	a1,a1,24
	addw	a1,a1,a0
	sraiw	a2,a1,8
	li	a4,255
	sd	a2,8(sp)
	ble	a0,a4,.L159
	fmv.s.x	fa2,zero
	sd	s0,160(sp)
	sd	s1,152(sp)
	fmv.s	fa3,fa2
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	li	s1,808464384
	li	s0,252645376
	li	t6,1061109760
	addi	a2,a5,260
	li	t2,-1
	addi	a5,sp,48
	sd	s2,144(sp)
	sd	s3,136(sp)
	sd	a5,16(sp)
	sd	s4,128(sp)
	sd	s5,120(sp)
	sd	s6,112(sp)
	sd	s7,104(sp)
	sd	s8,96(sp)
	sd	s9,88(sp)
	sd	s10,80(sp)
	sd	s11,72(sp)
	addi	a4,a3,4
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
	la	s3,ggml_table_f32_f16
	addi	a1,sp,40
	li	s2,4
	addi	s1,s1,48
	addi	s0,s0,-241
	addi	t6,t6,-193
	srli	t2,t2,32
	li	a5,32
	li	a6,16
	sd	t5,24(sp)
	vmv.v.i	v30,0
	vsetivli	zero,8,e16,m1,ta,ma
.L157:
	lbu	s6,4(a4)
	lbu	s5,5(a4)
	lbu	s4,6(a4)
	lbu	t5,7(a4)
	lbu	s10,8(a4)
	lbu	s9,9(a4)
	lbu	s8,10(a4)
	lbu	s7,11(a4)
	lhu	a0,-4(a4)
	lhu	a3,-2(a4)
	lbu	t4,0(a4)
	lbu	t1,2(a4)
	lbu	a7,3(a4)
	lbu	t3,1(a4)
	addi	s11,a2,2
	vlse16.v	v8,0(s11),s2
	slli	a0,a0,2
	sb	s10,8(a1)
	sb	s9,9(a1)
	sb	s8,10(a1)
	sb	s7,11(a1)
	sb	s6,4(a1)
	sb	s5,5(a1)
	sb	s4,6(a1)
	sb	t5,7(a1)
	slli	a3,a3,2
	lw	t5,48(sp)
	vlse16.v	v31,0(a2),s2
	add	a0,s3,a0
	add	a3,s3,a3
	sb	t4,0(a1)
	sb	t1,2(a1)
	sb	a7,3(a1)
	sb	t3,1(a1)
	flw	fa5,-260(a2)
	flw	fa1,0(a3)
	flw	fa4,0(a0)
	lw	t3,44(sp)
	lw	a0,40(sp)
	srliw	s4,t5,4
	srliw	a7,t3,6
	srliw	a3,a0,6
	slliw	a3,a3,4
	slliw	a7,a7,4
	and	t4,t5,s0
	and	a3,a3,s1
	and	s4,s4,s0
	and	a7,a7,s1
	or	t5,a3,t4
	and	t1,a0,t6
	or	a7,a7,s4
	and	t3,t3,t6
	mv	a0,t1
	slli	t5,t5,32
	and	t3,t3,t2
	and	t1,t1,t2
	slli	a7,a7,32
	or	t1,t1,t5
	or	a7,t3,a7
	sd	a7,48(sp)
	sd	t1,40(sp)
	addi	s5,a4,12
	vsetvli	zero,a5,e8,m2,ta,mu
	vle8.v	v24,0(s5)
	vand.vi	v12,v24,1
	addi	s4,a4,44
	vmsne.vi	v0,v12,0
	addi	a7,a4,76
	vand.vi	v12,v24,2
	addi	s11,a2,-256
	addi	s10,a2,-224
	or	a3,a3,t4
	vle8.v	v28,0(s4)
	vle8.v	v26,0(a7)
	vle8.v	v16,0(s11)
	vle8.v	v2,0(s10)
	vand.vi	v10,v28,15
	srli	t5,a0,8
	vadd.vx	v10,v10,a6,v0.t
	vsrl.vi	v28,v28,4
	vmsne.vi	v0,v12,0
	srli	t4,a0,16
	vadd.vx	v28,v28,a6,v0.t
	vwmul.vv	v12,v10,v16
	srli	t3,a0,24
	vsetvli	zero,zero,e16,m4,ta,ma
	andi	a0,a0,0xff
	vwmul.vx	v16,v12,a0
	vsetvli	zero,zero,e8,m2,ta,ma
	vwmul.vv	v12,v28,v2
	vsetvli	zero,zero,e32,m8,ta,ma
	andi	t5,t5,0xff
	vredsum.vs	v28,v16,v30
	vsetvli	zero,zero,e16,m4,ta,ma
	addi	s9,a2,-192
	vwmul.vx	v16,v12,t5
	addi	s8,a2,-160
	vsetvli	zero,zero,e32,m8,ta,ma
	vredsum.vs	v16,v16,v28
	vle8.v	v10,0(s8)
	vle8.v	v2,0(s9)
	vmv.x.s	a0,v16
	vsetvli	zero,zero,e8,m2,ta,mu
	vand.vi	v12,v24,4
	vmsne.vi	v0,v12,0
	vand.vi	v12,v24,8
	vand.vi	v28,v26,15
	andi	t4,t4,0xff
	vadd.vx	v28,v28,a6,v0.t
	vsrl.vi	v26,v26,4
	vmsne.vi	v0,v12,0
	vwmul.vv	v12,v28,v2
	vadd.vx	v26,v26,a6,v0.t
	vsetvli	zero,zero,e16,m4,ta,ma
	vwmul.vx	v16,v12,t4
	vsetvli	zero,zero,e8,m2,ta,ma
	vwmul.vv	v12,v26,v10
	vsetvli	zero,zero,e32,m8,ta,ma
	andi	t3,t3,0xff
	vredsum.vs	v26,v16,v30
	vsetvli	zero,zero,e16,m4,ta,ma
	addi	s5,a2,-96
	vwmul.vx	v16,v12,t3
	vsetvli	zero,zero,e32,m8,ta,ma
	vredsum.vs	v16,v16,v26
	vmv.x.s	t3,v16
	vsetvli	zero,zero,e8,m2,ta,mu
	vle8.v	v10,0(s5)
	vand.vx	v12,v24,a6
	li	s5,32
	vmsne.vi	v0,v12,0
	addi	s7,a4,108
	vand.vx	v12,v24,s5
	addi	s6,a2,-128
	vle8.v	v26,0(s7)
	vle8.v	v16,0(s6)
	vand.vi	v28,v26,15
	andi	s4,a3,0xff
	vadd.vx	v28,v28,a6,v0.t
	vsrl.vi	v26,v26,4
	vmsne.vi	v0,v12,0
	vwmul.vv	v12,v28,v16
	vadd.vx	v26,v26,a6,v0.t
	vsetvli	zero,zero,e16,m4,ta,ma
	vwmul.vx	v16,v12,s4
	vsetvli	zero,zero,e8,m2,ta,ma
	srli	t1,a3,8
	vwmul.vv	v12,v26,v10
	vsetvli	zero,zero,e32,m8,ta,ma
	andi	t1,t1,0xff
	vredsum.vs	v26,v16,v30
	vsetvli	zero,zero,e16,m4,ta,ma
	addw	a0,a0,t3
	vwmul.vx	v16,v12,t1
	vsetvli	zero,zero,e32,m8,ta,ma
	vredsum.vs	v16,v16,v26
	vmv.x.s	t1,v16
	addw	a0,a0,t1
	li	t1,64
	vsetvli	zero,zero,e8,m2,ta,mu
	srli	a7,a3,16
	vand.vx	v12,v24,t1
	addi	t5,a4,140
	vmsne.vi	v0,v12,0
	addi	t4,a2,-64
	addi	t3,a2,-32
	li	t1,-128
	vand.vx	v24,v24,t1
	vle8.v	v26,0(t5)
	vle8.v	v16,0(t4)
	vand.vi	v28,v26,15
	vle8.v	v10,0(t3)
	vadd.vx	v28,v28,a6,v0.t
	vsrl.vi	v26,v26,4
	vmsne.vi	v0,v24,0
	vwmul.vv	v12,v28,v16
	vadd.vx	v26,v26,a6,v0.t
	andi	a7,a7,0xff
	vsetvli	zero,zero,e16,m4,ta,ma
	vwmul.vx	v16,v12,a7
	vsetvli	zero,zero,e8,m2,ta,ma
	srli	a3,a3,24
	vwmul.vv	v12,v26,v10
	vsetvli	zero,zero,e32,m8,ta,ma
	andi	a3,a3,0xff
	vredsum.vs	v24,v16,v30
	vsetvli	zero,zero,e16,m4,ta,ma
	vwmul.vx	v16,v12,a3
	vsetvli	zero,zero,e32,m8,ta,ma
	vredsum.vs	v16,v16,v24
	vmv.x.s	a3,v16
	addw	a3,a0,a3
	fcvt.s.w	fa0,a3
	ld	a3,16(sp)
	vsetivli	zero,8,e16,m1,ta,ma
	fmul.s	fa4,fa5,fa4
	vle8.v	v24,0(a3)
	fmul.s	fa5,fa5,fa1
	vadd.vv	v31,v31,v8
	vzext.vf2	v26,v24
	vwmul.vv	v24,v31,v26
	vsetvli	zero,zero,e32,m2,ta,ma
	vredsum.vs	v24,v24,v30
	vmv.x.s	a3,v24
	fcvt.s.w	fa1,a3
	ld	a3,8(sp)
	addiw	t0,t0,1
	fmadd.s	fa2,fa0,fa4,fa2
	fnmsub.s	fa3,fa1,fa5,fa3
	addi	a2,a2,292
	addi	a4,a4,176
	bgt	a3,t0,.L157
	fadd.s	fa3,fa3,fa2
	ld	t5,24(sp)
	ld	s0,160(sp)
	.cfi_restore 8
	ld	s1,152(sp)
	.cfi_restore 9
	ld	s2,144(sp)
	.cfi_restore 18
	ld	s3,136(sp)
	.cfi_restore 19
	ld	s4,128(sp)
	.cfi_restore 20
	ld	s5,120(sp)
	.cfi_restore 21
	ld	s6,112(sp)
	.cfi_restore 22
	ld	s7,104(sp)
	.cfi_restore 23
	ld	s8,96(sp)
	.cfi_restore 24
	ld	s9,88(sp)
	.cfi_restore 25
	ld	s10,80(sp)
	.cfi_restore 26
	ld	s11,72(sp)
	.cfi_restore 27
.L156:
	la	a5,__stack_chk_guard
	fsw	fa3,0(t5)
	ld	a4, 56(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L164
	ld	ra,168(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,176
	.cfi_def_cfa_offset 0
	jr	ra
.L159:
	.cfi_restore_state
	fmv.s.x	fa3,zero
	j	.L156
.L164:
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	sd	s3,136(sp)
	sd	s4,128(sp)
	sd	s5,120(sp)
	sd	s6,112(sp)
	sd	s7,104(sp)
	sd	s8,96(sp)
	sd	s9,88(sp)
	sd	s10,80(sp)
	sd	s11,72(sp)
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
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__stack_chk_fail@plt
.L163:
	.cfi_restore_state
	lla	a3,.LANCHOR0+272
	li	a2,1530
	lla	a1,.LC4
	lla	a0,.LC12
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	sd	s3,136(sp)
	sd	s4,128(sp)
	sd	s5,120(sp)
	sd	s6,112(sp)
	sd	s7,104(sp)
	sd	s8,96(sp)
	sd	s9,88(sp)
	sd	s10,80(sp)
	sd	s11,72(sp)
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
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L162:
	.cfi_restore_state
	lla	a3,.LANCHOR0+272
	li	a2,1529
	lla	a1,.LC4
	lla	a0,.LC15
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	sd	s3,136(sp)
	sd	s4,128(sp)
	sd	s5,120(sp)
	sd	s6,112(sp)
	sd	s7,104(sp)
	sd	s8,96(sp)
	sd	s9,88(sp)
	sd	s10,80(sp)
	sd	s11,72(sp)
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
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
	.cfi_endproc
.LFE99:
	.size	ggml_vec_dot_q5_K_q8_K, .-ggml_vec_dot_q5_K_q8_K
	.align	1
	.globl	ggml_vec_dot_q6_K_q8_K
	.type	ggml_vec_dot_q6_K_q8_K, @function
ggml_vec_dot_q6_K_q8_K:
.LFB100:
	.cfi_startproc
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	la	a2,__stack_chk_guard
	sd	s9,72(sp)
	sd	ra,152(sp)
	ld	a4, 0(a2)
	sd	a4, 40(sp)
	li	a4, 0
	.cfi_offset 25, -88
	.cfi_offset 1, -8
	andi	s9,a0,0xff
	vsetivli	zero,1,e32,m1,ta,ma
	bne	s9,zero,.L181
	li	a4,1
	bne	a7,a4,.L182
	sraiw	a4,a0,31
	srliw	a4,a4,24
	csrr	a2,vlenb
	sd	s5,104(sp)
	sd	s10,64(sp)
	.cfi_offset 21, -56
	.cfi_offset 26, -96
	mv	s5,a1
	addw	a4,a4,a0
	slliw	a2,a2,3
	li	a1,128
	sraiw	s10,a4,8
	beq	a2,a1,.L168
	li	a4,256
	bne	a2,a4,.L169
	li	a4,255
	ble	a0,a4,.L179
	fmv.s.x	fa5,zero
	sd	s8,80(sp)
	.cfi_offset 24, -80
	la	s8,ggml_table_f32_f16
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s11,56(sp)
	mv	a6,a3
	addi	a0,a5,4
	li	a1,32
	li	a2,32
	sd	s10,8(sp)
	sd	s5,24(sp)
	sd	s8,16(sp)
	vmv.v.i	v30,0
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 27, -104
.L173:
	lhu	a5,208(a6)
	ld	t3,16(sp)
	addi	a4,a6,160
	vsetvli	zero,a1,e8,m1,ta,ma
	vle8.v	v24,0(a4)
	lb	a4,200(a6)
	slli	a5,a5,2
	addi	a3,a6,128
	add	a5,t3,a5
	vle8.v	v25,0(a3)
	vle8.v	v29,0(a6)
	flw	fa4,0(a5)
	sh	a4,6(sp)
	addi	a5,a0,128
	vle8.v	v10,0(a5)
	addi	a5,a0,160
	vle8.v	v9,0(a5)
	lb	s4,192(a6)
	addi	a5,a0,192
	addi	s11,a6,32
	addi	s7,a0,32
	addi	s6,a0,64
	addi	s5,a0,96
	addi	s10,a6,64
	addi	s8,a6,96
	vle8.v	v18,0(a0)
	lb	s0,196(a6)
	lb	a4,207(a6)
	vle8.v	v28,0(s11)
	vle8.v	v27,0(s10)
	vle8.v	v26,0(s8)
	vle8.v	v17,0(s7)
	vle8.v	v16,0(s6)
	vle8.v	v14,0(s5)
	lb	s3,193(a6)
	lb	s2,194(a6)
	lb	s1,195(a6)
	lb	t2,197(a6)
	lb	t0,198(a6)
	lb	t6,199(a6)
	lb	t5,201(a6)
	lb	t4,202(a6)
	lb	t3,203(a6)
	lb	t1,204(a6)
	lb	a7,205(a6)
	lb	a3,206(a6)
	vand.vi	v12,v29,15
	vle8.v	v8,0(a5)
	vand.vi	v19,v25,3
	addi	a5,a0,224
	vsrl.vi	v15,v25,2
	vsrl.vi	v13,v25,4
	vsll.vi	v19,v19,4
	vand.vi	v13,v13,3
	vor.vv	v12,v12,v19
	vsll.vi	v13,v13,4
	vsub.vx	v12,v12,a2
	vsrl.vi	v25,v25,6
	vand.vi	v25,v25,3
	vsll.vi	v25,v25,4
	vwmul.vv	v22,v12,v18
	vle8.v	v31,0(a5)
	vand.vi	v11,v28,15
	vsrl.vi	v29,v29,4
	vsrl.vi	v28,v28,4
	vor.vv	v29,v29,v13
	vor.vv	v28,v28,v25
	vsub.vx	v29,v29,a2
	vsub.vx	v28,v28,a2
	vwmul.vv	v12,v29,v16
	vand.vi	v15,v15,3
	vsll.vi	v15,v15,4
	vor.vv	v11,v11,v15
	vsub.vx	v25,v11,a2
	vwmul.vv	v20,v25,v17
	vsetivli	zero,16,e16,m1,ta,ma
	vwmul.vx	v16,v22,s4
	vsetvli	zero,a1,e8,m1,ta,ma
	vwmul.vv	v18,v28,v14
	vsetivli	zero,16,e16,m1,ta,ma
	vwmul.vx	v28,v12,s0
	vwmul.vx	v2,v23,s3
	vwmul.vx	v14,v20,s2
	vwmul.vx	v0,v21,s1
	vwmul.vx	v22,v13,t2
	vwmul.vx	v20,v19,t6
	vwmul.vx	v12,v18,t0
	vsetvli	zero,zero,e32,m2,ta,ma
	vadd.vv	v28,v28,v22
	vadd.vv	v16,v16,v2
	vadd.vv	v14,v14,v0
	vredsum.vs	v16,v16,v30
	vadd.vv	v12,v12,v20
	vredsum.vs	v14,v14,v16
	vredsum.vs	v25,v28,v14
	vsetvli	zero,a1,e8,m1,ta,ma
	vand.vi	v28,v27,15
	vsetivli	zero,16,e32,m2,ta,ma
	vredsum.vs	v12,v12,v25
	vsetvli	zero,a1,e8,m1,ta,ma
	vand.vi	v25,v26,15
	vsetivli	zero,0,e32,m1,ta,ma
	lhu	s0,6(sp)
	vmv.x.s	a5,v12
	vsetvli	zero,a1,e8,m1,ta,ma
	vand.vi	v12,v24,3
	vsrl.vi	v11,v24,2
	vsrl.vi	v29,v24,4
	vsrl.vi	v24,v24,6
	vand.vi	v24,v24,3
	vsll.vi	v24,v24,4
	flw	fa3,-4(a0)
	vsll.vi	v12,v12,4
	vsrl.vi	v26,v26,4
	vand.vi	v11,v11,3
	vor.vv	v26,v26,v24
	vsll.vi	v11,v11,4
	vor.vv	v25,v25,v11
	vsub.vx	v24,v25,a2
	vor.vv	v28,v28,v12
	vsub.vx	v26,v26,a2
	vwmul.vv	v12,v24,v9
	vsub.vx	v28,v28,a2
	vsrl.vi	v27,v27,4
	vwmul.vv	v14,v28,v10
	vand.vi	v29,v29,3
	vsll.vi	v29,v29,4
	vor.vv	v27,v27,v29
	vsub.vx	v27,v27,a2
	vwmul.vv	v24,v27,v8
	vsetivli	zero,16,e16,m1,ta,ma
	vwmul.vx	v8,v14,s0
	vsetvli	zero,a1,e8,m1,ta,ma
	fmul.s	fa4,fa4,fa3
	vwmul.vv	v10,v26,v31
	vsetivli	zero,16,e16,m1,ta,ma
	vwmul.vx	v18,v15,t5
	vwmul.vx	v28,v12,t4
	vwmul.vx	v16,v13,t3
	vwmul.vx	v26,v24,t1
	vwmul.vx	v14,v25,a7
	vwmul.vx	v12,v11,a4
	vwmul.vx	v24,v10,a3
	vsetvli	zero,zero,e32,m2,ta,ma
	vadd.vv	v8,v8,v18
	vadd.vv	v28,v28,v16
	vredsum.vs	v8,v8,v30
	vadd.vv	v26,v26,v14
	vredsum.vs	v28,v28,v8
	vadd.vv	v24,v24,v12
	vredsum.vs	v26,v26,v28
	vredsum.vs	v24,v24,v26
	vmv.x.s	a4,v24
	addw	a5,a5,a4
	fcvt.s.w	fa3,a5
	ld	a5,8(sp)
	addiw	s9,s9,1
	fmadd.s	fa5,fa3,fa4,fa5
	addi	a6,a6,210
	addi	a0,a0,292
	bgt	a5,s9,.L173
	ld	s5,24(sp)
.L180:
	ld	s0,144(sp)
	.cfi_restore 8
	ld	s1,136(sp)
	.cfi_restore 9
	ld	s2,128(sp)
	.cfi_restore 18
	ld	s3,120(sp)
	.cfi_restore 19
	ld	s4,112(sp)
	.cfi_restore 20
	ld	s6,96(sp)
	.cfi_restore 22
	ld	s7,88(sp)
	.cfi_restore 23
	ld	s8,80(sp)
	.cfi_restore 24
	ld	s11,56(sp)
	.cfi_restore 27
.L171:
	la	a5,__stack_chk_guard
	fsw	fa5,0(s5)
	ld	a4, 40(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L183
	ld	ra,152(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s5,104(sp)
	.cfi_restore 21
	ld	s10,64(sp)
	.cfi_restore 26
	ld	s9,72(sp)
	.cfi_restore 25
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
.L168:
	.cfi_restore_state
	li	a4,255
	ble	a0,a4,.L179
	fmv.s.x	fa5,zero
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s8,80(sp)
	sd	s0,144(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s11,56(sp)
	addi	a2,a3,418
	addi	a1,a5,4
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 24, -80
	.cfi_offset 8, -16
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 27, -104
	la	s8,ggml_table_f32_f16
	li	s4,32
	li	s3,64
	li	s2,128
	li	s1,48
.L174:
	lhu	a5,-210(a2)
	flw	fa3,-4(a1)
	addi	a0,a2,-418
	slli	a5,a5,2
	add	a5,s8,a5
	flw	fa4,0(a5)
	addi	s0,a2,-226
	addi	s6,a2,-290
	fmul.s	fa4,fa4,fa3
#APP
# 1845 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	addi s7, a0, 32
	ld t0, 0(s0)
	addi s0, s0, 8
	slli t6, t0, 1 * 8
	lb zero, 0(a0)
	slli t5, t0, 2 * 8
	slli t4, t0, 3 * 8
	lb zero, 0(s7)
	slli t3, t0, 4 * 8
	slli t2, t0, 5 * 8
	lb zero, 0(s6)
	lb zero, 31(s7)
	slli t1, t0, 6 * 8
	srai a7, t0, 56
	vsetvli zero, s4, e8, m2
	vle8.v v8, (a0)
	srai t6, t6, 56
	srai t5, t5, 56
	srai t4, t4, 56
	srai t3, t3, 56
	vle8.v v10, (s7)
	addi a0, a0, 64
	slli t0, t0, 7 * 8
	srai t2, t2, 56
	srai t1, t1, 56
	srai t0, t0, 56
	vle8.v v4, (s6)
	vsrl.vi v12, v8, 4
	vsrl.vi v14, v10, 4
	lb zero, 0(a1)
	vand.vi v8, v8, 0xF
	vand.vi v10, v10, 0xF
	lb zero, 32(a1)
	vsll.vi v0, v4, 4
	vsll.vi v2, v4, 2
	lb zero, 64(a1)
	vsrl.vi v6, v4, 2
	vand.vx v0, v0, s1
	lb zero, 96(a1)
	vand.vx v2, v2, s1
	vand.vx v4, v4, s1
	vand.vx v6, v6, s1
	vor.vv v8, v8, v0
	lb zero, 127(a1)
	vor.vv v10, v10, v2
	vor.vv v12, v12, v4
	vor.vv v14, v14, v6
	vsetvli zero, s2, e8, m8
	vle8.v v0, (a1)
	vsub.vx v8, v8, s4
	vsetvli zero, s3, e8, m4
	vwmul.vv v16, v0, v8
	vwmul.vv v24, v4, v12
	vsetivli zero, 16, e16, m2
	vmv.v.x v0, zero
	vwredsum.vs v10, v16, v0
	vwredsum.vs v9, v18, v0
	vwredsum.vs v8, v20, v0
	vwredsum.vs v7, v22, v0
	vwredsum.vs v11, v24, v0
	vwredsum.vs v12, v26, v0
	vwredsum.vs v13, v28, v0
	vwredsum.vs v14, v30, v0
	vsetivli zero, 4, e32, m1
	vmul.vx v0, v10, t0
	vmul.vx v1, v9, t1
	vmacc.vx v0, t2, v8
	vmacc.vx v1, t3, v7
	vmacc.vx v0, t4, v11
	vmacc.vx v1, t5, v12
	vmacc.vx v0, t6, v13
	vmacc.vx v1, a7, v14
	vadd.vv v0, v0, v1
	vfcvt.f.x.v v0, v0
	vfmv.f.s fa3, v0
	fmadd.s fa5, fa4, fa3, fa5
# 0 "" 2
#NO_APP
	addi	s6,a2,-258
	addi	s7,a1,128
#APP
# 1845 "/home/paddymac/llama.cpp/ggml/src/ggml-cpu/arch/riscv/quants.c" 1
	addi s11, a0, 32
	ld t0, 0(s0)
	addi s0, s0, 8
	slli t6, t0, 1 * 8
	lb zero, 0(a0)
	slli t5, t0, 2 * 8
	slli t4, t0, 3 * 8
	lb zero, 0(s11)
	slli t3, t0, 4 * 8
	slli t2, t0, 5 * 8
	lb zero, 0(s6)
	lb zero, 31(s11)
	slli t1, t0, 6 * 8
	srai a7, t0, 56
	vsetvli zero, s4, e8, m2
	vle8.v v8, (a0)
	srai t6, t6, 56
	srai t5, t5, 56
	srai t4, t4, 56
	srai t3, t3, 56
	vle8.v v10, (s11)
	addi a0, a0, 64
	slli t0, t0, 7 * 8
	srai t2, t2, 56
	srai t1, t1, 56
	srai t0, t0, 56
	vle8.v v4, (s6)
	vsrl.vi v12, v8, 4
	vsrl.vi v14, v10, 4
	lb zero, 0(s7)
	vand.vi v8, v8, 0xF
	vand.vi v10, v10, 0xF
	lb zero, 32(s7)
	vsll.vi v0, v4, 4
	vsll.vi v2, v4, 2
	lb zero, 64(s7)
	vsrl.vi v6, v4, 2
	vand.vx v0, v0, s1
	lb zero, 96(s7)
	vand.vx v2, v2, s1
	vand.vx v4, v4, s1
	vand.vx v6, v6, s1
	vor.vv v8, v8, v0
	lb zero, 127(s7)
	vor.vv v10, v10, v2
	vor.vv v12, v12, v4
	vor.vv v14, v14, v6
	vsetvli zero, s2, e8, m8
	vle8.v v0, (s7)
	vsub.vx v8, v8, s4
	vsetvli zero, s3, e8, m4
	vwmul.vv v16, v0, v8
	vwmul.vv v24, v4, v12
	vsetivli zero, 16, e16, m2
	vmv.v.x v0, zero
	vwredsum.vs v10, v16, v0
	vwredsum.vs v9, v18, v0
	vwredsum.vs v8, v20, v0
	vwredsum.vs v7, v22, v0
	vwredsum.vs v11, v24, v0
	vwredsum.vs v12, v26, v0
	vwredsum.vs v13, v28, v0
	vwredsum.vs v14, v30, v0
	vsetivli zero, 4, e32, m1
	vmul.vx v0, v10, t0
	vmul.vx v1, v9, t1
	vmacc.vx v0, t2, v8
	vmacc.vx v1, t3, v7
	vmacc.vx v0, t4, v11
	vmacc.vx v1, t5, v12
	vmacc.vx v0, t6, v13
	vmacc.vx v1, a7, v14
	vadd.vv v0, v0, v1
	vfcvt.f.x.v v0, v0
	vfmv.f.s fa3, v0
	fmadd.s fa5, fa4, fa3, fa5
# 0 "" 2
#NO_APP
	addiw	s9,s9,1
	addi	a2,a2,210
	addi	a1,a1,292
	bgt	s10,s9,.L174
	j	.L180
.L179:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 27
	fmv.s.x	fa5,zero
	j	.L171
.L181:
	.cfi_restore 21
	.cfi_restore 26
	lla	a3,.LANCHOR0+296
	li	a2,1648
	lla	a1,.LC4
	lla	a0,.LC15
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L169:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 27
	lla	a3,.LANCHOR0+296
	li	a2,1941
	lla	a1,.LC4
	lla	a0,.LC14
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s11,56(sp)
	.cfi_remember_state
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 27, -104
	call	__assert_fail@plt
.L183:
	.cfi_restore_state
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s11,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 27, -104
	call	__stack_chk_fail@plt
.L182:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 26
	.cfi_restore 27
	lla	a3,.LANCHOR0+296
	li	a2,1649
	lla	a1,.LC4
	lla	a0,.LC12
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
	.cfi_endproc
.LFE100:
	.size	ggml_vec_dot_q6_K_q8_K, .-ggml_vec_dot_q6_K_q8_K
	.align	1
	.globl	ggml_vec_dot_iq2_s_q8_K
	.type	ggml_vec_dot_iq2_s_q8_K, @function
ggml_vec_dot_iq2_s_q8_K:
.LFB103:
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	la	t3,__stack_chk_guard
	csrr	t5,vlenb
	ld	t1, 0(t3)
	sd	t1, 40(sp)
	li	t1, 0
	sd	ra,88(sp)
	sd	s0,80(sp)
	slli	t5,t5,3
	li	t0,128
	mv	t1,a1
	mv	t6,a3
	mv	t2,a5
	vsetivli	zero,8,e16,mf2,ta,ma
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	beq	t5,t0,.L185
	li	t0,256
	bne	t5,t0,.L207
	andi	s0,a0,0xff
	sd	s1,72(sp)
	.cfi_offset 9, -24
	bne	s0,zero,.L208
	lla	a5,.LANCHOR0
	ld	a2,400(a5)
	ld	a1,392(a5)
	ld	a3,408(a5)
	ld	a4,416(a5)
	sd	a2,16(sp)
	sd	a1,8(sp)
	addi	a2,sp,8
	vle16.v	v31,0(a2)
	sraiw	s1,a0,31
	sd	a3,24(sp)
	sd	a4,32(sp)
	addi	a3,sp,24
	vle16.v	v10,0(a3)
	srliw	s1,s1,24
	lla	a3,.LANCHOR0+424
	li	a5,64
	vsetvli	zero,a5,e8,m2,ta,ma
	addw	s1,s1,a0
	vle8.v	v12,0(a3)
	li	a4,255
	lla	a3,.LANCHOR0+488
	sraiw	s1,s1,8
	vle8.v	v14,0(a3)
	ble	a0,a4,.L200
	fmv.s.x	fa2,zero
	addi	a5,t2,4
	li	t2,8192
	vsetivli	zero,1,e32,m1,ta,ma
	sd	s2,64(sp)
	sd	s3,56(sp)
	addi	a3,t6,34
	la	t4,ggml_table_f32_f16
	lla	a7,iq2s_grid
	addi	t0,sp,6
	addiw	t2,t2,-2048
	li	a6,64
	vmv.v.i	v30,0
	vsetivli	zero,8,e32,m1,ta,ma
	.cfi_offset 18, -32
	.cfi_offset 19, -40
.L196:
	lhu	a4,-34(a3)
	flw	fa4,-4(a5)
	fmv.s.x	fa5,zero
	slli	a4,a4,2
	add	a4,t4,a4
	flw	fa3,0(a4)
	mv	t6,a5
	addi	t5,a3,-32
	fmul.s	fa3,fa3,fa4
	addi	a0,a3,32
.L195:
	lbu	s2,0(a0)
	lbu	a1,1(a0)
	vle8.v	v28,0(t5)
	sb	s2,0(t0)
	sb	a1,1(t0)
	vsetvli	zero,a6,e8,m2,ta,ma
	vle8.v	v26,0(t6)
	vsetivli	zero,2,e8,mf8,ta,ma
	vle8.v	v25,0(t0)
	vsetivli	zero,8,e8,mf4,ta,ma
	vwcvtu.x.x.v	v24,v28
	vsetivli	zero,2,e8,mf8,ta,ma
	addi	a2,t5,32
	vwcvtu.x.x.v	v28,v25
	vsetivli	zero,8,e16,mf2,ta,ma
	vle8.v	v8,0(a2)
	vrgather.vv	v25,v28,v31
	vsll.vi	v24,v24,3
	vsll.vv	v25,v25,v10
	vsetvli	zero,a6,e8,m2,ta,ma
	vrgather.vv	v28,v8,v12
	vsetivli	zero,8,e16,mf2,ta,ma
	lbu	a4,8(a0)
	vand.vx	v25,v25,t2
	vsetvli	zero,a6,e8,m2,ta,ma
	vand.vv	v28,v28,v14
	vsetivli	zero,8,e16,mf2,ta,ma
	vor.vv	v24,v24,v25
	vsetvli	zero,a6,e8,m2,ta,ma
	andi	s2,a4,15
	vmsne.vi	v0,v28,0
	vsetivli	zero,8,e64,m2,ta,ma
	slliw	s2,s2,1
	vluxei16.v	v8,(a7),v24
	vsetvli	zero,a6,e8,m2,ta,mu
	vneg.v	v26,v26,v0.t
	addiw	s2,s2,1
	vmv2r.v	v28,v26
	vwmul.vv	v24,v8,v28
	vsetivli	zero,16,e16,m1,ta,ma
	vwredsum.vs	v28,v24,v30
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a2,v28
	mulw	s2,s2,a2
	srliw	a2,a4,4
	slliw	a2,a2,1
	lbu	a4,9(a0)
	vsetivli	zero,16,e16,m1,ta,ma
	addiw	a2,a2,1
	vwredsum.vs	v28,v25,v30
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	s3,v28
	andi	a1,a4,15
	mulw	a2,a2,s3
	slliw	a1,a1,1
	vsetivli	zero,16,e16,m1,ta,ma
	addiw	a1,a1,1
	vwredsum.vs	v28,v26,v30
	fcvt.s.w	fa4,s2
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	s3,v28
	srliw	a4,a4,4
	fadd.s	fa4,fa4,fa5
	mulw	a1,a1,s3
	slliw	a4,a4,1
	vsetivli	zero,16,e16,m1,ta,ma
	addiw	a4,a4,1
	vwredsum.vs	v28,v27,v30
	fcvt.s.w	fa5,a2
	vsetivli	zero,8,e32,m1,ta,ma
	vmv.x.s	s2,v28
	fadd.s	fa5,fa5,fa4
	addi	t5,t5,8
	mulw	a4,a4,s2
	fcvt.s.w	fa4,a1
	addi	a0,a0,2
	addi	t6,t6,64
	fadd.s	fa4,fa4,fa5
	fcvt.s.w	fa5,a4
	fadd.s	fa5,fa5,fa4
	bne	t5,a3,.L195
	addiw	s0,s0,1
	fmadd.s	fa2,fa3,fa5,fa2
	addi	a5,a5,292
	addi	a3,t5,82
	bgt	s1,s0,.L196
	flw	fa5,.LC16,a5
	fmul.s	fa2,fa2,fa5
	ld	s2,64(sp)
	.cfi_restore 18
	ld	s3,56(sp)
	.cfi_restore 19
.L194:
	fsw	fa2,0(t1)
	ld	a4, 40(sp)
	ld	a5, 0(t3)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L209
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	ld	s1,72(sp)
	.cfi_restore 9
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
.L207:
	.cfi_def_cfa_offset 96
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	ld	s0, 40(sp)
	ld	t1, 0(t3)
	xor	t1, s0, t1
	li	s0, 0
	bne	t1,zero,.L210
	ld	s0,80(sp)
	.cfi_remember_state
	.cfi_restore 8
	ld	ra,88(sp)
	.cfi_restore 1
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	tail	ggml_vec_dot_iq2_s_q8_K_generic@plt
.L185:
	.cfi_restore_state
	andi	s0,a0,0xff
	sd	s1,72(sp)
	.cfi_offset 9, -24
	bne	s0,zero,.L211
	sraiw	s1,a0,31
	li	a5,32
	ld	a4,.LANCHOR0+352
	srliw	s1,s1,24
	vsetvli	zero,a5,e8,m2,ta,ma
	sd	a4,24(sp)
	addw	s1,s1,a0
	addi	a5,sp,24
	li	a4,255
	vid.v	v12
	vmv.v.i	v14,1
	vand.vi	v24,v12,7
	fmv.s.x	fa2,zero
	vsrl.vi	v12,v12,3
	vsll.vv	v14,v14,v24
	sraiw	s1,s1,8
	vsetivli	zero,4,e16,mf2,ta,ma
	vle16.v	v9,0(a5)
	ble	a0,a4,.L194
	li	t0,8192
	vsetivli	zero,1,e32,m1,ta,ma
	addi	t2,t2,4
	addi	t6,a3,34
	la	t4,ggml_table_f32_f16
	lla	a7,iq2s_grid
	addiw	t0,t0,-2048
	li	a0,32
	vmv.v.i	v8,0
	vsetivli	zero,4,e32,m1,ta,ma
.L191:
	lhu	a5,-34(t6)
	flw	fa4,-4(t2)
	fmv.s.x	fa5,zero
	slli	a5,a5,2
	add	a5,t4,a5
	flw	fa3,0(a5)
	addi	a1,t6,-32
	mv	a5,t2
	fmul.s	fa3,fa3,fa4
	addi	a6,t6,32
.L190:
	lbu	a4,8(a6)
	vle8.v	v25,0(a1)
	addi	a6,a6,1
	vsetvli	zero,a0,e8,m2,ta,ma
	addi	t5,a6,-1
	vle8.v	v26,0(a5)
	vsetivli	zero,4,e8,mf4,ta,ma
	addi	a3,a1,32
	vlse8.v	v28,0(t5),zero
	vwcvtu.x.x.v	v24,v25
	vwcvtu.x.x.v	v25,v28
	vsetvli	zero,zero,e16,mf2,ta,ma
	vle8.v	v30,0(a3)
	vsll.vi	v24,v24,3
	vsll.vv	v25,v25,v9
	vand.vx	v25,v25,t0
	vsetvli	zero,a0,e8,m2,ta,ma
	vrgather.vv	v28,v30,v12
	vsetivli	zero,4,e16,mf2,ta,ma
	vor.vv	v24,v24,v25
	vsetvli	zero,a0,e8,m2,ta,ma
	andi	a2,a4,15
	vand.vv	v28,v28,v14
	vsetivli	zero,4,e64,m2,ta,ma
	slliw	a2,a2,1
	vluxei16.v	v10,(a7),v24
	vsetvli	zero,a0,e8,m2,ta,mu
	addiw	a2,a2,1
	vmsne.vi	v0,v28,0
	vneg.v	v26,v26,v0.t
	vwmul.vv	v28,v10,v26
	vsetivli	zero,16,e16,m2,ta,ma
	vwredsum.vs	v24,v28,v8
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a3,v24
	mulw	a2,a2,a3
	srliw	a4,a4,4
	slliw	a4,a4,1
	vsetivli	zero,16,e16,m2,ta,ma
	addiw	a4,a4,1
	vwredsum.vs	v24,v30,v8
	vsetivli	zero,4,e32,m1,ta,ma
	vmv.x.s	a3,v24
	addi	a1,a1,4
	addi	a5,a5,32
	mulw	a4,a4,a3
	fcvt.s.w	fa4,a2
	fadd.s	fa5,fa4,fa5
	fcvt.s.w	fa4,a4
	fadd.s	fa5,fa4,fa5
	bne	a1,t6,.L190
	addiw	s0,s0,1
	fmadd.s	fa2,fa3,fa5,fa2
	addi	t2,t2,292
	addi	t6,a1,82
	bgt	s1,s0,.L191
	flw	fa5,.LC16,a5
	fmul.s	fa2,fa2,fa5
	j	.L194
.L200:
	fmv.s.x	fa2,zero
	j	.L194
.L210:
	.cfi_restore 9
	sd	s1,72(sp)
	sd	s2,64(sp)
	sd	s3,56(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	call	__stack_chk_fail@plt
.L209:
	.cfi_restore 18
	.cfi_restore 19
	sd	s2,64(sp)
	sd	s3,56(sp)
	.cfi_remember_state
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	call	__stack_chk_fail@plt
.L211:
	.cfi_restore_state
	li	a2,4096
	lla	a3,.LANCHOR0+320
	addi	a2,a2,-2026
	lla	a1,.LC4
	lla	a0,.LC15
	sd	s2,64(sp)
	sd	s3,56(sp)
	.cfi_remember_state
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	call	__assert_fail@plt
.L208:
	.cfi_restore_state
	lla	a3,.LANCHOR0+360
	li	a2,1968
	lla	a1,.LC4
	lla	a0,.LC15
	sd	s2,64(sp)
	sd	s3,56(sp)
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	call	__assert_fail@plt
	.cfi_endproc
.LFE103:
	.size	ggml_vec_dot_iq2_s_q8_K, .-ggml_vec_dot_iq2_s_q8_K
	.align	1
	.globl	ggml_vec_dot_iq3_s_q8_K
	.type	ggml_vec_dot_iq3_s_q8_K, @function
ggml_vec_dot_iq3_s_q8_K:
.LFB105:
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	la	t0,__stack_chk_guard
	csrr	t3,vlenb
	sd	ra,104(sp)
	ld	t1, 0(t0)
	sd	t1, 40(sp)
	li	t1, 0
	slli	t3,t3,3
	li	t4,256
	.cfi_offset 1, -8
	beq	t3,t4,.L226
	ld	t3, 40(sp)
	ld	t1, 0(t0)
	xor	t1, t3, t1
	li	t3, 0
	bne	t1,zero,.L227
	ld	ra,104(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	tail	ggml_vec_dot_iq3_s_q8_K_generic@plt
.L226:
	.cfi_restore_state
	sd	s1,88(sp)
	.cfi_offset 9, -24
	andi	s1,a0,0xff
	bne	s1,zero,.L228
	mv	t5,a5
	lla	a5,.LANCHOR0
	ld	a4,608(a5)
	ld	a2,592(a5)
	mv	t6,a1
	mv	t2,a3
	ld	a1,584(a5)
	ld	a3,600(a5)
	sd	s2,80(sp)
	.cfi_offset 18, -32
	sraiw	s2,a0,31
	sd	a3,24(sp)
	sd	a4,32(sp)
	sd	a1,8(sp)
	sd	a2,16(sp)
	li	a5,64
	lla	a3,.LANCHOR0+424
	srliw	s2,s2,24
	vsetvli	zero,a5,e8,m2,ta,ma
	addw	s2,s2,a0
	vle8.v	v12,0(a3)
	addi	a5,sp,8
	lla	a3,.LANCHOR0+488
	li	a4,255
	vle8.v	v14,0(a3)
	sraiw	s2,s2,8
	vsetivli	zero,16,e16,m1,ta,ma
	vle16.v	v9,0(a5)
	ble	a0,a4,.L221
	fmv.s.x	fa2,zero
	vsetivli	zero,1,e32,m1,ta,ma
	sd	s0,96(sp)
	sd	s3,72(sp)
	addi	a1,t2,66
	addi	a5,t5,4
	addi	a3,t2,106
	sd	s4,64(sp)
	sd	s5,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	la	s3,ggml_table_f32_f16
	addi	t5,sp,6
	lla	s0,iq3s_grid
	li	a0,64
	li	t2,32
	vmv.v.i	v8,0
	vsetivli	zero,16,e32,m2,ta,ma
.L217:
	lhu	a4,-66(a1)
	flw	fa4,-4(a5)
	fmv.s.x	fa5,zero
	slli	a4,a4,2
	add	a4,s3,a4
	flw	fa3,0(a4)
	mv	t4,a5
	addi	a6,a1,-64
	fmul.s	fa3,fa3,fa4
	addi	t3,a1,8
	mv	t1,a3
	mv	a7,a1
.L216:
	lbu	s5,0(a7)
	lbu	s4,1(a7)
	vle8.v	v28,0(a6)
	sb	s5,0(t5)
	sb	s4,1(t5)
	vsetivli	zero,8,e8,mf4,ta,ma
	vle8.v	v30,0(t3)
	vsetvli	zero,a0,e8,m2,ta,ma
	vle8.v	v26,0(t4)
	vsetivli	zero,16,e8,mf2,ta,ma
	vwcvtu.x.x.v	v25,v28
	vlse16.v	v24,0(t5),zero
	vsetvli	zero,zero,e16,m1,ta,ma
	vsll.vi	v25,v25,2
	vsrl.vv	v24,v24,v9
	vand.vi	v24,v24,1
	vsetvli	zero,a0,e8,m2,ta,ma
	vrgather.vv	v28,v30,v12
	vsetivli	zero,16,e16,m1,ta,ma
	lbu	a4,0(t1)
	vsll.vi	v24,v24,10
	vsetvli	zero,a0,e8,m2,ta,ma
	vand.vv	v28,v28,v14
	vsetivli	zero,16,e16,m1,ta,ma
	vor.vv	v24,v25,v24
	vsetvli	zero,a0,e8,m2,ta,ma
	andi	a2,a4,15
	vmsne.vi	v0,v28,0
	srliw	a4,a4,4
	vsetivli	zero,16,e32,m2,ta,ma
	slliw	a2,a2,1
	vluxei16.v	v10,(s0),v24
	slliw	a4,a4,1
	vsetvli	zero,a0,e8,m2,ta,mu
	addiw	a2,a2,1
	vneg.v	v26,v26,v0.t
	addiw	a4,a4,1
	vwmulsu.vv	v28,v26,v10
	vsetvli	zero,t2,e16,m2,ta,ma
	vwredsum.vs	v25,v28,v8
	vwredsum.vs	v24,v30,v8
	vsetivli	zero,16,e32,m2,ta,ma
	vmv.x.s	s5,v25
	vmv.x.s	s4,v24
	mulw	a2,a2,s5
	addi	a6,a6,16
	addi	a7,a7,2
	addi	t3,t3,8
	addi	t4,t4,64
	addi	t1,t1,1
	mulw	a4,a4,s4
	addw	a4,a2,a4
	fcvt.s.w	fa4,a4
	fadd.s	fa5,fa5,fa4
	bne	a6,a1,.L216
	addiw	s1,s1,1
	fmadd.s	fa2,fa3,fa5,fa2
	addi	a1,a6,110
	addi	a5,a5,292
	addi	a3,a3,110
	bgt	s2,s1,.L217
	flw	fa5,.LC16,a5
	fmul.s	fa2,fa2,fa5
	ld	s0,96(sp)
	.cfi_restore 8
	ld	s3,72(sp)
	.cfi_restore 19
	ld	s4,64(sp)
	.cfi_restore 20
	ld	s5,56(sp)
	.cfi_restore 21
.L215:
	fsw	fa2,0(t6)
	ld	a4, 40(sp)
	ld	a5, 0(t0)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L229
	ld	ra,104(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s1,88(sp)
	.cfi_restore 9
	ld	s2,80(sp)
	.cfi_restore 18
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
.L221:
	.cfi_restore_state
	fmv.s.x	fa2,zero
	j	.L215
.L229:
	sd	s0,96(sp)
	sd	s3,72(sp)
	sd	s4,64(sp)
	sd	s5,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	call	__stack_chk_fail@plt
.L227:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	sd	s0,96(sp)
	sd	s1,88(sp)
	sd	s2,80(sp)
	sd	s3,72(sp)
	sd	s4,64(sp)
	sd	s5,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	call	__stack_chk_fail@plt
.L228:
	.cfi_restore 8
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	li	a2,4096
	lla	a3,.LANCHOR0+552
	addi	a2,a2,-1917
	lla	a1,.LC4
	lla	a0,.LC15
	sd	s0,96(sp)
	sd	s2,80(sp)
	sd	s3,72(sp)
	sd	s4,64(sp)
	sd	s5,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	call	__assert_fail@plt
	.cfi_endproc
.LFE105:
	.size	ggml_vec_dot_iq3_s_q8_K, .-ggml_vec_dot_iq3_s_q8_K
	.section	.rodata.str1.8
	.align	3
.LC17:
	.string	"\001\001\001\001\003\003\003\003\t\t\t\t\033\033\033\033"
	.text
	.align	1
	.globl	ggml_vec_dot_tq1_0_q8_K
	.type	ggml_vec_dot_tq1_0_q8_K, @function
ggml_vec_dot_tq1_0_q8_K:
.LFB107:
	.cfi_startproc
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	sd	s3,120(sp)
	csrr	t3,vlenb
	.cfi_offset 19, -40
	la	s3,__stack_chk_guard
	sd	ra,152(sp)
	ld	t1, 0(s3)
	sd	t1, 40(sp)
	li	t1, 0
	slli	t3,t3,3
	li	t2,256
	vsetivli	zero,1,e32,m1,ta,ma
	.cfi_offset 1, -8
	beq	t3,t2,.L242
	ld	t3, 40(sp)
	ld	t1, 0(s3)
	xor	t1, t3, t1
	li	t3, 0
	bne	t1,zero,.L243
	ld	ra,152(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s3,120(sp)
	.cfi_restore 19
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	tail	ggml_vec_dot_tq1_0_q8_K_generic@plt
.L242:
	.cfi_restore_state
	mv	t6,a5
	li	a5,1
	bne	a7,a5,.L244
	lla	a5,.LC17
	ld	a4,0(a5)
	ld	a5,8(a5)
	sd	s9,72(sp)
	.cfi_offset 25, -88
	sraiw	s9,a0,31
	srliw	s9,s9,24
	addw	s9,s9,a0
	sd	a5,32(sp)
	sd	a4,24(sp)
	li	a5,255
	mv	t4,a1
	sraiw	s9,s9,8
	ble	a0,a5,.L238
	fmv.s.x	fa4,zero
	sd	s10,64(sp)
	sd	s11,56(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	addi	a5,t6,4
	li	a0,0
	addi	a1,sp,20
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	addi	s11,sp,24
	la	s10,ggml_table_f32_f16
	li	a4,32
	li	a2,3
	li	t1,9
	li	a7,27
	li	a6,81
	sd	t4,8(sp)
	vmv.v.i	v31,0
	vsetivli	zero,16,e8,mf2,ta,ma
.L234:
	lbu	t3,51(a3)
	lbu	t6,48(a3)
	lbu	t5,49(a3)
	lbu	t4,50(a3)
	addi	s8,a3,32
	vle8.v	v28,0(s8)
	addi	s7,a5,32
	vsetvli	zero,a4,e8,m1,ta,ma
	addi	s6,a5,64
	addi	s5,a5,96
	addi	s4,a5,128
	vle8.v	v20,0(s7)
	vle8.v	v10,0(s6)
	vle8.v	v30,0(s5)
	vle8.v	v29,0(s4)
	addi	s2,a5,160
	vsetivli	zero,16,e8,mf2,ta,ma
	addi	s1,a5,176
	addi	s0,a5,192
	addi	t2,a5,208
	addi	t0,a5,224
	vle8.v	v19,0(s2)
	vle8.v	v18,0(s1)
	vle8.v	v17,0(s0)
	vle8.v	v16,0(t2)
	vle8.v	v11,0(t0)
	vsetvli	zero,a4,e8,m1,ta,ma
	sb	t6,0(a1)
	sb	t5,1(a1)
	sb	t4,2(a1)
	sb	t3,3(a1)
	vle8.v	v24,0(a3)
	vle8.v	v25,0(a5)
	vmul.vx	v26,v24,a2
	vwmulu.vx	v22,v24,a2
	vsetvli	zero,zero,e16,m2,ta,ma
	vsrl.vi	v22,v22,8
	vsetvli	zero,zero,e8,m1,ta,ma
	vwmulu.vx	v14,v26,a2
	vmul.vx	v26,v24,t1
	vsetvli	zero,zero,e16,m2,ta,ma
	vsrl.vi	v14,v14,8
	vsetvli	zero,zero,e8,m1,ta,ma
	vmul.vx	v8,v24,a7
	vwmulu.vx	v12,v26,a2
	vsetvli	zero,zero,e16,m2,ta,ma
	vsrl.vi	v12,v12,8
	vsetvli	zero,zero,e8,m1,ta,ma
	vwmulu.vx	v26,v8,a2
	vmul.vx	v24,v24,a6
	vsetvli	zero,zero,e16,m2,ta,ma
	vsrl.vi	v26,v26,8
	vsetvli	zero,zero,e8,m1,ta,ma
	vwmulu.vx	v8,v24,a2
	vwcvt.x.x.v	v4,v25
	vsetvli	zero,zero,e16,m2,ta,ma
	vsrl.vi	v8,v8,8
	vsetvli	zero,zero,e8,m1,ta,ma
	vwcvt.x.x.v	v24,v20
	vwcvt.x.x.v	v2,v10
	vwcvt.x.x.v	v0,v30
	vwcvt.x.x.v	v20,v29
	vsetvli	zero,zero,e16,m2,ta,ma
	vadd.vi	v12,v12,-1
	vadd.vi	v14,v14,-1
	vmul.vv	v14,v14,v24
	vadd.vi	v24,v26,-1
	vmul.vv	v26,v12,v2
	vmul.vv	v24,v24,v0
	vadd.vi	v22,v22,-1
	vadd.vi	v8,v8,-1
	vmul.vv	v22,v22,v4
	vmul.vv	v8,v8,v20
	vwadd.vv	v0,v22,v14
	vwadd.vv	v12,v26,v24
	vwcvt.x.x.v	v24,v8
	vsetvli	zero,zero,e32,m4,ta,ma
	vadd.vv	v12,v0,v12
	vsetivli	zero,16,e8,mf2,ta,ma
	vmul.vx	v29,v28,a2
	vwmulu.vx	v10,v28,a2
	vsetvli	zero,zero,e16,m1,ta,ma
	vsrl.vi	v10,v10,8
	vsetvli	zero,zero,e8,mf2,ta,ma
	vwmulu.vx	v30,v29,a2
	vmul.vx	v29,v28,t1
	vsetvli	zero,zero,e16,m1,ta,ma
	vsrl.vi	v30,v30,8
	vsetvli	zero,zero,e8,mf2,ta,ma
	vwmulu.vx	v8,v29,a2
	vmul.vx	v20,v28,a7
	vsetvli	zero,zero,e16,m1,ta,ma
	vsrl.vi	v9,v8,8
	vsetvli	zero,zero,e8,mf2,ta,ma
	vwmulu.vx	v29,v20,a2
	vmul.vx	v8,v28,a6
	vsetvli	zero,zero,e16,m1,ta,ma
	vsrl.vi	v29,v29,8
	vsetvli	zero,zero,e8,mf2,ta,ma
	vwmulu.vx	v28,v8,a2
	vwcvt.x.x.v	v20,v19
	vsetvli	zero,zero,e16,m1,ta,ma
	vsrl.vi	v28,v28,8
	vsetvli	zero,zero,e8,mf2,ta,ma
	vwcvt.x.x.v	v8,v18
	vwcvt.x.x.v	v19,v17
	vwcvt.x.x.v	v18,v11
	vwcvt.x.x.v	v17,v16
	vsetvli	zero,zero,e16,m1,ta,ma
	vadd.vi	v10,v10,-1
	vadd.vi	v30,v30,-1
	vmul.vv	v10,v10,v20
	vmul.vv	v30,v30,v8
	vadd.vi	v8,v9,-1
	vmul.vv	v8,v8,v19
	vadd.vi	v29,v29,-1
	vadd.vi	v28,v28,-1
	vmul.vv	v29,v29,v17
	vmul.vv	v28,v28,v18
	vwadd.vv	v16,v10,v30
	vwadd.vv	v10,v8,v29
	vwcvt.x.x.v	v8,v28
	vsetvli	zero,zero,e32,m2,ta,ma
	vadd.vv	v10,v16,v10
	vsetvli	zero,a4,e32,m4,ta,ma
	lw	t3,20(sp)
	vadd.vv	v24,v24,v12
	vsetivli	zero,16,e32,m2,ta,ma
	vadd.vv	v8,v8,v10
	vsetivli	zero,4,e32,mf2,ta,ma
	sw	t3,20(sp)
	addi	t5,a5,240
	vmv.v.x	v30,t3
	vsetivli	zero,16,e8,mf2,ta,ma
	vle8.v	v28,0(t5)
	vle8.v	v29,0(s11)
	vmul.vv	v29,v29,v30
	vwcvt.x.x.v	v30,v28
	vwmulu.vx	v28,v29,a2
	vsetvli	zero,zero,e32,m2,ta,ma
	vadd.vv	v24,v26,v24
	vsetvli	zero,zero,e16,m1,ta,ma
	vsrl.vi	v26,v28,8
	vsetvli	zero,zero,e32,m2,ta,ma
	vadd.vv	v24,v24,v8
	vsetvli	zero,zero,e16,m1,ta,ma
	flw	fa3,-4(a5)
	lhu	t4,52(a3)
	vadd.vi	v26,v26,-1
	vmul.vv	v26,v26,v30
	vwcvt.x.x.v	v28,v26
	vsetvli	zero,zero,e32,m2,ta,ma
	vadd.vv	v24,v24,v28
	vredsum.vs	v24,v24,v31
	vmv.x.s	t3,v24
	fcvt.s.w	fa5,t3
	slli	t3,t4,2
	add	t3,s10,t3
	fmul.s	fa5,fa5,fa3
	flw	fa3,0(t3)
	addiw	a0,a0,1
	addi	a3,a3,54
	addi	a5,a5,292
	fmadd.s	fa4,fa5,fa3,fa4
	bgt	s9,a0,.L234
	ld	t4,8(sp)
	ld	s0,144(sp)
	.cfi_restore 8
	ld	s1,136(sp)
	.cfi_restore 9
	ld	s2,128(sp)
	.cfi_restore 18
	ld	s4,112(sp)
	.cfi_restore 20
	ld	s5,104(sp)
	.cfi_restore 21
	ld	s6,96(sp)
	.cfi_restore 22
	ld	s7,88(sp)
	.cfi_restore 23
	ld	s8,80(sp)
	.cfi_restore 24
	ld	s10,64(sp)
	.cfi_restore 26
	ld	s11,56(sp)
	.cfi_restore 27
.L233:
	fsw	fa4,0(t4)
	ld	a4, 40(sp)
	ld	a5, 0(s3)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L245
	ld	ra,152(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s9,72(sp)
	.cfi_restore 25
	ld	s3,120(sp)
	.cfi_restore 19
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
.L238:
	.cfi_restore_state
	fmv.s.x	fa4,zero
	j	.L233
.L243:
	.cfi_restore 25
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__stack_chk_fail@plt
.L245:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 26
	.cfi_restore 27
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__stack_chk_fail@plt
.L244:
	.cfi_restore 8
	.cfi_restore 9
	.cfi_restore 18
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	li	a2,4096
	lla	a3,.LANCHOR0+616
	addi	a2,a2,-1807
	lla	a1,.LC4
	lla	a0,.LC12
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	call	__assert_fail@plt
	.cfi_endproc
.LFE107:
	.size	ggml_vec_dot_tq1_0_q8_K, .-ggml_vec_dot_tq1_0_q8_K
	.align	1
	.globl	ggml_vec_dot_tq2_0_q8_K
	.type	ggml_vec_dot_tq2_0_q8_K, @function
ggml_vec_dot_tq2_0_q8_K:
.LFB109:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	la	t5,__stack_chk_guard
	csrr	t0,vlenb
	sd	s0,32(sp)
	sd	ra,40(sp)
	ld	t1, 0(t5)
	sd	t1, 8(sp)
	li	t1, 0
	slli	t0,t0,3
	.cfi_offset 8, -16
	.cfi_offset 1, -8
	li	s0,256
	beq	t0,s0,.L260
	ld	t3, 8(sp)
	ld	t1, 0(t5)
	xor	t1, t3, t1
	li	t3, 0
	bne	t1,zero,.L259
	ld	s0,32(sp)
	.cfi_remember_state
	.cfi_restore 8
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	tail	ggml_vec_dot_tq2_0_q8_K_generic@plt
.L260:
	.cfi_restore_state
	andi	a6,a0,0xff
	bne	a6,zero,.L261
	mv	t1,a5
	li	a5,1
	bne	a7,a5,.L262
	sraiw	s0,a0,31
	srliw	s0,s0,24
	addw	s0,s0,a0
	li	a5,255
	mv	t4,a1
	sraiw	s0,s0,8
	ble	a0,a5,.L255
	li	a4,32
	vsetvli	a0,a4,e16,m2,ta,ma
	fmv.s.x	fa4,zero
	vsetvli	a5,a4,e8,m1,ta,mu
	vsetvli	zero,a0,e16,m2,ta,ma
	sd	s1,24(sp)
	addi	a2,t1,4
	.cfi_offset 9, -24
	la	s1,ggml_table_f32_f16
	vmv.v.i	v30,0
	vsetivli	zero,1,e32,m1,ta,ma
	vmv.v.i	v29,0
.L251:
	lhu	a4,64(a3)
	addi	t0,a2,32
	addi	t6,a2,64
	slli	a4,a4,2
	vsetvli	zero,a5,e8,m1,ta,ma
	addi	a7,a2,160
	vle8.v	v24,0(a3)
	vle8.v	v12,0(a2)
	vle8.v	v11,0(t0)
	vle8.v	v10,0(t6)
	vand.vi	v9,v24,3
	vsrl.vi	v8,v24,2
	vsrl.vi	v28,v24,4
	add	a4,s1,a4
	vsrl.vi	v24,v24,6
	addi	t3,a2,96
	addi	t2,a3,32
	addi	t1,a2,128
	addi	a1,a2,192
	vle8.v	v26,0(t2)
	vadd.vi	v27,v24,-1
	vadd.vi	v9,v9,-1
	vle8.v	v13,0(t3)
	vand.vi	v8,v8,3
	vand.vi	v28,v28,3
	vadd.vi	v8,v8,-1
	vadd.vi	v28,v28,-1
	flw	fa5,0(a4)
	vmv2r.v	v24,v30
	addi	a4,a2,224
	vwmacc.vv	v24,v9,v12
	vle8.v	v12,0(t1)
	vwmacc.vv	v24,v8,v11
	vle8.v	v11,0(a7)
	vwmacc.vv	v24,v28,v10
	vle8.v	v10,0(a1)
	vwmacc.vv	v24,v27,v13
	vsetvli	zero,zero,e16,m2,ta,ma
	flw	fa3,-4(a2)
	vwredsum.vs	v27,v24,v29
	vle8.v	v9,0(a4)
	vsetvli	zero,zero,e8,m1,ta,ma
	vand.vi	v8,v26,3
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a4,v27
	vsetvli	zero,a5,e8,m1,ta,ma
	fmul.s	fa5,fa5,fa3
	vsrl.vi	v28,v26,2
	vsrl.vi	v27,v26,4
	vadd.vi	v8,v8,-1
	vand.vi	v28,v28,3
	vand.vi	v27,v27,3
	vadd.vi	v28,v28,-1
	vadd.vi	v27,v27,-1
	vsrl.vi	v26,v26,6
	vmv2r.v	v24,v30
	vadd.vi	v26,v26,-1
	vwmacc.vv	v24,v8,v12
	vwmacc.vv	v24,v28,v11
	vwmacc.vv	v24,v27,v10
	vwmacc.vv	v24,v26,v9
	vsetvli	zero,zero,e16,m2,ta,ma
	vwredsum.vs	v26,v24,v29
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a7,v26
	addw	a4,a4,a7
	fcvt.s.w	fa3,a4
	addiw	a6,a6,1
	addi	a3,a3,66
	fmadd.s	fa4,fa5,fa3,fa4
	addi	a2,a2,292
	bgt	s0,a6,.L251
	ld	s1,24(sp)
	.cfi_restore 9
.L250:
	fsw	fa4,0(t4)
	ld	a4, 8(sp)
	ld	a5, 0(t5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L259
	ld	ra,40(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.L255:
	.cfi_restore_state
	fmv.s.x	fa4,zero
	j	.L250
.L259:
	sd	s1,24(sp)
	.cfi_remember_state
	.cfi_offset 9, -24
	call	__stack_chk_fail@plt
.L261:
	.cfi_restore_state
	li	a2,4096
	lla	a3,.LANCHOR0+648
	addi	a2,a2,-1686
	lla	a1,.LC4
	lla	a0,.LC15
	sd	s1,24(sp)
	.cfi_remember_state
	.cfi_offset 9, -24
	call	__assert_fail@plt
.L262:
	.cfi_restore_state
	li	a2,4096
	lla	a3,.LANCHOR0+648
	addi	a2,a2,-1685
	lla	a1,.LC4
	lla	a0,.LC12
	sd	s1,24(sp)
	.cfi_offset 9, -24
	call	__assert_fail@plt
	.cfi_endproc
.LFE109:
	.size	ggml_vec_dot_tq2_0_q8_K, .-ggml_vec_dot_tq2_0_q8_K
	.align	1
	.globl	ggml_vec_dot_iq1_s_q8_K
	.type	ggml_vec_dot_iq1_s_q8_K, @function
ggml_vec_dot_iq1_s_q8_K:
.LFB111:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	la	t3,__stack_chk_guard
	csrr	t4,vlenb
	sd	s0,64(sp)
	sd	ra,72(sp)
	ld	t1, 0(t3)
	sd	t1, 40(sp)
	li	t1, 0
	slli	t4,t4,3
	.cfi_offset 8, -16
	.cfi_offset 1, -8
	li	s0,256
	beq	t4,s0,.L277
	ld	s0, 40(sp)
	ld	t1, 0(t3)
	xor	t1, s0, t1
	li	s0, 0
	bne	t1,zero,.L276
	ld	s0,64(sp)
	.cfi_remember_state
	.cfi_restore 8
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	tail	ggml_vec_dot_iq1_s_q8_K_generic@plt
.L277:
	.cfi_restore_state
	andi	t4,a0,0xff
	bne	t4,zero,.L278
	mv	t0,a5
	li	a5,1
	bne	a7,a5,.L279
	sraiw	t5,a0,31
	srliw	t5,t5,24
	addw	t5,t5,a0
	li	a5,255
	mv	t1,a1
	sraiw	t5,t5,8
	ble	a0,a5,.L272
	li	a0,32
	li	a2,1207971840
	vsetvli	zero,a0,e16,m2,ta,ma
	slli	a2,a2,5
	vid.v	v28
	addi	a2,a2,3
	vsetivli	zero,8,e32,m1,ta,ma
	slli	a2,a2,16
	vmv.v.i	v9,-1
	vmv.v.i	v8,1
	fmv.s.x	fa3,zero
	vsetvli	zero,zero,e64,m2,ta,ma
	flw	fa0,.LC16,a4
	vmv.v.x	v30,a2
	li	a6,-1
	vsetvli	zero,a0,e16,m2,ta,ma
	li	a2,4
	addi	a5,t0,4
	vdiv.vx	v28,v28,a2
	sd	s1,56(sp)
	vsetivli	zero,1,e32,m1,ta,ma
	sd	s2,48(sp)
	addi	a3,a3,34
	lla	a7,iq1s_grid
	addi	s0,sp,8
	la	t2,ggml_table_f32_f16
	li	t0,2
	li	t6,-32768
	li	a4,32
	li	a1,128
	srli	a6,a6,32
	vmv.v.i	v27,0
	vsetivli	zero,8,e16,mf2,ta,ma
	.cfi_offset 9, -24
	.cfi_offset 18, -32
.L268:
	vle16.v	v0,0(a3)
	addi	a2,a3,-32
	vsetvli	zero,a4,e16,m2,ta,ma
	vle8.v	v26,0(a2)
	vrgather.vv	v24,v0,v28
	vzext.vf2	v10,v26
	vsrl.vv	v24,v24,v30
	vsetvli	zero,a1,e8,m4,ta,ma
	vle8.v	v12,0(a5)
	vsetvli	zero,a4,e16,m2,ta,ma
	vand.vi	v24,v24,7
	vsll.vi	v24,v24,8
	vor.vv	v24,v24,v10
	vsll.vi	v24,v24,3
	vsetivli	zero,16,e64,m4,ta,ma
	vluxei16.v	v4,(a7),v24
	vsetvli	zero,a1,e8,m4,ta,ma
	vwmul.vv	v16,v4,v12
	vsetvli	zero,a4,e16,m2,ta,ma
	vwredsum.vs	v10,v16,v27
	vwredsum.vs	v26,v18,v27
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a0,v10
	vmv.x.s	s2,v26
	vsetvli	zero,a4,e16,m2,ta,ma
	and	a0,a6,a0
	vwredsum.vs	v10,v20,v27
	vwredsum.vs	v26,v22,v27
	slli	s2,s2,32
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a2,v10
	vmv.x.s	s1,v26
	and	a2,a6,a2
	slli	s1,s1,32
	vsetivli	zero,8,e16,mf2,ta,ma
	or	a0,a0,s2
	or	a2,a2,s1
	vsrl.vi	v10,v0,12
	sd	a0,8(sp)
	vand.vx	v0,v0,t6
	vand.vi	v10,v10,7
	vmseq.vi	v0,v0,0
	vwmulu.vx	v26,v10,t0
	sd	a2,16(sp)
	vsetvli	zero,zero,e32,m1,ta,ma
	vadd.vi	v26,v26,1
	vmerge.vvm	v11,v9,v8,v0
	vsetivli	zero,16,e64,m4,ta,ma
	addi	a2,a5,128
	vluxei16.v	v0,(a7),v25
	vsetvli	zero,a1,e8,m4,ta,ma
	vle8.v	v12,0(a2)
	vwmul.vv	v16,v0,v12
	vsetvli	zero,a4,e16,m2,ta,ma
	vwredsum.vs	v25,v16,v27
	vwredsum.vs	v24,v18,v27
	vsetivli	zero,0,e32,m1,ta,ma
	vmv.x.s	a0,v25
	vmv.x.s	s2,v24
	vsetvli	zero,a4,e16,m2,ta,ma
	and	a0,a6,a0
	vwredsum.vs	v25,v20,v27
	vwredsum.vs	v24,v22,v27
	slli	s2,s2,32
	vsetivli	zero,16,e32,m2,ta,ma
	vmv.x.s	a2,v25
	vmv.x.s	s1,v24
	and	a2,a6,a2
	slli	s1,s1,32
	or	a0,a0,s2
	or	a2,a2,s1
	sd	a0,24(sp)
	sd	a2,32(sp)
	lhu	a2,-34(a3)
	addi	a0,a5,256
	vle16.v	v25,0(a0)
	vsetivli	zero,8,e16,mf2,ta,ma
	slli	a2,a2,2
	vnsrl.wi	v12,v25,0
	vle32.v	v24,0(s0)
	vnsrl.wi	v25,v25,16
	vsetvli	zero,zero,e32,m1,ta,ma
	add	a2,t2,a2
	vmul.vv	v24,v26,v24
	vsetvli	zero,zero,e16,mf2,ta,ma
	flw	fa4,0(a2)
	vwadd.vv	v10,v12,v25
	vsetvli	zero,zero,e32,m1,ta,ma
	vredsum.vs	v24,v24,v27
	vmv.x.s	a2,v24
	flw	fa1,-4(a5)
	fcvt.s.w	fa2,a2
	vmul.vv	v26,v26,v11
	vmul.vv	v26,v26,v10
	vredsum.vs	v26,v26,v27
	vmv.x.s	a2,v26
	fcvt.s.w	fa5,a2
	fmul.s	fa4,fa4,fa1
	addiw	t4,t4,1
	fmadd.s	fa5,fa5,fa0,fa2
	addi	a3,a3,50
	addi	a5,a5,292
	fmadd.s	fa3,fa4,fa5,fa3
	bgt	t5,t4,.L268
	ld	s1,56(sp)
	.cfi_restore 9
	ld	s2,48(sp)
	.cfi_restore 18
.L267:
	fsw	fa3,0(t1)
	ld	a4, 40(sp)
	ld	a5, 0(t3)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L276
	ld	ra,72(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
.L272:
	.cfi_restore_state
	fmv.s.x	fa3,zero
	j	.L267
.L276:
	sd	s1,56(sp)
	sd	s2,48(sp)
	.cfi_remember_state
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	call	__stack_chk_fail@plt
.L278:
	.cfi_restore_state
	li	a2,4096
	lla	a3,.LANCHOR0+680
	addi	a2,a2,-1600
	lla	a1,.LC4
	lla	a0,.LC15
	sd	s1,56(sp)
	sd	s2,48(sp)
	.cfi_remember_state
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	call	__assert_fail@plt
.L279:
	.cfi_restore_state
	li	a2,4096
	lla	a3,.LANCHOR0+680
	addi	a2,a2,-1599
	lla	a1,.LC4
	lla	a0,.LC12
	sd	s1,56(sp)
	sd	s2,48(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	call	__assert_fail@plt
	.cfi_endproc
.LFE111:
	.size	ggml_vec_dot_iq1_s_q8_K, .-ggml_vec_dot_iq1_s_q8_K
	.align	1
	.globl	ggml_vec_dot_iq1_m_q8_K
	.type	ggml_vec_dot_iq1_m_q8_K, @function
ggml_vec_dot_iq1_m_q8_K:
.LFB113:
	.cfi_startproc
	csrr	t0,vlenb
	li	t1,14
	mul	t1,t1,t0
	addi	sp,sp,-160
	.cfi_def_cfa_offset 160
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	ra,152(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	sd	s6,96(sp)
	sd	s7,88(sp)
	sd	s8,80(sp)
	sd	s9,72(sp)
	sd	s10,64(sp)
	sd	s11,56(sp)
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 1, -8
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
	li	s1,14
	sub	sp,sp,t1
	.cfi_escape 0xf,0xc,0x72,0,0x92,0xa2,0x38,0,0x3e,0x1e,0x23,0xa0,0x1,0x22
	csrr	t1,vlenb
	mul	s1,s1,t1
	la	s0,__stack_chk_guard
	csrr	t4,vlenb
	slli	t4,t4,3
	li	t6,256
	vsetivli	zero,16,e32,m2,ta,ma
	addi	s1,s1,40
	add	s1,s1,sp
	ld	t1, 0(s0)
	sd	t1, 0(s1)
	li	t1, 0
	beq	t4,t6,.L293
	csrr	t1,vlenb
	li	s1,14
	mul	s1,s1,t1
	la	s0,__stack_chk_guard
	addi	s1,s1,40
	add	s1,s1,sp
	ld	t3, 0(s1)
	ld	t1, 0(s0)
	xor	t1, t3, t1
	li	t3, 0
	bne	t1,zero,.L291
	csrr	t0,vlenb
	li	t1,14
	mul	t1,t1,t0
	add	sp,sp,t1
	.cfi_remember_state
	.cfi_def_cfa_offset 160
	ld	ra,152(sp)
	.cfi_restore 1
	ld	s0,144(sp)
	.cfi_restore 8
	ld	s1,136(sp)
	.cfi_restore 9
	ld	s2,128(sp)
	.cfi_restore 18
	ld	s3,120(sp)
	.cfi_restore 19
	ld	s4,112(sp)
	.cfi_restore 20
	ld	s5,104(sp)
	.cfi_restore 21
	ld	s6,96(sp)
	.cfi_restore 22
	ld	s7,88(sp)
	.cfi_restore 23
	ld	s8,80(sp)
	.cfi_restore 24
	ld	s9,72(sp)
	.cfi_restore 25
	ld	s10,64(sp)
	.cfi_restore 26
	ld	s11,56(sp)
	.cfi_restore 27
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	tail	ggml_vec_dot_iq1_m_q8_K_generic@plt
.L293:
	.cfi_restore_state
	andi	s5,a0,0xff
	bne	s5,zero,.L294
	mv	s3,a5
	li	a5,1
	bne	a7,a5,.L295
	sraiw	a4,a0,31
	srliw	a4,a4,24
	addw	a4,a4,a0
	sraiw	a4,a4,8
	li	a5,255
	sd	a4,8(sp)
	mv	t1,a1
	ble	a0,a5,.L289
	li	a4,16842752
	addi	a4,a4,257
	slli	a4,a4,16
	addi	a4,a4,257
	li	a5,8388608
	addiw	a5,a5,8
	li	a2,262144
	slli	a4,a4,16
	addi	a4,a4,257
	vmv.v.i	v6,0
	addiw	a2,a2,8
	vsetivli	zero,8,e32,m1,ta,ma
	vmv.v.x	v2,a5
	addi	a5,sp,32
	vmv.v.x	v3,a2
	vsetivli	zero,16,e64,m4,ta,ma
	vmv.v.x	v24,a4
	vs4r.v	v24,0(a5)
	csrr	a5,vlenb
	slli	a5,a5,2
	addi	a5,a5,32
	add	a5,a5,sp
	vmv.v.i	v24,-1
	csrr	a4,vlenb
	vs4r.v	v24,0(a5)
	li	a5,12
	mul	a5,a5,a4
	li	a1,4096
	fmv.s.x	fa3,zero
	addi	a1,a1,-256
	addi	s3,s3,4
	lla	s7,iq1s_grid
	flw	fa0,.LC16,a0
	li	s4,128
	sd	a1,16(sp)
	sd	t1,24(sp)
	addi	a5,a5,32
	add	a5,a5,sp
	vsetivli	zero,1,e32,m1,ta,ma
	vs2r.v	v6,0(a5)
	vmv.v.i	v1,0
.L285:
	lhu	a0,48(a3)
	lhu	a1,50(a3)
	lhu	a4,54(a3)
	lhu	a2,52(a3)
	ld	s0,16(sp)
	li	a5,-4096
	srliw	a6,a0,12
	and	a5,a4,a5
	srliw	a7,a1,8
	or	a5,a5,a6
	andi	a7,a7,240
	srliw	a6,a2,4
	and	a6,s0,a6
	or	a5,a5,a7
	or	a5,a5,a6
	slli	a5,a5,48
	srli	a5,a5,48
	la	s6,ggml_table_f32_f16
	slli	a5,a5,2
	add	a5,s6,a5
	vsetvli	zero,s4,e8,m4,ta,ma
	csrr	s6,vlenb
	vle8.v	v24,0(s3)
	slli	s6,s6,3
	vsetivli	zero,16,e8,mf2,ta,ma
	addi	s11,s3,128
	vle8.v	v30,0(a3)
	addi	s6,s6,32
	vsetvli	zero,s4,e8,m4,ta,ma
	addi	s10,a3,32
	vle8.v	v12,0(s11)
	add	s6,s6,sp
	vsetivli	zero,8,e8,mf4,ta,ma
	vs4r.v	v12,0(s6)
	addi	s9,a3,40
	vle8.v	v28,0(s10)
	vsetivli	zero,16,e16,m1,ta,ma
	addi	s6,sp,32
	vzext.vf2	v29,v30
	vsetivli	zero,8,e16,mf2,ta,ma
	vle8.v	v8,0(s9)
	vzext.vf2	v30,v28
	vzext.vf2	v28,v8
	vl4re64.v	v8,0(s6)
	csrr	s6,vlenb
	slli	s6,s6,2
	addi	s6,s6,32
	add	s6,s6,sp
	csrr	s9,vlenb
	vl4re64.v	v12,0(s6)
	li	s6,12
	mul	s6,s6,s9
	vsll.vi	v31,v30,8
	vor.vv	v30,v30,v31
	vsll.vi	v31,v28,8
	vsetivli	zero,16,e16,m1,ta,ma
	vzext.vf2	v0,v30
	vsetivli	zero,8,e16,mf2,ta,ma
	flw	fa4,0(a5)
	vor.vv	v30,v28,v31
	li	a5,1792
	vsetivli	zero,16,e16,m1,ta,ma
	andi	s2,a0,7
	vzext.vf2	v28,v30
	vsll.vv	v31,v0,v3
	srli	s1,a0,2
	vand.vx	v30,v31,a5
	vand.vv	v0,v0,v2
	vor.vv	v29,v29,v30
	vmsgtu.vi	v0,v0,0
	vsll.vi	v29,v29,3
	srli	s0,a0,5
	vsetvli	zero,zero,e64,m4,ta,ma
	andi	t2,a1,7
	srli	a0,a0,8
	vmerge.vvm	v8,v8,v12,v0
	addi	s8,a3,16
	vluxei16.v	v12,(s7),v29
	slli	s2,s2,1
	vsetvli	zero,s4,e8,m4,ta,ma
	andi	s1,s1,14
	andi	s0,s0,14
	andi	a0,a0,14
	slli	t2,t2,1
	addi	s6,s6,32
	vwmul.vv	v16,v8,v24
	addi	s2,s2,1
	addi	s1,s1,1
	addi	s0,s0,1
	addi	a0,a0,1
	addi	t2,t2,1
	vmv4r.v	v4,v12
	add	s6,s6,sp
	vwmul.vv	v8,v4,v24
	vsetivli	zero,16,e16,m1,ta,ma
	vle8.v	v30,0(s8)
	vsll.vv	v29,v28,v3
	vand.vx	v29,v29,a5
	addi	a5,sp,32
	vand.vv	v0,v28,v2
	vl2re32.v	v24,0(s6)
	vmv2r.v	v26,v24
	vwmacc.vx	v24,s2,v8
	vwmacc.vx	v24,s1,v9
	vwmacc.vx	v24,s0,v10
	vwmacc.vx	v24,a0,v11
	vwmacc.vx	v24,t2,v12
	vzext.vf2	v12,v30
	vor.vv	v12,v12,v29
	vl4re64.v	v28,0(a5)
	slli	a5,s9,2
	addi	a5,a5,32
	srli	t0,a1,2
	srli	t6,a1,5
	add	a5,a5,sp
	srli	a1,a1,8
	vl4re64.v	v8,0(a5)
	andi	t0,t0,14
	andi	t6,t6,14
	andi	a1,a1,14
	slli	a5,s9,3
	addi	t0,t0,1
	addi	t6,t6,1
	addi	a1,a1,1
	addi	a5,a5,32
	vwmacc.vx	v26,s2,v16
	vwmacc.vx	v24,t0,v13
	vwmacc.vx	v26,s1,v17
	vwmacc.vx	v24,t6,v14
	vwmacc.vx	v26,s0,v18
	vwmacc.vx	v24,a1,v15
	vwmacc.vx	v26,a0,v19
	vsll.vi	v12,v12,3
	vwmacc.vx	v26,t2,v20
	vmsgtu.vi	v0,v0,0
	vwmacc.vx	v26,t0,v21
	andi	t5,a2,7
	vwmacc.vx	v26,t6,v22
	srli	t4,a2,2
	vwmacc.vx	v26,a1,v23
	srli	t3,a2,5
	vsetvli	zero,zero,e64,m4,ta,ma
	andi	t1,a4,7
	srli	a7,a4,2
	srli	a6,a4,5
	add	a5,a5,sp
	srli	a2,a2,8
	srli	a4,a4,8
	vmerge.vvm	v8,v28,v8,v0
	slli	t5,t5,1
	vluxei16.v	v28,(s7),v12
	andi	t4,t4,14
	vl4re8.v	v12,0(a5)
	vsetvli	zero,s4,e8,m4,ta,ma
	andi	t3,t3,14
	andi	a2,a2,14
	slli	t1,t1,1
	andi	a7,a7,14
	andi	a6,a6,14
	andi	a4,a4,14
	vwmul.vv	v16,v8,v12
	addi	a4,a4,1
	addi	t5,t5,1
	addi	t4,t4,1
	addi	t3,t3,1
	addi	a2,a2,1
	addi	t1,t1,1
	addi	a7,a7,1
	addi	a6,a6,1
	vmv4r.v	v4,v12
	vwmul.vv	v8,v28,v4
	vsetivli	zero,16,e16,m1,ta,ma
	flw	fa1,-4(s3)
	vwmacc.vx	v26,t5,v16
	vwmacc.vx	v24,t5,v8
	vwmacc.vx	v26,t4,v17
	vwmacc.vx	v24,t4,v9
	vwmacc.vx	v26,t3,v18
	vwmacc.vx	v24,t3,v10
	vwmacc.vx	v26,a2,v19
	vwmacc.vx	v24,a2,v11
	vwmacc.vx	v26,t1,v20
	vwmacc.vx	v24,t1,v12
	vwmacc.vx	v26,a7,v21
	vwmacc.vx	v24,a7,v13
	vwmacc.vx	v26,a6,v22
	vwmacc.vx	v24,a6,v14
	vwmacc.vx	v26,a4,v23
	vwmacc.vx	v24,a4,v15
	vsetvli	zero,zero,e32,m2,ta,ma
	vredsum.vs	v26,v26,v1
	vredsum.vs	v24,v24,v1
	vmv.x.s	a4,v26
	vmv.x.s	a5,v24
	fcvt.s.w	fa5,a4
	fcvt.s.w	fa2,a5
	fmul.s	fa4,fa4,fa1
	ld	a5,8(sp)
	fmadd.s	fa5,fa5,fa0,fa2
	addiw	s5,s5,1
	addi	a3,a3,56
	addi	s3,s3,292
	fmadd.s	fa3,fa4,fa5,fa3
	bgt	a5,s5,.L285
	ld	t1,24(sp)
.L284:
	csrr	a4,vlenb
	li	a3,14
	mul	a3,a3,a4
	la	a5,__stack_chk_guard
	fsw	fa3,0(t1)
	addi	a3,a3,40
	add	a3,a3,sp
	ld	a4, 0(a3)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L291
	csrr	t0,vlenb
	li	t1,14
	mul	t1,t1,t0
	add	sp,sp,t1
	.cfi_remember_state
	.cfi_def_cfa_offset 160
	ld	ra,152(sp)
	.cfi_restore 1
	ld	s0,144(sp)
	.cfi_restore 8
	ld	s1,136(sp)
	.cfi_restore 9
	ld	s2,128(sp)
	.cfi_restore 18
	ld	s3,120(sp)
	.cfi_restore 19
	ld	s4,112(sp)
	.cfi_restore 20
	ld	s5,104(sp)
	.cfi_restore 21
	ld	s6,96(sp)
	.cfi_restore 22
	ld	s7,88(sp)
	.cfi_restore 23
	ld	s8,80(sp)
	.cfi_restore 24
	ld	s9,72(sp)
	.cfi_restore 25
	ld	s10,64(sp)
	.cfi_restore 26
	ld	s11,56(sp)
	.cfi_restore 27
	addi	sp,sp,160
	.cfi_def_cfa_offset 0
	jr	ra
.L289:
	.cfi_restore_state
	fmv.s.x	fa3,zero
	j	.L284
.L291:
	call	__stack_chk_fail@plt
.L294:
	li	a2,4096
	lla	a3,.LANCHOR0+712
	addi	a2,a2,-1489
	lla	a1,.LC4
	lla	a0,.LC15
	call	__assert_fail@plt
.L295:
	li	a2,4096
	lla	a3,.LANCHOR0+712
	addi	a2,a2,-1488
	lla	a1,.LC4
	lla	a0,.LC12
	call	__assert_fail@plt
	.cfi_endproc
.LFE113:
	.size	ggml_vec_dot_iq1_m_q8_K, .-ggml_vec_dot_iq1_m_q8_K
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
.LC6:
	.word	1123942400
	.align	2
.LC7:
	.word	1065353216
	.align	2
.LC8:
	.word	2004877312
	.align	2
.LC9:
	.word	142606336
	.align	2
.LC16:
	.word	1040187392
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	__PRETTY_FUNCTION__.18, @object
	.size	__PRETTY_FUNCTION__.18, 18
__PRETTY_FUNCTION__.18:
	.string	"quantize_row_q8_0"
	.zero	6
	.type	__PRETTY_FUNCTION__.17, @object
	.size	__PRETTY_FUNCTION__.17, 18
__PRETTY_FUNCTION__.17:
	.string	"quantize_row_q8_1"
	.zero	6
	.type	__PRETTY_FUNCTION__.16, @object
	.size	__PRETTY_FUNCTION__.16, 23
__PRETTY_FUNCTION__.16:
	.string	"ggml_vec_dot_q4_0_q8_0"
	.zero	1
	.type	__PRETTY_FUNCTION__.15, @object
	.size	__PRETTY_FUNCTION__.15, 23
__PRETTY_FUNCTION__.15:
	.string	"ggml_vec_dot_q4_1_q8_1"
	.zero	1
	.type	__PRETTY_FUNCTION__.14, @object
	.size	__PRETTY_FUNCTION__.14, 23
__PRETTY_FUNCTION__.14:
	.string	"ggml_vec_dot_q5_0_q8_0"
	.zero	1
	.type	__PRETTY_FUNCTION__.13, @object
	.size	__PRETTY_FUNCTION__.13, 23
__PRETTY_FUNCTION__.13:
	.string	"ggml_vec_dot_q5_1_q8_1"
	.zero	1
	.type	__PRETTY_FUNCTION__.12, @object
	.size	__PRETTY_FUNCTION__.12, 23
__PRETTY_FUNCTION__.12:
	.string	"ggml_vec_dot_q8_0_q8_0"
	.zero	1
	.type	__PRETTY_FUNCTION__.11, @object
	.size	__PRETTY_FUNCTION__.11, 23
__PRETTY_FUNCTION__.11:
	.string	"ggml_vec_dot_q2_K_q8_K"
	.zero	1
.LC13:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001"
	.ascii	"\001"
	.type	__PRETTY_FUNCTION__.10, @object
	.size	__PRETTY_FUNCTION__.10, 23
__PRETTY_FUNCTION__.10:
	.string	"ggml_vec_dot_q3_K_q8_K"
	.zero	1
	.type	__PRETTY_FUNCTION__.9, @object
	.size	__PRETTY_FUNCTION__.9, 23
__PRETTY_FUNCTION__.9:
	.string	"ggml_vec_dot_q4_K_q8_K"
	.zero	1
	.type	__PRETTY_FUNCTION__.8, @object
	.size	__PRETTY_FUNCTION__.8, 23
__PRETTY_FUNCTION__.8:
	.string	"ggml_vec_dot_q5_K_q8_K"
	.zero	1
	.type	__PRETTY_FUNCTION__.7, @object
	.size	__PRETTY_FUNCTION__.7, 23
__PRETTY_FUNCTION__.7:
	.string	"ggml_vec_dot_q6_K_q8_K"
	.zero	1
	.type	__PRETTY_FUNCTION__.6, @object
	.size	__PRETTY_FUNCTION__.6, 30
__PRETTY_FUNCTION__.6:
	.string	"ggml_vec_dot_iq2_s_q8_K_vl128"
	.zero	2
.LC0:
	.half	11
	.half	9
	.half	7
	.half	5
	.type	__PRETTY_FUNCTION__.5, @object
	.size	__PRETTY_FUNCTION__.5, 30
__PRETTY_FUNCTION__.5:
	.string	"ggml_vec_dot_iq2_s_q8_K_vl256"
	.zero	2
.LC1:
	.half	0
	.half	0
	.half	0
	.half	0
	.half	1
	.half	1
	.half	1
	.half	1
.LC2:
	.half	11
	.half	9
	.half	7
	.half	5
	.half	11
	.half	9
	.half	7
	.half	5
	.type	sign_gather_indices_arr, @object
	.size	sign_gather_indices_arr, 64
sign_gather_indices_arr:
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.ascii	"\001\001\001\001\001\001\001\001\002\002\002\002\002\002\002"
	.ascii	"\002\003\003\003\003\003\003\003\003\004\004\004\004\004\004"
	.ascii	"\004\004\005\005\005\005\005\005\005\005\006\006\006\006\006"
	.ascii	"\006\006\006\007\007\007\007\007\007\007\007"
	.type	sign_bit_masks_arr, @object
	.size	sign_bit_masks_arr, 64
sign_bit_masks_arr:
	.ascii	"\001\002\004\b\020 @\200\001\002\004\b\020 @\200\001\002\004"
	.ascii	"\b\020 @\200\001\002\004\b\020 @\200\001\002\004\b\020 @\200"
	.ascii	"\001\002\004\b\020 @\200\001\002\004\b\020 @\200\001\002\004"
	.ascii	"\b\020 @\200"
	.type	__PRETTY_FUNCTION__.4, @object
	.size	__PRETTY_FUNCTION__.4, 30
__PRETTY_FUNCTION__.4:
	.string	"ggml_vec_dot_iq3_s_q8_K_vl256"
	.zero	2
.LC3:
	.half	0
	.half	1
	.half	2
	.half	3
	.half	4
	.half	5
	.half	6
	.half	7
	.half	8
	.half	9
	.half	10
	.half	11
	.half	12
	.half	13
	.half	14
	.half	15
	.type	__PRETTY_FUNCTION__.3, @object
	.size	__PRETTY_FUNCTION__.3, 30
__PRETTY_FUNCTION__.3:
	.string	"ggml_vec_dot_tq1_0_q8_K_vl256"
	.zero	2
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 30
__PRETTY_FUNCTION__.2:
	.string	"ggml_vec_dot_tq2_0_q8_K_vl256"
	.zero	2
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 30
__PRETTY_FUNCTION__.1:
	.string	"ggml_vec_dot_iq1_s_q8_K_vl256"
	.zero	2
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 30
__PRETTY_FUNCTION__.0:
	.string	"ggml_vec_dot_iq1_m_q8_K_vl256"
	.zero	2
	.type	iq1s_grid, @object
	.size	iq1s_grid, 16384
iq1s_grid:
	.dword	-1
	.dword	-255
	.dword	-65536
	.dword	-65025
	.dword	-65279
	.dword	-16711936
	.dword	-16777216
	.dword	-16646145
	.dword	-16646399
	.dword	-16711169
	.dword	-16711423
	.dword	-4278255616
	.dword	-4294902016
	.dword	-4294967041
	.dword	-4294967295
	.dword	-4294901760
	.dword	-4261412865
	.dword	-4261413119
	.dword	-4261477889
	.dword	-4261478143
	.dword	-4278190080
	.dword	-4278059009
	.dword	-4278059263
	.dword	-4278124033
	.dword	-4278124287
	.dword	-1095216725761
	.dword	-1095216726016
	.dword	-1095233372416
	.dword	-1095233437441
	.dword	-1095233437695
	.dword	-1095233437440
	.dword	-1095233437439
	.dword	-1095233372160
	.dword	-1099494850816
	.dword	-1099494916095
	.dword	-1099494915840
	.dword	-1099511562495
	.dword	-1099511627776
	.dword	-1099511627519
	.dword	-1099511496960
	.dword	-1099511561985
	.dword	-1099511562239
	.dword	-1099511561729
	.dword	-1099478138880
	.dword	-1099494785280
	.dword	-1099494850305
	.dword	-1099494850559
	.dword	-1099494785024
	.dword	-1090921693185
	.dword	-1090921693439
	.dword	-1090921758209
	.dword	-1090921758463
	.dword	-1090938470400
	.dword	-1090938339329
	.dword	-1090938339583
	.dword	-1090938404353
	.dword	-1090938404607
	.dword	-1095199948800
	.dword	-1095216595200
	.dword	-1095216660224
	.dword	-1095216594689
	.dword	-1095216594688
	.dword	-1095183106049
	.dword	-1095183106303
	.dword	-1095183171073
	.dword	-1095183171327
	.dword	-1095199817984
	.dword	-1095199883264
	.dword	-1095199883008
	.dword	-1095199752193
	.dword	-1095199752447
	.dword	-1095199817217
	.dword	-1095199817471
	.dword	-280375481794816
	.dword	-280375481859841
	.dword	-280375481860095
	.dword	-280375481794560
	.dword	-280379743273216
	.dword	-280379743338240
	.dword	-280379760050176
	.dword	-280379760049919
	.dword	-280379759984385
	.dword	-280379759984640
	.dword	-280379743207680
	.dword	-280379743272704
	.dword	-280379743207424
	.dword	-281470681743616
	.dword	-281470681808641
	.dword	-281470681808896
	.dword	-281470681808895
	.dword	-281470698520576
	.dword	-281470698520065
	.dword	-281470698520319
	.dword	-281470698454784
	.dword	-281474959933441
	.dword	-281474959998976
	.dword	-281474959998719
	.dword	-281474976645121
	.dword	-281474976645376
	.dword	-281474976710401
	.dword	-281474976710656
	.dword	-281474976710655
	.dword	-281474976710400
	.dword	-281474976579585
	.dword	-281474976579839
	.dword	-281474976645120
	.dword	-281474976644609
	.dword	-281474976644863
	.dword	-281474943156480
	.dword	-281474959868160
	.dword	-281474959933440
	.dword	-281474959932929
	.dword	-281474959933183
	.dword	-281474959802624
	.dword	-281474959867649
	.dword	-281474959867904
	.dword	-281474959867903
	.dword	-281474959867648
	.dword	-281466403553025
	.dword	-281466403553024
	.dword	-281470664966400
	.dword	-281470665031425
	.dword	-281470681677825
	.dword	-281470681678079
	.dword	-281470681743360
	.dword	-281470681742849
	.dword	-281470681612289
	.dword	-281470681612544
	.dword	-281470681677823
	.dword	-281470681677568
	.dword	-281470648254464
	.dword	-281470664900864
	.dword	-281470664965889
	.dword	-281470664965888
	.dword	-279275953455105
	.dword	-279275953455359
	.dword	-279275953520129
	.dword	-279275953520383
	.dword	-279275970232320
	.dword	-279275970101249
	.dword	-279275970101503
	.dword	-279275970166273
	.dword	-279275970166527
	.dword	-279280231710720
	.dword	-279280248357120
	.dword	-279280248422399
	.dword	-279280248356864
	.dword	-279280214867969
	.dword	-279280214868223
	.dword	-279280214932993
	.dword	-279280214933247
	.dword	-279280231645184
	.dword	-279280231514113
	.dword	-279280231514367
	.dword	-279280231579137
	.dword	-279280231579391
	.dword	-280371170181120
	.dword	-280371186827520
	.dword	-280371186892545
	.dword	-280371186892544
	.dword	-280371186827009
	.dword	-280371186827264
	.dword	-280375448305920
	.dword	-280375465017345
	.dword	-280375465017600
	.dword	-280375465082880
	.dword	-280375464952064
	.dword	-280375465017089
	.dword	-280375465017088
	.dword	-280375448240384
	.dword	-280375448305409
	.dword	-280375448305663
	.dword	-280375448305408
	.dword	-280375448240128
	.dword	-280366875148289
	.dword	-280366875148543
	.dword	-280366875213313
	.dword	-280366875213567
	.dword	-280366891925504
	.dword	-280366891794433
	.dword	-280366891794687
	.dword	-280366891859457
	.dword	-280366891859711
	.dword	-280371153403904
	.dword	-280371170050304
	.dword	-280371170115328
	.dword	-280371169984768
	.dword	-280371170050048
	.dword	-280371136561153
	.dword	-280371136561407
	.dword	-280371136626688
	.dword	-280371136626177
	.dword	-280371136626431
	.dword	-280371153338368
	.dword	-280371153207297
	.dword	-280371153207551
	.dword	-280371153272321
	.dword	-280371153272575
	.dword	-71776119077928961
	.dword	-71776119077929216
	.dword	-71776119077994241
	.dword	-71776119077994240
	.dword	-71776119077928705
	.dword	-71776119077928960
	.dword	-71776123339407616
	.dword	-71776123339472641
	.dword	-71776123356119041
	.dword	-71776123356184576
	.dword	-71776123356184065
	.dword	-71776123356053760
	.dword	-71776123356118785
	.dword	-71776123356119040
	.dword	-71776123356118784
	.dword	-71776123339342080
	.dword	-71776123339407105
	.dword	-71776123339407359
	.dword	-71776123339276544
	.dword	-71776123339341824
	.dword	-71777214277878016
	.dword	-71777214277943041
	.dword	-71777214277943295
	.dword	-71777214277943040
	.dword	-71777214294589441
	.dword	-71777214294589695
	.dword	-71777214294654976
	.dword	-71777214294654465
	.dword	-71777214294524160
	.dword	-71777214294589185
	.dword	-71777214294589184
	.dword	-71777218556133376
	.dword	-71777218556133119
	.dword	-71777218572779521
	.dword	-71777218572779776
	.dword	-71777218572779775
	.dword	-71777218572844801
	.dword	-71777218572845056
	.dword	-71777218572845055
	.dword	-71777218572844800
	.dword	-71777218572713985
	.dword	-71777218572779520
	.dword	-71777218539355905
	.dword	-71777218556002559
	.dword	-71777218556067840
	.dword	-71777218555937024
	.dword	-71777218556002049
	.dword	-71777209999622400
	.dword	-71777209999687425
	.dword	-71777209999687679
	.dword	-71777209999622144
	.dword	-71777214261100545
	.dword	-71777214261166079
	.dword	-71777214261165824
	.dword	-71777214277812479
	.dword	-71777214277877760
	.dword	-71777214277877249
	.dword	-71777214277877503
	.dword	-71777214277811969
	.dword	-71777214277812223
	.dword	-71777214244388864
	.dword	-71777214261035264
	.dword	-71777214261100289
	.dword	-71777214261100543
	.dword	-71777214261035008
	.dword	-72056494526300416
	.dword	-72056494526365695
	.dword	-72056494526365440
	.dword	-72056494543077121
	.dword	-72056494543077376
	.dword	-72056494543076865
	.dword	-72056494543077120
	.dword	-72056494542946560
	.dword	-72056494543011839
	.dword	-72056498804490496
	.dword	-72056498804555776
	.dword	-72056498804555775
	.dword	-72056498804555265
	.dword	-72056498804555519
	.dword	-72056498821202176
	.dword	-72056498821267201
	.dword	-72056498821267456
	.dword	-72056498821267455
	.dword	-72056498821267200
	.dword	-72056498821136639
	.dword	-72056498821201920
	.dword	-72056498821201409
	.dword	-72056498787778305
	.dword	-72056498787778304
	.dword	-72056498804424705
	.dword	-72056498804489985
	.dword	-72056498804490240
	.dword	-72056498804489729
	.dword	-72056498804489984
	.dword	-72056498804489983
	.dword	-72056498804359424
	.dword	-72056498804424449
	.dword	-72056498804424704
	.dword	-72056498804424448
	.dword	-72057589742960895
	.dword	-72057589743026176
	.dword	-72057589743025919
	.dword	-72057589759672576
	.dword	-72057589759737601
	.dword	-72057589759737856
	.dword	-72057589759737855
	.dword	-72057589759737600
	.dword	-72057589759606785
	.dword	-72057589759607039
	.dword	-72057589759672320
	.dword	-72057589759671809
	.dword	-72057589759672063
	.dword	-72057594021150976
	.dword	-72057594021216001
	.dword	-72057594021216256
	.dword	-72057594021216255
	.dword	-72057594037862656
	.dword	-72057594037862655
	.dword	-72057594037927681
	.dword	-72057594037927936
	.dword	-72057594037927935
	.dword	-72057594037927680
	.dword	-72057594037927679
	.dword	-72057594037797120
	.dword	-72057594037862145
	.dword	-72057594037862400
	.dword	-72057594037862399
	.dword	-72057594037862144
	.dword	-72057594004373505
	.dword	-72057594004373759
	.dword	-72057594004438785
	.dword	-72057594004439040
	.dword	-72057594004438529
	.dword	-72057594004438783
	.dword	-72057594021085185
	.dword	-72057594021085440
	.dword	-72057594021150465
	.dword	-72057594021150720
	.dword	-72057594021150719
	.dword	-72057594021150464
	.dword	-72057594021150463
	.dword	-72057594021019649
	.dword	-72057594021019903
	.dword	-72057594021085184
	.dword	-72057585447993600
	.dword	-72057585448058625
	.dword	-72057585448058880
	.dword	-72057585448058879
	.dword	-72057585464770560
	.dword	-72057585464770559
	.dword	-72057585464770049
	.dword	-72057585464770303
	.dword	-72057585464639744
	.dword	-72057585464705023
	.dword	-72057589726183425
	.dword	-72057589726183679
	.dword	-72057589726248705
	.dword	-72057589726248960
	.dword	-72057589726248449
	.dword	-72057589726248703
	.dword	-72057589742895360
	.dword	-72057589742960640
	.dword	-72057589742960639
	.dword	-72057589742960129
	.dword	-72057589742960384
	.dword	-72057589742829824
	.dword	-72057589742894849
	.dword	-72057589742895104
	.dword	-72057589742894593
	.dword	-72057589742894848
	.dword	-72057589742894847
	.dword	-72057589709471743
	.dword	-72057589709471487
	.dword	-72057589726118143
	.dword	-72057589726183424
	.dword	-72057589726117633
	.dword	-72057589726117632
	.dword	-72055395031384320
	.dword	-72055395031449599
	.dword	-72055395031384064
	.dword	-72055399292862720
	.dword	-72055399292927745
	.dword	-72055399292927999
	.dword	-72055399292927744
	.dword	-72055399309574145
	.dword	-72055399309639680
	.dword	-72055399309639169
	.dword	-72055399309639423
	.dword	-72055399309508609
	.dword	-72055399309508864
	.dword	-72055399309573889
	.dword	-72055399309574143
	.dword	-72055399309573888
	.dword	-72055399276150784
	.dword	-72055399292797184
	.dword	-72055399292862209
	.dword	-72055399292796928
	.dword	-72056490248044545
	.dword	-72056490248044799
	.dword	-72056490248110080
	.dword	-72056490248109823
	.dword	-72056490247979264
	.dword	-72056490248044544
	.dword	-72056494509523199
	.dword	-72056494509588225
	.dword	-72056494509588480
	.dword	-72056494509587969
	.dword	-72056494526234880
	.dword	-72056494526299905
	.dword	-72056494526300160
	.dword	-72056494526300159
	.dword	-72056494526299904
	.dword	-72056494526299903
	.dword	-72056494526169089
	.dword	-72056494526234624
	.dword	-72056494526234367
	.dword	-72056494492811008
	.dword	-72056494509457664
	.dword	-72056494509457663
	.dword	-72056494509522944
	.dword	-72056494509522433
	.dword	-72056494509392128
	.dword	-72056494509457407
	.dword	-72056494509457152
	.dword	-72056485936430848
	.dword	-72056485953142783
	.dword	-72056485953076993
	.dword	-72056485953077247
	.dword	-72056490214620929
	.dword	-72056490214621183
	.dword	-72056490214620928
	.dword	-72056490231267329
	.dword	-72056490231267583
	.dword	-72056490231332864
	.dword	-72056490231332353
	.dword	-72056490231202048
	.dword	-72056490231267327
	.dword	-72056490231267072
	.dword	-72056490197843968
	.dword	-72056490214490368
	.dword	-72056490214555647
	.dword	-72056490214555391
	.dword	-71494644084506625
	.dword	-71494644084506879
	.dword	-71494644084571649
	.dword	-71494644084571903
	.dword	-71494644101283840
	.dword	-71494644101152769
	.dword	-71494644101153023
	.dword	-71494644101218304
	.dword	-71494644101217793
	.dword	-71494644101218047
	.dword	-71494648362762240
	.dword	-71494648379408640
	.dword	-71494648379473664
	.dword	-71494648379343104
	.dword	-71494648379408384
	.dword	-71494648345919489
	.dword	-71494648345919743
	.dword	-71494648345984513
	.dword	-71494648345984767
	.dword	-71494648362696704
	.dword	-71494648362565633
	.dword	-71494648362565887
	.dword	-71494648362631168
	.dword	-71494648362630657
	.dword	-71494648362630911
	.dword	-71495739301232640
	.dword	-71495739317879040
	.dword	-71495739317944065
	.dword	-71495739317944064
	.dword	-71495739317878784
	.dword	-71495743579357439
	.dword	-71495743579422465
	.dword	-71495743579422464
	.dword	-71495743596134400
	.dword	-71495743596133889
	.dword	-71495743596134143
	.dword	-71495743596003584
	.dword	-71495743596068609
	.dword	-71495743596068864
	.dword	-71495743596068863
	.dword	-71495743562645504
	.dword	-71495743579291649
	.dword	-71495743579357183
	.dword	-71495743579356928
	.dword	-71495743579291648
	.dword	-71495735006200064
	.dword	-71495735006264833
	.dword	-71495735006265087
	.dword	-71495735022911744
	.dword	-71495735022977024
	.dword	-71495735022845953
	.dword	-71495735022846207
	.dword	-71495735022910977
	.dword	-71495735022911231
	.dword	-71495739284455424
	.dword	-71495739301101824
	.dword	-71495739301167103
	.dword	-71495739301166848
	.dword	-71495739301101568
	.dword	-71495739267612928
	.dword	-71495739267677697
	.dword	-71495739267677951
	.dword	-71495739284324608
	.dword	-71495739284389888
	.dword	-71495739284258817
	.dword	-71495739284259071
	.dword	-71495739284323841
	.dword	-71495739284324095
	.dword	-71775019549655040
	.dword	-71775019566366465
	.dword	-71775019566366719
	.dword	-71775019566366464
	.dword	-71775019566301184
	.dword	-71775023827844865
	.dword	-71775023827845120
	.dword	-71775023827845119
	.dword	-71775023827844864
	.dword	-71775023844491519
	.dword	-71775023844556800
	.dword	-71775023844556289
	.dword	-71775023844556543
	.dword	-71775023844491263
	.dword	-71775023811067904
	.dword	-71775023827714304
	.dword	-71775023827779329
	.dword	-71775023827779328
	.dword	-71775023827648768
	.dword	-71775023827714048
	.dword	-71776114766315264
	.dword	-71776114783027200
	.dword	-71776114782896384
	.dword	-71776114782961408
	.dword	-71776119044440065
	.dword	-71776119044505600
	.dword	-71776119044505089
	.dword	-71776119061152000
	.dword	-71776119061217025
	.dword	-71776119061217280
	.dword	-71776119061217024
	.dword	-71776119061086463
	.dword	-71776119061151744
	.dword	-71776119061151233
	.dword	-71776119027728128
	.dword	-71776119044374529
	.dword	-71776119044439809
	.dword	-71776119044440064
	.dword	-71776119044439553
	.dword	-71776119044439807
	.dword	-71776119044309248
	.dword	-71776119044374273
	.dword	-71776119044374527
	.dword	-71776119044374272
	.dword	-71776110471348224
	.dword	-71776110487994369
	.dword	-71776110487994623
	.dword	-71776110488059648
	.dword	-71776110487994368
	.dword	-71776114749473024
	.dword	-71776114749538048
	.dword	-71776114766249984
	.dword	-71776114766118913
	.dword	-71776114766119168
	.dword	-71776114766184192
	.dword	-71776114732760833
	.dword	-71776114732761087
	.dword	-71776114749407233
	.dword	-71776114749472511
	.dword	-71773920037961729
	.dword	-71773920037961983
	.dword	-71773920038026753
	.dword	-71773920038027007
	.dword	-71773920054738944
	.dword	-71773920054607873
	.dword	-71773920054608127
	.dword	-71773920054672897
	.dword	-71773920054673151
	.dword	-71773924316217344
	.dword	-71773924332863744
	.dword	-71773924332928769
	.dword	-71773924332863488
	.dword	-71773924299374593
	.dword	-71773924299374847
	.dword	-71773924299439617
	.dword	-71773924299439871
	.dword	-71773924316020737
	.dword	-71773924316020991
	.dword	-71773924316085761
	.dword	-71773924316086015
	.dword	-71775015254687488
	.dword	-71775015271334144
	.dword	-71775015271399169
	.dword	-71775015271399168
	.dword	-71775015271333888
	.dword	-71775019532877823
	.dword	-71775019532877568
	.dword	-71775019549524223
	.dword	-71775019549589504
	.dword	-71775019549458688
	.dword	-71775019549523713
	.dword	-71775019549523967
	.dword	-71775019549523712
	.dword	-71775019516100608
	.dword	-71775019532746753
	.dword	-71775019532812287
	.dword	-71775019532812032
	.dword	-71775019532746497
	.dword	-71775019532746752
	.dword	-71775010959654913
	.dword	-71775010959655167
	.dword	-71775010959719937
	.dword	-71775010959720191
	.dword	-71775010976301057
	.dword	-71775010976301311
	.dword	-71775010976366081
	.dword	-71775010976366335
	.dword	-71775015237910528
	.dword	-71775015254556928
	.dword	-71775015254622207
	.dword	-71775015254621952
	.dword	-71775015254556672
	.dword	-71775015221067777
	.dword	-71775015221068031
	.dword	-71775015221132801
	.dword	-71775015221133055
	.dword	-71775015237844992
	.dword	-71775015237713921
	.dword	-71775015237714175
	.dword	-71775015237778945
	.dword	-71775015237779199
	.dword	72057594037862400
	.dword	72057594021216000
	.dword	72057594021150721
	.dword	72057594021216256
	.dword	72057589759672576
	.dword	72057589743025921
	.dword	72057589742960640
	.dword	72057589742961151
	.dword	72057589742960897
	.dword	72057589743091456
	.dword	72057589743026431
	.dword	72057589743026177
	.dword	72057589759738111
	.dword	72057589759738112
	.dword	72057589759868672
	.dword	72057589759803393
	.dword	72056498821267455
	.dword	72056498821267200
	.dword	72056498821202175
	.dword	72056498821201921
	.dword	72056498821202176
	.dword	72056498804555521
	.dword	72056498804490240
	.dword	72056498804490241
	.dword	72056498804490751
	.dword	72056498804490497
	.dword	72056498804621056
	.dword	72056498804555777
	.dword	72056498804556032
	.dword	72056494543011840
	.dword	72056494543012351
	.dword	72056494543012097
	.dword	72056494526365440
	.dword	72056494526300415
	.dword	72056494526300160
	.dword	72056494526300161
	.dword	72056494526300416
	.dword	72056494526300417
	.dword	72056494526365696
	.dword	72056494526366207
	.dword	72056494526365953
	.dword	72056494559854336
	.dword	72056494559789311
	.dword	72056494559789057
	.dword	72056494543142911
	.dword	72056494543142657
	.dword	72056494543077376
	.dword	72056494543208447
	.dword	72056494543208192
	.dword	72056494543208193
	.dword	72056503116169216
	.dword	72056503099522816
	.dword	72056503099457791
	.dword	72056503099457537
	.dword	72056503099523072
	.dword	72056498838044416
	.dword	72056498821332737
	.dword	72056498821267456
	.dword	72056498821267713
	.dword	72056498821333247
	.dword	72056498821333248
	.dword	72056498854756608
	.dword	72056498838044927
	.dword	72056498838110208
	.dword	71777218572844800
	.dword	71777218556067840
	.dword	71777218556068096
	.dword	71777218556133632
	.dword	71777214294589440
	.dword	71777214294589951
	.dword	71777214294589697
	.dword	71777214277943040
	.dword	71777214277878015
	.dword	71777214277877760
	.dword	71777214277877761
	.dword	71777214278008576
	.dword	71777214278008577
	.dword	71777214277943296
	.dword	71777214277943807
	.dword	71777214277943553
	.dword	71777214311431936
	.dword	71777214311366657
	.dword	71777214311366912
	.dword	71777214294720511
	.dword	71777214294720257
	.dword	71777214294654976
	.dword	71777214294786047
	.dword	71777214294785792
	.dword	71777214294720768
	.dword	71776123356184320
	.dword	71776123356184321
	.dword	71776123356119040
	.dword	71776123356119297
	.dword	71776123339472640
	.dword	71776123339407615
	.dword	71776123339407360
	.dword	71776123339407361
	.dword	71776123339407616
	.dword	71776123339538431
	.dword	71776123339472896
	.dword	71776123339473153
	.dword	71776119077994240
	.dword	71776119077929215
	.dword	71776119077928960
	.dword	71776119077928961
	.dword	71776119077929216
	.dword	71776119061282815
	.dword	71776119061282560
	.dword	71776119061217535
	.dword	71776119061217280
	.dword	71776119061217281
	.dword	71776119061217791
	.dword	71776119061217536
	.dword	71776119061348096
	.dword	71776119061283071
	.dword	71776119061282816
	.dword	71776119061282817
	.dword	71776119061283072
	.dword	71776119094771457
	.dword	71776119094706431
	.dword	71776119094706176
	.dword	71776119094706687
	.dword	71776119078059776
	.dword	71776119077994751
	.dword	71776119077994496
	.dword	71776119077994497
	.dword	71776119077994752
	.dword	71776119077994753
	.dword	71776119078060032
	.dword	71776119078060543
	.dword	71776119078060289
	.dword	71776127651151616
	.dword	71776127651086336
	.dword	71776127651086592
	.dword	71776127634374911
	.dword	71776127634374656
	.dword	71776127634375167
	.dword	71776127634374913
	.dword	71776127634505472
	.dword	71776127634440447
	.dword	71776127634440448
	.dword	71776123372961791
	.dword	71776123372961537
	.dword	71776123372896256
	.dword	71776123372896767
	.dword	71776123356250111
	.dword	71776123356249856
	.dword	71776123356249857
	.dword	71776123356184576
	.dword	71776123356184577
	.dword	71776123356184832
	.dword	71776123356315393
	.dword	71776123356250112
	.dword	71776123356250623
	.dword	71776123389738752
	.dword	71776123389673472
	.dword	71776123389673729
	.dword	71776123372962047
	.dword	71776123372961792
	.dword	71776123373092608
	.dword	71776123373027583
	.dword	71776123373027329
	.dword	71778318084407296
	.dword	71778318067760896
	.dword	71778318067695616
	.dword	71778318067695873
	.dword	71778318067761152
	.dword	71778313806282497
	.dword	71778313806217472
	.dword	71778313789571071
	.dword	71778313789505536
	.dword	71778313789506047
	.dword	71778313789636352
	.dword	71778313789571327
	.dword	71778313789571073
	.dword	71778313789571328
	.dword	71778313822994432
	.dword	71778313806348032
	.dword	71778313806283007
	.dword	71778313806282753
	.dword	71778313806283008
	.dword	71778313806348288
	.dword	71777222867812096
	.dword	71777222867746816
	.dword	71777222867746817
	.dword	71777222867747073
	.dword	71777222851100671
	.dword	71777222851035391
	.dword	71777222851035136
	.dword	71777222851035647
	.dword	71777222851165952
	.dword	71777222851100927
	.dword	71777222851100673
	.dword	71777218589622271
	.dword	71777218589556736
	.dword	71777218589556993
	.dword	71777218572910336
	.dword	71777218572910337
	.dword	71777218572845311
	.dword	71777218572845056
	.dword	71777218572845057
	.dword	71777218572845312
	.dword	71777218572976127
	.dword	71777218572975873
	.dword	71777218572910592
	.dword	71777218572910593
	.dword	71777218572910849
	.dword	71777218606333953
	.dword	71777218606334208
	.dword	71777218589687553
	.dword	71777218589622272
	.dword	71777218589622273
	.dword	71777218589622783
	.dword	71777218589753088
	.dword	71777218589688063
	.dword	71777218589687809
	.dword	71777218589688064
	.dword	71777227146002433
	.dword	71777222884524287
	.dword	71777222884524033
	.dword	71777222884524288
	.dword	71777222867812352
	.dword	71777222867812863
	.dword	71777222867812609
	.dword	71777222867878143
	.dword	71777222867878144
	.dword	71777222884589823
	.dword	71777222884655104
	.dword	281474976710400
	.dword	281474976645375
	.dword	281474976645120
	.dword	281474976645121
	.dword	281474976645376
	.dword	281474959998721
	.dword	281474959933440
	.dword	281474959933697
	.dword	281474960064256
	.dword	281474959999231
	.dword	281474959999232
	.dword	281470698520575
	.dword	281470698455040
	.dword	281470698455551
	.dword	281470681808640
	.dword	281470681743615
	.dword	281470681743360
	.dword	281470681743361
	.dword	281470681743616
	.dword	281470681808896
	.dword	281470681809407
	.dword	281470715232257
	.dword	281470715232512
	.dword	281470698520576
	.dword	281470698521087
	.dword	281470698651647
	.dword	281470698651392
	.dword	281470698586113
	.dword	281470698586368
	.dword	280379759984640
	.dword	280379759985151
	.dword	280379759984896
	.dword	280379759984897
	.dword	280379743338240
	.dword	280379743273215
	.dword	280379743272960
	.dword	280379743272961
	.dword	280379743273471
	.dword	280379743273216
	.dword	280379743404031
	.dword	280379743338496
	.dword	280379743338497
	.dword	280379743339007
	.dword	280379743338753
	.dword	280375481859840
	.dword	280375481794815
	.dword	280375481794560
	.dword	280375481794561
	.dword	280375481794816
	.dword	280375465148415
	.dword	280375465148160
	.dword	280375465148161
	.dword	280375465083135
	.dword	280375465082880
	.dword	280375465082881
	.dword	280375465083391
	.dword	280375465083136
	.dword	280375465083137
	.dword	280375465213696
	.dword	280375465148671
	.dword	280375465148416
	.dword	280375465148417
	.dword	280375465148672
	.dword	280375498637057
	.dword	280375498571776
	.dword	280375481925376
	.dword	280375481860351
	.dword	280375481860096
	.dword	280375481860097
	.dword	280375481860352
	.dword	280375481991167
	.dword	280375481925632
	.dword	280375481925889
	.dword	280384055017216
	.dword	280384054951937
	.dword	280384038305537
	.dword	280384038240256
	.dword	280384038240513
	.dword	280384038371072
	.dword	280384038306047
	.dword	280379776827137
	.dword	280379776761856
	.dword	280379776762113
	.dword	280379760115456
	.dword	280379760050431
	.dword	280379760050176
	.dword	280379760050177
	.dword	280379760050432
	.dword	280379760180993
	.dword	280379760115712
	.dword	280379793539072
	.dword	280379776892927
	.dword	280379776892673
	.dword	280379776827392
	.dword	280379776827648
	.dword	280379776827649
	.dword	280379776893183
	.dword	1099511562495
	.dword	1099511562240
	.dword	1099494915840
	.dword	1099494850815
	.dword	1099494850560
	.dword	1099494850561
	.dword	1099494851071
	.dword	1099494850816
	.dword	1099494981376
	.dword	1099494916096
	.dword	1099494916607
	.dword	1099494916353
	.dword	1095233437440
	.dword	1095233372415
	.dword	1095233372160
	.dword	1095233372161
	.dword	1095233372416
	.dword	1095233372417
	.dword	1095216726015
	.dword	1095216725760
	.dword	1095216660735
	.dword	1095216660480
	.dword	1095216660481
	.dword	1095216660991
	.dword	1095216660736
	.dword	1095216660737
	.dword	1095216791296
	.dword	1095216791297
	.dword	1095216726271
	.dword	1095216726016
	.dword	1095216726017
	.dword	1095216726272
	.dword	1095250214911
	.dword	1095250149887
	.dword	1095250149633
	.dword	1095233502976
	.dword	1095233437951
	.dword	1095233437696
	.dword	1095233437697
	.dword	1095233437952
	.dword	1095233568512
	.dword	1095233503487
	.dword	1095233503232
	.dword	1095233503489
	.dword	4294967040
	.dword	4294967041
	.dword	4294902015
	.dword	4294901760
	.dword	4294901761
	.dword	4294902016
	.dword	4278255615
	.dword	4278255360
	.dword	4278255361
	.dword	4278190335
	.dword	4278190080
	.dword	4278190081
	.dword	4278190336
	.dword	4278190337
	.dword	4278320896
	.dword	4278255871
	.dword	4278255616
	.dword	4278255617
	.dword	4278255872
	.dword	16777215
	.dword	16776960
	.dword	16776961
	.dword	16711935
	.dword	16711680
	.dword	16711681
	.dword	16712191
	.dword	16711936
	.dword	65535
	.dword	65280
	.dword	65281
	.dword	255
	.dword	0
	.dword	1
	.dword	511
	.dword	256
	.dword	257
	.dword	131071
	.dword	130816
	.dword	65791
	.dword	65536
	.dword	65537
	.dword	66047
	.dword	65792
	.dword	65793
	.dword	33554176
	.dword	33489151
	.dword	33488896
	.dword	33489152
	.dword	33489153
	.dword	16842751
	.dword	16842496
	.dword	16777471
	.dword	16777216
	.dword	16777217
	.dword	16777727
	.dword	16777472
	.dword	16908032
	.dword	16843007
	.dword	16842752
	.dword	16842753
	.dword	16843008
	.dword	8589934591
	.dword	8589934336
	.dword	8589934337
	.dword	8589869311
	.dword	8589869057
	.dword	8589869567
	.dword	8589869312
	.dword	8573222656
	.dword	8573157631
	.dword	8573157376
	.dword	8573157887
	.dword	8573157632
	.dword	8573288447
	.dword	8573288192
	.dword	8573288193
	.dword	8573223167
	.dword	8573222912
	.dword	8573222913
	.dword	8573223423
	.dword	8573223168
	.dword	4311744256
	.dword	4311678976
	.dword	4311678977
	.dword	4311679487
	.dword	4311679232
	.dword	4311679233
	.dword	4295032831
	.dword	4295032576
	.dword	4295032577
	.dword	4294967551
	.dword	4294967296
	.dword	4294967297
	.dword	4294967807
	.dword	4294967552
	.dword	4294967553
	.dword	4295098112
	.dword	4295033087
	.dword	4295032832
	.dword	4295033088
	.dword	4328521473
	.dword	4328456192
	.dword	4328456193
	.dword	4328456703
	.dword	4328456448
	.dword	4328456449
	.dword	4311809792
	.dword	4311744512
	.dword	4311744769
	.dword	4311875329
	.dword	4311810048
	.dword	4311810049
	.dword	4311810559
	.dword	4311810304
	.dword	2199023190271
	.dword	2199023190016
	.dword	2199023190017
	.dword	2199023190272
	.dword	2199006543871
	.dword	2199006478336
	.dword	2199006478847
	.dword	2199006609152
	.dword	2199006544129
	.dword	2194744999936
	.dword	2194745000447
	.dword	2194745000193
	.dword	2194728353536
	.dword	2194728288511
	.dword	2194728288256
	.dword	2194728288257
	.dword	2194728288767
	.dword	2194728288512
	.dword	2194728419327
	.dword	2194728419073
	.dword	2194728354047
	.dword	2194728353792
	.dword	2194761842433
	.dword	2194761777408
	.dword	2194745131007
	.dword	2194745130753
	.dword	2194745065472
	.dword	2194745065983
	.dword	2194745196288
	.dword	2194745131264
	.dword	1103806594816
	.dword	1103806594817
	.dword	1103806529536
	.dword	1103806529793
	.dword	1103789883136
	.dword	1103789818111
	.dword	1103789817856
	.dword	1103789817857
	.dword	1103789818112
	.dword	1103789883392
	.dword	1099528404736
	.dword	1099528339711
	.dword	1099528339456
	.dword	1099528339457
	.dword	1099528339712
	.dword	1099511693311
	.dword	1099511693056
	.dword	1099511693057
	.dword	1099511628031
	.dword	1099511627776
	.dword	1099511627777
	.dword	1099511628287
	.dword	1099511628032
	.dword	1099511628033
	.dword	1099511758592
	.dword	1099511693567
	.dword	1099511693312
	.dword	1099511693313
	.dword	1099511693568
	.dword	1099545181952
	.dword	1099545116672
	.dword	1099545116928
	.dword	1099528470272
	.dword	1099528405247
	.dword	1099528404992
	.dword	1099528404993
	.dword	1099528405503
	.dword	1099528405248
	.dword	1099528470528
	.dword	1108101497087
	.dword	1108101497343
	.dword	1108084785152
	.dword	1108084785409
	.dword	1108084916223
	.dword	1108084850688
	.dword	1108084850689
	.dword	1108084850944
	.dword	1103823306752
	.dword	1103823307263
	.dword	1103823307008
	.dword	1103806660352
	.dword	1103806595072
	.dword	1103806595073
	.dword	1103806595583
	.dword	1103806595328
	.dword	1103806725889
	.dword	1103806660608
	.dword	1103806661119
	.dword	1103806660865
	.dword	1103840149248
	.dword	1103840084225
	.dword	1103823437569
	.dword	1103823372288
	.dword	1103823372289
	.dword	1103823372799
	.dword	1103823372545
	.dword	1103823503104
	.dword	562949953355776
	.dword	562949936644351
	.dword	562949936644097
	.dword	562949936644352
	.dword	562949936709632
	.dword	562945675165951
	.dword	562945658519551
	.dword	562945658454016
	.dword	562945658454017
	.dword	562945658454527
	.dword	562945658454273
	.dword	562945658584832
	.dword	562945658519807
	.dword	562945658519553
	.dword	562945658519808
	.dword	562945692008192
	.dword	562945675231233
	.dword	562945675296768
	.dword	561854736760576
	.dword	561854736695551
	.dword	561854736695297
	.dword	561854736695552
	.dword	561854720048897
	.dword	561854719983616
	.dword	561854720114432
	.dword	561854720114433
	.dword	561854720049153
	.dword	561854720049408
	.dword	561850458505216
	.dword	561850458505472
	.dword	561850441858816
	.dword	561850441793536
	.dword	561850441793537
	.dword	561850441793792
	.dword	561850441859072
	.dword	561850441859073
	.dword	561850441859329
	.dword	561850475282687
	.dword	561850475282689
	.dword	561850458636033
	.dword	561850458570752
	.dword	561850458701568
	.dword	561850458636289
	.dword	561850458636544
	.dword	561859015016192
	.dword	561859014950913
	.dword	561859014951168
	.dword	561854753538047
	.dword	561854753537792
	.dword	561854753472513
	.dword	561854736760832
	.dword	561854736760833
	.dword	561854736761343
	.dword	561854736891903
	.dword	561854770249728
	.dword	561854753603328
	.dword	561854753538049
	.dword	561854753603584
	.dword	282574471626496
	.dword	282574471626497
	.dword	282574471561216
	.dword	282574471561217
	.dword	282574471561473
	.dword	282574471692032
	.dword	282574471626753
	.dword	282574471627008
	.dword	282570210148351
	.dword	282570210148097
	.dword	282570210082816
	.dword	282570210083327
	.dword	282570210083073
	.dword	282570193436416
	.dword	282570193371391
	.dword	282570193371136
	.dword	282570193371137
	.dword	282570193371392
	.dword	282570193371393
	.dword	282570193502207
	.dword	282570193501953
	.dword	282570193436672
	.dword	282570226860287
	.dword	282570226860032
	.dword	282570226860288
	.dword	282570210213887
	.dword	282570210213633
	.dword	282570210148607
	.dword	282570210148352
	.dword	282570210148353
	.dword	282570210148863
	.dword	282570210148609
	.dword	282570210279168
	.dword	282570210214143
	.dword	282570210214144
	.dword	281479271612416
	.dword	281479271612927
	.dword	281479271612673
	.dword	281479254966016
	.dword	281479254900736
	.dword	281479254900737
	.dword	281479254900992
	.dword	281474993422591
	.dword	281474993422336
	.dword	281474993422337
	.dword	281474993422592
	.dword	281474976776191
	.dword	281474976775936
	.dword	281474976710911
	.dword	281474976710656
	.dword	281474976710657
	.dword	281474976710912
	.dword	281474976841472
	.dword	281474976776447
	.dword	281474976776192
	.dword	281474976776193
	.dword	281474976776448
	.dword	281475010199553
	.dword	281475010199808
	.dword	281475010199809
	.dword	281474993553152
	.dword	281474993487872
	.dword	281474993487873
	.dword	281474993488128
	.dword	281474993488129
	.dword	281474993618689
	.dword	281474993553408
	.dword	281474993553409
	.dword	281474993553919
	.dword	281483566644993
	.dword	281483566579968
	.dword	281483549868032
	.dword	281483549999103
	.dword	281483549933569
	.dword	281483549934079
	.dword	281483549933824
	.dword	281479288455167
	.dword	281479288389632
	.dword	281479288390143
	.dword	281479288389889
	.dword	281479271743232
	.dword	281479271678207
	.dword	281479271677952
	.dword	281479271677953
	.dword	281479271678463
	.dword	281479271678209
	.dword	281479271809023
	.dword	281479271743488
	.dword	281479271743999
	.dword	281479305232383
	.dword	281479305232129
	.dword	281479305166848
	.dword	281479305167105
	.dword	281479288455423
	.dword	281479288455169
	.dword	281479288455679
	.dword	281479288455424
	.dword	281479288586239
	.dword	281479288520959
	.dword	281479288520705
	.dword	281479288520961
	.dword	283673983188993
	.dword	283673983189248
	.dword	283673983254528
	.dword	283669721775872
	.dword	283669705064193
	.dword	283669704998912
	.dword	283669704999169
	.dword	283669705129728
	.dword	283669705064704
	.dword	283669738487808
	.dword	283669721841408
	.dword	283669721776639
	.dword	283669721841665
	.dword	282578783305472
	.dword	282578783240447
	.dword	282578766594047
	.dword	282578766528512
	.dword	282578766659328
	.dword	282578766594303
	.dword	282578766594049
	.dword	282578766594304
	.dword	282574505115647
	.dword	282574505115392
	.dword	282574505050112
	.dword	282574505050113
	.dword	282574505050623
	.dword	282574488403712
	.dword	282574488338687
	.dword	282574488338432
	.dword	282574488338433
	.dword	282574488338688
	.dword	282574488469503
	.dword	282574488403968
	.dword	282574488404225
	.dword	282574521892609
	.dword	282574521827583
	.dword	282574521827585
	.dword	282574505115648
	.dword	282574505246464
	.dword	282574505181439
	.dword	282574505181184
	.dword	282574505181440
	.dword	282583061561088
	.dword	282583061495809
	.dword	282583061496319
	.dword	282578800082688
	.dword	282578800017663
	.dword	282578800017664
	.dword	282578783371263
	.dword	282578783305728
	.dword	282578783306239
	.dword	282578783305985
	.dword	282578783371519
	.dword	282578783371264
	.dword	282578783371520
	.dword	282578816794625
	.dword	282578800083199
	.dword	282578800083455
	.dword	282578800083201
	.dword	282578800148481
	.dword	144115188075855871
	.dword	144115188075855617
	.dword	144115188075790847
	.dword	144115188075790593
	.dword	144115188059209727
	.dword	144115188059209473
	.dword	144115188059144703
	.dword	144115188059144449
	.dword	144115183797600256
	.dword	144115183780954111
	.dword	144115183780953856
	.dword	144115183780888831
	.dword	144115183780888577
	.dword	144115183780888832
	.dword	144115183780954112
	.dword	144115183814443007
	.dword	144115183814442753
	.dword	144115183814377983
	.dword	144115183814377729
	.dword	144115183797665792
	.dword	144115183797796863
	.dword	144115183797796609
	.dword	144115183797731839
	.dword	144115183797731585
	.dword	144114092859129856
	.dword	144114092842483456
	.dword	144114092842418431
	.dword	144114092842418177
	.dword	144114092842418432
	.dword	144114092842483712
	.dword	144114088581005056
	.dword	144114088580940031
	.dword	144114088580940032
	.dword	144114088564293631
	.dword	144114088564293377
	.dword	144114088564228096
	.dword	144114088564228097
	.dword	144114088564228607
	.dword	144114088564228352
	.dword	144114088564293887
	.dword	144114088564293633
	.dword	144114088564293888
	.dword	144114088597716992
	.dword	144114088597717248
	.dword	144114088581005567
	.dword	144114088581005313
	.dword	144114088581005568
	.dword	144114088581070848
	.dword	144114097154162687
	.dword	144114097154162433
	.dword	144114097154097663
	.dword	144114097154097409
	.dword	144114097137385472
	.dword	144114097137516543
	.dword	144114097137516289
	.dword	144114097137451519
	.dword	144114097137451265
	.dword	144114092859260672
	.dword	144114092859195647
	.dword	144114092859195648
	.dword	144114092859260928
	.dword	144114092892749823
	.dword	144114092892749569
	.dword	144114092892684799
	.dword	144114092892684545
	.dword	144114092875972608
	.dword	144114092876103679
	.dword	144114092876103425
	.dword	144114092876038655
	.dword	144114092876038401
	.dword	143834812593996031
	.dword	143834812593996032
	.dword	143834808332582656
	.dword	143834808332517631
	.dword	143834808315870976
	.dword	143834808315805696
	.dword	143834808315805953
	.dword	143834808315936512
	.dword	143834808315871487
	.dword	143834808315871488
	.dword	143834808332583167
	.dword	143834808332583168
	.dword	143833717394112256
	.dword	143833717394047232
	.dword	143833717377400577
	.dword	143833717377335296
	.dword	143833717377335553
	.dword	143833717377400833
	.dword	143833717377401088
	.dword	143833713115922431
	.dword	143833713115922176
	.dword	143833713115856896
	.dword	143833713115857407
	.dword	143833713099210496
	.dword	143833713099145471
	.dword	143833713099145216
	.dword	143833713099145217
	.dword	143833713099145472
	.dword	143833713099145473
	.dword	143833713099210752
	.dword	143833713099210753
	.dword	143833713099211263
	.dword	143833713099211009
	.dword	143833713132699392
	.dword	143833713132634367
	.dword	143833713132634113
	.dword	143833713132634368
	.dword	143833713115987967
	.dword	143833713115987713
	.dword	143833713115922432
	.dword	143833713115922943
	.dword	143833713115987969
	.dword	143833721672367872
	.dword	143833721672302593
	.dword	143833721672302848
	.dword	143833721672368128
	.dword	143833717410889472
	.dword	143833717410824447
	.dword	143833717410824448
	.dword	143833717410824449
	.dword	143833717394178047
	.dword	143833717394112512
	.dword	143833717394112768
	.dword	143833717394112769
	.dword	143833717394243328
	.dword	143833717394178049
	.dword	143833717394178305
	.dword	143833717427601408
	.dword	143833717410955008
	.dword	143833717410889985
	.dword	143833717410955519
	.dword	143835912122400767
	.dword	143835912122400513
	.dword	143835912122335743
	.dword	143835912122335489
	.dword	143835912105623552
	.dword	143835912105754623
	.dword	143835912105754369
	.dword	143835912105689599
	.dword	143835912105689345
	.dword	143835907844210432
	.dword	143835907844145152
	.dword	143835907827498752
	.dword	143835907827433727
	.dword	143835907827433728
	.dword	143835907827499008
	.dword	143835907827499264
	.dword	143835907860987903
	.dword	143835907860987649
	.dword	143835907860922879
	.dword	143835907860922625
	.dword	143835907844210688
	.dword	143835907844341759
	.dword	143835907844341505
	.dword	143835907844276735
	.dword	143835907844276481
	.dword	143834816905674752
	.dword	143834816905674753
	.dword	143834816889028352
	.dword	143834816888963327
	.dword	143834816888963073
	.dword	143834816889028608
	.dword	143834812627549952
	.dword	143834812627484927
	.dword	143834812627484673
	.dword	143834812627484928
	.dword	143834812610838527
	.dword	143834812610838273
	.dword	143834812610772992
	.dword	143834812610773249
	.dword	143834812610903808
	.dword	143834812610838783
	.dword	143834812644261888
	.dword	143834812627550209
	.dword	143834812627550464
	.dword	143834812627615744
	.dword	143834821200707583
	.dword	143834821200707329
	.dword	143834821200642559
	.dword	143834821200642305
	.dword	143834821183930368
	.dword	143834821184061439
	.dword	143834821184061185
	.dword	143834821183996415
	.dword	143834821183996161
	.dword	143834816922451968
	.dword	143834816905805568
	.dword	143834816905740543
	.dword	143834816905740289
	.dword	143834816939294719
	.dword	143834816939294465
	.dword	143834816939229695
	.dword	143834816939229441
	.dword	143834816922517504
	.dword	143834816922648575
	.dword	143834816922648321
	.dword	143834816922583551
	.dword	143834816922583297
	.dword	72339069014573056
	.dword	72339068997926656
	.dword	72339068997861377
	.dword	72339068997861887
	.dword	72339068997861632
	.dword	72339068997926912
	.dword	72339064736448256
	.dword	72339064736382977
	.dword	72339064736383232
	.dword	72339064719671296
	.dword	72339064719671807
	.dword	72339064719671553
	.dword	72339064719737088
	.dword	72339064719737089
	.dword	72339064753160192
	.dword	72339064736513792
	.dword	72339064736448767
	.dword	72339064736448513
	.dword	72339064736448768
	.dword	72339064736514048
	.dword	72337973797977856
	.dword	72337973797912831
	.dword	72337973797912577
	.dword	72337973797912832
	.dword	72337973781266431
	.dword	72337973781200896
	.dword	72337973781201407
	.dword	72337973781201153
	.dword	72337973781331712
	.dword	72337973781266687
	.dword	72337973781266433
	.dword	72337973781266688
	.dword	72337969519788031
	.dword	72337969519722496
	.dword	72337969503076351
	.dword	72337969503076096
	.dword	72337969503011071
	.dword	72337969503010816
	.dword	72337969503010817
	.dword	72337969503011072
	.dword	72337969503141633
	.dword	72337969503076352
	.dword	72337969536499967
	.dword	72337969536499713
	.dword	72337969519853313
	.dword	72337969519788032
	.dword	72337969519788543
	.dword	72337969519918848
	.dword	72337969519853823
	.dword	72337969519853569
	.dword	72337969519853824
	.dword	72337978092879872
	.dword	72337978076233472
	.dword	72337978076168447
	.dword	72337978076168448
	.dword	72337978076233728
	.dword	72337973814690047
	.dword	72337973814689793
	.dword	72337973814690048
	.dword	72337973798043647
	.dword	72337973798043393
	.dword	72337973797978112
	.dword	72337973797978623
	.dword	72337973798043649
	.dword	72337973798043904
	.dword	72337973831467008
	.dword	72337973814755583
	.dword	72337973814755329
	.dword	72337973814821120
	.dword	72058693549555456
	.dword	72058693549490431
	.dword	72058693549490177
	.dword	72058693532844031
	.dword	72058693532778496
	.dword	72058693532779007
	.dword	72058693532844033
	.dword	72058689271365631
	.dword	72058689271300353
	.dword	72058689254653696
	.dword	72058689254588671
	.dword	72058689254588416
	.dword	72058689254588417
	.dword	72058689254588927
	.dword	72058689254588672
	.dword	72058689254719487
	.dword	72058689254719232
	.dword	72058689254719233
	.dword	72058689254653952
	.dword	72058689288077567
	.dword	72058689288077313
	.dword	72058689271430913
	.dword	72058689271365887
	.dword	72058689271365632
	.dword	72058689271366143
	.dword	72058689271496448
	.dword	72058689271431424
	.dword	72057598332895231
	.dword	72057598332829696
	.dword	72057598332830207
	.dword	72057598332829953
	.dword	72057598316183551
	.dword	72057598316183296
	.dword	72057598316118271
	.dword	72057598316118016
	.dword	72057598316118017
	.dword	72057598316118272
	.dword	72057598316248832
	.dword	72057598316183552
	.dword	72057598316183808
	.dword	72057598316183809
	.dword	72057594054704896
	.dword	72057594054639871
	.dword	72057594054639616
	.dword	72057594054639617
	.dword	72057594054639872
	.dword	72057594037993471
	.dword	72057594037993216
	.dword	72057594037993217
	.dword	72057594037928191
	.dword	72057594037927936
	.dword	72057594037927937
	.dword	72057594037928447
	.dword	72057594037928192
	.dword	72057594037928193
	.dword	72057594038058752
	.dword	72057594037993727
	.dword	72057594037993472
	.dword	72057594037993473
	.dword	72057594037993728
	.dword	72057594071482112
	.dword	72057594071416832
	.dword	72057594071417343
	.dword	72057594054770432
	.dword	72057594054770433
	.dword	72057594054705407
	.dword	72057594054705152
	.dword	72057594054705153
	.dword	72057594054705408
	.dword	72057594054705409
	.dword	72057594054836223
	.dword	72057594054835969
	.dword	72057594054770688
	.dword	72057594054771199
	.dword	72057594054770945
	.dword	72057602627862272
	.dword	72057602627797247
	.dword	72057602611150847
	.dword	72057602611085312
	.dword	72057602611085568
	.dword	72057602611216383
	.dword	72057602611150849
	.dword	72057602611151104
	.dword	72057598349606912
	.dword	72057598349607423
	.dword	72057598349607168
	.dword	72057598332960512
	.dword	72057598332960513
	.dword	72057598332895232
	.dword	72057598332895233
	.dword	72057598332895488
	.dword	72057598332960768
	.dword	72057598332961279
	.dword	72057598366449409
	.dword	72057598366384383
	.dword	72057598366384384
	.dword	72057598366384385
	.dword	72057598349737729
	.dword	72057598349672703
	.dword	72057598349672448
	.dword	72057598349738239
	.dword	72057598349737985
	.dword	72057598349738240
	.dword	72059793061117952
	.dword	72059793044406273
	.dword	72059793044406528
	.dword	72059793044471808
	.dword	72059788782993152
	.dword	72059788782927873
	.dword	72059788766281727
	.dword	72059788766281473
	.dword	72059788766216192
	.dword	72059788766216193
	.dword	72059788766216449
	.dword	72059788766281983
	.dword	72059788766281728
	.dword	72059788799705088
	.dword	72059788783058688
	.dword	72059788782993409
	.dword	72059788782993664
	.dword	72059788783058944
	.dword	72058697844457727
	.dword	72058697844457473
	.dword	72058697844457728
	.dword	72058697827811327
	.dword	72058697827811073
	.dword	72058697827745792
	.dword	72058697827746303
	.dword	72058697827746049
	.dword	72058697827876863
	.dword	72058697827876608
	.dword	72058697827811583
	.dword	72058697827811329
	.dword	72058693566332927
	.dword	72058693566332673
	.dword	72058693566267392
	.dword	72058693566267903
	.dword	72058693566267649
	.dword	72058693549620992
	.dword	72058693549555967
	.dword	72058693549555712
	.dword	72058693549555713
	.dword	72058693549555968
	.dword	72058693549686529
	.dword	72058693549621248
	.dword	72058693549621249
	.dword	72058693549621505
	.dword	72058693583109888
	.dword	72058693583044863
	.dword	72058693566398463
	.dword	72058693566398209
	.dword	72058693566332928
	.dword	72058693566333185
	.dword	72058693566463744
	.dword	72058693566398465
	.dword	72058702139424768
	.dword	72058702122713088
	.dword	72058702122778624
	.dword	72058697861234943
	.dword	72058697861234689
	.dword	72058697861234944
	.dword	72058697844588543
	.dword	72058697844523008
	.dword	72058697844523519
	.dword	72058697844653824
	.dword	72058697878011904
	.dword	72058697861365504
	.dword	72058697861300479
	.dword	72058697861300224
	.dword	72058697861300225
	.dword	72620543991349247
	.dword	72620543991348993
	.dword	72620543991284223
	.dword	72620543991283969
	.dword	72620543974572032
	.dword	72620543974703103
	.dword	72620543974702849
	.dword	72620543974638079
	.dword	72620543974637825
	.dword	72620539713093632
	.dword	72620539696447232
	.dword	72620539696382207
	.dword	72620539696381953
	.dword	72620539696382208
	.dword	72620539729936383
	.dword	72620539729936129
	.dword	72620539729871359
	.dword	72620539729871105
	.dword	72620539713159168
	.dword	72620539713290239
	.dword	72620539713289985
	.dword	72620539713225215
	.dword	72620539713224961
	.dword	72619448774623232
	.dword	72619448774623488
	.dword	72619448757976832
	.dword	72619448757911807
	.dword	72619448757911553
	.dword	72619448757911808
	.dword	72619448757911809
	.dword	72619444496433153
	.dword	72619444496433408
	.dword	72619444479786752
	.dword	72619444479721472
	.dword	72619444479721983
	.dword	72619444479721729
	.dword	72619444479852288
	.dword	72619444479787263
	.dword	72619444513210368
	.dword	72619444496564223
	.dword	72619444496563969
	.dword	72619444496498689
	.dword	72619444496498944
	.dword	72619453069655809
	.dword	72619453069591039
	.dword	72619453069590785
	.dword	72619453052944383
	.dword	72619453052879104
	.dword	72619453053009665
	.dword	72619453052944895
	.dword	72619453052944641
	.dword	72619448791400448
	.dword	72619448774754048
	.dword	72619448774688769
	.dword	72619448774689024
	.dword	72619448774754304
	.dword	72619448808243199
	.dword	72619448808242945
	.dword	72619448808178175
	.dword	72619448808177921
	.dword	72619448791465984
	.dword	72619448791597055
	.dword	72619448791596801
	.dword	72619448791532031
	.dword	72619448791531777
	.dword	72340168509489408
	.dword	72340168509554688
	.dword	72340164248076032
	.dword	72340164248011007
	.dword	72340164231364607
	.dword	72340164231299327
	.dword	72340164231299072
	.dword	72340164231299583
	.dword	72340164231299329
	.dword	72340164231429888
	.dword	72340164231364608
	.dword	72340164231364609
	.dword	72340164231365119
	.dword	72340164231364864
	.dword	72340164264787968
	.dword	72339073309540353
	.dword	72339073309540608
	.dword	72339073292894207
	.dword	72339073292893953
	.dword	72339073292828672
	.dword	72339073292829183
	.dword	72339073292894209
	.dword	72339073292894464
	.dword	72339069031415553
	.dword	72339069031350272
	.dword	72339069014703872
	.dword	72339069014638847
	.dword	72339069014638592
	.dword	72339069014638593
	.dword	72339069014638848
	.dword	72339069014704128
	.dword	72339069014704385
	.dword	72339069048192768
	.dword	72339069048127743
	.dword	72339069048127488
	.dword	72339069048127489
	.dword	72339069048127744
	.dword	72339069031481089
	.dword	72339069031415808
	.dword	72339069031416319
	.dword	72339077604507648
	.dword	72339077587861248
	.dword	72339077587795969
	.dword	72339077587796225
	.dword	72339077587926784
	.dword	72339077587861504
	.dword	72339073326317823
	.dword	72339073326317569
	.dword	72339073326317825
	.dword	72339073309671169
	.dword	72339073309605888
	.dword	72339073309605889
	.dword	72339073309606399
	.dword	72339073309736959
	.dword	72339073309736705
	.dword	72339073343094785
	.dword	72339073326448639
	.dword	72339073326383104
	.dword	72339073326383105
	.dword	72339073326383360
	.dword	72339073326513920
	.dword	72339073326448895
	.dword	72339073326448641
	.dword	72341268037894143
	.dword	72341268037893889
	.dword	72341268037829119
	.dword	72341268037828865
	.dword	72341268021247999
	.dword	72341268021247745
	.dword	72341268021182975
	.dword	72341268021182721
	.dword	72341263742992128
	.dword	72341263742927103
	.dword	72341263742926849
	.dword	72341263742927104
	.dword	72341263776481279
	.dword	72341263776481025
	.dword	72341263776416255
	.dword	72341263776416001
	.dword	72341263759704064
	.dword	72341263759835135
	.dword	72341263759834881
	.dword	72341263759770111
	.dword	72341263759769857
	.dword	72340172821168128
	.dword	72340172804456703
	.dword	72340172804456704
	.dword	72340172804587264
	.dword	72340172804521984
	.dword	72340168543043328
	.dword	72340168526331903
	.dword	72340168526266368
	.dword	72340168526266625
	.dword	72340168526397184
	.dword	72340168526331905
	.dword	72340168526332160
	.dword	72340168543109119
	.dword	72340168543043585
	.dword	72340177116200959
	.dword	72340177116200705
	.dword	72340177116135935
	.dword	72340177116135681
	.dword	72340177099554815
	.dword	72340177099554561
	.dword	72340177099489791
	.dword	72340177099489537
	.dword	72340172821298944
	.dword	72340172821233919
	.dword	72340172821233665
	.dword	72340172854788095
	.dword	72340172854787841
	.dword	72340172854723071
	.dword	72340172854722817
	.dword	72340172838010880
	.dword	72340172838141951
	.dword	72340172838141697
	.dword	72340172838076927
	.dword	72340172838076673
	.type	iq3s_grid, @object
	.size	iq3s_grid, 2048
iq3s_grid:
	.word	16843009
	.word	16843011
	.word	16843013
	.word	16843019
	.word	16843023
	.word	16843521
	.word	16843523
	.word	16843525
	.word	16843529
	.word	16843533
	.word	16844033
	.word	16844035
	.word	16844043
	.word	16844551
	.word	16845057
	.word	16845061
	.word	16845067
	.word	16845071
	.word	16845571
	.word	16845575
	.word	16846081
	.word	16846085
	.word	16846595
	.word	16846601
	.word	16846607
	.word	16974081
	.word	16974083
	.word	16974085
	.word	16974089
	.word	16974593
	.word	16974595
	.word	16974603
	.word	16975105
	.word	16975111
	.word	16975119
	.word	16975619
	.word	16975627
	.word	16976137
	.word	16977155
	.word	16977163
	.word	16977669
	.word	17105153
	.word	17105155
	.word	17105163
	.word	17105167
	.word	17105665
	.word	17105671
	.word	17105677
	.word	17106179
	.word	17106187
	.word	17106689
	.word	17106697
	.word	17107205
	.word	17107211
	.word	17107215
	.word	17107715
	.word	17107719
	.word	17108737
	.word	17108743
	.word	17236231
	.word	17236739
	.word	17236747
	.word	17237249
	.word	17237253
	.word	17237763
	.word	17237767
	.word	17237773
	.word	17238281
	.word	17238785
	.word	17238789
	.word	17239311
	.word	17239811
	.word	17239819
	.word	17367297
	.word	17367815
	.word	17367823
	.word	17368323
	.word	17368329
	.word	17368837
	.word	17369345
	.word	17369351
	.word	17369859
	.word	17370881
	.word	17498373
	.word	17498377
	.word	17499393
	.word	17499397
	.word	17499405
	.word	17499911
	.word	17500419
	.word	17500427
	.word	17500431
	.word	17501453
	.word	17501959
	.word	17629453
	.word	17629955
	.word	17629959
	.word	17630979
	.word	17632005
	.word	17633027
	.word	17760513
	.word	17760517
	.word	17760521
	.word	17761537
	.word	17761541
	.word	17761549
	.word	17762055
	.word	17763073
	.word	17763081
	.word	50397441
	.word	50397443
	.word	50397445
	.word	50397449
	.word	50397953
	.word	50397955
	.word	50397959
	.word	50397963
	.word	50397967
	.word	50398465
	.word	50398469
	.word	50398979
	.word	50398985
	.word	50398989
	.word	50400009
	.word	50400013
	.word	50400515
	.word	50401029
	.word	50528513
	.word	50528515
	.word	50528519
	.word	50528525
	.word	50529025
	.word	50529033
	.word	50529539
	.word	50530049
	.word	50530055
	.word	50530563
	.word	50531073
	.word	50531077
	.word	50532097
	.word	50532109
	.word	50659585
	.word	50660101
	.word	50660107
	.word	50660111
	.word	50660609
	.word	50660617
	.word	50661125
	.word	50661633
	.word	50661639
	.word	50662155
	.word	50662657
	.word	50663173
	.word	50790659
	.word	50790665
	.word	50790671
	.word	50791169
	.word	50791175
	.word	50791683
	.word	50791695
	.word	50792193
	.word	50792201
	.word	50792707
	.word	50793733
	.word	50794241
	.word	50921735
	.word	50921739
	.word	50922245
	.word	50922249
	.word	50923267
	.word	50923271
	.word	50923781
	.word	50923789
	.word	50924289
	.word	50924297
	.word	51052803
	.word	51053313
	.word	51053319
	.word	51053827
	.word	51054337
	.word	51054341
	.word	51055363
	.word	51184897
	.word	51184905
	.word	51184911
	.word	51185929
	.word	51185933
	.word	51314947
	.word	51314951
	.word	51315457
	.word	51315461
	.word	51315971
	.word	51316491
	.word	51316995
	.word	51318021
	.word	51318529
	.word	83951873
	.word	83951875
	.word	83951879
	.word	83951883
	.word	83951887
	.word	83952385
	.word	83952389
	.word	83952393
	.word	83952397
	.word	83952899
	.word	83952903
	.word	83952911
	.word	83953409
	.word	83953413
	.word	83953923
	.word	83953927
	.word	83953931
	.word	83954433
	.word	83954437
	.word	83954959
	.word	83955457
	.word	83955463
	.word	83955467
	.word	84082945
	.word	84082949
	.word	84083457
	.word	84083463
	.word	84083471
	.word	84083973
	.word	84083979
	.word	84084483
	.word	84084489
	.word	84084997
	.word	84085507
	.word	84214019
	.word	84214025
	.word	84214031
	.word	84215043
	.word	84215047
	.word	84215553
	.word	84215567
	.word	84216067
	.word	84216583
	.word	84216591
	.word	84217603
	.word	84217609
	.word	84345089
	.word	84345093
	.word	84345099
	.word	84345603
	.word	84346117
	.word	84346121
	.word	84346627
	.word	84346631
	.word	84347141
	.word	84347649
	.word	84348173
	.word	84476163
	.word	84476175
	.word	84477185
	.word	84477191
	.word	84477701
	.word	84477707
	.word	84478211
	.word	84479749
	.word	84479755
	.word	84607241
	.word	84607747
	.word	84608261
	.word	84608783
	.word	84609281
	.word	84609799
	.word	84610817
	.word	84738305
	.word	84738309
	.word	84738319
	.word	84739331
	.word	84740875
	.word	84741379
	.word	84869387
	.word	84869891
	.word	84870413
	.word	84870913
	.word	84871431
	.word	84871937
	.word	117506309
	.word	117506819
	.word	117506823
	.word	117506827
	.word	117506831
	.word	117507333
	.word	117507843
	.word	117507847
	.word	117507851
	.word	117508357
	.word	117508361
	.word	117508367
	.word	117508867
	.word	117509383
	.word	117509891
	.word	117637379
	.word	117637383
	.word	117637387
	.word	117637897
	.word	117638403
	.word	117638407
	.word	117639425
	.word	117640449
	.word	117640965
	.word	117640973
	.word	117768449
	.word	117768965
	.word	117769473
	.word	117769989
	.word	117769993
	.word	117771009
	.word	117899523
	.word	117900033
	.word	117900041
	.word	117900547
	.word	117900551
	.word	117900559
	.word	117901057
	.word	117901571
	.word	117901575
	.word	117901583
	.word	117902091
	.word	117903111
	.word	118030599
	.word	118031107
	.word	118031117
	.word	118031621
	.word	118032131
	.word	118033157
	.word	118033665
	.word	118033673
	.word	118161667
	.word	118162177
	.word	118162181
	.word	118162699
	.word	118163205
	.word	118163721
	.word	118164237
	.word	118165255
	.word	118293261
	.word	118294787
	.word	118423811
	.word	118423815
	.word	118424833
	.word	118424837
	.word	118425355
	.word	151060737
	.word	151060745
	.word	151061253
	.word	151061761
	.word	151061769
	.word	151061775
	.word	151062277
	.word	151062787
	.word	151063297
	.word	151064321
	.word	151191813
	.word	151191823
	.word	151192323
	.word	151192327
	.word	151192837
	.word	151193345
	.word	151193355
	.word	151193863
	.word	151194371
	.word	151194379
	.word	151322883
	.word	151322887
	.word	151323393
	.word	151323403
	.word	151323907
	.word	151324423
	.word	151324929
	.word	151325455
	.word	151325957
	.word	151326465
	.word	151453961
	.word	151454467
	.word	151454471
	.word	151454977
	.word	151454981
	.word	151455491
	.word	151455499
	.word	151585025
	.word	151585029
	.word	151586057
	.word	151586575
	.word	151587073
	.word	151588611
	.word	151716107
	.word	151716111
	.word	151717123
	.word	151719173
	.word	151847687
	.word	151848713
	.word	151850241
	.word	151978753
	.word	151978763
	.word	151979777
	.word	151980295
	.word	151980803
	.word	184615173
	.word	184615681
	.word	184615689
	.word	184616197
	.word	184617217
	.word	184617225
	.word	184617231
	.word	184617733
	.word	184618253
	.word	184618761
	.word	184746243
	.word	184746247
	.word	184746251
	.word	184746757
	.word	184747267
	.word	184747781
	.word	184749829
	.word	184877313
	.word	184877827
	.word	184878343
	.word	184878849
	.word	184878861
	.word	184879879
	.word	185008389
	.word	185008399
	.word	185008897
	.word	185009423
	.word	185010441
	.word	185010947
	.word	185011467
	.word	185011975
	.word	185139459
	.word	185139465
	.word	185140481
	.word	185140997
	.word	185141517
	.word	185271045
	.word	185271565
	.word	185273091
	.word	185273095
	.word	185403653
	.word	185532677
	.word	185532681
	.word	185533701
	.word	218170115
	.word	218170119
	.word	218170123
	.word	218171139
	.word	218171143
	.word	218172673
	.word	218300673
	.word	218301697
	.word	218301711
	.word	218303753
	.word	218432261
	.word	218433289
	.word	218433797
	.word	218434315
	.word	218434821
	.word	218435329
	.word	218562817
	.word	218563337
	.word	218563843
	.word	218564865
	.word	218694923
	.word	218695943
	.word	218696965
	.word	218824961
	.word	218824967
	.word	218826505
	.word	218828033
	.word	218956043
	.word	218958081
	.word	219087619
	.word	219087623
	.word	251724033
	.word	251724041
	.word	251724047
	.word	251725057
	.word	251725061
	.word	251725581
	.word	251726081
	.word	251726601
	.word	251727109
	.word	251855109
	.word	251855619
	.word	251856137
	.word	251857159
	.word	251857163
	.word	251986179
	.word	251986185
	.word	251986689
	.word	251986701
	.word	251987203
	.word	251987713
	.word	251988739
	.word	252117253
	.word	252118789
	.word	252118795
	.word	252119815
	.word	252248323
	.word	252248331
	.word	252248839
	.word	252249345
	.word	252250881
	.word	252380421
	.word	252381445
	.word	252510469
	.word	252512003
	.word	252641537
	.type	iq2s_grid, @object
	.size	iq2s_grid, 8192
iq2s_grid:
	.dword	578721382704613384
	.dword	578721382704613419
	.dword	578721382704617753
	.dword	578721382704622344
	.dword	578721382704622379
	.dword	578721382705727513
	.dword	578721382705731848
	.dword	578721382705731883
	.dword	578721382705736473
	.dword	578721382706907144
	.dword	578721382706907179
	.dword	578721382706911513
	.dword	578721382706916104
	.dword	578721382989826073
	.dword	578721382989830408
	.dword	578721382989830443
	.dword	578721382989835033
	.dword	578721382990940168
	.dword	578721382990940203
	.dword	578721382990944537
	.dword	578721382990949128
	.dword	578721382992119833
	.dword	578721382992124168
	.dword	578721382992124203
	.dword	578721382992128793
	.dword	578721383291815944
	.dword	578721383291815979
	.dword	578721383291820313
	.dword	578721383291824904
	.dword	578721383292930073
	.dword	578721383292934408
	.dword	578721383294109704
	.dword	578721383294114073
	.dword	578721383294118699
	.dword	578721455719057433
	.dword	578721455719061768
	.dword	578721455719061803
	.dword	578721455719066393
	.dword	578721455720171528
	.dword	578721455720171563
	.dword	578721455720175897
	.dword	578721455720180488
	.dword	578721455721351193
	.dword	578721455721355528
	.dword	578721456004270088
	.dword	578721456004270123
	.dword	578721456004274457
	.dword	578721456004279048
	.dword	578721456005384217
	.dword	578721456005388552
	.dword	578721456005388587
	.dword	578721456005393177
	.dword	578721456006563848
	.dword	578721456006568217
	.dword	578721456006572808
	.dword	578721456306259993
	.dword	578721456306264328
	.dword	578721456307374088
	.dword	578721456307374123
	.dword	578721456307378457
	.dword	578721456308553753
	.dword	578721456308558088
	.dword	578721533028468744
	.dword	578721533028468779
	.dword	578721533028473113
	.dword	578721533028477704
	.dword	578721533029582873
	.dword	578721533029587208
	.dword	578721533030762504
	.dword	578721533030771499
	.dword	578721533313681433
	.dword	578721533313685768
	.dword	578721533313685803
	.dword	578721533313690393
	.dword	578721533314795528
	.dword	578721533314799897
	.dword	578721533615671304
	.dword	578721533615675673
	.dword	578721533615680299
	.dword	578721533616789768
	.dword	578721533617965099
	.dword	578740074402285593
	.dword	578740074402289928
	.dword	578740074402289963
	.dword	578740074402294553
	.dword	578740074403399688
	.dword	578740074403399723
	.dword	578740074403404057
	.dword	578740074403408648
	.dword	578740074404579353
	.dword	578740074404583688
	.dword	578740074404583723
	.dword	578740074404588313
	.dword	578740074687498248
	.dword	578740074687498283
	.dword	578740074687502617
	.dword	578740074687507208
	.dword	578740074687507243
	.dword	578740074688612377
	.dword	578740074688616712
	.dword	578740074688616747
	.dword	578740074688621337
	.dword	578740074689792008
	.dword	578740074689792043
	.dword	578740074689796377
	.dword	578740074989488153
	.dword	578740074989492488
	.dword	578740074989492523
	.dword	578740074989497113
	.dword	578740074990602248
	.dword	578740074990606617
	.dword	578740074990611208
	.dword	578740074991781913
	.dword	578740074991786248
	.dword	578740147416729608
	.dword	578740147416729643
	.dword	578740147416733977
	.dword	578740147416738568
	.dword	578740147416738603
	.dword	578740147417843737
	.dword	578740147417848072
	.dword	578740147417848107
	.dword	578740147417852697
	.dword	578740147419023368
	.dword	578740147419027737
	.dword	578740147419032328
	.dword	578740147701942297
	.dword	578740147701946632
	.dword	578740147701946667
	.dword	578740147701951257
	.dword	578740147703056392
	.dword	578740147703056427
	.dword	578740147703060761
	.dword	578740147703065352
	.dword	578740147704236057
	.dword	578740147704240392
	.dword	578740148003932168
	.dword	578740148003932203
	.dword	578740148003936537
	.dword	578740148003941128
	.dword	578740148005046297
	.dword	578740148005050632
	.dword	578740148006225928
	.dword	578740224726140953
	.dword	578740224726145288
	.dword	578740224726145323
	.dword	578740224726149913
	.dword	578740224727255048
	.dword	578740224727259417
	.dword	578740225011353608
	.dword	578740225011357977
	.dword	578740225011362568
	.dword	578740225012467737
	.dword	578740225012472072
	.dword	578740225013647368
	.dword	578740225313343513
	.dword	578740225313347848
	.dword	578740225314457608
	.dword	578759865611585544
	.dword	578759865611585579
	.dword	578759865611589913
	.dword	578759865611594504
	.dword	578759865612699673
	.dword	578759865612704008
	.dword	578759865612704043
	.dword	578759865612708633
	.dword	578759865613879304
	.dword	578759865613883673
	.dword	578759865613888299
	.dword	578759865896798233
	.dword	578759865896802568
	.dword	578759865896802603
	.dword	578759865896807193
	.dword	578759865897912328
	.dword	578759865897912363
	.dword	578759865897916697
	.dword	578759865897921288
	.dword	578759865899091993
	.dword	578759865899096328
	.dword	578759866198788104
	.dword	578759866198792473
	.dword	578759866199906568
	.dword	578759866201090859
	.dword	578759938626029593
	.dword	578759938626033928
	.dword	578759938627143688
	.dword	578759938627143723
	.dword	578759938627148057
	.dword	578759938627152648
	.dword	578759938628323353
	.dword	578759938911242248
	.dword	578759938911246617
	.dword	578759938911251208
	.dword	578759938912356377
	.dword	578759938912360712
	.dword	578759938913536008
	.dword	578759939213232153
	.dword	578759939214346248
	.dword	578760015935440904
	.dword	578760015936555033
	.dword	578760015936559368
	.dword	578760015937734699
	.dword	578760015937743624
	.dword	578760015937743659
	.dword	578760016221767688
	.dword	578760016523766553
	.dword	583506457308694553
	.dword	583506457308698888
	.dword	583506457308698923
	.dword	583506457308703513
	.dword	583506457309808648
	.dword	583506457309808683
	.dword	583506457309813017
	.dword	583506457309817608
	.dword	583506457310988313
	.dword	583506457310992648
	.dword	583506457310992683
	.dword	583506457593907208
	.dword	583506457593907243
	.dword	583506457593911577
	.dword	583506457593916168
	.dword	583506457595021337
	.dword	583506457595025672
	.dword	583506457595025707
	.dword	583506457595030297
	.dword	583506457596200968
	.dword	583506457596201003
	.dword	583506457596205337
	.dword	583506457596209928
	.dword	583506457895897113
	.dword	583506457895901448
	.dword	583506457895901483
	.dword	583506457897011208
	.dword	583506457897015577
	.dword	583506457897020168
	.dword	583506457898190873
	.dword	583506457898195208
	.dword	583506530323138568
	.dword	583506530323138603
	.dword	583506530323142937
	.dword	583506530323147528
	.dword	583506530323147563
	.dword	583506530324252697
	.dword	583506530324257032
	.dword	583506530324257067
	.dword	583506530324261657
	.dword	583506530325432328
	.dword	583506530325432363
	.dword	583506530325436697
	.dword	583506530325441288
	.dword	583506530608351257
	.dword	583506530608355592
	.dword	583506530608355627
	.dword	583506530608360217
	.dword	583506530609465352
	.dword	583506530609465387
	.dword	583506530609469721
	.dword	583506530609474312
	.dword	583506530610645017
	.dword	583506530610649352
	.dword	583506530910341128
	.dword	583506530910341163
	.dword	583506530910345497
	.dword	583506530910350088
	.dword	583506530911455257
	.dword	583506530911459592
	.dword	583506607632549913
	.dword	583506607632554248
	.dword	583506607632558873
	.dword	583506607633664008
	.dword	583506607633668377
	.dword	583506607634843673
	.dword	583506607634848008
	.dword	583506607917762568
	.dword	583506607917766937
	.dword	583506607918876697
	.dword	583506607918881032
	.dword	583506608219752473
	.dword	583506608219756808
	.dword	583506608220866568
	.dword	583525149006366728
	.dword	583525149006366763
	.dword	583525149006371097
	.dword	583525149006375688
	.dword	583525149007480857
	.dword	583525149007485192
	.dword	583525149007485227
	.dword	583525149007489817
	.dword	583525149008660488
	.dword	583525149008664857
	.dword	583525149008669448
	.dword	583525149291579417
	.dword	583525149291583752
	.dword	583525149291583787
	.dword	583525149291588377
	.dword	583525149292693512
	.dword	583525149292693547
	.dword	583525149292697881
	.dword	583525149292702472
	.dword	583525149293873177
	.dword	583525149293877512
	.dword	583525149593569288
	.dword	583525149593569323
	.dword	583525149593573657
	.dword	583525149593578248
	.dword	583525149594683417
	.dword	583525149594687752
	.dword	583525149595863048
	.dword	583525222020810777
	.dword	583525222020815112
	.dword	583525222020815147
	.dword	583525222020819737
	.dword	583525222021924872
	.dword	583525222021924907
	.dword	583525222021929241
	.dword	583525222021933832
	.dword	583525222023104537
	.dword	583525222023108872
	.dword	583525222306023432
	.dword	583525222306023467
	.dword	583525222306027801
	.dword	583525222306032392
	.dword	583525222307137561
	.dword	583525222307141896
	.dword	583525222308317192
	.dword	583525222608013337
	.dword	583525222608017672
	.dword	583525222609127432
	.dword	583525299330222088
	.dword	583525299330226457
	.dword	583525299330231048
	.dword	583525299331336217
	.dword	583525299331340552
	.dword	583525299332515848
	.dword	583525299615434777
	.dword	583525299615439112
	.dword	583525299616548872
	.dword	583525299917424648
	.dword	583525299919727403
	.dword	583544940215666713
	.dword	583544940215671048
	.dword	583544940215671083
	.dword	583544940215675673
	.dword	583544940216780808
	.dword	583544940216785177
	.dword	583544940216789768
	.dword	583544940217960473
	.dword	583544940500879368
	.dword	583544940500879403
	.dword	583544940500883737
	.dword	583544940500888328
	.dword	583544940501993497
	.dword	583544940501997832
	.dword	583544940503173128
	.dword	583544940802869273
	.dword	583544940802873608
	.dword	583545013230110728
	.dword	583545013230110763
	.dword	583545013230115097
	.dword	583545013230119688
	.dword	583545013231224857
	.dword	583545013231229192
	.dword	583545013232404488
	.dword	583545013515323417
	.dword	583545013515327752
	.dword	583545013516437512
	.dword	583545013517626137
	.dword	583545013819607083
	.dword	583545090539526408
	.dword	583545090540636168
	.dword	583545090824734728
	.dword	583545090825853227
	.dword	588573006889486344
	.dword	588573006889486379
	.dword	588573006889490713
	.dword	588573006889495304
	.dword	588573006890600473
	.dword	588573006890604808
	.dword	588573006890604843
	.dword	588573006890609433
	.dword	588573006891780104
	.dword	588573006891784473
	.dword	588573006891789099
	.dword	588573007174699033
	.dword	588573007174703368
	.dword	588573007175813128
	.dword	588573007175813163
	.dword	588573007175817497
	.dword	588573007176997128
	.dword	588573007476688904
	.dword	588573007476697899
	.dword	588573007477807368
	.dword	588573007478991659
	.dword	588573079903930393
	.dword	588573079903934728
	.dword	588573079905044488
	.dword	588573079905044523
	.dword	588573079905048857
	.dword	588573079906224153
	.dword	588573080189143048
	.dword	588573080189143083
	.dword	588573080189147417
	.dword	588573080190257177
	.dword	588573080190261512
	.dword	588573080191436808
	.dword	588573080491132953
	.dword	588573080491137288
	.dword	588573080492247048
	.dword	588573157213341704
	.dword	588573157213350699
	.dword	588573157215635499
	.dword	588573157215644424
	.dword	588573157215644459
	.dword	588573157498558728
	.dword	588573157499668488
	.dword	588573157800553224
	.dword	588573157800553259
	.dword	588573157802846984
	.dword	588591698587158553
	.dword	588591698587162888
	.dword	588591698587162923
	.dword	588591698587167513
	.dword	588591698588272648
	.dword	588591698588277017
	.dword	588591698588281608
	.dword	588591698589452313
	.dword	588591698589456648
	.dword	588591698872371208
	.dword	588591698872371243
	.dword	588591698872375577
	.dword	588591698872380168
	.dword	588591698873485337
	.dword	588591698873489672
	.dword	588591698874664968
	.dword	588591699174361113
	.dword	588591699174365448
	.dword	588591699175475208
	.dword	588591771601602568
	.dword	588591771601606937
	.dword	588591771601611528
	.dword	588591771602716697
	.dword	588591771602721032
	.dword	588591771603896328
	.dword	588591771886815257
	.dword	588591771886819592
	.dword	588591771887929352
	.dword	588591771889113387
	.dword	588591772188805128
	.dword	588591848911013913
	.dword	588591848911018248
	.dword	588591848912128008
	.dword	588591849196226568
	.dword	588591849197349657
	.dword	588611489796458504
	.dword	588611489796462873
	.dword	588611489797572633
	.dword	588611489797576968
	.dword	588611490081671193
	.dword	588611490081675528
	.dword	588611490082785288
	.dword	588611490383670059
	.dword	588611490385963819
	.dword	588611562810902553
	.dword	588611562810906888
	.dword	588611562812016648
	.dword	588611563399223577
	.dword	588611640120322859
	.dword	588611640122607659
	.dword	588611640407824648
	.dword	588611640707525384
	.dword	588611640707525419
	.dword	1803700481349388313
	.dword	1803700481349392648
	.dword	1803700481349392683
	.dword	1803700481349397273
	.dword	1803700481350502408
	.dword	1803700481350502443
	.dword	1803700481350506777
	.dword	1803700481350511368
	.dword	1803700481350511403
	.dword	1803700481351682073
	.dword	1803700481351686408
	.dword	1803700481351686443
	.dword	1803700481634600968
	.dword	1803700481634601003
	.dword	1803700481634605337
	.dword	1803700481634609928
	.dword	1803700481634609963
	.dword	1803700481635715097
	.dword	1803700481635719432
	.dword	1803700481635719467
	.dword	1803700481635724057
	.dword	1803700481636894728
	.dword	1803700481636894763
	.dword	1803700481636899097
	.dword	1803700481936590873
	.dword	1803700481936595208
	.dword	1803700481937704968
	.dword	1803700481937709337
	.dword	1803700481937713928
	.dword	1803700481938884633
	.dword	1803700481938888968
	.dword	1803700554363832328
	.dword	1803700554363832363
	.dword	1803700554363836697
	.dword	1803700554363841288
	.dword	1803700554364946457
	.dword	1803700554364950792
	.dword	1803700554364950827
	.dword	1803700554364955417
	.dword	1803700554366126088
	.dword	1803700554366126123
	.dword	1803700554366130457
	.dword	1803700554649045017
	.dword	1803700554649049352
	.dword	1803700554649049387
	.dword	1803700554649053977
	.dword	1803700554650159112
	.dword	1803700554650159147
	.dword	1803700554650163481
	.dword	1803700554650168072
	.dword	1803700554651338777
	.dword	1803700554651343112
	.dword	1803700554951034888
	.dword	1803700554951034923
	.dword	1803700554951039257
	.dword	1803700554951043848
	.dword	1803700554952149017
	.dword	1803700554952153352
	.dword	1803700554953328648
	.dword	1803700631673243673
	.dword	1803700631673248008
	.dword	1803700631674357768
	.dword	1803700631674357803
	.dword	1803700631674362137
	.dword	1803700631674366728
	.dword	1803700631675541768
	.dword	1803700631958456328
	.dword	1803700631958460697
	.dword	1803700631958465288
	.dword	1803700631959570457
	.dword	1803700631959574792
	.dword	1803700631960750088
	.dword	1803700632260446233
	.dword	1803700632260450568
	.dword	1803719173047060488
	.dword	1803719173047060523
	.dword	1803719173047064857
	.dword	1803719173047069448
	.dword	1803719173047069483
	.dword	1803719173048174617
	.dword	1803719173048178952
	.dword	1803719173048178987
	.dword	1803719173048183577
	.dword	1803719173049354248
	.dword	1803719173049354283
	.dword	1803719173049358617
	.dword	1803719173049363208
	.dword	1803719173332273177
	.dword	1803719173332277512
	.dword	1803719173332277547
	.dword	1803719173332282137
	.dword	1803719173333387272
	.dword	1803719173333387307
	.dword	1803719173333391641
	.dword	1803719173333396232
	.dword	1803719173334566937
	.dword	1803719173334571272
	.dword	1803719173634263048
	.dword	1803719173634263083
	.dword	1803719173634267417
	.dword	1803719173634272008
	.dword	1803719173635377177
	.dword	1803719173635381512
	.dword	1803719173636556808
	.dword	1803719246061504537
	.dword	1803719246061508872
	.dword	1803719246061508907
	.dword	1803719246061513497
	.dword	1803719246062618632
	.dword	1803719246062618667
	.dword	1803719246062623001
	.dword	1803719246062627592
	.dword	1803719246063798297
	.dword	1803719246063802632
	.dword	1803719246346717192
	.dword	1803719246346717227
	.dword	1803719246346721561
	.dword	1803719246346726152
	.dword	1803719246347831321
	.dword	1803719246347835656
	.dword	1803719246349010952
	.dword	1803719246349019947
	.dword	1803719246648707097
	.dword	1803719246648711432
	.dword	1803719246649821192
	.dword	1803719323370915848
	.dword	1803719323370915883
	.dword	1803719323370920217
	.dword	1803719323370924808
	.dword	1803719323372029977
	.dword	1803719323372034312
	.dword	1803719323373209608
	.dword	1803719323656128537
	.dword	1803719323656132872
	.dword	1803719323657242632
	.dword	1803719323958118408
	.dword	1803719323960416537
	.dword	1803738964256360473
	.dword	1803738964256364808
	.dword	1803738964256369433
	.dword	1803738964257474568
	.dword	1803738964257474603
	.dword	1803738964257478937
	.dword	1803738964257483528
	.dword	1803738964258654233
	.dword	1803738964258658568
	.dword	1803738964541573128
	.dword	1803738964541573163
	.dword	1803738964541577497
	.dword	1803738964541582088
	.dword	1803738964542687257
	.dword	1803738964542691592
	.dword	1803738964543866888
	.dword	1803738964843567368
	.dword	1803738964844677128
	.dword	1803739037270804488
	.dword	1803739037270804523
	.dword	1803739037270808857
	.dword	1803739037270813448
	.dword	1803739037271918617
	.dword	1803739037271922952
	.dword	1803739037273098248
	.dword	1803739037556017177
	.dword	1803739037556021512
	.dword	1803739037557131272
	.dword	1803739037858007048
	.dword	1803739037859125547
	.dword	1803739114580215833
	.dword	1803739114580220168
	.dword	1803739114581329928
	.dword	1803739114865428488
	.dword	1808485555953469448
	.dword	1808485555953469483
	.dword	1808485555953473817
	.dword	1808485555953478408
	.dword	1808485555954583577
	.dword	1808485555954587912
	.dword	1808485555954587947
	.dword	1808485555954592537
	.dword	1808485555955763208
	.dword	1808485555955763243
	.dword	1808485555955767577
	.dword	1808485555955772168
	.dword	1808485556238682137
	.dword	1808485556238686472
	.dword	1808485556238686507
	.dword	1808485556238691097
	.dword	1808485556239796232
	.dword	1808485556239796267
	.dword	1808485556239800601
	.dword	1808485556239805192
	.dword	1808485556240975897
	.dword	1808485556240980232
	.dword	1808485556540672008
	.dword	1808485556540672043
	.dword	1808485556540676377
	.dword	1808485556540680968
	.dword	1808485556541786137
	.dword	1808485556541790472
	.dword	1808485628967913497
	.dword	1808485628967917832
	.dword	1808485628967917867
	.dword	1808485628967922457
	.dword	1808485628969027592
	.dword	1808485628969027627
	.dword	1808485628969031961
	.dword	1808485628969036552
	.dword	1808485628970207257
	.dword	1808485628970211592
	.dword	1808485629253126152
	.dword	1808485629253126187
	.dword	1808485629253130521
	.dword	1808485629253135112
	.dword	1808485629254240281
	.dword	1808485629254244616
	.dword	1808485629255419912
	.dword	1808485629555116057
	.dword	1808485629555120392
	.dword	1808485629556230152
	.dword	1808485706277324808
	.dword	1808485706277329177
	.dword	1808485706277333768
	.dword	1808485706278438937
	.dword	1808485706278443272
	.dword	1808485706279618568
	.dword	1808485706562537497
	.dword	1808485706562541832
	.dword	1808485706563651592
	.dword	1808485706564840217
	.dword	1808485706864527368
	.dword	1808504247651141657
	.dword	1808504247651145992
	.dword	1808504247651146027
	.dword	1808504247651150617
	.dword	1808504247652255752
	.dword	1808504247652255787
	.dword	1808504247652260121
	.dword	1808504247652264712
	.dword	1808504247653435417
	.dword	1808504247653439752
	.dword	1808504247936354312
	.dword	1808504247936354347
	.dword	1808504247936358681
	.dword	1808504247936363272
	.dword	1808504247937468441
	.dword	1808504247937472776
	.dword	1808504247938648072
	.dword	1808504248238344217
	.dword	1808504248238348552
	.dword	1808504248239458312
	.dword	1808504320665585672
	.dword	1808504320665585707
	.dword	1808504320665590041
	.dword	1808504320665594632
	.dword	1808504320666699801
	.dword	1808504320666704136
	.dword	1808504320667879432
	.dword	1808504320950798361
	.dword	1808504320950802696
	.dword	1808504320951912456
	.dword	1808504321252788232
	.dword	1808504397974997017
	.dword	1808504397975001352
	.dword	1808504397976111112
	.dword	1808504397977295147
	.dword	1808504398260209672
	.dword	1808524038860441608
	.dword	1808524038860441643
	.dword	1808524038860445977
	.dword	1808524038860450568
	.dword	1808524038861555737
	.dword	1808524038861560072
	.dword	1808524038862735368
	.dword	1808524039145654297
	.dword	1808524039145658632
	.dword	1808524039146768392
	.dword	1808524039146777387
	.dword	1808524039447644168
	.dword	1808524111874885657
	.dword	1808524111874889992
	.dword	1808524111875999752
	.dword	1808524112160098312
	.dword	1808524189184296968
	.dword	1808524189185420057
	.dword	1808524189771503897
	.dword	1808524189773802248
	.dword	1813552105534261273
	.dword	1813552105534265608
	.dword	1813552105534265643
	.dword	1813552105535375368
	.dword	1813552105535375403
	.dword	1813552105535379737
	.dword	1813552105535384328
	.dword	1813552105536555033
	.dword	1813552105536559368
	.dword	1813552105819473928
	.dword	1813552105819478297
	.dword	1813552105819482888
	.dword	1813552105820588057
	.dword	1813552105820592392
	.dword	1813552105821767688
	.dword	1813552106121468168
	.dword	1813552106122577928
	.dword	1813552178548705288
	.dword	1813552178548705323
	.dword	1813552178548709657
	.dword	1813552178548714248
	.dword	1813552178549819417
	.dword	1813552178549823752
	.dword	1813552178550999048
	.dword	1813552178833917977
	.dword	1813552178833922312
	.dword	1813552178835032072
	.dword	1813552179135907848
	.dword	1813552179137030937
	.dword	1813552255858120968
	.dword	1813552255859230728
	.dword	1813552256143329288
	.dword	1813552256144447787
	.dword	1813552256447612953
	.dword	1813570797231933448
	.dword	1813570797231937817
	.dword	1813570797231942408
	.dword	1813570797233047577
	.dword	1813570797233051912
	.dword	1813570797234227208
	.dword	1813570797517146137
	.dword	1813570797517150472
	.dword	1813570797518260232
	.dword	1813570797819136008
	.dword	1813570870246377497
	.dword	1813570870246381832
	.dword	1813570870247491592
	.dword	1813570870531590152
	.dword	1813570870531599147
	.dword	1813570870533892872
	.dword	1813570870834694187
	.dword	1813570947555788808
	.dword	1813570948144109832
	.dword	1813590588441233433
	.dword	1813590588441237768
	.dword	1813590588442347528
	.dword	1813590588728744217
	.dword	1813590589029559048
	.dword	1813590661455677448
	.dword	1813590661457980203
	.dword	1813590739050301483
	.dword	1813590739354585113
	.dword	3100737174032091144
	.dword	3100737174032091179
	.dword	3100737174032095513
	.dword	3100737174032100104
	.dword	3100737174033205273
	.dword	3100737174033209608
	.dword	3100737174033214233
	.dword	3100737174034384904
	.dword	3100737174034389273
	.dword	3100737174317303833
	.dword	3100737174317308168
	.dword	3100737174318417928
	.dword	3100737174318417963
	.dword	3100737174318422297
	.dword	3100737174318426888
	.dword	3100737174319597593
	.dword	3100737174619293704
	.dword	3100737174619298073
	.dword	3100737174620407833
	.dword	3100737174620412168
	.dword	3100737247046535193
	.dword	3100737247046539528
	.dword	3100737247046544153
	.dword	3100737247047649288
	.dword	3100737247047649323
	.dword	3100737247047653657
	.dword	3100737247047658248
	.dword	3100737247048828953
	.dword	3100737247048833288
	.dword	3100737247331747848
	.dword	3100737247331747883
	.dword	3100737247331752217
	.dword	3100737247331756808
	.dword	3100737247332861977
	.dword	3100737247332866312
	.dword	3100737247633737753
	.dword	3100737247633742088
	.dword	3100737247634851848
	.dword	3100737247636040473
	.dword	3100737324355946504
	.dword	3100737324355950873
	.dword	3100737324355955499
	.dword	3100737324357060633
	.dword	3100737324357064968
	.dword	3100737324641159193
	.dword	3100737324641163528
	.dword	3100737324642273288
	.dword	3100755865729763353
	.dword	3100755865729767688
	.dword	3100755865729767723
	.dword	3100755865729772313
	.dword	3100755865730877448
	.dword	3100755865730877483
	.dword	3100755865730881817
	.dword	3100755865730886408
	.dword	3100755865732057113
	.dword	3100755866014976008
	.dword	3100755866014976043
	.dword	3100755866014980377
	.dword	3100755866014984968
	.dword	3100755866016090137
	.dword	3100755866016094472
	.dword	3100755866017269768
	.dword	3100755866316965913
	.dword	3100755866316970248
	.dword	3100755866318080008
	.dword	3100755938744207368
	.dword	3100755938744207403
	.dword	3100755938744211737
	.dword	3100755938744216328
	.dword	3100755938745321497
	.dword	3100755938745325832
	.dword	3100755938746501128
	.dword	3100755939029420057
	.dword	3100755939029424392
	.dword	3100755939030534152
	.dword	3100755939331409928
	.dword	3100755939331418923
	.dword	3100756016053618713
	.dword	3100756016053623048
	.dword	3100756016054732808
	.dword	3100756016055921433
	.dword	3100756016338831368
	.dword	3100775656939063304
	.dword	3100775656939067673
	.dword	3100775656940177433
	.dword	3100775656940181768
	.dword	3100775657224275993
	.dword	3100775657224280328
	.dword	3100775657225390088
	.dword	3100775657528559659
	.dword	3100775729953507353
	.dword	3100775729953511688
	.dword	3100775730238720008
	.dword	3100775730241018137
	.dword	3100775807265212459
	.dword	3100775807549254408
	.dword	3100775807549254443
	.dword	3100775807850121259
	.dword	3100775807852415019
	.dword	3105522248636172313
	.dword	3105522248636176648
	.dword	3105522248636181273
	.dword	3105522248637286408
	.dword	3105522248637286443
	.dword	3105522248637290777
	.dword	3105522248637295368
	.dword	3105522248638470408
	.dword	3105522248921384968
	.dword	3105522248921385003
	.dword	3105522248921389337
	.dword	3105522248921393928
	.dword	3105522248922499097
	.dword	3105522248922503432
	.dword	3105522248923678728
	.dword	3105522249223374873
	.dword	3105522249223379208
	.dword	3105522249224488968
	.dword	3105522321650616328
	.dword	3105522321650620697
	.dword	3105522321651730457
	.dword	3105522321651734792
	.dword	3105522321935829017
	.dword	3105522321935833352
	.dword	3105522321936943112
	.dword	3105522321936952107
	.dword	3105522398960027673
	.dword	3105522398960032008
	.dword	3105522398961141768
	.dword	3105522399245240328
	.dword	3105522399549528363
	.dword	3105540940333844488
	.dword	3105540940333844523
	.dword	3105540940333848857
	.dword	3105540940333853448
	.dword	3105540940334958617
	.dword	3105540940334962952
	.dword	3105540940336138248
	.dword	3105540940619057177
	.dword	3105540940619061512
	.dword	3105540940620171272
	.dword	3105540940921047048
	.dword	3105540940922165547
	.dword	3105541013348288537
	.dword	3105541013348292872
	.dword	3105541013349402632
	.dword	3105541013633501192
	.dword	3105541013936614152
	.dword	3105541013937784857
	.dword	3105541090657699848
	.dword	3105541090942916907
	.dword	3105541090945210632
	.dword	3105560731543144473
	.dword	3105560731543148808
	.dword	3105560731544258568
	.dword	3105560731545442603
	.dword	3105560731828357128
	.dword	3105560732132649753
	.dword	3105560804557588488
	.dword	3105560804842810137
	.dword	3105560804843915307
	.dword	3105560882455316488
	.dword	3110588798216964104
	.dword	3110588798216968473
	.dword	3110588798216973099
	.dword	3110588798218082568
	.dword	3110588798219257899
	.dword	3110588798219266859
	.dword	3110588798502176793
	.dword	3110588798502181128
	.dword	3110588798503290888
	.dword	3110588798806460459
	.dword	3110588798806469419
	.dword	3110588871516620808
	.dword	3110588871518918937
	.dword	3110588948540819499
	.dword	3110588948540828459
	.dword	3110588948543113259
	.dword	3110588948543122184
	.dword	3110588948543122219
	.dword	3110588949128022059
	.dword	3110588949128030984
	.dword	3110588949128031019
	.dword	3110588949130324744
	.dword	3110607489914636313
	.dword	3110607489914640648
	.dword	3110607489915750408
	.dword	3110607490199848968
	.dword	3110607490501847833
	.dword	3110607490504136968
	.dword	3110607562929080328
	.dword	3110607562930203417
	.dword	3110607640524818457
	.dword	3110627281123945259
	.dword	3110627281126238984
	.dword	3110627281713432619
	.dword	3110627354424711432
	.dword	3110627354725587243
	.dword	3110627431447800584
	.dword	3110627431447800619
	.dword	3110627431450085384
	.dword	3110627431450085419
	.dword	3110627431450094344
	.dword	3110627432035003144
	.dword	3110627432037296939
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
