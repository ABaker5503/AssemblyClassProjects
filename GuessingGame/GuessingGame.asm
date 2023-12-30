%include "/usr/local/share/csc314/asm_io.inc"


segment .data

	stringGuess		db		"Enter Guess: ", 0
	stringHigh		db		"Too High!", 10, 0
	stringLow		db		"Too Low!", 10, 0
	stringRight		db		"That's Correct!", 10, 0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		ebx, 0					;zeroing ebx
	mov		bl, cl					;putting random number into ebx

	dump_regs 1

	top:
	mov		eax, stringGuess
	call 	print_string			;"Enter Guess"

	call	read_int

	cmp		eax, ebx				;compare entered with random
	jg		High
	jl		Low
	je		Equals

	High:							;number entered greater than random
	mov		eax, stringHigh
	call	print_string
	jmp		top

	Low:							;number entered less than random
	mov		eax, stringLow
	call	print_string
	jmp		top

	Equals:							;number entered is correct
	mov		eax, stringRight
	call	print_string

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
