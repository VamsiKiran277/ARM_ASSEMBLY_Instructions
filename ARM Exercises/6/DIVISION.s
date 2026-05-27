.global _start
_start:
		MOV R1,#4
		MOV R2,#2
		MOV R3,#0 //initializing it with zero
		
div_loop:
		CMP R1,R2 //CHECK IF R1>R2
		BLT div_done
		SUB R1,R1,R2
		ADD R3,R3,#1 //Increment the quotient
		B div_loop  //repeat
div_done:
		MOV R4,R1
		

		
	