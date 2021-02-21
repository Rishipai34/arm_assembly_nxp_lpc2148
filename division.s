	; divide two numbers 
	AREA Program, CODe, READONLY
	ENTRY
main 
	ldr r0, num1 ; load number 1
	ldr r1, num2 ; load number 2
	mov r3, #0 ; load 0 to r3
loop 
	cmp r1, #0; check if divisor is zero 
	beq Err ; if so then branch without dividing 
	cmp r0, r1 ; check if both are the same 
	blt done ; if so then division is complete 
	add r3, r3, #1 ; increment r3
	sub r0, r0, r1 ; subract number 2 from number 1 and loop back 
	b loop 
Err
	mov r3, #0xFFFFFFFF ; not possible to divide with zero 
done
	ldr r7, =0x40000000 ; store the results 
	str r0, [r7]
	ldr r7, =0x40000008
	str r3, [r7]
stop b stop 

num1 DCD &00000004
num2 DCD &00000002
	end
		