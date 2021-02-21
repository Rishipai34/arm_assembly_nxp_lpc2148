	; extract the higher order and lower order nibbles from a byte 
	AREA RISHI1, CODE, READONLY
	ENTRY
main 
	ldr r1, value ;load the target byte
	ldr r2, mask ; load the bit mask 
	mov r3, r1, lsr #0x4 ; extract the higher order nibble into r3
	mov r3, r3, lsl #0x8 ; left shif the extracted nibble to the ls position
	and r1, r1, r2  ;add the result to what was moved into r3
	add r1, r1, r3
	ldr r5, =0x40000000 ;store the result 
	str r1, [r5] 
STOP b STOP
; data values 
value	DCB	&FB
	align 
Mask	DCB	&000F
	end 