Inicio:	MOV		R0, #0x5200
		LDR		R1, [R0]
		CMP		R1, #1
		BEQ		TipoDeco
Fin:		MOV		R0, #0x5200
		MOV		R1, #0
		STR		R1, [R0]
		B		Inicio	
TipoDeco:	MOV		R0, #0x4000
		LDR		R1, [R0]
		CMP		R1, #0
		BEQ		DecoXOR
		CMP		R1, #1
		BEQ		DecoNOT
		CMP		R1, #3
		BEQ		DecoROR
		B		Inicio
DecoXOR:	MOV		R1, #0x4600
		MOV		R2, #4
		MOV		R3, #0
		LDR		R4, [R0, R2]
		ADD		R2, R2, #4
CicloXOR:	LDR		R5, [R0, R2]
		CMP		R5, #0xFF
		BEQ		Fin
		ADD		R2, R2, #4
		EOR		R6, R5, R4
		STR		R6, [R1, R3]
		ADD		R3, R3, #4
		B		CicloXOR
DecoNOT:	MOV		R1, #0x4600
		MOV		R2, #4
		MOV		R3, #0
		MOV		R4, #0xFF
CicloNOT:	LDR		R5, [R0, R2]
		CMP		R5, #0xFF
		BEQ		Fin
		ADD		R2, R2, #4
		EOR		R6, R5, R4
		STR		R6, [R1, R3]
		ADD		R3, R3, #4
		B		CicloNOT
DecoROR:	MOV		R1, #0x4600
		MOV		R2, #4
		MOV		R3, #0
		LDR		R4, [R0, R2]
		ADD		R2, R2, #4
CicloROR:	LDR		R5, [R0, R2]
		CMP		R5, #0xFF
		BEQ		Fin
		ADD		R2, R2, #4
		ROR		R6, R5, R4
		STR		R6, [R1, R3]
		ADD		R3, R3, #4
		B		CicloROR