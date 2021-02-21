	;program to sort an array of numbers 
	AREA	program, CODE, READONLY
ENTRY	
main 
	ldr	r6, list ;laod the data
	ldr	r10, =0x40000004 ; load the destination address
	mov	r0, #0 ; clear the r0 register 
	ldr	r0, [r6] ; load the length of the data 
startc
    ldr	r9, list ; load the address of the list 
	add r9, #4 ; incriment to get the address of the first element 
    mov r4, r0  ; get the length of the list                
wordcopy
    ldr r11, [r9], #4  ; load the data word         
    str r11, [r10], #4 ; store the data word into the destination address 
    subs r4, r4, #4   ;decrement the count of number of data elememts 
    bne wordcopy  ; if not zero then copy the next word 
	ldr	r10, =0x40000000 ; set the value of the new location of the data table 
	ldr r8, =0x40000000
sort 
	add r7, r10, r0 ; last elements address
	mov r1, #0  ; zero flag for changes 
	add r8, r8, #4 ; move one elmemt up the list
next 
	ldr r2, [r7], #-4 ; load the first byte 
	ldr r3, [r7] ; and the next byte 
	cmp r2, r3 ; compare 
	bcc noswitch ; if they are in the right order branch
	str r2, [r7], #4; store the values to the result destination
	str r3, [r7] ; 
	add r1, r1, #1 ; flag that changes have been made 
	sub r7, r7, #4 ; decrement the address to check 
noswitch 
	cmp r7, r8 ; are all words checked
	bhi next  ; if not then branch back
	cmp r1, #0 ; are all changes made 
	bne sort  ; if not then make them 
done 
stop b stop 
start DCD	24
	DCD	&2A, &5B, &60, &3F, &D1, &19
list DCB start
	end