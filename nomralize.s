; normalize a binary number 
	AREA Progrma, CODE, READONLY
	ENTRY
main
	ldr r0, =Table ;load the address of the table
	eor r1, r1, r1; clear r1 to store shifts
	ldr r3, [r0] ;get data
	cmp r3, r1 ; compare if bit is one
	beq done ; branch if bit table is empty 
loop 
	add r1, r1, #1 ;increment pointer 
	movs r3, r3, lsl #0x1 ;decrement count with zero 
	bpl loop ; if not negative then loop
done 
	ldr r10, =0x40000000 ;load the address to store the restult 
	str r1, [r10] ; store result
	str r3, [r10],#4 ; store result 
stop b stop
Table 
	DCD &30001000
	DCD &00000001
	DCD &00000000
	DCD &C1234567
	end