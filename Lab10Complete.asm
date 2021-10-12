# Name: Dev
# CECS 225
# Due Date: 05/01/21
# Lab 10 / 10 - Clock Simulator w/ seconds, minutes, hours, and AM/PM
# NOTE - Run at 30 instruction per second.  
# Logic - Your verbiage on how the program works. 
# example updated with 0 pad for numbers less than 10

# ---NOTES---
# 

.data
#Area to store information to randomAccessMemory
	AM: .asciiz " AM"
	PM: .asciiz " PM"
	space: .asciiz "\n"
	Colon: .byte ':'

.text
#Area to store instructions

	#Loads intermediates/constants to t-registers
	
		li $t0, 0		# Seconds counter 
		li $t1, 0		# Minutes Counter 
		li $t2, 0		# Hour counter 
		li $a3, 0		# Sub Second counter 
	
	#Loads address
	  
		la $t3, 0		# AM/PM Counter, AM = 0
		la $t4, AM		# Stores the AM/PM text, defaults to AM
	
	#Loop Method
	subSecondLoop:
		addi $a3, $a3, 1		# increment the sub second count	
		bne $a3, 15, subSecondLoop 	# if not 1 loop again, basically just takes up 4 instructions 
	
	#Iteration Method
	iteration: 
		li $a3, 12 			# sets sub second count back to 0
		addi $t0, $t0, 1		# increment the seconds counter
		bne $t0, 60, print 		# test seconds, if 59 or greater move on
		li $t0,0			# set seconds back to 0
		addi $t1, $t1, 1		# increment the minutes counter
		bne $t1, 60, print 		# test minutes, if 59 or greater move on
		li $t1,0			# set minutes back to 0
		addi $t2, $t2, 1		# increment the hours counter
		bne $t2, 12, NoAMPM		#checking for AM/PM change
		bne $t3, 0, ChangeToAM
		la $t4, PM			#changes to PM
		li $t3, 1
		j print
		
ChangeToAM:	
	la $t4, AM			#changes to PM
	li $t3, 0			#changes to AM
NoAMPM:
	bne $t2, 13, print		# test hours, if 12 or greater move on
	li $t2,1			# set hours back to 1
	
	
print:
	#li $v0, 4
	#la  $a0, Time			# 
	#syscall 
	#li $a3, 12
	#j subSecondLoop			
					
	li $v0, 1
	bgt $t2, 9, NoPadHours
	move $a0, $zero			# 
	syscall 
NoPadHours:
	li $v0, 1
	move $a0, $t2
	syscall 			# Prints hours
	
	li $v0, 4
	la $a0, Colon 
	syscall   			# 


	li $v0, 1
	bgt $t1, 9, NoPadMin
	move $a0, $zero			# 
	syscall 
NoPadMin:
	li $v0, 1
	move $a0, $t1
	syscall 			# 
	
	li $v0, 4
	la $a0, Colon 
	syscall   			# 

# do I need to pad a 0?	
	li $v0, 1
	bgt $t0, 9, NoPadSec
	move $a0, $zero		# 
	syscall 
NoPadSec:
	
	li $v0, 1
	move $a0, $t0
	syscall 			# 

	li $v0, 4			# 4 means print characters
	move $a0, $t4 
	syscall 			# prints AM/PM
	
	li $v0, 4 			# print_string syscall
    	la $a0, space       		# prints new line 
    	syscall
	nop
	nop
	nop
	nop
	nop
#	j subSecondLoop
	j iteration
NoPadAnything:
