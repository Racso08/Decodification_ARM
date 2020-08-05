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
		
DecoXOR	MOV		R1, #0x4600 ; Carga dirección de memoria de la RAM a R1
		ADD		R0, R0, #1   ; Suma 1 a R0
		LDRB		R2, [R0] ; Carga el segundo byte del ROM a R2, esta es la llave del XOR
		ADD		R0, R0, #1   ; Suma 1 a R0
		
CicloXOR	LDRB		R3, [R0]     ; Carga un byte del mensaje codificado a R3
		CMP		R3, #0xFF    ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acabó y vuelve al inicio
		ADD		R0, R0, #1   ; Suma 1 a R0
		EOR		R4, R3, R2   ; Aplica XOR entre la letra y la llave
		STRB		R4, [R1]     ; Almacena la letra decodificada en la RAM
		ADD		R1, R1, #1   ; Suma 1 a R1
		B		CicloXOR     ; Repite el ciclo
		
		;		Rutina que se encarga de realizar la decodificación NOT
		
DecoNOT	MOV		R1, #0x4600 ; Carga dirección de memoria del RAM en R1
		ADD		R0, R0, #1   ; Suma 1 a R0
		MOV		R2, #0xFF ; Carga un 0xFF a R2, esto para poder realizar la negación utilizando XOR
		
CicloNOT	LDRB		R3, [R0] ; Carga un byte del mensaje codificado a R3
		CMP		R3, #0xFF    ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acabó y vuelve al inicio
		ADD		R0, R0, #1   ; Suma 1 a R0
		EOR		R4, R3, R2   ; Aplica XOR entre la letra y 0xFF, para negar la palabra
		STRB		R4, [R1] ; Almacena la letra decodificada en la RAM
		ADD		R1, R1, #1   ; Suma 1 a R1
		B		CicloNOT     ; Repite el ciclo
		
		;		Rutina que se encarga de realizar la decodificación ROR
		
DecoROR	MOV		R1, #0x4600 ; Carga dirección de memoria del RAM en R1
		ADD		R0, R0, #1   ; Suma 1 a R0
		LDRB		R2, [R0] ; Carga el segundo byte del ROM a R2, esta es la cantidad de bits a rotar
		ADD		R0, R0, #1   ; Suma 1 a R0
		
CicloROR	LDRB		R3, [R0] ; Carga un byte del mensaje codificado a R3
		CMP		R3, #0xFF    ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acabó y vuelve al inicio
		ADD		R0, R0, #1   ; Suma 1 a R0
		ROR		R4, R3, R2   ; Aplica ROR entre la letra y la llave
		STRB		R4, [R1] ; Almacena la letra decodificada en la RAM
		ADD		R1, R1, #1   ; Suma 1 a R1
		B		CicloROR     ; Repite el ciclo
