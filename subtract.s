	AREA RISHI, CODE, READONLY
	ENTRY
	mov R1, #0x10
	mov R2, #20
	subs R3, R2, R1
	moveq R9, R1
	movhi R10,R2
	movmi R10, R1
LABL1 B LABL1 
	END
	