%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss

	retaddr		resd	1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;program that takes two values and adds them together in a function and then return and print value

	mov		eax, 5
	mov		ebx, 10
;	push	return1								;pushes address of label onto stack
;;	mov		DWORD[retaddr], return1				;storing the address of the label into memory
;	jmp		add									;call add function

;	return1:									;address of return1 stored into retaddr and put into ecx in function

	call	add									;does push, jump, and label instructions
	call	print_int
	call	print_nl

	mov		eax, 13
	mov		ebx, 7
;	push	return2
;;	mov		DWORD[retaddr], return2
;	jmp		add

;	return2:
	call	add
	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

add:
;	push	return3
;;	mov		DWORD[retaddr], return3
;	jmp		mul
;	return3:

	call	mul
	add 	eax, ebx
;	pop		ecx									;pops the top value off the stack and stores into ecx
;;	mov		ecx, DWORD[retaddr]					;takes the return address out of memory and stores it into ecx
;	jmp		ecx
	ret											;does pop and jmp instruction, stores address off stack into eip

mul:
	imul	eax, ebx
;	pop		ecx
;;	mov		ecx, DWORD[retaddr]
;	jmp 	ecx
	ret
