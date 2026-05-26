.global _start
_start:
	LDR R0,=list
	LDR R1,[R0]
	LDR R2,[R0,#4]! 
	LDR R3,[R0],#4 
	
.data
list:
	.word 4,3,-1,0,5,-4,6