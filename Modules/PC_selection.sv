module PC_selection  #(parameter N = 32) (	input logic clk,
															input logic [N-1:0] InstructionAdr
															output logic [N-1:0] PC_output, instrMem_output

		);
		
				
		register PC(clk,InstructionAdr,PC_output);
		
		intsructionMem (PC_output,instrMem_output);
		
		
			
				
endmodule 