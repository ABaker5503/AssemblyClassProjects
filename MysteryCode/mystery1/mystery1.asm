%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	fmt		db		"%d", 10, 0

segment .bss


segment .text
	global  asm_main
	extern 	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	31
	push	25
	call	myFunc
	add		esp,8

	push	eax
	push	fmt
	call	printf
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

myFunc:
	push 	ebp
	mov		ebp, esp

	sub		esp, 4

	cmp		DWORD[ebp+8], 10
	jge		option2
		mov		eax, DWORD[ebp+8]
		add		eax, DWORD[ebp+12]
		mov		DWORD[ebp-4], eax
		jmp		endif
	option2:
		mov		eax, DWORD[ebp+8]
		sub		eax, DWORD[ebp+12]
		mov		DWORD[ebp-4], eax
	endif:

	mov		eax, DWORD[ebp-4]

	mov		esp, ebp
	pop		ebp
	ret








