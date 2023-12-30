
segment .data

		scanstring	db	"%d, 

segment .bss

		arr		resd	13

segment .text
	global  main

main:
	push	rbp
	mov		rbp, rsp
	; ********** CODE STARTS HERE **********

	mov		rbx, 0

	toploop:
	cmp		rbx, 13
	jge		endloop

	mov		rsi, scanstring
	call	scanf

	inc		rbx
	jmp 	toploop

	endloop:

	; *********** CODE ENDS HERE ***********
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp
	ret
