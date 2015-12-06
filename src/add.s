.text
.global _start
_start:
    mov     r0, $5      /* Move 5 into r0 register */
    mov     r1, $10     /* Move 10 into r0 register */
    add     r0, r0, r1  /* Add r0 and r1 together, store in r0 */
    mov     r3, r0      /* Move value of r0 to r3 */
    
    mov     r0, $1 	  /* Move 1 into r0 register for syscall (file descriptor stdout) */
    ldr     r1, r0 	  /* Load the result into the r1 register */
    mov     r2, $100 	/* Load size of 32bit constant into register r2 */
    mov     r7, $4  	/* Load syscall number into register r7 (4 for write) */
    swi     $0      	/* Invoke the system call */
   
    mov     r0, $0  	/* Set exit code to 0 in register r0 */
    mov     r7, $1  	/* Load syscall number into register r7 (1 for exit) */
    swi     $0      	/* Invoke the system call */
