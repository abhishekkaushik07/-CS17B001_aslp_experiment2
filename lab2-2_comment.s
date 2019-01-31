	.file	1 "lab2-2.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,80,$31		# vars= 48, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-80		$sp=$sp-80              Values are treated as unsigned integers, not two's complement integers
	sw	$31,76($sp)		Memory[$sp+76]=$31     Copy from register to memory
	sw	$fp,72($sp)		Memory[$sp+72]=$fp
	move	$fp,$sp			$fp=$sp			Copy from register to register
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)		$2=Memory[$2+0]    Copy from memory to register
	sw	$2,68($fp)		Memory[$fp+68]=$2
	li	$2,5			# 0x5	$2=5
	sw	$2,32($fp)		Memory[$fp+32]=$2
	li	$2,2			# 0x2    $2=2
	sw	$2,36($fp)		Memory[$fp+36]=$2
	lw	$2,32($fp)		$2=Memory[$fp+32]
	sw	$2,40($fp)		Memory[$fp+40]=$2
	li	$2,1			# 0x1 	$2=1
	sw	$2,48($fp)		Memory[$fp+48]=$2
	li	$2,2			# 0x2	$2=2
	sw	$2,52($fp)		Memory[$fp+52]=$2
	li	$2,3			# 0x3	$2=3
	sw	$2,56($fp)		Memory[$fp+56]=$2
	li	$2,4			# 0x4	$2=4
	sw	$2,60($fp)		Memory[$fp+60]=$2
	li	$2,5			# 0x5	$2=5
	sw	$2,64($fp)		Memory[$fp+64]=$2
	li	$2,5			# 0x5	$2=5
	sw	$2,44($fp)		Memory[$fp+44]=$2
	sw	$0,28($fp)		Memory[$fp+28]=$0
	b	$L2			 # unconditional branch to label
	nop

$L3:
	lw	$2,28($fp)		$2=Memory[$fp+28]
	sll	$2,$2,2			
	addiu	$3,$fp,72		 $3=$fp+72 
	addu	$2,$3,$2		$2=$3+$2 
	lw	$3,-24($2)		$3=Memory[$2-24]
	lw	$2,36($fp)		$2=Memory[$fp+36]
	addu	$3,$3,$2		$2=$3+$2 
	lw	$2,28($fp)		$2=Memory[$fp+28]
	sll	$2,$2,2			 $2=$2<<2  shift left logical by 2
	addiu	$4,$fp,72		 $4=$fp+72 
	addu	$2,$4,$2		$2=$4+$2 
	sw	$3,-24($2)		Memory[$2-24]=$3
	lw	$2,28($fp)		$2=Memory[$fp+28]
	addiu	$2,$2,1			$2=$2+1
	sw	$2,28($fp)		Memory[$fp+28]=$2
$L2:
	lw	$3,28($fp)		$3=Memory[$fp+28]
	lw	$2,44($fp)		$2=Memory[$fp+44]
	slt	$2,$3,$2		if($3<$2)$2=1; else $2=0 	set on less than
	bne	$2,$0,$L3		Test if registers are not equal
	nop

	move	$2,$0			$2=$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,68($fp)		$4=Memory[$fp+68]
	lw	$3,0($3)		$3=Memory[$3+0]
	beq	$4,$3,$L5		if($1==$2) go to $L5  Test if registers are equal
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2			$25=$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25			Jump and Link and R-Type
	nop

$L5:
	move	$sp,$fp			$sp=$fp
	lw	$31,76($sp)		$31=Memory[$sp+76]
	lw	$fp,72($sp)		$fp=Memory[$sp+72]
	addiu	$sp,$sp,80		$sp=$sp+80
	j	$31			jump
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
