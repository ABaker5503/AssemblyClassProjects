%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	password	db		"W3lc0m3H0m3!", 0
	format		db		"Complexity: %d", 10, 0

segment .bss


segment .text
	global  asm_main
	extern	printf

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;allocate 5 local variables in the function

	push	password
	call	complexity
	add		esp, 4

	push	eax
	push	format
	call	printf
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret


complexity:
	push	ebp
	mov		ebp, esp

	sub		esp, 20					;need 5 local variables

	mov		DWORD[ebp-8], 1			;upper=1
	mov		DWORD[ebp-12], 1		;lower=1
	mov		DWORD[ebp-16], 1		;digit=1
	mov		DWORD[ebp-20], 1		;other=1

	mov		DWORD[ebp-4], 0			;length=0
	mov		ecx, DWORD[ebp-4]		;ecx=length

	toploop:
	mov		ebx, DWORD[ebp+8]		;ebp=string pointer

	cmp		BYTE[ebx+ecx], 0		;while not /0
	je		endloop

	;checking uppercase
	mov		al, 'A'
	cmp		BYTE[ebx+ecx], al
	jl		lowercase				;less than A

	mov		al, 'Z'
	cmp		BYTE[ebx+ecx], al
	jg		lowercase				;greater than Z

	add		DWORD[ebp-8], 1
	jmp		endcmp

	lowercase:
	mov		al, 'a'
	cmp		BYTE[ebx+ecx], al
	jl		digit					;less than a

	mov		al, 'z'
	cmp		BYTE[ebx+ecx], al
	jg		digit					;greater than z

	add		DWORD[ebp-12], 1
	jmp		endcmp

	digit:
	mov		al, '0'
	cmp		BYTE[ebx+ecx], al
	jl		other					;less than 0

	mov		al, '9'
	cmp		BYTE[ebx+ecx], al
	jg		other					;greater than 9

	add		DWORD[ebp-16], 1
	jmp		endcmp

	other:
	add		DWORD[ebp-20], 1

	endcmp:
	add 	ecx, 1
	jmp		toploop

	endloop:
	;do the math now

	mov		eax, DWORD[ebp-8]		;eax=upper
	mov		ebx, DWORD[ebp-12]		;ebx=lower
	imul	eax, ebx				;eax=upper*lower

	mov		ebx, DWORD[ebp-16]		;ebx=digit
	imul	eax, ebx				;eax=upper*lower*digit

	mov		ebx, DWORD[ebp-20]		;ebx=other
	imul	eax, ebx				;eax=upper*lower*digit*other

	add		eax, ecx				;eax=upper*lower*digit*other +length

	mov		esp, ebp
	pop		ebp
	ret



