	// Each Instruction are explained only once.

	.file	1 "lab2-5.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.word	2
	.word	3
	.word	5
	.word	7
	.word	9
	.word	11
	.word	13
	.word	15
	.word	17
	.align	2
$LC1:
	.word	1
	.word	2
	.word	3
	.word	3
	.word	4
	.word	5
	.word	5
	.word	6
	.word	7
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,120,$31		# vars= 88, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-120	$sp=$sp-176 		 Values are treated as unsigned integers 
	sw	$31,116($sp)		Memory[$sp+116]=$31		 Copy from register to memory
	sw	$fp,112($sp)
	move	$fp,$sp 					$fp=$sp copy from register to register
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)						$2=Memory[$2+0]    Copy from memory to register
	sw	$2,108($fp)
	lui	$2,%hi($LC0)
	addiu	$3,$fp,36
	addiu	$2,$2,%lo($LC0)				$4=36 Load immediate
	li	$4,36			# 0x24
	move	$6,$4					$6=$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25						unconitionally jump to instruction  and return type is R
	nop

	lw	$28,16($fp)
	lui	$2,%hi($LC1)
	addiu	$3,$fp,72
	addiu	$2,$2,%lo($LC1)
	li	$4,36			# 0x24
	move	$6,$4
	move	$5,$2
	move	$4,$3
	lw	$2,%call16(memcpy)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$0,28($fp)
	b	$L2								unconditional branch to label
	nop

$L5:
	sw	$0,32($fp)
	b	$L3
	nop

$L4:
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,1						$2=$2<<1  Shift left by constant number of bits
	addu	$2,$2,$3				$2=$2+$3  Values are treated as unsigned integers
	lw	$3,32($fp)
	addu	$2,$2,$3
	sll	$2,$2,2						$2=$2<<2  Shift left by constant number of bits
	addiu	$3,$fp,112
	addu	$2,$3,$2
	lw	$4,-76($2)
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	lw	$3,32($fp)
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$fp,112
	addu	$2,$3,$2
	lw	$2,-40($2)
	addu	$4,$4,$2
	lw	$3,28($fp)
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	lw	$3,32($fp)
	addu	$2,$2,$3
	sll	$2,$2,2
	addiu	$3,$fp,112
	addu	$2,$3,$2
	sw	$4,-76($2)
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L3:
	lw	$2,32($fp)
	slt	$2,$2,3				set on less than
	bne	$2,$0,$L4			if($2!=$0) go to $L4	Test if registers are not equal
	nop

	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$2,28($fp)
	slt	$2,$2,3
	bne	$2,$0,$L5 						if($2!=$0) go to $L6	Test if registers are not equal
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,108($fp)
	lw	$3,0($3)
	beq	$4,$3,$L7
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25						unconitionally jump to instruction  and return type is R			
	nop

$L7:
	move	$sp,$fp
	lw	$31,116($sp)
	lw	$fp,112($sp)
	addiu	$sp,$sp,120
	j	$31              jump  on target
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
