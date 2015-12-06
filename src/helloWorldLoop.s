.data
msg:
    .ascii      "Hello World\n"

.text
.global _start
_start:
    mov     r0, $1 	/* Move 1 into r0 register for syscall (file descriptor stdout) */
    ldr     r1, =msg 	/* Load the 32bit msg constant into the r1 register */
    mov     r2, $12 	/* Load size of 32bit constant into register r2 */
    mov     r7, $4  	/* Load syscall number into register r7 (4 for write) */
    swi     $0      	/* Invoke the system call */
    b	    _start	/* Jump back to start */
