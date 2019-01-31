	.file	1 "lab2-4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	odd
	.set	nomips16
	.set	nomicromips
	.ent	odd
	.type	odd, @function
odd:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$3,8($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1
	and	$2,$3,$2
	bgez	$2,$L2
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3
	addiu	$2,$2,1
$L2:
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L3
	nop

	li	$2,1			# 0x1
	.option	pic0
	b	$L4
	nop

	.option	pic2
$L3:
	move	$2,$0
$L4:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	odd
	.size	odd, .-odd
	.align	2
	.globl	even
	.set	nomips16
	.set	nomicromips
	.ent	even
	.type	even, @function
even:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	andi	$2,$2,0x1
	bne	$2,$0,$L6
	nop

	li	$2,2			# 0x2
	.option	pic0
	b	$L7
	nop

	.option	pic2
$L6:
	move	$2,$0
$L7:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	even
	.size	even, .-even
	.align	2
	.globl	prime
	.set	nomips16
	.set	nomicromips
	.ent	prime
	.type	prime, @function
prime:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	lw	$3,16($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L9
	nop

	li	$2,3			# 0x3
	.option	pic0
	b	$L10
	nop

	.option	pic2
$L9:
	li	$2,2			# 0x2
	sw	$2,0($fp)
	li	$2,1			# 0x1
	sw	$2,4($fp)
	.option	pic0
	b	$L11
	nop

	.option	pic2
$L14:
	lw	$3,16($fp)
	lw	$2,0($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L12
	nop

	sw	$0,4($fp)
	.option	pic0
	b	$L13
	nop

	.option	pic2
$L12:
	lw	$2,0($fp)
	addiu	$2,$2,1
	sw	$2,0($fp)
$L11:
	lw	$2,16($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	addiu	$2,$2,1
	lw	$3,0($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L14
	nop

$L13:
	lw	$3,4($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L15
	nop

	li	$2,3			# 0x3
	.option	pic0
	b	$L10
	nop

	.option	pic2
$L15:
	move	$2,$0
$L10:
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	prime
	.size	prime, .-prime
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, gp= 8
	.mask	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$16,36($sp)
	move	$fp,$sp
	li	$2,25			# 0x19
	sw	$2,24($fp)
	lw	$4,24($fp)
	.option	pic0
	jal	odd
	nop

	.option	pic2
	move	$16,$2
	lw	$4,24($fp)
	.option	pic0
	jal	even
	nop

	.option	pic2
	addu	$16,$16,$2
	lw	$4,24($fp)
	.option	pic0
	jal	prime
	nop

	.option	pic2
	addu	$2,$16,$2
	sw	$2,28($fp)
	lw	$2,28($fp)
	li	$3,2			# 0x2
	beq	$2,$3,$L18
	nop

	slt	$3,$2,3
	beq	$3,$0,$L19
	nop

	li	$3,1			# 0x1
	beq	$2,$3,$L20
	nop

	.option	pic0
	b	$L17
	nop

	.option	pic2
$L19:
	li	$3,4			# 0x4
	beq	$2,$3,$L21
	nop

	.option	pic0
	b	$L17
	nop

	.option	pic2
$L20:
	lw	$2,24($fp)
	addiu	$2,$2,2
	move	$4,$2
	.option	pic0
	jal	prime
	nop

	.option	pic2
	beq	$2,$0,$L23
	nop

	lw	$2,24($fp)
	addiu	$2,$2,2
	sw	$2,24($fp)
	.option	pic0
	b	$L17
	nop

	.option	pic2
$L23:
	lw	$2,24($fp)
	addiu	$2,$2,-2
	sw	$2,24($fp)
	.option	pic0
	b	$L17
	nop

	.option	pic2
$L18:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
	.option	pic0
	b	$L17
	nop

	.option	pic2
$L21:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
	nop
$L17:
	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,36($sp)
	addiu	$sp,$sp,48
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
