module compuerta_xor #(parameter N = 8) (input logic [N-1:0] a,b,
													  output logic [N-1:0] xor_out );
													  
assign xor_out = a ^ b;

endmodule

