	.file	1 "ex4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	lw	$2,%got(source)($28)#$2 为数组source
	lw	$3,0($2) #$3 is tmp
	beq	$3,$0,$L6 #if(tmp == 0) 退出程序
	nop

	lw	$4,%got(dest)($28)
$L3:#for Loop  # 但是这个循环中没有 k 的概念
	addiu	$2,$2,4  //source 向右偏移4个
	sw	$3,0($4)//dest[i](tmp) = source[i]
	addiu	$4,$4,4//dest 右移一个 int
	lw	$3,0($2) #tmp = source[i]
	bne	$3,$0,$L3 #source[i]tmp != 0 则继续循环
	nop

$L6: #return 0;
	move	$2,$0
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main

	.comm	dest,40,4
	.globl	source
	.data
	.align	2
	.type	source, @object
	.size	source, 28
source:
	.word	3
	.word	1
	.word	4
	.word	1
	.word	5
	.word	9
	.word	0
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
