module flag_cero #(parameter N = 32) (input logic [N-1:0] num,
												  input logic [1:0] ALUControl,
												  output logic zero_output);
													
	assign zero_output = (num == '0) & (ALUControl == 2'b00);
	
endmodule 