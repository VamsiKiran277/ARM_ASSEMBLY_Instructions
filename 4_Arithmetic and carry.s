.global _start
_start:
	MOV R0,#0xFFFFFFFF
	MOV R1,#3
	ADC R2,R0,R1 //R2 = R0+R1+CARRY