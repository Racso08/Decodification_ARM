module unidad_logico_aritmetica
	#(parameter N = 8)
		(input logic [N-1:0] operador1, operador2,
		input logic [3:0] ALUControl,
		output logic [N-1:0] resultadoFinal,
		output logic flagNegativo,
		output logic flagCero,
		output logic flagOverflow,
		output logic flagCarry);
			
			logic [N-1:0] and_resultado, or_resultado, xor_resultado, not_resultado;
			logic [N-1:0] correr_izq_al_resultado, correr_der_al_resultado, correr_izq_bl_resultado, correr_der_bl_resultado;
			logic [N-1:0] suma_resultado, resta_resultado;
			logic carry_out_suma;
			logic carry_out_resta;
			logic signed [N-1:0] correr_izq_aa_resultado, correr_der_aa_resultado, correr_izq_ba_resultado, correr_der_ba_resultado;
			logic [N-1:0] resultado1, resultado2;
		
			compuerta_and #(N) And(operador1, operador2, and_resultado); 
			compuerta_or #(N) Or(operador1, operador2, or_resultado); 
			compuerta_xor #(N) Xor(operador1, operador2, xor_resultado); 
			compuerta_not #(N) Not(operador1, not_resultado); 
			
			correr_derecha_logico #(N) RAShiftL(operador1, correr_der_al_resultado);
			correr_izquierda_logico #(N) LAShiftL(operador1, correr_izq_al_resultado);
			correr_derecha_logico #(N) RBShiftL(operador2, correr_der_bl_resultado);
			correr_izquierda_logico #(N) LBShiftL(operador2, correr_izq_bl_resultado);
			
			mux3a8 #(N) MuxL(and_resultado, or_resultado, xor_resultado, not_resultado, correr_der_al_resultado, correr_izq_al_resultado,
			correr_der_bl_resultado, correr_izq_bl_resultado, ALUControl[2:0], resultado1);
			
			sumador #(N) Add(operador1, operador2, 1'b0, suma_resultado, carry_out_suma);
			restador #(N) Minus(operador1, operador2, resta_resultado, carry_out_resta);
			
			correr_derecha_aritmetico #(N) RAShiftA(operador1, correr_der_aa_resultado);
			correr_izquierda_aritmetico #(N) LAShiftA(operador1, correr_izq_aa_resultado);
			correr_derecha_aritmetico #(N) RBShiftA(operador2, correr_der_ba_resultado);
			correr_izquierda_aritmetico #(N) LBShiftA(operador2, correr_izq_ba_resultado);
			
			mux3a8 #(N) MuxA(suma_resultado, resta_resultado, correr_der_aa_resultado, correr_izq_aa_resultado, 
			correr_der_ba_resultado, correr_izq_ba_resultado, 1'bz, 1'bz, ALUControl[2:0], resultado2);
			
			mux1a2 #(N) MuxR(resultado1, resultado2, ALUControl[3], resultadoFinal);
			
			flag_negativo #(N) Fnegativo(resultadoFinal[N-1], ALUControl[3], flagNegativo);
			flag_cero #(N) FCero(resultadoFinal, ALUControl[3], flagCero);
			flag_overflow #(N) FOverflow(operador1[N-1], operador2[N-1], resultadoFinal[N-1], ALUControl, flagOverflow);
			flag_carry #(N) FCarry(carry_out_suma, carry_out_resta, ALUControl, flagCarry);
					
endmodule 