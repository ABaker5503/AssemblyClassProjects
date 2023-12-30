%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss

	userlist	resd	10

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	;arr[i+1]--->mov DWORD [arr+ecx*4+4]

	;do a bubble sort because ryan says so.
	mov		ecx, 0
	toploop1:
	call	read_int
	mov		DWORD [userlist+ecx*4],eax
	add		ecx, 1
	cmp		ecx, 10
	jl		toploop1

;    for (int i=0; i<10; i++)
;    {
;        for (int j=0; j<9; j++)
;        {
;            if (userlist[j]>userlist[j+1])
;            {
;                int tmp;
;                tmp=userlist[j];
;                userlist[j]=userlist[j+1];
;                userlist[j+1]=tmp;
;            }
;        }
;    }

	mov 	ecx, 0										;counter variable for i loop
	topouterloop:										;loop to determine what spot starting with
		mov		edx, 0									;counter variable for j loop
		topinnerloop:
			mov		eax, DWORD [userlist+edx*4]			;put spot j into eax
			mov		ebx, DWORD [userlist+edx*4+4]		;put spot j+1 into ebx
			cmp		eax, ebx
			jg		switchnums							;j>j+1 so need to switch
			jmp		endswitch							;skip over switching and do loop increments
			switchnums:
				mov		DWORD [userlist+edx*4], ebx
				mov		DWORD [userlist+edx*4+4], eax
		endswitch:
		add		edx, 1
		cmp		edx, 9
		jl		topinnerloop
	add		ecx, 1
	cmp		ecx, 10
	jl		topouterloop

	call	print_nl

	mov		ecx, 0										;printing loop
	topprintloop:
		mov		eax, DWORD [userlist+ecx*4]
		call	print_int
		call	print_nl
	add		ecx, 1
	cmp		ecx, 10
	jl		topprintloop

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
