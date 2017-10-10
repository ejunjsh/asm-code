build_hello:
	rm -rf bin/
	mkdir bin
	nasm -f elf64 -o bin/hello.o hello/hello.asm
	ld -o bin/hello bin/hello.o

clean:
	rm -rf bin/