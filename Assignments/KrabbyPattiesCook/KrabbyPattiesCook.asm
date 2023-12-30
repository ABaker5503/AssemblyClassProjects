%include "/usr/local/share/csc314/asm_io.inc"
%define LETTUCE		128			;10000000
%define ONION		64			;01000000
%define TOMATO		32			;00100000
%define	PICKLE		16			;00010000
%define BLACKOLIVE	8			;00001000
%define MAYO		4			;00000100
%define KETCHUP		2			;00000010
%define MUSTARD		1			;00000001

segment .data

	code		db		"Krabby Patty code: ", 0
	start		db		"This Krabby Patty needs: ", 0
	lettuce		db		"Lettuce", 0
	onion		db		"Onion", 0
	tomato		db		"Tomato", 0
	pickle		db		"Pickle", 0
	blackolive	db		"Black Olive", 0
	mayo		db		"Mayo", 0
	ketchup		db		"Ketchup", 0
	mustard		db		"Mustard", 0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, code
	call	print_string
	call	read_int
	mov		ebx, eax				;code stored in ebx

	;decryption
	xor		ebx, 45
	ror		ebx, 3
	sub		ebx, 63

	mov		eax, start
	call	print_string
	call	print_nl

	checklettuce:
	mov		eax, ebx
	and		eax, LETTUCE
	cmp		eax, 128
	jne		checkonion

	printlettuce:
	mov		eax, lettuce
	call	print_string
	call	print_nl

	checkonion:
	mov		eax, ebx
	and		eax, ONION
	cmp		eax, 64
	jne		checktomato

	printonion:
	mov		eax, onion
	call	print_string
	call	print_nl

	checktomato:
	mov		eax, ebx
	and		eax, TOMATO
	cmp		eax, 32
	jne		checkpickle

	printtomato:
	mov		eax, tomato
	call	print_string
	call	print_nl

	checkpickle:
	mov		eax, ebx
	and		eax, PICKLE
	cmp		eax, 16
	jne		checkblackolive

	printpickle:
	mov		eax, pickle
	call	print_string
	call	print_nl

	checkblackolive:
	mov		eax, ebx
	and		eax, BLACKOLIVE
	cmp		eax, 8
	jne		checkmayo

	printblackolive:
	mov		eax, blackolive
	call	print_string
	call	print_nl

	checkmayo:
	mov		eax, ebx
	and		eax, MAYO
	cmp		eax, 4
	jne		checkketchup

	printmayo:
	mov		eax, mayo
	call	print_string
	call	print_nl

	checkketchup:
	mov		eax, ebx
	and		eax, KETCHUP
	cmp		eax, 2
	jne		checkmustard

	printketchup:
	mov		eax, ketchup
	call	print_string
	call	print_nl

	checkmustard:
	mov		eax, ebx
	and		eax, MUSTARD
	cmp		eax, 1
	jne		end

	printmustard:
	mov		eax, mustard
	call	print_string
	call	print_nl

	end:
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
