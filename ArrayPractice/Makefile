NAME=ArrayPractice

all: ArrayPractice

clean:
	rm -rf ArrayPractice ArrayPractice.o

ArrayPractice: ArrayPractice.asm
	nasm -f elf -F dwarf -g ArrayPractice.asm
	gcc -no-pie -g -m32 -o ArrayPractice ArrayPractice.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
