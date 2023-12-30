NAME=memory3

all: memory3

clean:
	rm -rf memory3 memory3.o

memory3: memory3.asm
	nasm -f elf -F dwarf -g memory3.asm
	gcc -no-pie -g -m32 -o memory3 memory3.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
