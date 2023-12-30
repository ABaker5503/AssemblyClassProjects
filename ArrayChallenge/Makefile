NAME=ArrayChallenge

all: ArrayChallenge

clean:
	rm -rf ArrayChallenge ArrayChallenge.o

ArrayChallenge: ArrayChallenge.asm
	nasm -f elf -F dwarf -g ArrayChallenge.asm
	gcc -no-pie -g -m32 -o ArrayChallenge ArrayChallenge.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
