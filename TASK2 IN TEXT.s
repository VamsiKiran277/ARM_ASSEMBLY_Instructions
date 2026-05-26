.global _start
_start:
	//LOW REGISTERS
	LDR R1,=0x11111111
	LDR R2,=0x22222222
	LDR R3,=0x33333333
	LDR R4,=0x44444444
	LDR r5, =0x55555555
	LDR r6, =0x66666666
	LDR r7, =0x77777777

	// High registers
	LDR r8, =0x88888888
	LDR r9, =0x99999999
	LDR r10, =0xAAAAAAAA
	LDR r11, =0xBBBBBBBB
	LDR r12, =0xCCCCCCCC
	//Task b dummy pointer 
	LDR R0, =taskb_stack_top
    LDR R1, =TASKB_SP
    STR R0, [R1]
	
	// Setup Task A's stack pointer
    LDR R0, =taska_stack_top // R0 is our active Stack Pointer
	//call functions
	BL task1
	BL task2
stop:
	B stop //infinite loop when done
/* ---- THE COMPLETED TASK 1 EXERCISE ---- */
task1:
    STMDB r0!, {r4-r7, lr}

    MOV r4, r8
    MOV r5, r9
    MOV r6, r10
    MOV r7, r11

    STMDB r0!, {r4-r7}

    MOV r4, r12
    STMDB r0!, {r4}
	LDR R1, =TASKA_SP
    STR R0, [R1]
    
    BX lr     // Return back to main program
task2:
	LDR R1,=TASKB_SP //Get the stack pointer out of taskb's memory
	LDR R0,[R1]
	LDMIA R0!,{R4-R7}
	BX lr
.data
.align 4 //by using this we are bascially moving 4bytes forward
// Allocate a small 64-byte array for our test stack
TASKA_SP:  .word 0 //allocates 4 bytes initialized to zero
TASKB_SP:  .word 0 //allocates 4 bytes initialized to zero
// Task A Stack Space
taska_stack_base: .space 64
taska_stack_top:

// Task B Stack Space
taskb_stack_base: .space 64
taskb_stack_top: