.text

.globl _start
_start:
    mov     r0, $204
    mov     r7, $1
    swi     $0    
