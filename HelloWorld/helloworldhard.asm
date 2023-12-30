segment .data			;where the data (variables) go

	myMessage	db	"Hello World", 10, 0 	;variable name, defined bytes, "message", new line (10), null byte (0)

segment .text			;where actual code goes

global _start			;exports the function at load time

_start: 				;start of our function

mov eax, 4				;4 is system call to print
mov ebx, 1				;1 is standard out "printing to screen"
mov ecx, myMessage		;puts "hello world" into ecx register
mov edx, 12				;print out length of string + new line
int 0x80				;telling kernel to interupt and perform our system call

mov eax, 1				;1 is system call to stop program
mov ebx, 0				;0 for return status code "exit program"
int 0x80