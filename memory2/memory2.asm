%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	myArray		dd		1,5,4,8,6,3,2,7,10,11

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;print out numbers greater than 5 from an array (10 integers)

	mov		ecx, 0
	toploop:
	cmp		ecx, 10
	jge		endloop
		mov		eax, DWORD [myArray+ecx*4]
		cmp		eax, 5
		jle		endif
			call	print_int
			call	print_nl
		endif:
		add ecx, 1
		jmp toploop
	endloop:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
