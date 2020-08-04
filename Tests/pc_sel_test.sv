module pc_sel_test();


	logic clk,InstructionAdr;
	logic PC_output, instrMem_output;

	PC_selection #(32) DUT(clk,InstructionAdr,PC_output, instrMem_output);
	
	initial begin
		
		clk = 0;
		
	end
	always begin
		#50 clk = !clk;
	end

endmodule 