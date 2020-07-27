module flag_negativo #(parameter N = 8)(
							  input logic ultimo_bit, ALUControl,
							  output logic resultado);
										
assign resultado = ultimo_bit & ALUControl;

endmodule 