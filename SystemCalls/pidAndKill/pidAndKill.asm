%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, 0x14			;call getpid
	int		0x80				;interrupt system
	mov		ebx, eax			;put pid into ebx
	mov		eax, 0x25			;call syskill
	mov		ecx, 6				;set signal flag
	int		0x80				;interrupt system

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
