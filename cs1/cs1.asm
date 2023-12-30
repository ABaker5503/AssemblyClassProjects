%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, 0			;a=0;
	topofloop:				;topofloop:
	cmp		eax, 25				;if (a>=25) goto endofloop;
		jge		endofloop
		call	print_int			;print_int(a)
		call	print_nl			;print_nl()
		add		eax, 1				;a++
		jmp		topofloop			;goto topofloop;
	endofloop:						;endofloop:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
