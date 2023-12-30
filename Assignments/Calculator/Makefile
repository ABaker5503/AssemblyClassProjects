NAME=Calculator

all: Calculator

clean:
	rm -rf Calculator Calculator.o

Calculator: Calculator.asm
	nasm -f elf -F dwarf -g Calculator.asm
	gcc -no-pie -g -m32 -o Calculator Calculator.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
