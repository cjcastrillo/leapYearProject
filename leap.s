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
	la		$a0, resultone
	li		$v0, 4
	syscall
	lw		$a0, fromyr
	li		$v0, 1
	syscall
	la		$a0, resulttwo
	li		$v0, 4
	syscall
	lw		$a0, toyr
	li		$v0, 1
	syscall
	li		$a0, ':'
	li		$v0, 11
	syscall
	lw		$t0, fromyr
	lw		$t1, toyr		#Store values into registers for easier calculations
	li		$t2, 1
	sub		$t0, $t0, $t2	#Subtract one because everytime we start loop we add 1
whileyearloop:
	add		$t0, $t0, 1
	bgt		$t0, $t1, endwhile
	li		$t2, 400
	div		$t0, $t2
	mfhi	$t3
	beqz	$t3, printyear
	li		$t2, 100
	div		$t0, $t2
	mfhi	$t3
	beqz	$t3, whileyearloop
	li		$t2, 4
	div		$t0, $t2
	mfhi	$t3
	beqz	$t3, printyear
	b		whileyearloop
printyear:
	li		$a0, '\n'
	li		$v0, 11
	syscall
	move	$a0, $t0
	li		$v0, 1
	syscall
	b		whileyearloop
endwhile:	
	li		$v0, 10
	syscall
	