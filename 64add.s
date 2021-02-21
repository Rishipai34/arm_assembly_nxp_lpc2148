	AREA ADD64, CODE, READONLY
	ENTRY 
	adr r0, Va1 ; address of first value
	ldmia r0, {r1,r2} ; load the first value into registers r1 and r2
	adr r0, Va2 ; address of second value
	ldmia r0, {r3, r4}; load the second value into registers r3 and r4
	adds r6, r2, r4; ; add lesser significant bits
	adc r5, r1, r3 ; add higher signifcant bits and carry
	adr r0, =0x40000000 ; address of storage location 
	stmia r0, {r5, r6} ; store the result 
stop b stop
	
Va1 DCD &12A2E640, &F2100123
Va2 DCD &001019BF, &40023F51
	END