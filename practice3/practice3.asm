%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, 62			;thing1=62-4
	sub		eax, 4

	mov		ebx, eax		;thing2=thing1+thing1
	add		ebx, eax

	mov		ecx, ebx		;thing3=thing2-5
	sub		ecx, 5

	mov		eax, ecx		;print thing3
	call print_int
	call print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
