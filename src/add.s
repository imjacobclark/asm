.data
num1:	/* Create a word-sized variable in memory of 5 */
	.word	5
num2:	/* Create a word-sized variable in memory of 10 */
	.word 	10

.text
.global _start
_start:
    ldr 	r0, =num1	/* Get address of num1 from memory, assign to r0 */
    ldr         r0, [r0]	/* Get value within address from memory, re-assign r0 */
    ldr 	r1, =num2	/* Get address of num1 from memory, assign to r1 */
    ldr         r1, [r1]	/* Get value within address from memory, re-assign r0 */
    add 	r0, r0, r1	/* Add r0 to r1, re-assign r0 */

    mov 	r7, $1		/* Load 1 into r7 register for exit syscall */
    swi 	$0		/* Software intterupt */
    /* Exits with answer to addition */
