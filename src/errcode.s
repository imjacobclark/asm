.text

.global _start
_start:
    mov     r0, $204    /* Set exit code to 204 in register r0 */
    mov     r7, $1      /* Load syscall number into register r7 (1 for exit) */
    swi     $0          /* Invoke the system call */
