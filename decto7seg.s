	;convert decimal number to seven segment binary
	AREA Program, CODE, READONLY
	ENTRY
main 
	ldr r0, =Table ; the table contains the seven segment display equivalent of the digit
	eor r1, r1, r1 ; clear the r1 register 
	ldr r2, digit ; load the digit to check convert 
	cmp r2, #9 ; compare to see if the digit is < 9
	bhi done  ; if so then conversion will not be possible 
 	add r0, r0, r2 ; find the location of the value of the seven segment display value
	ldrb r1, [r0]; load the value of the required sevensegment equivalent 
done 
	ldr r9, =0x40000000 ;store the value obtained to the destination 
	str r1, [r9]
stop b stop
Table DCB &3F
	DCB &06 
	DCB	&5B
	DCB &4F
	DCB &66
	DCB &6D
	DCB &7D
	DCB &07
	DCB &7F
	DCB &6F
	align 
digit DCB &05
	end