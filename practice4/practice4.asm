%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		ebx, 100			;cat=100+200+300
	add		ebx, 200
	add		ebx, 300

	mov		ecx, ebx			;dog=cat-50
	sub		ecx, 50

	mov		edx, ebx			;fish=40+cat
	add		edx, 40

	mov		eax, edx

	call print_int				;print fish
	call print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
