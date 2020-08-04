module unidad_logico_aritmetica #(parameter N = 32) (input logic [N-1:0] operador1, operador2,
																	  input logic [1:0] ALUControl,
																	  output logic [N-1:0] resultadoFinal,
																     output logic flagNegativo,
																	  output logic flagCero,
																	  output logic flagOverflow,
																	  output logic flagCarry);

			
	logic [N-1:0] xor_resultado, suma_resultado, resta_resultado;
	logic [7:0] corrimiento_circular_resultado;
	logic carry_out_suma, carry_out_resta;

			
	sumador #(N) Add(operador1, operador2, 1'b0, suma_resultado, carry_out_suma);
	restador #(N) Minus(operador1, operador2, resta_resultado, carry_out_resta);
	compuerta_xor #(N) Xor(operador1, operador2, xor_resultado);
	corrimiento_circular #(8) CirShift(operador1[7:0], operador2[7:0], corrimiento_circular_resultado);
			
	mux2a4 #(N) Mux(suma_resultado, resta_resultado, xor_resultado, {24'b0, corrimiento_circular_resultado}, ALUControl, resultadoFinal);
			
	flag_negativo Fnegativo(resultadoFinal[N-1], !ALUControl[1], flagNegativo);
	flag_cero #(N) FCero(resultadoFinal, !ALUControl[1], flagCero);
	flag_overflow FOverflow(operador1[N-1], operador2[N-1], resultadoFinal[N-1], ALUControl, flagOverflow);
	flag_carry FCarry(carry_out_suma, carry_out_resta, ALUControl, flagCarry);
					
endmodule 