.global _start
.text

_start:
    /* ---- 1. SETUP MOCK DATA ---- */
    // Loading easily recognizable hex values into registers
    LDR r1, =0x11111111
    LDR r2, =0x22222222
    LDR r3, =0x33333333
    LDR r4, =0x44444444
    LDR r5, =0x55555555
    LDR r6, =0x66666666
    LDR r7, =0x77777777
    
    // High registers
    LDR r8, =0x88888888
    LDR r9, =0x99999999
    LDR r10, =0xAAAAAAAA
    LDR r11, =0xBBBBBBBB
    LDR r12, =0xCCCCCCCC

    /* ---- 2. SETUP MOCK STACK ---- */
    // Point R0 to the top of our dummy stack space
    LDR r0, =mock_stack_top 

    /* ---- 3. CALL YOUR FUNCTION ---- */
    BL save_context

stop:
    B stop    // Infinite loop when done


/* ---- THE COMPLETED TASK 1 EXERCISE ---- */
save_context:
    // 1. Save low registers (R4-R7) and the Link Register (LR)
    // STMDB means "Store Multiple, Decrement Before".
    // The '!' tells R0 to update its address as it moves down.
    STMDB r0!, {r4-r7, lr}

    // 2. We can't push high registers (R8-R11) directly in Thumb mode.
    // So, we copy their values into our safely-backed-up low registers.
    MOV r4, r8
    MOV r5, r9
    MOV r6, r10
    MOV r7, r11

    // 3. Now we push R4-R7 to the stack again.
    // (But remember, they now hold the values of R8-R11!)
    STMDB r0!, {r4-r7}

    // 4. Finally, let's grab R12, copy it to R4, and push it too.
    MOV r4, r12
    STMDB r0!, {r4}
    
    BX lr     // Return back to main program


.data
.align 4
// Allocate a small 64-byte array for our test stack
mock_stack_base:
    .space 64
mock_stack_top: 
    // Stacks grow downwards, so our pointer starts at the very end of the memory space