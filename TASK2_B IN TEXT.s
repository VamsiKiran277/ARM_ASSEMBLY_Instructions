.global _start
_start:
    // (Assume registers are loaded and we are switching tasks)
    LDR R0, =taskb_stack_top
    
    // Let's manually pre-fill Task B's stack with fake data 
    // so we have something to pop!
    MOV R1, #0x12          // Fake LR / Return address
    STMDB R0!, {R4-R7, R1} // Push low registers and fake LR
    
    MOV R4, #0x88          // Fake R8
    MOV R5, #0x99          // Fake R9
    MOV R6, #0xAA          // Fake R10
    MOV R7, #0xBB          // Fake R11
    STMDB R0!, {R4-R7}     // Push fake high registers
    
    MOV R4, #0xCC          // Fake R12
    STMDB R0!, {R4}        // Push fake R12
    
    // At this point, R0 is pointing to the bottom of Task B's stack frame.
    // Now let's trigger the restore!
    BL task2

stop:
    B stop

/* ---- YOUR TASK 2 EXERCISE: THE RESTORE ---- */
task2:
    // Step 1: Pop R12 (It was pushed last, so it comes out first!)
    LDMIA R0!, {R4}        // Pops the value 0xCC into R4
    MOV R12, R4            // Move it to its rightful home in R12

    // Step 2: Pop the high registers (0x88, 0x99, 0xAA, 0xBB)
    // They will land cleanly back into R4, R5, R6, and R7.
    LDMIA R0!, {R4-R7}

    // ??? YOUR TURN: WRITE THE 4 MOV INSTRUCTIONS ???
    // Move the values currently in R4-R7 up into R8-R11 so they are restored
	MOV R8,R4
	MOV R9,R5
	MOV R10,R6
	MOV R11,R7
    
    
    // Step 3: Pop final low registers and the return address
    LDMIA R0!, {R4-R7, PC} // Popping straight into PC triggers the jump back!

.data
.align 4
taskb_stack_base: .space 64
taskb_stack_top: