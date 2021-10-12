.data
	PI: .float 3.14
.text
	li $v0, 2
	#to print ints its 1, to print strings its 4, to print floats its 2.
	lwc1 $f12, PI
	#lwc1 - load word code processor 1
	#$f12 - located in word code prcessor 1. Must be $f12 in order for code to work.
	syscall