NAME=PasswordComplexity

all: PasswordComplexity

clean:
	rm -rf PasswordComplexity PasswordComplexity.o

PasswordComplexity: PasswordComplexity.asm
	nasm -f elf -F dwarf -g PasswordComplexity.asm
	gcc -no-pie -g -m32 -o PasswordComplexity PasswordComplexity.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
