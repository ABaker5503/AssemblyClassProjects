%include "/usr/local/share/csc314/asm_io.inc"

;1,000,000 = 1 second
%define TICK 50000

; the file that stores the initial state
%define BOARD_FILE 'board.txt'
%define SECRET_FILE 'secretboard.txt'

; how to represent everything
%define WALL_CHAR '#'
%define PLAYER_CHAR 'O'
%define MONEY_CHAR '$'
%define EMPTY_CHAR ' '
%define HIT_CHAR 'X'
%define MISS_CHAR '*'
%define SHIP_CHAR '@'

; the size of the game screen in characters
%define HEIGHT 20
%define WIDTH 40

; the player starting position.
; top left is considered (0,0)
%define STARTX 1
%define STARTY 1

; these keys do things
%define EXITCHAR 'x'
%define UPCHAR 'w'
%define LEFTCHAR 'a'
%define DOWNCHAR 's'
%define RIGHTCHAR 'd'
%define DROPCHAR 'y'

segment .data

	; used to fopen() the board file defined above
	board_file			db BOARD_FILE,0
	secret_file			db SECRET_FILE, 0

	; used to change the terminal mode
	mode_r				db "r",0
	raw_mode_on_cmd		db "stty raw -echo",0
	raw_mode_off_cmd	db "stty -raw echo",0

	; ANSI escape sequence to clear/refresh the screen
	clear_screen_code	db	27,"[2J",27,"[H",0

	; things the program will print
	help_str			db 13,10,"Controls: ", \
							UPCHAR,"=UP / ", \
							LEFTCHAR,"=LEFT / ", \
							DOWNCHAR,"=DOWN / ", \
							RIGHTCHAR,"=RIGHT / ", \
							DROPCHAR,"=DROP / ", \
							EXITCHAR,"=EXIT", \
							13,10,10,0

	score_fmt			db	"Hits: %d   Misses: %d", 10, 13, 0
	p1_hit				dd 	0
	p1_miss				dd 	0

	shipsize			db	"Looking for: 1 ship of size 4, 1 ship of size 6, 2 ships of size 8, 1 ship of size 10", 10, 13, 0

	dropflag			dd	0

segment .bss

	; this array stores the current rendered gameboard (HxW)
	board	resb	(HEIGHT * WIDTH)

	; these variables store the current player position
	xpos	resd	1
	ypos	resd	1

segment .text

	global	asm_main
	global  raw_mode_on
	global  raw_mode_off
	global  init_board
	global  render

	extern	system
	extern	putchar
	extern	getchar
	extern	printf
	extern	fopen
	extern	fread
	extern	fgetc
	extern	fclose

	extern 	time
	extern	rand
	extern	srand

	extern 	fcntl
	extern 	usleep

asm_main:
	push	ebp
	mov		ebp, esp

	; put the terminal in raw mode so the game works nicely
	call	raw_mode_on

	; read the game board file into the global variable
	call	init_board

	;set player starting position to be random
	;srand(time(0))    xpos=rand()%(WIDTH-2)+1   ypos=rand()%(HEIGHT-2)+1
	push	0
	call	time
	add		esp, 4

	push	eax
	call	srand
	add		esp, 4

	call	rand
	mov		ebx, WIDTH
	sub		ebx, 2
	cdq
	div		ebx										;divides rand in eax by ebx
	add		edx, 1									;remainder stored in edx
	mov		DWORD[xpos], edx

	call	rand
	mov		ebx, HEIGHT
	sub		ebx, 2
	cdq
	div		ebx										;divides rand in eax by ebx
	add		edx, 1									;remainder stored in edx
	mov		DWORD[ypos], edx

	; the game happens in this loop
	; the steps are...
	;   1. render (draw) the current board
	;   2. get a character from the user
	;	3. store current xpos,ypos in esi,edi
	;	4. update xpos,ypos based on character from user
	;	5. check what's in the buffer (board) at new xpos,ypos
	;	6. if it's a wall, reset xpos,ypos to saved esi,edi
	;	7. otherwise, just continue! (xpos,ypos are ok)
	game_loop:

		push	TICK
		call	usleep
		add		esp, 4

		; draw the game board
		call	render

		; get an action from the user
		call	getchar
;		call	nonblocking_getchar

		cmp		al, -1										;if no user input, render the board again
		je		game_loop

		; store the current position
		; we will test if the new position is legal
		; if not, we will restore these
		mov		esi, DWORD [xpos]
		mov		edi, DWORD [ypos]

		; choose what to do
		cmp		eax, EXITCHAR
		je		game_loop_end
		cmp		eax, UPCHAR
		je 		move_up
		cmp		eax, LEFTCHAR
		je		move_left
		cmp		eax, DOWNCHAR
		je		move_down
		cmp		eax, RIGHTCHAR
		je		move_right
		cmp		eax, DROPCHAR
		je		move_drop
		jmp		input_end			; or just do nothing

		; move the player according to the input character
		move_up:
			dec		DWORD [ypos]
			jmp		input_end
		move_left:
			dec		DWORD [xpos]
			jmp		input_end
		move_down:
			inc		DWORD [ypos]
			jmp		input_end
		move_right:
			inc		DWORD [xpos]
			jmp		input_end
		move_drop:
			mov		DWORD[dropflag], 1
		input_end:

		; (W * y) + x = pos

		; compare the current position to the wall character
		mov		eax, WIDTH
		mul		DWORD [ypos]
		add		eax, DWORD [xpos]
		lea		eax, [board + eax]
		cmp		BYTE [eax], WALL_CHAR
		jne		valid_move
			; opps, that was an invalid move, reset
			mov		DWORD [xpos], esi
			mov		DWORD [ypos], edi
		valid_move:

		cmp		DWORD[dropflag], 1
		jne		end_drop

		; determine if dropped on a ship or not
		; open the secret board and compare to that
		mov		DWORD[dropflag], 0
		cmp		BYTE[eax], HIT_CHAR
		je		end_drop
		cmp		BYTE[eax], SHIP_CHAR
		jne		drop_miss

		; you hit a ship!
		drop_hit:
		inc		DWORD[p1_hit]
		mov		BYTE[eax], HIT_CHAR
		jmp		end_drop

		drop_miss:
		inc		DWORD[p1_miss]
		mov		BYTE[eax], MISS_CHAR

		end_drop:

	jmp		game_loop
	game_loop_end:

	; restore old terminal functionality
	call raw_mode_off

	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

raw_mode_on:

	push	ebp
	mov		ebp, esp

	push	raw_mode_on_cmd
	call	system
	add		esp, 4

	mov		esp, ebp
	pop		ebp
	ret

raw_mode_off:

	push	ebp
	mov		ebp, esp

	push	raw_mode_off_cmd
	call	system
	add		esp, 4

	mov		esp, ebp
	pop		ebp
	ret

init_board:

	push	ebp
	mov		ebp, esp

	; FILE* and loop counter
	; ebp-4, ebp-8
	sub		esp, 8

	; open the file
	push	mode_r
	push	secret_file
	call	fopen
	add		esp, 8
	mov		DWORD [ebp - 4], eax

	; read the file data into the global buffer
	; line-by-line so we can ignore the newline characters
	mov		DWORD [ebp - 8], 0
	read_loop:
	cmp		DWORD [ebp - 8], HEIGHT
	je		read_loop_end

		; find the offset (WIDTH * counter)
		mov		eax, WIDTH
		mul		DWORD [ebp - 8]
		lea		ebx, [board + eax]

		; read the bytes into the buffer
		push	DWORD [ebp - 4]
		push	WIDTH
		push	1
		push	ebx
		call	fread
		add		esp, 16

		; slurp up the newline
		push	DWORD [ebp - 4]
		call	fgetc
		add		esp, 4

	inc		DWORD [ebp - 8]
	jmp		read_loop
	read_loop_end:

	; close the open file handle
	push	DWORD [ebp - 4]
	call	fclose
	add		esp, 4

	mov		esp, ebp
	pop		ebp
	ret

render:

	push	ebp
	mov		ebp, esp

	; two ints, for two loop counters
	; ebp-4, ebp-8
	sub		esp, 8

	; clear the screen
	push	clear_screen_code
	call	printf
	add		esp, 4

	; print the help information
	push	help_str
	call	printf
	add		esp, 4

	push	DWORD[p1_miss]
	push	DWORD[p1_hit]
	push	score_fmt
	call	printf
	add		esp, 12

	; print out the size of ships
	mov		eax, shipsize
	call	print_string

	; outside loop by height
	; i.e. for(c=0; c<height; c++)
	mov		DWORD [ebp - 4], 0
	y_loop_start:
	cmp		DWORD [ebp - 4], HEIGHT
	je		y_loop_end

		; inside loop by width
		; i.e. for(c=0; c<width; c++)
		mov		DWORD [ebp - 8], 0
		x_loop_start:
		cmp		DWORD [ebp - 8], WIDTH
		je 		x_loop_end

			; check if (xpos,ypos)=(x,y)
			mov		eax, DWORD [xpos]
			cmp		eax, DWORD [ebp - 8]
			jne		print_board
			mov		eax, DWORD [ypos]
			cmp		eax, DWORD [ebp - 4]
			jne		print_board
				; if both were equal, print the player
				push	PLAYER_CHAR
				call	putchar
				add		esp, 4
				jmp		print_end
			print_board:
				; otherwise print whatever's in the buffer
				; getting spot where we're at (w*y)+x
				mov		eax, DWORD [ebp - 4]
				mov		ebx, WIDTH
				mul		ebx
				add		eax, DWORD [ebp - 8]
				mov		ebx, 0
				mov		bl, BYTE [board + eax]

				cmp		bl, '@'
				jne		print_blank

				mov		bl, ' '

				print_blank:

				push	ebx
				call	putchar
				add		esp, 4

			print_end:

		inc		DWORD [ebp - 8]
		jmp		x_loop_start
		x_loop_end:

		; write a carriage return (necessary when in raw mode)
		push	0x0d
		call 	putchar
		add		esp, 4

		; write a newline
		push	0x0a
		call	putchar
		add		esp, 4

	inc		DWORD [ebp - 4]
	jmp		y_loop_start
	y_loop_end:

	mov		esp, ebp
	pop		ebp
	ret


nonblocking_getchar:

; returns -1 on no-data   (0xff)
; returns char on success

; magic values
%define F_GETFL 3
%define F_SETFL 4
%define O_NONBLOCK 2048
%define STDIN 0

	push	ebp
	mov		ebp, esp

	; single int used to hold flags
	; single character (aligned to 4 bytes) return
	sub		esp, 8

	; get current stdin flags
	; flags = fcntl(stdin, F_GETFL, 0)
	push	0
	push	F_GETFL
	push	STDIN
	call	fcntl
	add		esp, 12
	mov		DWORD [ebp-4], eax

	; set non-blocking mode on stdin
	; fcntl(stdin, F_SETFL, flags | O_NONBLOCK)
	or		DWORD [ebp-4], O_NONBLOCK
	push	DWORD [ebp-4]
	push	F_SETFL
	push	STDIN
	call	fcntl
	add		esp, 12

	call	getchar
	mov		DWORD [ebp-8], eax

	; restore blocking mode
	; fcntl(stdin, F_SETFL, flags ^ O_NONBLOCK
	xor		DWORD [ebp-4], O_NONBLOCK
	push	DWORD [ebp-4]
	push	F_SETFL
	push	STDIN
	call	fcntl
	add		esp, 12

	mov		eax, DWORD [ebp-8]

	mov		esp, ebp
	pop		ebp
	ret

