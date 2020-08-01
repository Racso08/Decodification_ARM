module flag_carry #(parameter N = 8) 
						(input logic carry_in_suma, carry_in_resta,
						 input logic[3:0] ALU_Control, 
						 output logic carry_output);
			
assign carry_output = (carry_in_suma & (ALU_Control == 4'b1000)) | (carry_in_resta & (ALU_Control == 4'b1001));
													
endmodule 