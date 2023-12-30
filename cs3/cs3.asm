%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call	read_int			;a=read_int()
	cmp		eax, 13				;if (a==13)
	jne		elseif
		mov		eax, 37				;print_int(37)
		call	print_int
		call	print_nl			;print_nl();
		jmp		endif
	elseif:						;else if (a==100)
		cmp		eax, 100
		jne		else
		mov		eax, 200
		call	print_int			;print_int(200)
		call	print_nl
		jmp		endif
	else:
		mov		eax, -1				;else print -1
		call	print_int
		call	print_nl
	endif:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
