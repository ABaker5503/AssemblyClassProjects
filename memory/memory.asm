%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	var1	dd	123			;var1 is a dword with 123 in it
	var2	db	'A'
	var3	dd	0
	arr1	dd	1,2,3,4,5,6,7,8
	arr2	db	'H','E','L','L','O','!'

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

;	mov		eax, var1
	mov		eax, DWORD [var1]
	call	print_int
	call	print_nl

	mov		al, BYTE [var2]
	call	print_char
	call	print_nl

	mov		DWORD [var3], 1337
	mov		eax, DWORD [var3]
	call	print_int
	call	print_nl

	mov		ecx, 0						;index for loop
	mov		eax, 0
	toploop:
		add		eax, DWORD [arr1+ecx*4]
		add		ecx, 1
		cmp		ecx, 7
		jle		toploop
	call	print_int
	call	print_nl

	mov		ecx, 0
	mov		eax, 0
	toploop2:
		mov		al, BYTE[arr2+ecx]
		call	print_char
		add		ecx, 1
		cmp		ecx, 5
		jle		toploop2
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
