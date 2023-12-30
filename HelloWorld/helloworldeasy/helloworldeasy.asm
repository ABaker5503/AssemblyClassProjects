%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	popcorn	db	"Hello World!!", 10, 0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov eax, popcorn
	call print_string

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
