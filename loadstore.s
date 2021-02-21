	; program to copy a chunk of data from one memory location to the other 
	AREA RISHI, CODE, READONLY
	ENTRY
 	mov R1, #200 ; load a random value to the register   
	ldr R2, =0x40000001; load a destination address
	mov r4, #1 ; mov a counter value into an address
loop mov R1, R1, lsl #2; r1 = r1 * 4
	str r1, [r2, #4]! ; load the value of that address 
	add r4, r4, #1 ;increment the value of the counter 
	cmp r4, #40 ; compare with the total number value
	bne loop  ; if not equal then repeat
	ldr r2, = 0x40000001 ; repeat the process one more time 
	ldr r5, = 0x40000700
	mov r4, #1
loop2 ldr r1, [r2,#4]!
	str r1, [r5, #4]!
	add r4 , r4, #1
	cmp r4, #40
	bne loop2
stop b stop
	END
