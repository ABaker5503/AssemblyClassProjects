NAME=cs3

all: cs3

clean:
	rm -rf cs3 cs3.o

cs3: cs3.asm
	nasm -f elf -F dwarf -g cs3.asm
	gcc -no-pie -g -m32 -o cs3 cs3.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
