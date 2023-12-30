NAME=Printf

all: Printf

clean:
	rm -rf Printf Printf.o

Printf: Printf.asm
	nasm -f elf -F dwarf -g Printf.asm
	gcc -no-pie -g -m32 -o Printf Printf.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
