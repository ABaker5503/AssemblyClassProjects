NAME=helloworldeasy

all: helloworldeasy

clean:
	rm -rf helloworldeasy helloworldeasy.o

helloworldeasy: helloworldeasy.asm
	nasm -f elf -F dwarf -g helloworldeasy.asm
	gcc -no-pie -g -m32 -o helloworldeasy helloworldeasy.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
