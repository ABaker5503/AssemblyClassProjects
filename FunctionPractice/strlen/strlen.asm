%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	myString		db		"Hello World!", 0
	lengthString	db		"String length was: %d", 10, 0

segment .bss


segment .text
	global  asm_main
	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	myString
	call	strlen
	add		esp, 4

	push	eax
	push	lengthString
	call	printf
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret


	strlen:
	push 	ebp
	mov		ebp, esp

	sub		esp, 4						;makes space on stack for i (int i)
	mov		DWORD [ebp-4], 0			;i=0

	toploop:
	mov		ebx, DWORD [ebp+8]			;ebp=*s
	mov		ecx, DWORD [ebp-4]			;ecx=i

	cmp		BYTE[ebx+ecx], 0			;while(s[i]!='\0')
	je		endloop

	add		DWORD [ebp-4], 1			;i++

	jmp		toploop

	endloop:

	mov		eax, DWORD[ebp-4]			;return i

	mov		esp, ebp
	pop		ebp
	ret
