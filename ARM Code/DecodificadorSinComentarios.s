Inicio:	MOV		R0, #0x5200
		LDR		R1, [R0]
		CMP		R1, #1
		BEQ		TipoDeco
Fin:		MOV		R0, #0x5200
		MOV		R1, #0
		STR		R1, [R0]
		B		Inicio	
TipoDeco:	MOV		R0, #0x4000
		LDRB		R1, [R0]
		CMP		R1, #0
		BEQ		DecoXOR
		CMP		R1, #1
		BEQ		DecoNOT
		CMP		R1, #3
		BEQ		DecoROR
		B		Inicio
DecoXOR:	MOV		R1, #0x4600
		ADD		R0, R0, #1
		LDRB		R2, [R0]
		ADD		R0, R0, #1
CicloXOR:	LDRB		R3, [R0]
		CMP		R3, #0xFF
		BEQ		Fin
		ADD		R0, R0, #1
		EOR		R4, R3, R2
		STRB		R4, [R1]
		ADD		R1, R1, #1
		B		CicloXOR
DecoNOT:	MOV		R1, #0x4600
		ADD		R0, R0, #1
		MOV		R2, #0xFF
CicloNOT:	LDRB		R3, [R0]
		CMP		R3, #0xFF
		BEQ		Fin
		ADD		R0, R0, #1
		EOR		R4, R3, R2
		STRB		R4, [R1]
		ADD		R1, R1, #1
		B		CicloNOT
DecoROR:	MOV		R1, #0x4600
		ADD		R0, R0, #1
		LDRB		R2, [R0]
		ADD		R0, R0, #1
CicloROR:	LDRB		R3, [R0]
		CMP		R3, #0xFF
		BEQ		Fin
		ADD		R0, R0, #1
		ROR		R4, R3, R2
		STRB		R4, [R1]
		ADD		R1, R1, #1
		B		CicloROR