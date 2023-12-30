NAME=funcs1

all: funcs1

clean:
	rm -rf funcs1 funcs1.o

funcs1: funcs1.asm
	nasm -f elf -F dwarf -g funcs1.asm
	gcc -no-pie -g -m32 -o funcs1 funcs1.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
