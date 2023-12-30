%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	string1		db		"Enter guess: ", 10,0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, string1
	call	print_string

	mov		ebx,0
	mov		bl, cl				;store random value into ebx  0x000000FF

	call	read_int
	cmp		eax, ebx
	je

	;mov		eax, 0
	;mov		ebx, 0
	;dump_regs 1				;clearing out registers

	;mov 	al, '+'
	;mov		bl, al
	;dump_regs 2
	;call	read_char			;print char stores in al
	;cmp		eax, ebx
	;je	printit
	;jmp end

	;printit:
	;mov		al, bl
	;call	print_char
	;call	print_nl

	;end:

	;call	read_char
	;call	print_char
	;call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
