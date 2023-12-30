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
	mov		ebx, eax

	call	read_char
	call	read_char
	mov		esi, eax

	call	read_int
	mov		ecx, eax

	mov		eax, '='
	call	print_char
	call	print_nl

	cmp		esi, '+'			;switch statement for operations
	je		plus

	cmp		esi, '-'
	je		minus

	cmp		esi, '*'
	je		multiplication

	cmp		esi, '/'
	je		division

	cmp		esi, '%'
	je		modular

	cmp		esi, '^'
	je		exponent

	plus:
	add		ecx, ebx
	mov		eax, ecx
	jmp		endofswitch

	minus:
	sub		ebx, ecx
	mov		eax, ebx
	jmp		endofswitch

	multiplication:
	mov		eax, ebx
	imul	ecx
	jmp		endofswitch

	division:
	mov		eax, ebx
	cdq
	idiv	ecx
	jmp		endofswitch

	modular:
	mov		eax, ebx
	cdq
	idiv	ecx
	mov		eax, edx
	jmp		endofswitch

	exponent:
	mov		eax, ebx
	mov		edi, 1
	topofloop:					;while (x<ecx) do multiplication
	imul	ebx
	inc		edi
	cmp		edi, ecx
	jl		topofloop
	jmp		endofswitch

	endofswitch:
	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
