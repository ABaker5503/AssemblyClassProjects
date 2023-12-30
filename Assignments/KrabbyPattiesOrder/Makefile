NAME=KrabbyPattiesOrder

all: KrabbyPattiesOrder

clean:
	rm -rf KrabbyPattiesOrder KrabbyPattiesOrder.o

KrabbyPattiesOrder: KrabbyPattiesOrder.asm
	nasm -f elf -F dwarf -g KrabbyPattiesOrder.asm
	gcc -no-pie -g -m32 -o KrabbyPattiesOrder KrabbyPattiesOrder.o /usr/local/share/csc314/driver.c /usr/local/share/csc314/asm_io.o
