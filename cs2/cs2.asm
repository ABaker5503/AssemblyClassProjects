%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		ebx, 0						;int i=0
	topofloop:							;topofloop:
	cmp		ebx, 100						;if (i>=100) goto endofloop;
	jge		endofloop
		mov		ecx, 2						;if (i%2!=0) goto endif;
		mov 	eax, ebx
		cdq
		idiv	ecx
		cmp		edx, 0						;(remainder stored in edx, compare 0 to edx)
		jne		endif
			mov		eax, ebx				;(mov loop counter into eax to print)
			call	print_int;
			call	print_nl;
			endif:							;endif:
		add		ebx, 1					;i++
		jmp		topofloop				;goto topofloop
	endofloop:							;endofloop:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
