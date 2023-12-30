NAME=CustomCode

all: CustomCode

clean:
	rm -rf CustomCode CustomCode.o

CustomCode: CustomCode.asm
	nasm -f elf -F dwarf -g CustomCode.asm
	gcc -no-pie -g -m32 -o CustomCode CustomCode.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
