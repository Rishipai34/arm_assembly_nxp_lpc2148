	;scan a series of 16 bit numbers to find which ones are negative 
	AREA Program, CODE, READONLY
	ENTRY
	
Main
	ldr r0, =data ; load the data values starting address
	eor r1, r1, r1 ; clear r1 reg
	ldr r2, length ; load the value of address pointing to length 
	cmp r2, #0 ; compare to zero
	beq done ; if zero then branch
loop
	ldr r3, [r0] ; load the content of data table location 1
	cmp r3, #0 ; compare to zero 
	bpl loop1 ; branch if positive 
	add r1, r1, #1 ; increment count of negative nums
loop1
	add r0, r0, #+4 ; increment address by four to find next memory location 
	subs r2, r2, #0x1 ; decrement count of numers to check
	bne loop ; loop back to check
done
	ldr r10, =0x40000000
	str r1, [r10] ; store the result
stop b stop

data
Table DCD &F1522040
	DCD	&7F611C22
	DCD &70000242
Tableend DCD 0

length DCW (Tableend - Table)/4
	align
	end