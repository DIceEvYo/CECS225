.data #Data
	myCharacter: .byte 'm' 
	#Be careful with syntax, mips is VERY specific. Kept getting assembly errors
		#because first, I forgot the : after myCharacter, and second I accidently
		#places "" instead of ''. Unlike high programming languages
		#mips is VERY specfic. Be sure to use the right punctuations!
	#1 character is a byte, or 8 bits
.text #Instructions
	li $v0, 4
	#You can treat characters and strings when running this line
	la $a0, myCharacter
	syscall