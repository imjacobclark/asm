.text
.global _start
_start:
    mov 	r0, $5
    mov 	r1, $6
    add 	r0, r0, r1

    mov 	r7, $1
    swi 	$0
