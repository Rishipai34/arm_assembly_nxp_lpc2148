	;search a table for a match and if not fond then append to the end of the table 
	AREA Program , CODE , READONLY
	ENTRY
startc
	ldr	r10, =0x40000004 ; load the destination address
    ldr	r9, list ; load the address of the list 
	add r9, #4 ; incriment to get the address of the first element 
    mov r4, r0  ; get the length of the list                
wordcopy
    ldr r11, [r9], #4  ; load the data word         
    str r11, [r10], #4 ; store the data word into the destination address 
    subs r4, r4, #4   ;decrement the count of number of data elememts 
    bne wordcopy  ; if not zero then copy the next word 
	ldr r0, 0x40000004 ; load the starting address of the list 
	ldr r1, query ; load the value to be searched 
	ldr r3, [r0] ; copy the list counter 
	ldr r2, [r0], #4 ; intitialize the counter and the data pointer 
	ldr r4, [r0], #4
loop 
	cmp r1, r4 ; does the item match the list 
	beq done ; if so then branch to the end 
	subs r2, r2, #1 ; if not then get the next item 
	ldr r4, [r0], #4
	bne loop
	sub r0, r0, #4 ; adjust the pointer 
	add r3, r3, #4 ;increment the number of items 
	str r3, 0x40000004; store the items back 
	str r1, [r0] ; store the new items at the end of the list 
done 
stop b stop 
list 
	DCD &4
	DCD &5376
	DCD &7615
	DCD &138A
	DCD &21DC
query
	DCD &16FA
	end 