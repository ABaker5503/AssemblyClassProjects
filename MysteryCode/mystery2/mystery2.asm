%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	nope_str		db		"Nope", 10. 0
	yep_str			db		"Yep", 10, 0
	stuff			db		"racecar", 0

segment .bss


segment .text
	global  asm_main
	extern 	printf
	extern	strlen

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	stuff
	call	check
	add		esp, 4

	cmp		eax, 0
	je		nope
		push	yep_str
		call	printf
		add		esp, 4
		jmp		end
	nope:
		push	nope_str
		call	printf
		add		esp, 4
	end:
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret


check:
	push	ebp
	mov		ebp, esp

	sub		esp, 12

	push	DWORD[ebp+8]
	call	strlen
	add		esp, 4
	dec		eax
	mov		DWORD[ebp-4], eax

	mov		DWORD[ebp-8], 0

	mov		DWORD[ebp-12], 1

	checkloop:
	mov		ecx, DWORD[ebp-8]
	cmp		ecx, DWORD[ebp-4]
	jge		endcheck

		mov		eax, DWORD[ebp+8]
		mov		ebx, DWORD[ebp-8]
		mov		ecx, DWORD[ebp-4]
		mov		bl, BYTE[eax + ebx]
		mov		cl, BYTE[eax, ecx]
		cmp		bl, cl
		je		okay
			mov		DWORD[ebp-12], 0

		okay:

		inc		DWORD[ebp-8]
		dec		DWORD[ebp-4]

	jmp		checkloop
	endcheck:

	mov		eax, DWORD[ebp-12]

	mov		esp, ebp
	pop		ebp
	ret