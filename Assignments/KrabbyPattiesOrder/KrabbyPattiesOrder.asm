%include "/usr/local/share/csc314/asm_io.inc"
%define LETTUCE		128			;10000000
%define ONION		64			;01000000
%define TOMATO		32			;00100000
%define PICKLE		16			;00010000
%define BLACKOLIVE	8			;00001000
%define MAYO		4			;00000100
%define KETCHUP		2			;00000010
%define MUSTARD		1			;00000001

segment .data

	lettuce		db		"Lettuce: ", 0
	onion		db		"Onion: ", 0
	tomato		db		"Tomato: ", 0
	pickle		db		"Pickle: ", 0
	blackolive	db		"Black Olive: ", 0
	mayo		db		"Mayo: ", 0
	ketchup		db		"Ketchup: ", 0
	mustard		db		"Mustard: ", 0
	finalorder	db		"Krabby Patty Code: ", 0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		ebx, 0					;ebx is where order stored
	;ask for ingredients

	;Lettuce
	mov		eax, lettuce
	call	print_string
	call	read_char
	cmp		eax, "n"
	jne		addlettuce
	jmp		askonions

	addlettuce:
	or		ebx, LETTUCE
	;do I need a jump here?

	askonions:
	mov		eax, onion
	call	print_string
	call	read_char
	call	read_char
	cmp		eax, "n"
	jne		addonion
	jmp		asktomato

	addonion:
	or		ebx, ONION

	asktomato:
	mov		eax, tomato
	call	print_string
	call	read_char
	call	read_char
	cmp		eax, "n"
	jne		addtomato
	jmp		askpickle

	addtomato:
	or		ebx, TOMATO

	askpickle:
	mov		eax, pickle
	call	print_string
	call	read_char
	call	read_char
	cmp		eax, "n"
	jne		addpickle
	jmp		askblackolive

	addpickle:
	or		ebx, PICKLE

	askblackolive:
	mov		eax, blackolive
	call	print_string
	call	read_char
	call	read_char
	cmp		eax, "n"
	jne		addblackolive
	jmp		askmayo

	addblackolive:
	or		ebx, BLACKOLIVE

	askmayo:
	mov		eax, mayo
	call	print_string
	call	read_char
	call	read_char
	cmp		eax, "n"
	jne		addmayo
	jmp		askketchup

	addmayo:
	or		ebx, MAYO

	askketchup:
	mov		eax, ketchup
	call	print_string
	call	read_char
	call	read_char
	cmp		eax, "n"
	jne		addketchup
	jmp		askmustard

	addketchup:
	or		ebx, KETCHUP

	askmustard:
	mov		eax, mustard
	call	print_string
	call	read_char
	call	read_char
	cmp		eax, "n"
	jne		addmustard
	jmp		end

	addmustard:
	or		ebx, MUSTARD

	end:
	mov		eax, finalorder
	call	print_string

	;encryption
	add		ebx, 63
	rol		ebx, 3
	xor		ebx, 45
	mov		eax, ebx
	call	print_int
	call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
