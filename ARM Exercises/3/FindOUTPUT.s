.global _start
_start:
		MOV R0,#0x11
		MOV R1,R0,LSL #1
		ADD R2,R1,R1,LSL #2 // R2 = R1+(R1*2POWERN)
stop:
	B stop

		
	