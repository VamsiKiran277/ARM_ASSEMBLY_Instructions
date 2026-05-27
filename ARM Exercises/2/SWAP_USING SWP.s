.global _start
_start:
		MOV R0,#2
		MOV R1,#4
		//METHOD 1 USING XOR
		LDR R2,=temp //memory address
		STR R0,[R2] //STORE R0 INTO MEMORY
		SWP R3, R1, [R2]
		MOV R0, R3  
stop:
    B stop
		
.data
.align 4
temp:
	.word 0
		
	