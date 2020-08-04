module instructionMem_tb();

	logic [31:0] PC, Instr;
	
	instructionMem DUT(PC, Instr);
	
	initial begin
	
		PC = 32'd0;
		
		#10;
		
		PC = 32'd4;
		
		#10;
		
		PC = 32'd8;
		
		#10;
		
		PC = 32'd12;
		
		#10;
		
		PC = 32'd16;
	
	end

endmodule 