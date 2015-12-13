.section .init
.global _start
_start:
    /* Branch into our main function, making room for our stack */
    b main

.section .text
main:
    /* Point the stack at our default load address (0x8000)*/
    mov sp,#0x8000

    /* Select pin 16 and it's GPIO function */
    mov r0,#16
    mov r1,#1
    bl SetGpioFunction

loop$:
    /* Select pin 16 and set it to 0 */
    mov r0,#16
    mov r1,#0
    bl SetGpio

    mov r0,#0x3F0000
    wait1$:
        sub r0,#1
        teq r0,#0
        bne wait1$

    /* Select pin 16 and set it to 1 */
    mov r0,#16
    mov r1,#1
    bl SetGpio

    mov r0,#0x3F0000
    wait2$:
        sub r0,#1
        teq r0,#0
        bne wait2$

b loop$
