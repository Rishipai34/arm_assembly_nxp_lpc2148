	; find the factorial of two numbers using a look up table 
	AREA factorial, CODE, READONLY
	ENTRY
Main
	ldr r0, =data ; load the starting address of the data table
	ldr r1, Va ; load the address containing the location of query number 
	mov r1, r1, lsl #2; adjust the offset to point at the correct memory loacation 
	add r0, r0, r1 ; find the address of the location of the required factorial
	ldr r2, [r0]; load the answer into r2
stop b stop
data ; table values
	DCD 	1,1,2,6,24,120,720,5040	
Va	DCB	5 ; query number 
		align
	END
		
