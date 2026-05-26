.global _start
_start:
	MOV R0,#0xAA
	MVN R0,R0
	AND R0,R0,#0x000000FF