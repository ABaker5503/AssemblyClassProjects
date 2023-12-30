NAME=HamDistance

all: HamDistance

clean:
	rm -rf HamDistance HamDistance.o

HamDistance: HamDistance.asm
	nasm -f elf -F dwarf -g HamDistance.asm
	gcc -no-pie -g -m32 -o HamDistance HamDistance.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
