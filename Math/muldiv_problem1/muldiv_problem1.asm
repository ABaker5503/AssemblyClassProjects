%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;read in values for A-D
	call 	read_int
	mov		ebx, eax		;A in ebx
	call 	read_int
	mov		ecx, eax		;B in ecx
	call	read_int
	mov		esi, eax		;C in esi
	call	read_int
	mov		edi, eax		;D in edi

	;A*B
	mov 	eax, ebx		;A in eax
	imul	ecx				;eax=A*B
	mov		ebx, eax		;ebx=A*B

	;C*D
	mov		eax, esi		;C in eax
	imul	edi				;eax=C*D
	mov		esi, eax		;esi=C*D

	;(A*B)/(C*D)
	mov		eax, ebx		;A*B=eax
	cdq
	idiv	esi				;eax/esi

	call print_int
	call print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
