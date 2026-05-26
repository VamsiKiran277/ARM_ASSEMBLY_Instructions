.global _start
_start:
	//we tell cpu what adderess the PSP should start with
	LDR R0,=user_stack_top
	//move the address from r0 to special register
	MSR psp,R0
	//read the current control register
	MRS R1, control
	//flip the bit 1 to select psp
	//bit 1 controls the stack selection .Flipped to 1 it enables psp
	//0b10 is 2 in binary
	MOVS R2,#2
	ORRS R1,R1,R2 //Logical or ensures bit 1 is set to 1
	//write back to control register
	MSR control,R1
	ISB //"Instruction Synchronization Barrier" - Forces the CPU 
                              // to instantly apply the context change before moving on
	//Test the new stack
	MOVS R3,#0xAA
	PUSH {R3}
stop:
    B stop
	
	
.data
.align 4
user_stack_base: .space 32
user_stack_top: