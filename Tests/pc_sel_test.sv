module pc_sel_test();


	logic clk,rst;
	logic [31:0] instrMem_output,InstructionAdr;

	PC_selection #(32) DUT(clk,rst,InstructionAdr,instrMem_output);
	
	initial begin

	
		InstructionAdr = 32'd0;
		
		clk = 0;
		
		rst = 0;
		
	end
<<<<<<< HEAD
	always begin
		#50 clk = !clk;
	end
=======


>>>>>>> master

endmodule 