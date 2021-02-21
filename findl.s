	; find the larger of the two numbers 
	AREA PROGRAM, CODE, READONLY
	ENTRY
	ldr r1, =0x30 ; load two numbers 
	ldr r2, =0x10 ;
	cmp r1, r2; compare them 
	bhi done ; if high then branch
	mov r1, r2;else mov the higher number into r1
done ldr r3, =0x40000000 ;store the higher number into the required address
	str r1, [r3]
e	b e;
Value1  DCD     &23456788               ;Value to be compared18
Value2  DCD     &12345678               ;Value to be compared19
Result  DCD     0                       ;Space to store result20
	
	END