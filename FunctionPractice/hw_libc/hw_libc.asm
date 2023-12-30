%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	myString	db		"Hello World", 10, 0

segment .bss


segment .text
	global  asm_main
	extern 	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push 	myString
	call	printf
	add		esp, 4

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
