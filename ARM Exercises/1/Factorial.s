.global _start
_start:
		MOV R0,#4
		MOV R1,#1 //RESULT
loop:
		MUL R1,R1,R0 //MULTIPLY WITH THE RESULT
		SUB R0,R0,#1 //DECREMENT
		CMP R0,#0
		BGT loop
stop:
		B stop
	