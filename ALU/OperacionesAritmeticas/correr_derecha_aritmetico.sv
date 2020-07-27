module correr_derecha_aritmetico #(parameter N = 8)(input logic signed [N-1:0] A,
													  output logic signed [N-1:0] shift_right_out);
													  
assign shift_right_out = signed'(A) >>> 1;

endmodule 