%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov 	eax, 10			;Y=10
	mov		ebx, 20			;Z=20
	add		eax, ebx		;Q=Y+Z
	call print_int			;print(Q)   print eax register
	call print_nl			;print new line

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
