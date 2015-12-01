.bss
	.lcomm num, 20

.text
.global _start
_start:
	mov r0, $1
	ldr r1, =num
	mov r2, $20
	mov r7, #3
	swi $0

	mov r0, $1
	ldr r1, =num
	mov r2, $20
	mov r7, #4
	swi $0	

	mov     r0, $0 
	mov     r7, $1
	swi     $0
