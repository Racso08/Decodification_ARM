module divisor #(parameter N = 8) (input logic [N-1:0] a,b,
													  output logic [N-1:0] div_out );

assign div_out = a / b;

endmodule
