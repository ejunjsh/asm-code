.PHONY: hello sum stack reverse macro c-call-asm c-inline-asm asm-call-c

all: hello sum stack reverse macro c-call-asm c-inline-asm asm-call-c

mkdir:
	mkdir -p bin

asm-call-c: mkdir
	gcc  -c asm-call-c/asm-call-c.c -o bin/asm-call-c.o
	nasm -f elf64 asm-call-c/asm-call-c.asm -o bin/asm-call-c-1.o
	ld   -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc bin/asm-call-c.o bin/asm-call-c-1.o -o bin/asm-call-c

c-inline-asm: mkdir
	gcc c-inline-asm/c-inline-asm.c -o bin/c-inline-asm

c-call-asm: mkdir
	nasm -f elf64 -o bin/c-call-asm.o c-call-asm/c-call-asm.asm
	gcc bin/c-call-asm.o c-call-asm/c-call-asm.c -o bin/c-call-asm

hello: mkdir
	nasm -f elf64 -o bin/hello.o hello/hello.asm
	ld -o bin/hello bin/hello.o

sum: mkdir
	nasm -f elf64 -o bin/sum.o sum/sum.asm
	ld -o bin/sum bin/sum.o

stack: mkdir
	nasm -f elf64 -o bin/stack.o stack/stack.asm
	ld -o bin/stack bin/stack.o

reverse: mkdir
	nasm -f elf64 -o bin/reverse.o reverse/reverse.asm
	ld -o bin/reverse bin/reverse.o

macro: mkdir
	nasm -f elf64 -o bin/macro.o macro/macro.asm
	ld -o bin/macro bin/macro.o

clean:
	rm -rf bin/