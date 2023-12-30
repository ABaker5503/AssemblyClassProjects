NAME=Shellcode

all: Shellcode

clean:
	rm -rf Shellcode Shellcode.o

Shellcode: Shellcode.asm
	nasm -f elf -F dwarf -g Shellcode.asm
	gcc -no-pie -g -m32 -o Shellcode Shellcode.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
