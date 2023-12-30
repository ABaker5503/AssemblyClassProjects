NAME=mystery1

all: mystery1

clean:
	rm -rf mystery1 mystery1.o

mystery1: mystery1.asm
	nasm -f elf -F dwarf -g mystery1.asm
	gcc -no-pie -g -m32 -o mystery1 mystery1.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
