%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss

	ArrayA		resd	100
	ArrayB		resd	100

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;read in size of array
	call	read_int
	mov		ebx, eax

	;read in numbers for first array
	mov		ecx, 0
	toploopA:
	cmp		ecx, ebx
	jge		endloopA
		call	read_int
		mov		DWORD [ArrayA+ecx*4], eax
		add		ecx, 1
	jmp		toploopA
	endloopA:

	call	print_nl

	;read in numbers for second array
	mov		ecx, 0
	toploopB:
	cmp		ecx, ebx
	jge		endloopB
		call	read_int
		mov		DWORD [ArrayB+ecx*4], eax
		add		ecx, 1
	jmp		toploopB
	endloopB:

	call	print_nl

	;add values at array index
	mov		ecx, 0
	toploopAdd:
	cmp		ecx, ebx
	jge		endloopAdd
		mov		eax, DWORD [ArrayA+ecx*4]
		add		eax, DWORD [ArrayB+ecx*4]
		call	print_int
		call	print_nl
		add		ecx, 1
	jmp		toploopAdd
	endloopAdd:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
