.data 
	number1: .word 20
	number2: .word 8
	
.text
	lw $s0, number1
	lw $s1, number2
	#the s register cannot be modified by the function
	
	sub $t0, $s0, $s1
	#$t0 = $s0 - $s1 = 20 - 8
	
	li $v0, 1
	#telling system we want to print an Int
	move $a0, $t0
	#moving the result $t0 = 12 to argument register a0.
	syscall