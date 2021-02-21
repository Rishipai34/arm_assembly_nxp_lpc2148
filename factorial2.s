	;find the factorial of a number 
	AREA Program, CODE, READONLY
	ENTRY
main 
	ldr r0, num
	ldr r12, =0x40000004
	bl factor
stop b stop	
	
	
factor
	str r0, [r12], #4 ; push to the stack 
	str r14, [r12], #4 ; push the return value to the stack 
	subs r0, r0, #1 ; subtract 1 from the number 
	bne f_cont ; if not one then jump to return
	mov r0, #1 ; factorial = one
	sub r12, r12, #4 ; adjust the stack pointer 
	b return
f_cont
	bl factor ; loop back to factor ( recucsively)

return
	ldr r14, [r12], #-4 ;load the return address 
	ldr r1, [r12], #-4 ; load the value to r1
	mul r0, r1, r0 ;multiply the result
	mov pc, lr ; return
	
num	DCD 2
fnum	DCD 0
	end