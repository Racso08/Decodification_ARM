		;		Rutina que se encarga de verificar si se puede iniciar el proceso de decodificaci�n
		
Inicio	LDR		R0, =0x10C20 ; Carga direcci�n de memoria del Flip Flop en R0
		LDR		R1, [R0] ; Carga el dato almacenado del Flip Flop en R1
		CMP		R1, #1   ; Se verifica si la se�al del Flip Flop es 1
		BEQ		TipoDeco ; Si lo es, inicia el proceso de Decodificaci�n
		
Fin		LDR		R0, =0x10C20 ; Carga direcci�n de memoria del Flip Flop en R0
		MOV		R1, #0   ; Almacena en un 0 en R1
		STR		R1, [R0] ; Guarda el dato de R1 en el Flip Flop
		B		Inicio   ; Sino, vuelve al inicio
		
		;		Rutina que se encarga de verificar cual proceso de decodificaci�n a realizar
		
TipoDeco	LDR		R0, =0x10000 ; Carga direcci�n de memoria del ROM en R0
		LDR		R1, [R0] ; Carga el primer byte a R1, este indica el tipo de decodificaci�n a realizar
		CMP		R1, #0   ; Se verifica si el byte es 0
		BEQ		DecoXOR  ; Si lo es, inicia el proceso de Decodificaci�n XOR
		CMP		R1, #1   ; Se verifica si el byte es 1
		BEQ		DecoNOT  ; Si lo es, inicia el proceso de Decodificaci�n NOT
		CMP		R1, #3   ; Se verifica si el byte es 1
		BEQ		DecoROR  ; Si lo es, inicia el proceso de Decodificaci�n ROR
		B		Inicio   ; Sino, vuelve al inicio
		
		;		Rutina que se encarga de realizar la decodificaci�n XOR
		
DecoXOR	LDR		R1, =0x10420 ; Carga direcci�n de memoria del RAM en R1
		MOV		R2, #4   ; Almacena un 4 en R2
		MOV		R3, #0   ; Almacena un 0 en R3
		LDR		R4, [R0, R2] ; Carga el segundo byte del ROM a R4, esta es la llave del XOR
		ADD		R2, R2, #4   ; Suma 4 a R2
		
CicloXOR	LDR		R5, [R0, R2] ; Carga un byte del mensaje codificado a R5
		CMP		R5, #0xFF     ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acab� y vuelve al inicio
		ADD		R2, R2, #4   ; Suma 4 a R2
		EOR		R6, R5, R4   ; Aplica XOR entre la letra y la llave
		STR		R6, [R1, R3] ; Almacena la letra decodificada en la RAM
		ADD		R3, R3, #4   ; Suma 4 a R3
		B		CicloXOR     ; Repite el ciclo
		
		;		Rutina que se encarga de realizar la decodificaci�n NOT
		
DecoNOT	LDR		R1, =0x10420 ; Carga direcci�n de memoria del RAM en R1
		MOV		R2, #4   ; Almacena un 4 en R2
		MOV		R3, #0   ; Almacena un 0 en R3
		MOV		R4, #0xFF ; Carga un 0xFF a R4, esto para poder realizar la negaci�n utilizando XOR
		
CicloNOT	LDR		R5, [R0, R2] ; Carga un byte del mensaje codificado a R5
		CMP		R5, #0xFF     ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acab� y vuelve al inicio
		ADD		R2, R2, #4   ; Suma 4 a R2
		EOR		R6, R5, R4   ; Aplica XOR entre la letra y 0xFF, para negar los bits de R4
		STR		R6, [R1, R3] ; Almacena la letra decodificada en la RAM
		ADD		R3, R3, #4   ; Suma 4 a R3
		B		CicloNOT     ; Repite el ciclo
		
		;		Rutina que se encarga de realizar la decodificaci�n ROR
		
DecoROR	LDR		R1, =0x10420 ; Carga direcci�n de memoria del RAM en R1
		MOV		R2, #4   ; Almacena un 4 en R2
		MOV		R3, #0   ; Almacena un 0 en R3
		LDR		R4, [R0, R2] ; Carga el segundo byte del ROM a R4, esta es la cantidad de bits a rotar
		ADD		R2, R2, #4   ; Suma 4 a R2
		
CicloROR	LDR		R5, [R0, R2] ; Carga un byte del mensaje codificado a R5
		CMP		R5, #0xFF     ; Verifica si el byte es 0xFF
		BEQ		Fin	        ; Si es 0xFF, el mensaje acab� y vuelve al inicio
		ADD		R2, R2, #4   ; Suma 4 a R2
		ROR		R6, R5, R4   ; Aplica ROR entre la letra y la llave
		STR		R6, [R1, R3] ; Almacena la letra decodificada en la RAM
		ADD		R3, R3, #4   ; Suma 4 a R3
		B		CicloROR     ; Repite el ciclo
