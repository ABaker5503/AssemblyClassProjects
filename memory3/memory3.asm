%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss

	myArray		resd	10

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;read in 10 integers and print those 10 integers

	mov		ecx, 0
	toploop:
	cmp		ecx, 10
	jge		endloop
		call	read_int
		mov		DWORD [myArray+ecx*4], eax
	add		ecx, 1
	jmp		toploop
	endloop:


	mov		ecx, 0
	toploop2:
	cmp		ecx, 10
	jge		endloop2
		mov		eax, DWORD [myArray+ecx*4]
		call	print_int
		call	print_nl
	add		ecx, 1
	jmp		toploop2
	endloop2:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
