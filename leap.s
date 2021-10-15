#
#	Name:		Castrillo, Carlos
#	Project:	2
#	Due:		10/20/2021
#	Course:		cs-2640-02-f21
#
#	Description:
#				Give a range of years to get all the leap years in that range
#

	.data
name:
	.asciiz	"Leap Years by C. Castrillo\n\n"
firstyear:
	.asciiz	"From Year? "
secondyear:
	.asciiz "To Year? "
fromyr:
	.word	0
toyr:
	.word	0
resultone:
	.asciiz	"Leap years from "
resulttwo:
	.asciiz " to "

	.text
main:
	la		$a0, name
	li		$v0, 4
	syscall
	la		$a0, firstyear
	syscall
	li		$v0, 5
	syscall
	sw		$v0, fromyr
	la		$a0, secondyear
	li		$v0, 4
	syscall
	li		$v0, 5
	syscall
	sw		$v0, toyr
	li		$a0, '\n'
	li		$v0, 11
	syscall
	lw		$t0, fromyr		#load start of range into a register
	lw		$t1, toyr		#load end of range into a regsiter
	la		$a0, resultone
	li		$v0, 4
	syscall
	move	$a0, $t0
	li		$v0, 1
	syscall
	la		$a0, resulttwo
	li		$v0, 4
	syscall
	move	$a0, $t1
	li		$v0, 1
	syscall
	li		$a0, ':'
	li		$v0, 11
	syscall
	li		$t3, 1
	sub		$t2, $t0, $t3	#Subtract one because everytime we start loop we add 1
whileyearloop:
	add		$t2, $t2, 1
	bgt		$t2, $t1, endwhile
	li		$t3, 400
	div		$t2, $t3
	mfhi	$t4
	beqz	$t4, printyear
	li		$t3, 100
	div		$t2, $t3
	mfhi	$t4
	beqz	$t4, whileyearloop
	li		$t3, 4
	div		$t2, $t3
	mfhi	$t4
	beqz	$t4, printyear
	b		whileyearloop
printyear:
	li		$a0, '\n'
	li		$v0, 11
	syscall
	move	$a0, $t2
	li		$v0, 1
	syscall
	b		whileyearloop
endwhile:	
	li		$v0, 10
	syscall