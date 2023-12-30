NAME=charExample

all: charExample

clean:
	rm -rf charExample charExample.o

charExample: charExample.asm
	nasm -f elf -F dwarf -g charExample.asm
	gcc -no-pie -g -m32 -o charExample charExample.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
