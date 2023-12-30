%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;Multiplication

	;A=read int
	;B=read int
	;C=A*B
	;print C

	call 	read_int
	mov 	ebx, eax			;moves A to ebx
	call 	read_int
	;mov	ecx, eax			;moves B to ecx
	;mov	eax, ebx			;moves A to eax
	;imul	ecx
	imul	ebx
	call 	print_int
	call 	print_nl

	;-------------------------------------------
	;Division

	;A=read int
	;B=read int
	;C=A/B
	;D=A%B
	;print C
	;print D

	call 	read_int
	mov 	ebx, eax

	call 	read_int
	mov		ecx, eax

	mov		eax, ebx
	cdq
	idiv	ecx

	call	print_int
	call	print_nl

	mov		eax, edx
	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
