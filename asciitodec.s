	; program to convert ascii to decimal 
	AREA Program, CODe, READONLY
	ENTRY
main 
	mov r1, #-1 ; set the -1 error flag 
	ldrb r0, char ; get the character 
	subs r0, r0, #"0" ; convert and check if the character is <0
	bcc done ; if so then then execution is complete 
	cmp r0, #9 ; check if character is > 9
 	bhi done ; do not branch if yes 
	mov r1, r0
done
	ldr r9, =0x40000000 ; store the address 
	str r1, [r9]
stop b stop
char DCB &37
	align
	end