module PC_selection  #(parameter N = 32) (	input logic clk,rst,
															input logic [N-1:0] InstructionAdr,
															output logic [N-1:0] instrMem_output);
		
		logic[N-1:0] PC_output;
		

		register #(N) PC(clk,rst,InstructionAdr,PC_output);
		
		instructionMem Mem(PC_output,instrMem_output);
		
		
			
				
endmodule 