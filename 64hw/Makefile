NAME=64hw

all: 64hw

clean:
	rm -rf 64hw 64hw.o

64hw: 64hw.asm
	nasm -f elf64 -F dwarf -g 64hw.asm
	gcc -no-pie -g -m64 -o 64hw 64hw.o
