

segment .data

	hwStr	db	"Hello World", 10, 0

segment .bss


segment .text
	global  main
	extern 	printf

main:
	push	rbp
	mov		rbp, rsp
	; ********** CODE STARTS HERE **********

	mov		rdi, hwStr
	call	printf

	; *********** CODE ENDS HERE ***********
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret
