%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	mystr		db		"Hello World", 10, 0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, 4				;sys_write
	mov		ebx, 1				;stdin=0, stdout=1
	mov		ecx, mystr			;what is being printed
	mov		edx, 12				;length
	int		0x80				;system interrupt

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
