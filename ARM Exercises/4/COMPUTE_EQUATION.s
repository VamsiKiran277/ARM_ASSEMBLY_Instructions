//compute 6x2−9x+2
.global _start
_start:
		MOV R3, #2 //lets say x = 2
		MUL R1,R3,R3  //R1=R3SQUARE
		MOV R5,#6 //R5=6
		MUL R1,R1,R5 //6XSQUARE
		MOV R4,#9 //R4 = 9
		MUL R4,R4,R3 //R4 = 9X
		SUB R2,R1,R4 //R2 = R1-R4
		ADD R2,R2,#2 //R2 = R2+2

		
	