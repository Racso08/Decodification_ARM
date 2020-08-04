module flag_carry (input logic carry_in_suma, carry_in_resta,
						 input logic [2:0] ALU_Control, 
						 output logic carry_output);
			
	assign carry_output = ~((carry_in_suma & (ALU_Control == 3'b000)) | (carry_in_resta & (ALU_Control == 3'b001)));
													
endmodule 