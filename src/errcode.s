.text

.globl _start
_start:
    mov     r0, $204 	/* Set exit code to 204 */
    mov     r7, $1 	/* exit is syscall 1 */
    swi     $0 		/* Invoke the system call */
