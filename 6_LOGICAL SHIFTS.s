.global _start
_start:
	MOV R0,#10
	ROR R0,#1
	MOV R1,R0,LSL #1
	MOV R2,R1,LSR #1