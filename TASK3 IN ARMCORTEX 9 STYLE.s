.global _start
.text

_start:
    
    LDR sp, =svc_stack_top    // Set the kernel stack pointer (Acts like MSP)

    
    MRS r0, cpsr              // Read the Current Program Status Register
    
    // Clear the bottom 5 mode bits (0x1F) using Bit Clear
    MOVS r1, #0x1F
    BICS r0, r0, r1           
    
    // Set the mode bits to 0x10
    MOVS r1, #0x10            
    ORRS r0, r0, r1           
    
    MSR cpsr, r0              // Write back to CPSR. The CPU instantly flips it
    ISB                       // Force synchronization

    // Now that the CPU is in User Mode, the 'sp' register is a 
    // completely separate physical tracking bank
    LDR sp, =user_stack_top   // Set the application task stack pointer (Acts like PSP)
    
   
    MOVS r3, #0xAA
    PUSH {r3}                 // Drops 0xAA onto user_stack, completely isolating svc_stack!

stop:
    B stop

.data
.align 4
// Kernel Stack
svc_stack_base:  .space 32
svc_stack_top:

// Application Task Stack
user_stack_base: .space 32
user_stack_top: