module flag_negativo (input logic ultimo_bit, ALUControl,
							 output logic resultado);
										
	assign resultado = ultimo_bit & ALUControl;

endmodule 