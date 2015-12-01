.bss
	.lcomm num, 20 /* Reserve 20 bytes for local common storage */

.text
.global _start
_start:
	mov r0, $1 	/* Move 1 into r0 register for syscall (file descriptor stdout) */
	ldr r1, =num 	/* Load our reserved 20 bytes for the buffer into r1  */
	mov r2, $20 	/* Set our max input to 20 bytes  */
	mov r7, #3 	/* Load syscall read (3) into r7  */
	swi $0 		/* Invoke the system call */

	mov r0, $1	/* Move 1 into r0 register for syscall (file descriptor stdout) */
	ldr r1, =num	/* Load our now populated buffer into r1  */
	mov r2, $20	/* Set the write output to 20 bytes  */
	mov r7, #4 	/* Load syscall write (4) into r7  */
	swi $0		/* Invoke the system call */

	mov     r0, $0  /* Set exit code to 0 in register r0 */
	mov     r7, $1	/* Load syscall number into register r7 (1 for exit) */
	swi     $0      /* Invoke the system call */
