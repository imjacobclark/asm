.data
dnum1:
	.word	5
dnum2:
	.word 	10

.text
.global _start
_start:
    ldr 	r0, num1
    ldr		r0, [r0]
    ldr 	r1, num2
    ldr		r1, [r1]    
    add 	r0, r0, r1

    mov 	r7, $1
    swi 	$0

num1: 
	.word dnum1
num2: 
	.word dnum2
