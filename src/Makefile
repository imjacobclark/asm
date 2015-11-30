# Makefile
all: first
 
first: errcode.o
	ld -o ../bin/errcode errcode.o
	rm errcode.o
 
first.o : errcode.s
	rm ../bin/errcode
	as -o errcode.o errcode.s
 
clean:
	rm ../bin/errcode
