/*
    Description:       Returns the GPIO address
    Params:            None
    Returns:           r0 -> address of register
*/
.global GetGpioAddress
GetGpioAddress:
    ldr r0,=0x20200000      /* Load our GPIO address into register 0 */
    mov pc,lr               /* Move the program counter back to the Last Link register (return to calling function) */

/*
    Description:    Sets the function of the GPIO
    Params:         r0 -> Pin required | r1 -> Function required
    Returns:        Nothing

    Information:    pin % 10 * 3 = bit for GPIO to enable
*/
.global SetGpioFunction
SetGpioFunction:
    cmp r0,#53              /* Compare register 0 to 53 */
    cmpls r1,#7             /* If register 0 was less than or equal to 53, compare register 1 to 7 */
    movhi pc,lr             /* If register 0 was higher than 53 or register 1 was higher than 7 return to calling function */

    push {lr}               /* Push the Last Link register address onto the stack */
    mov r2,r0               /* Move register 0 into register 2, as GetGpioAddress returns into register 0 */
    bl GetGpioAddress       /* Branch with link (so we can return back) to GetGpioAddress */

    /*
        54 GPIOs per 6 registers. 32 bits each with 7 modes per pin with 3 bits per GPIO
        GPFSELn 0-5 (0-9 | 10-19 | 20-29 | 30-39 | 40-49 | 50-54)
        16 % 10 * 3 = 18 (bit to enable)
    */
    functionLoop$:
    	cmp r2,#9              /* Compare register 2 to 9 */
    	subhi r2,#10           /* If register 2 higher than 9, subtract 10 from register 2 (pin required) */
    	addhi r0,#4            /* If register 2 higher than 9, add 10 to register 0 (GPIO address) */
    	bhi functionLoop$      /* Branch if register 2 is higher than 9 (loop) */

    /*
        Shift the binary representation of r2 left by 1, add r2 to this value. (r2 * 3)

        Example:

        r2 = 6(10) = 110(2)
        110(2) + 110(2) = 1100(2) OR 12(10)
        110(2) + 110(2) + 110(2) = 10010(2) OR 18(10)
    */
    add r2, r2,lsl #1

    lsl r1,r2              /* Shift register 1 by as many places register 2 is set to */
    str r1,[r0]            /* Store register 1 within the address computed and stored in register 0 */
    pop {pc}               /* Pop the stack and store in the program counter (return to calling function) */

/*
	Description:   Set pin and its desired state
	Params:        r0 -> Pin required | r1 -> State
	Returns:       Nothing
*/
.global SetGpio
SetGpio:
    cmp r0,#53             /* Compare register 0 to 53*/
    movhi pc,lr            /* If register 0 was higher than 53 return to calling function  */
    push {lr}              /* Push the current Link Register value onto the stack */
    mov r2,r0              /* Move register 0 values into register 2*/
    bl GetGpioAddress      /* Branch to GetGpioAddress and return */

    lsr r3,r2,#5           /* Shift the binary representation of register 2 5 places right, store in register 3 (Divide) */
    lsl r3,#2              /* Shift the binary representation of register 2 2 places left, store in register 3 (Multiply) */
    add r0,r3              /* Add register 0 and register 3 together */

    and r2,#31             /* Computes the boolean function of register 2 and 31 */
    mov r3,#1              /* Moves 1 into register 3 */
    lsl r3,r2              /* Shifts register 3 left by the value of r2 */

    teq r1,#0              /* Test if register 1 is equal to 0 */
    streq r3,[r0,#40]      /* If register 1 is equal to 0, store register 0+40 at register 3 */
    strne r3,[r0,#28]      /* If register 1 is not equal to 0, store register 0+28 at register 3 */
    pop {pc}               /* Pop the stack and store in the program counter (return to calling function) */
