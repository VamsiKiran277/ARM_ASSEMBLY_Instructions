.global _start
_start:
		MOV R0,#2
		MOV R1,#4
		//METHOD 1 USING XOR
		EOR R0,R0,R1
		EOR R1,R0,R1
		EOR R0,R1,R0
		
	