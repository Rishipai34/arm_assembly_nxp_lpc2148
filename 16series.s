	; add a series of 16 bit numbers by using a table address 
	AREA program, CODE, READONLY
	ENTRY
main
	ldr r0, =Data1 ; load the address of the table
	eor r1,r1,r1 ; clear the r1 register 
	ldr r2, Len ; length of the table 
loop 
	ldr r3, [r0] ;load the content of table content 1
	add r1, r1, r3 ; load add this to the previous number 
	add r0, r0, #+4 ; increment the address appropriately to find the subsequent values
	subs r2, r2, #0x1 ; subtract the value of length (count)
	bne loop 
stop b stop
Data1 ; table 
Table DCW &2040
	align
	DCW &1C22
	align 
	DCW &0242
	align
TableEnd DCD 0
Len DCW (TableEnd-Table)/4
	align 
Result DCW 0
	end