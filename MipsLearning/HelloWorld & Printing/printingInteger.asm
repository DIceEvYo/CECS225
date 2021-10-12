.data
	age: .word 23
	#a word is 32 bits or 4 bytes. don't confuse it as an actual word or a string.
.text
	li $v0, 1
	#1 is the code to print ints
	lw $a0, age
	#integer is just a word, we gotta load it.
		#we're not using loadAddress this time!
	syscall