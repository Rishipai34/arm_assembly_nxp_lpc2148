; find the length of a string 
CR	equ 0x0D
	AREA Program, CODE, READONLY
	ENTRY
main 
	adr r0, Table ; load the starting address of the string 
	eor r1, r1, r1 ;clear reg1
	ldr r10, =0x40000000 ; load the location to store the result 
loop 
	ldrb r2, [r0], #1 ; load the byte of the string
	cmp r2, #CR ; compare to null character 
	beq done ; branch if null character
	add r1, r1, #1 ; if not null character then increment count
	b loop ; branch to start of loop 
done
	str r1, [r10] ;store the result
stop b stop
Table
	DCB "Hello, World", CR
	align
	end