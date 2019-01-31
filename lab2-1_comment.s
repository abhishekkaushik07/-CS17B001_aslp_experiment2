	.file	1 "lab2-1.c"
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
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24          $sp=$sp-24              Values are treated as unsigned integers, not two's complement integers
	sw	$fp,20($sp)	     Memory[$sp+20]=$fp     Copy from register to memory
 	move	$fp,$sp		     $fp=$sp                Pseudo-instruction (provided by assembler, not processor!) Copy from register to register
	li	$2,10			# 0xa  $2=100	    Loads immediate value into register
	sw	$2,4($fp)       	Memory[$fp+4]=$2
	li	$2,5			# 0x5	$2=5
	sw	$2,8($fp)		Memory[$fp+8]=$2
	lw	$3,4($fp)		$3=Memory[$fp+4]    Copy from memory to register
	lw	$2,8($fp)		$2=Memory[$fp+8] 
	addu	$2,$3,$2		$2=$3+$2            Values are treated as unsigned integers,not two's complement integers
	sw	$2,12($fp)		Memory[$fp+12]=$2
	lw	$3,4($fp)		$3=Memory[$fp+4] 
	lw	$2,8($fp)		$2=Memory[$fp+8]
	subu	$2,$3,$2		$2=$3-$2		Values are treated as unsigned integers,not two's complement integers
	sw	$2,12($fp)		Memory[$fp+12]=$2
	lw	$3,4($fp)		$3=Memory[$fp+4] 
	lw	$2,8($fp)		$2=Memory[$fp+8] 
	teq	$2,$0,7			trap if equal
	div	$0,$3,$2		$0=$3/$2 		Result is only 32 bits
	mfhi	$2			$2=hi    		Copy from special register hi to general register
	mflo	$2			$2=lo			Copy from special register lo to general register
	sw	$2,12($fp)		Memory[$fp+12]=$2
	lw	$3,4($fp)		$3=Memory[$fp+4]
	lw	$2,8($fp)		$2=Memory[$fp+8]
	mul	$2,$3,$2		$2=$3*$2 		Result is only 32 bits
	sw	$2,12($fp)		Memory[$fp+12]=$2
	lw	$3,4($fp)		$3=Memory[$fp+4]
	lw	$2,8($fp)		$2=Memory[$fp+8]
	or	$2,$3,$2		$2=$3|$2      		Bitwise OR
	sw	$2,12($fp)		Memory[$fp+12]=$2
	lw	$3,4($fp)		$3=Memory[$fp+4]
	lw	$2,8($fp)		$2=Memory[$fp+8]
	and	$2,$3,$2		$2=$3&$2      		Bitwise AND with immediate values
	sw	$2,12($fp)		Memory[$fp+12]=$2
	lw	$2,4($fp)		$2=Memory[$fp+4]
	nor	$2,$0,$2		$2=~$2         		NOR operation
	sw	$2,12($fp)		Memory[$fp+12]=$2
	lw	$3,4($fp)		$3=Memory[$fp+4]
	lw	$2,8($fp)		$2=Memory[$fp+8]
	xor	$2,$3,$2		$2=$3^$2      		Bitwise XOR 
	sw	$2,12($fp)		Memory[$fp+12]=$2
	move	$2,$0			$2=$0	
	move	$sp,$fp			$sp=$fp
	lw	$fp,20($sp)		$fp=Memory[$sp+20]
	addiu	$sp,$sp,24		$sp=$sp+24
	j	$31			unconditional jump to instruction at target
	nop				

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
