; compare two counted strings for equality 
	AREA Program, CODE, READONLY
	ENTRY
main 
	ldr r0, =data1 ; load loaction of data 
	ldr r1, =data2
	ldr r2, match ; assume strings not equal . therefore this value is set to -1
	ldr r3, [r0], #4;shote the first string length in r3 
	ldr r4, [r1], #4 ;store the second string length in r4
	cmp r3, r4 ; 
	bne done ; branch if they are of the same length
	cmp r3, #0
	beq same ; if the lengths are same and same , they are the same 
loop 
	ldrb r5, [r0], #1 ; load the letters of the strings  
	ldrb r6, [r1], #1
	cmp r5, r6
	bne done ; branch if not equal
	subs r3, r3, #1 ; decrement the length count
	beq same ; if the end of the string is reached , then then they are the same 
	b loop 
same 
	mov r2, #0 ; clear the -1 from the match flag 
done 
	str r2, match
stop b stop 
data1
	DCD 3
	DCB "CAR"
	align
data2
	DCD 3
	DCB "CAR"
	align
match DCD &FFFF
	end