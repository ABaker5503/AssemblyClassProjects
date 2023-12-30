%include "/usr/local/share/csc314/asm_io.inc"


segment .data

;	srcbuff		db		"Hello World", 0
	funString	db		"Hello World", 0
	funString2	db		"Hello World", 0
segment .bss

;	dstbuff		resb	12

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

;	mov		ecx, 10
;	toploop:
;		mov		eax, ecx
;		call	print_int
;		call	print_nl
;	loop toploop

	;equivlent ->
	;dec ecx
	;cmp ecx, 0
	;jg toploop

;	cld							;increments forward in array
;	mov		esi, srcbuff
;	mov		edi, dstbuff
;	mov		ecx, 12
;
;	toploop:
;		lodsb				;dereferences the pointer at esi and then stores into al
;		;equivalent -> mov al, BYTE [esi] and add esi, 1
;		stosb				;takes the byte at al and puts it into edi pointer
;		;equivalent -> mov BYTE[edi], al and add edi, 1

;	cmp		al, 0			;checks for null byte
;	jne		toploop
;	loop 	toploop

;	mov		eax, dstbuff
;	call	print_string
;	call	print_nl

;	cld
;	mov		esi, srcbuff
;	mov		edi, dstbuff
;	mov		ecx, 12
;
;	toploop:
;		movsb
;		;equivalent -> mov BYTE [edi], BYTE [esi], 1; add edi, 1
;	cmp 	BYTE [edi-1], 0				;need -1 because movsb already increments edi before we can compare it
;	jne	toploop
;
;	mov		eax, dstbuff
;	call	print_string
;	call	print_nl


;compare these two strings in memory and check if they are equal
;if they are equal, print 0
;if not equal, print 1

	cld
	mov		esi, funString
	mov		edi, funString2
	mov		ecx, 12

	toploop:
		cmpsb					;comparing the bytes of [esi] and [edi]
		jne		notequal
		loop toploop			;equivalent -> dec ecx; cmp ecx, 0; jg toploop

		mov 	eax, 0
		call	print_int
		call	print_nl
		jmp		end

	notequal:
	mov		eax, 1
	call 	print_int
	call 	print_nl

	end:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
