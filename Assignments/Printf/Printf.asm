%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	str1		db		"Hello world", 10, 0
	str2		db		"str3 is '%s', isn't that cool?", 10, 0
	str3		db		"woot woot", 0
	str4		db		"%c is a char, but so is %%, %s again!", 10, 0
	str5		db		"this is %c", 10, 0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********



	push	str1
	call	printf
	add		esp, 4

	push	str3
	push	str2
	call	printf
	add		esp, 8

	push 	str3
	push 	'A'
	push	str4
	call	printf
	add		esp, 12

	push	'A'
	push	str5
	call	printf
	add		esp, 8

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret



printf:
	push	ebp
	mov		ebp, esp

	sub		esp, 8
	mov		DWORD [ebp-8], 0					;argument counter set to 0
	mov		DWORD [ebp-4], 0					;string character counter set to 0
	mov		esi, DWORD [ebp-4]					;esi is counter for where in string you are currently

	mov		edi, DWORD [ebp+8]					;start of string closest to ebp

	toploop:

	mov		al, "%"
	cmp		BYTE [edi+esi], al
	je		percentcomparing

	cmp		BYTE[edi+esi], 0
	je		endloop

	mov		eax, 4
	mov		ebx, 1
	lea		ecx, [edi+esi]
	mov		edx, 1
	int		0x80

	add		esi, 1

	jmp		toploop

	percentcomparing:
	add		esi, 1								;increment counter to spot after first %

	mov		al, "%"
	cmp		BYTE [edi+esi], al
	je		percent

	mov		al, "c"
	cmp		BYTE [edi+esi], al
	je		character

	mov		al, "s"
	cmp		BYTE [edi+esi], al
	je		string

	percent:
	mov		eax, 4
	mov		ebx, 1
	lea		ecx, [edi+esi]
	mov		edx, 1
	int		0x80

	add		esi, 1

	jmp		toploop

	character:
	mov		ebx, DWORD[ebp-8]
	lea		ecx, [ebp+12+ebx*4]
	mov		eax, 4
	mov		ebx, 1
	mov		edx, 1
	int 	0x80

	add		esi, 1
	add		DWORD[ebp-8], 1

	jmp		toploop

	string:
	;string length
	mov		edx, DWORD[ebp-8]
	mov		ebx, DWORD[ebp+12+edx*4]
	mov		edx, 0

	toplengthloop:

	cmp		BYTE[ebx+edx], 0
	je		endstringloop
	add		edx, 1
	jmp		toplengthloop

	endstringloop:
	mov		ebx, DWORD[ebp-8]
	mov		ecx, [ebp+12+ebx*4]
	mov		eax, 4
	mov		ebx, 1
	int		0x80

	add		esi, 1
	add		DWORD[ebp-8], 1

	jmp 	toploop

	endloop:

	mov		esp, ebp
	pop		ebp
	ret