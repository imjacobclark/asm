# asm
Assembler on the Raspberry Pi Zero.

Assembler examples for ARM11 architecture (Raspberry Pi Zero). 

Nothing within this repository is useful for anying other than research/education purposes.

**How to compile examples:**

```shell
$ as -o errcode.o errcode.s # Build object file from assembler
$ ld -o errcode errcode.o # Link object file to executable binary
$ ./errcode
```

**How to inspect built binaries:**

```shell
$ objdump -d errcode 

errcode:     file format elf32-littlearm


Disassembly of section .text:

00010054 <_start>:
   10054:	e3a000cc 	mov	r0, #204	; 0xcc
   10058:	e3a07001 	mov	r7, #1
   1005c:	ef000000 	svc	0x00000000
```

