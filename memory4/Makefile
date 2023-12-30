NAME=memory4

all: memory4

clean:
	rm -rf memory4 memory4.o

memory4: memory4.asm
	nasm -f elf -F dwarf -g memory4.asm
	gcc -no-pie -g -m32 -o memory4 memory4.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
