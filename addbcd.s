	;program to add bcd numbers
	AREA	Program, CODE, READONLY
	ENTRY
mask EQU 0x0000000F
	
main 
	ldr r0, =result ; load the destination of the result 
	ldr r1, BCDnum1 ; load the first bcd number 
	ldr r2, BCDnum2 ; second bcd number  
	mov r8, #&04 ; load the number of points in the data 
	ldr r0, =0x40000000 ; load the destination address 
	add r0, r0, #3 ; load the offset  
	mov r5, #0 ; load the carry
	
loop 
	mov r3, r1 ; copy what is left in the data register 
	mov r4, r2 ; and the other number 
	and r3, r3, #mask ; extract the lower order nibble 
	and r4, r4, #mask ;extract the lower order nibble 
	mov r1, r1, lsr #4 ; shift right one nibble 
	mov r2, r2, lsr #4 ; shift right one nibble 
	add r6, r3, r4 ; add the digits 
	add r6, r6, r5 ; and the carry 
	cmp r6, #0xA ; check if it is over 10
	blt Rcarry1 ; if not reset the carry to 0
	mov r5, #1 ; otherwise set the carry 
	sub r6, r6, #0xA ; and subtract 10 
	b Next
Rcarry1
	mov r5, #0 ; carry reset to zero 
	
; repeat the above process for the second time 
Next
	mov r3, r1
	mov r4, r2
	and r3, r3, #mask
	and r4, r4, #mask
	mov r1, r1, lsr #4
	mov r2, r2, lsr #4
	add r7, r3, r4
	add r7, r7, r5
	cmp r7, #0xA
	blt Rcarry2
	mov r5, #1
	sub r7, r7, #0xA
	b loopend 
Rcarry2
	mov r5, #0
loopend
	mov r7, r7, lsl #4 ; shift the second digit processed to the left 
	orr r6,r6,r7 ; and or the first digit to the lower nibble 
	strb r6, [r0], #-1 ; store the byte and decrement the address 
	subs r8, r8, #1 ; decrement the loop counter 
	bne loop ; loop while > 0
stop b stop

; data 
length DCB &04
	align 
BCDnum1 DCB &12, &66, &34, &59
BCDnum2 DCB &12, &66, &34, &59
result DCD 0
	end