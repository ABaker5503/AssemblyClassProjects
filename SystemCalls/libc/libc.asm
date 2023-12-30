%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	myString	db		"Abby", 0

segment .bss

	buff		resb	1024

segment .text
	global  asm_main
;	extern	putchar
;	extern	getchar
;	extern 	puts
;	extern 	gets

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	push	buff
	call	gets
	add		esp, 4

	push	buff
;	push	myString
	call	puts
	add		esp, 4


;	call	getchar

;	push	'C'
;	push	eax
;	call	putchar
;	add		esp, 4
;	call	print_nl


	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret


putchar:
	push 	ebp
	mov		ebp, esp

	mov		eax, 4				;sys_write
	mov		ebx, 1				;stdout
	lea		ecx, [ebp+8]		;putting the address of 'c' into spot (loads effective address)
	mov		edx, 1				;length

	int		0x80				;interrupt cpu

	mov		esp, ebp
	pop		ebp
	ret


getchar:
	push	ebp
	mov		ebp, esp

	sub		esp, 4				;space for local variable
	mov		eax, 3				;sys_read
	mov		ebx, 0				;stdin
	lea		ecx, [ebp-4]		;store address of local variable
	mov		edx, 1				;length

	int 	0x80				;interrupt cpu

	mov		al, BYTE[ebp-4]		;return char

	mov		esp, ebp
	pop		ebp
	ret


puts:
	;prints out a string

	push	ebp
	mov		ebp, esp

	;coding in newline character
	sub		esp, 4
	mov		BYTE[ebp-4], 10

	mov		esi, DWORD[ebp+8]			;moves string into register

	;loop for string length
	mov		edi, 0
	toploop:
	cmp		BYTE[esi+edi], 0
	je		endloop
		inc		edi
	jmp		toploop
	endloop:

	;could also call strlen if included with extern (push myString, call strlen, add esp,4, mov edi, eax)

	mov		eax, 4						;sys_write
	mov		ebx, 1						;stdout
	mov		ecx, DWORD[ebp+8]			;thing being printed
	mov		edx, edi					;length of string

	int 	0x80

	;printing newline
	mov		eax, 4
	mov		ebx, 1
	lea		ecx, [ebp-4]
	mov		edx, 1

	int 	0x80

	mov		esp, ebp
	pop		ebp
	ret

gets:
	;reads in string and puts prints it out
	push	ebp
	mov		ebp, esp

	mov		esi, -1								;counter
	mov		edi, DWORD[ebp+8]					;puts buffer into edi

	toploop1:
	inc		esi

	mov		eax, 3								;sys_read
	mov		ebx, 0								;stdin
	lea		ecx, [edi+esi]						;lea of the buffer at index
	mov		edx, 1								;char length

	int		0x80

	cmp		BYTE[edi+esi], 10					;newline char in asm
	jne		toploop1
	endloop1:

	mov		BYTE[edi+esi], 0					;overwrites enter key with null byte to terminate string

	mov		esp, ebp
	pop		ebp
	ret


