.data
	myDouble: .double 7.202
	zeroDouble: .double 0.0
	#for ints we have $0, but for doubles we don't. so we need to make one ^^
	
.text
	#For doubles ALWAYS use even register numbers.
	ldc1 $f2, myDouble #myDouble is stored in $f2 & $f3
	#want to move our double from randomAccess memory to coprocessor1
		#ldc1 loads myDouble to a pair a registers since a double is 64 bits.
			#we need 2 registers to hold a double
	ldc1 $f0, zeroDouble #zeroDouble is stored in $f0 & $f1
	
	li $v0, 3
	#number 3 is the code to initiate printing doubles
	add.d $f12, $f2, $f0
	#add.d adds f2 and f0. f12 is the result. add.d passes the value as an argument.
	syscall