%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	call	read_int
;	not 	eax
;	add		eax, 1
	neg		eax
	call	print_int
	call	print_nl

;	dump_regs 1

	;---------------------------------------

	call	read_int
	mov		esi, eax			;a value

	call	read_int
	mov		edi, eax			;b value

	xor		esi, edi
	xor		edi, esi
	xor		esi, edi

	dump_regs 1

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
