%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call	read_int				;A=input()
	mov		ebx, eax				;A in ebx

	call	read_int				;B=input()
	mov		ecx, eax				;B in ecx

	mov		esi, ebx				;value of A in esi

	add		esi, 17					;17+A

	mov		eax, ecx				;B in eax for mult
	mov		edi, 32
	imul	edi						;B*32

	cdq
	idiv	ebx						;(B*32)/A

	imul	esi						;(17+A)*((B*32)/A)

	add		eax, 123				;+123
	sub		eax, ecx				;-B

	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
