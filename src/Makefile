# Makefile
all: first
 
first: errcode.o
	gcc -o ../bin/errcode errcode.o
	rm errcode.o
 
first.o : errcode.s
	rm ../bin/errcode
	as -o errcode.o errcode/s
 
clean:
	rm -vf ../bin/errode errcode.o
