NAME=arrayinst

all: arrayinst

clean:
	rm -rf arrayinst arrayinst.o

arrayinst: arrayinst.asm
	nasm -f elf -F dwarf -g arrayinst.asm
	gcc -no-pie -g -m32 -o arrayinst arrayinst.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
