module flag_negativo (input logic ultimo_bit,
							 input logic [1:0] ALUControl,
							 output logic resultado);
										
	assign resultado = ~(ultimo_bit & (ALUControl == 2'b00));

endmodule 