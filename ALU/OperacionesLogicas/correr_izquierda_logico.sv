module correr_izquierda_logico #(parameter N = 8)(input logic [N-1:0] A,
													  output logic [N-1:0] shift_left_out );

assign shift_left_out = A << 1;


endmodule 
