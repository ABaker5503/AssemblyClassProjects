NAME=practice5

all: practice5

clean:
	rm -rf practice5 practice5.o

practice5: practice5.asm
	nasm -f elf -F dwarf -g practice5.asm
	gcc -no-pie -g -m32 -o practice5 practice5.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
