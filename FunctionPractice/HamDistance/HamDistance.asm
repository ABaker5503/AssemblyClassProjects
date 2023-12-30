%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	str1		db		"text", 0
	str2		db		"best", 0
	strf		db		"Hamming distance = %d", 10, 0

segment .bss


segment .text
	global  asm_main
	extern 	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;hamdist(str1, str2)
	push	str2
	push	str1
	call	hamdist
	add		esp, 8

	;printf("Hamming distance = %d")
	push 	eax
	push 	strf
	call	printf
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret


	hamdist:
	push 	ebp
	mov		ebp, esp

	sub		esp, 8						;int c, int unmatched (local variables)

	mov		DWORD[ebp-4], 0				;c=0
	mov		DWORD[ebp-8], 0				;unmatched=0

	toploop:
	mov		eax, DWORD[ebp+8]			;eax=str1
	mov		ebx, DWORD[ebp-4]			;ebx=c
	mov		cl, BYTE[eax+ebx]			;looking at individual characters in str1 (a[c])
	cmp		cl, 0						;if (a[c]!=\0)
	je		endloop

		;innards of the for loop
		mov		esi, DWORD[ebp+12]		;esi=str2
										;could move to ch instead of dl
		mov		dl, BYTE[esi+ebx]		;looking at individual characters in str2 (b[c])
		cmp		dl, cl
		je		endif					;if a[c]==b[c] jump, otherwise add to unmatched
		inc		DWORD[ebp-8]			;unmatched++

	endif:
	inc		DWORD[ebp-4]				;c++
	jmp		toploop
	endloop:

	mov		eax, DWORD[ebp-8]			;return unmatched

	mov		esp, ebp
	pop		ebp
	ret
