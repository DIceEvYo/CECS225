#Every mips program has two sections. The data section and the text section.

.data #Holds all the data in your program. 
	myMessage: .asciiz "Hello World \n"
	#myMessage is what we're declaring
	#before we refer myMessage to a randomAccessMemory we must specify the data type
	#.asciiz accepts text

.text #Holds all the instructions that your program needs.
	li $v0, 4 #System, please print out my text!
	#li - load immediate
	#$v0 - a v register - are for returning arguments. allows you to return information.
	#A signal that tells the system to get ready, we're about to do something
	la $a0, myMessage #Here's the myMessage I want you to print!
	#la - load address
	#$a0 - an a register- are for arguments. Whenever you need to pass arguments 
		#into a function, you’ll use these registers.
	#myMessage - holds value "Hello World \n" in the .data section of the code.
	syscall #Calls the system to run the function NOW.