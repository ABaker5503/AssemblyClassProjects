%include "/usr/local/share/csc314/asm_io.inc"
%define USER_R      256     ;100000000
%define USER_W      128     ;010000000
%define USER_X      64      ;001000000
%define GROUP_R     32      ;000100000
%define GROUP_W     16      ;000010000
%define GROUP_X     8       ;000001000
%define OTHER_R     4       ;000000100
%define OTHER_W     2       ;000000010
%define OTHER_X     1       ;000000001

segment .data

	notwrite	db		"Group cannot write",10,0
	write		db		"Group can write", 10, 0

segment .bss


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; or sets bits
	; rw-r--r--    110100100
	mov		eax, 0
	or		eax, USER_R
	or		eax, USER_W
	or		eax, GROUP_R
	or		eax, OTHER_R

	call	print_int
	call	print_nl

	;and checks bits
	;eax=110100100

	or		eax, GROUP_W
	;eax=110110100

	and		eax, GROUP_W
	cmp		eax, 0
	je		notwriteable

	mov		eax, write
	jmp		end

	notwriteable:
	mov		eax, notwrite

	end:
	call	print_string

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
