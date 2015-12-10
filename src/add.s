num1:
        .word   8
num2:
        .word   1
answer:
        .word   0
nl:
        .ascii "\n"

.text
.global _start
_start:
    # Add num1 + num2 together
    ldr         r0, =num1
    ldr         r0, [r0]
    ldr         r1, =num2
    ldr         r1, [r1]
    add         r3, r0, r1

    # Add calculated answer to 48 to get ASCII symbol number, move into address space of answer
    add         r0, r3, #48
    ldr         r2, =answer
    str         r0, [r2]
    ldr         r0, =answer
    ldr         r0, [r0]

    # Call write() passing in the address of answer in memory as the buffer
    mov         r0, $1
    ldr         r1, =answer
    mov         r2, $4
    mov         r7, $4
    swi         $0

    # Make the output nice with a carrage return
    mov         r0, $1
    ldr         r1, =nl
    mov         r2, $1
    mov         r7, $4
    swi         $0

    # At this stage, everything wen't okay, exit with 0 exit status
    mov         r0, #0
    mov         r7, $1
    swi         $0
