		;		Rutina que se encarga de verificar si se puede iniciar el proceso de decodificación
		
Inicio	MOV		R0, #0x5200 ; Carga dirección de memoria del Flip Flop en R0
		LDR		R1, [R0] ; Carga el dato almacenado del Flip Flop en R1
		CMP		R1, #1   ; Se verifica si la señal del Flip Flop es 1
		BEQ		TipoDeco ; Si lo es, inicia el proceso de Decodificación
		
Fin		MOV		R0, #0x5200 ; Carga dirección de memoria del Flip Flop en R0
		MOV		R1, #0   ; Almacena en un 0 en R1
		STR		R1, [R0] ; Guarda el dato de R1 en el Flip Flop
		B		Inicio   ; Sino, vuelve al inicio
		
		;		Rutina que se encarga de verificar cual proceso de decodificación a realizar
		
TipoDeco	MOV		R0, #0x4000 ; Carga dirección de memoria del ROM en R0
		LDRB		R1, [R0] ; Carga el primer byte a R1, este indica el tipo de decodificación a realizar
		CMP		R1, #0   ; Se verifica si el byte es 0
		BEQ		DecoXOR  ; Si lo es, inicia el proceso de Decodificación XOR
		CMP		R1, #1   ; Se verifica si el byte es 1
		BEQ		DecoNOT  ; Si lo es, inicia el proceso de Decodificación NOT
		CMP		R1, #3   ; Se verifica si el byte es 1
		BEQ		DecoROR  ; Si lo es, inicia el proceso de Decodificación ROR
		B		Inicio   ; Sino, vuelve al inicio
		
		;		Rutina que se encarga de realizar la decodificación XOR
		
DecoXOR	MOV		R1, #0x4600 ; Carga dirección de memoria del RAM en R1
		MOV		R2, #1   ; Almacena un 1 en R2
		MOV		R3, #0   ; Almacena un 0 en R3
		LDRB		R4, [R0, R2] ; Carga el segundo byte del ROM a R4, esta es la llave del XOR
		ADD		R2, R2, #1   ; Suma 1 a R2
		
CicloXOR	LDRB		R5, [R0, R2] ; Carga un byte del mensaje codificado a R5
		CMP		R5, #0xFF    ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acabó y vuelve al inicio
		ADD		R2, R2, #1   ; Suma 1 a R2
		EOR		R6, R5, R4   ; Aplica XOR entre la letra y la llave
		STRB		R6, [R1, R3] ; Almacena la letra decodificada en la RAM
		ADD		R3, R3, #1   ; Suma 1 a R3
		B		CicloXOR     ; Repite el ciclo
		
		;		Rutina que se encarga de realizar la decodificación NOT
		
DecoNOT	MOV		R1, #0x4600 ; Carga dirección de memoria del RAM en R1
		MOV		R2, #1   ; Almacena un 1 en R2
		MOV		R3, #0   ; Almacena un 0 en R3
		MOV		R4, #0xFF ; Carga un 0xFF a R4, esto para poder realizar la negación utilizando XOR
		
CicloNOT	LDRB		R5, [R0, R2] ; Carga un byte del mensaje codificado a R5
		CMP		R5, #0xFF    ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acabó y vuelve al inicio
		ADD		R2, R2, #1   ; Suma 1 a R2
		EOR		R6, R5, R4   ; Aplica XOR entre la letra y 0xFF, para negar los bits de R4
		STRB		R6, [R1, R3] ; Almacena la letra decodificada en la RAM
		ADD		R3, R3, #1   ; Suma 1 a R3
		B		CicloNOT     ; Repite el ciclo
		
		;		Rutina que se encarga de realizar la decodificación ROR
		
DecoROR	MOV		R1, #0x4600 ; Carga dirección de memoria del RAM en R1
		MOV		R2, #1   ; Almacena un 1 en R2
		MOV		R3, #0   ; Almacena un 0 en R3
		LDRB		R4, [R0, R2] ; Carga el segundo byte del ROM a R4, esta es la cantidad de bits a rotar
		ADD		R2, R2, #1   ; Suma 1 a R2
		
CicloROR	LDRB		R5, [R0, R2] ; Carga un byte del mensaje codificado a R5
		CMP		R5, #0xFF    ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acabó y vuelve al inicio
		ADD		R2, R2, #1   ; Suma 1 a R2
		ROR		R6, R5, R4   ; Aplica ROR entre la letra y la llave
		STRB		R6, [R1, R3] ; Almacena la letra decodificada en la RAM
		ADD		R3, R3, #1   ; Suma 1 a R3
		B		CicloROR     ; Repite el ciclo
