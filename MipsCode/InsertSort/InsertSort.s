	.file	1 "InsertSort.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC1:
	.ascii	"failed!!!\000"
	.text
	.align	2
	.globl	insert_sort
	.set	nomips16
	.set	nomicromips
	.ent	insert_sort
	.type	insert_sort, @function
insert_sort:
	.frame	$sp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sltu	$2,$4,$5
	.cprestore	16
	sw	$16,32($sp)
	move	$16,$4
	sw	$31,36($sp)
	beq	$2,$0,$L15
	nop

$L2:
	addiu	$2,$16,4
	move	$8,$16
	beq	$5,$2,$L1
	nop

$L12:
	lw	$7,4($8)
	lw	$3,0($8)
	slt	$2,$7,$3
	beq	$2,$0,$L9
	nop

	sltu	$2,$8,$16
	bne	$2,$0,$L9
	nop

	move	$2,$8
	b	$L5
	nop

$L16:
	bne	$6,$0,$L4
	nop

$L5:
	sw	$3,4($2)
	addiu	$2,$2,-4
	lw	$3,0($2)
	sltu	$6,$2,$16
	slt	$4,$7,$3
	bne	$4,$0,$L16
	nop

$L4:
	addiu	$3,$8,8
	sw	$7,4($2)
	addiu	$8,$8,4
	bne	$5,$3,$L12
	nop

$L1:
	lw	$31,36($sp)
	lw	$16,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

$L9:
	move	$2,$8
	addiu	$3,$8,8
	sw	$7,4($2)
	addiu	$8,$8,4
	bne	$5,$3,$L12
	nop

	b	$L1
	nop

$L15:
	lw	$4,%got($LC1)($28)
	lw	$25,%call16(printf)($28)
	sw	$5,24($sp)
	addiu	$4,$4,%lo($LC1)
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$5,24($sp)
	b	$L2
	nop

	.set	macro
	.set	reorder
	.end	insert_sort
	.size	insert_sort, .-insert_sort
	.section	.rodata.str1.4
	.align	2
$LC2:
	.ascii	"%d \000"
	.text
	.align	2
	.globl	print_result
	.set	nomips16
	.set	nomicromips
	.ent	print_result
	.type	print_result, @function
print_result:
	.frame	$sp,40,$31		# vars= 0, regs= 4/0, args= 16, gp= 8
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	.cprestore	16
	sw	$31,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	beq	$4,$5,$L20
	nop

	lw	$17,%got($LC2)($28)
	move	$16,$4
	move	$18,$5
	addiu	$17,$17,%lo($LC2)
$L19:
	lw	$25,%call16(printf)($28)
	addiu	$16,$16,4
	lw	$5,-4($16)
	move	$4,$17
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($sp)
	bne	$18,$16,$L19
	nop

$L20:
	lw	$2,%got(stdout)($28)
	li	$4,10			# 0xa
	lw	$31,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	lw	$5,0($2)
	addiu	$sp,$sp,40
	lw	$25,%call16(_IO_putc)($28)
	.reloc	1f,R_MIPS_JALR,_IO_putc
1:	jr	$25
	nop

	.set	macro
	.set	reorder
	.end	print_result
	.size	print_result, .-print_result
	.rdata
	.align	2
$LC0:
	.word	3
	.word	0
	.word	2
	.word	7
	.word	4
	.word	-99
	.word	2
	.word	6
	.word	9
	.word	32
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,80,$31		# vars= 40, regs= 4/0, args= 16, gp= 8
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	lw	$2,%got($LC0)($28)
	addiu	$sp,$sp,-80
	addiu	$2,$2,%lo($LC0)
	sw	$16,64($sp)
	addiu	$16,$sp,24
	.cprestore	16
	addiu	$4,$2,32
	sw	$31,76($sp)
	sw	$18,72($sp)
	move	$3,$16
	sw	$17,68($sp)
$L24:
	lw	$8,0($2)
	addiu	$2,$2,16
	addiu	$3,$3,16
	sw	$8,-16($3)
	lw	$7,-12($2)
	lw	$6,-8($2)
	lw	$5,-4($2)
	sw	$7,-12($3)
	sw	$6,-8($3)
	sw	$5,-4($3)
	bne	$2,$4,$L24
	nop

	lw	$6,0($2)
	addiu	$17,$sp,64
	lw	$2,4($2)
	move	$4,$16
	lw	$18,%got(print_result)($28)
	move	$5,$17
	sw	$6,0($3)
	sw	$2,4($3)
	move	$25,$18
	.reloc	1f,R_MIPS_JALR,print_result
1:	jalr	$25
	nop

	move	$5,$17
	lw	$28,16($sp)
	move	$4,$16
	lw	$25,%got(insert_sort)($28)
	.reloc	1f,R_MIPS_JALR,insert_sort
1:	jalr	$25
	nop

	move	$5,$17
	move	$4,$16
	move	$25,$18
	.reloc	1f,R_MIPS_JALR,print_result
1:	jalr	$25
	nop

	move	$2,$0
	lw	$31,76($sp)
	lw	$18,72($sp)
	lw	$17,68($sp)
	lw	$16,64($sp)
	addiu	$sp,$sp,80
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
