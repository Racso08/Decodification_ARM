module dataMem_tb();

	logic [31:0] address, writeData, readData;
	logic clk, writeEnable;
	
	dataMem DUT(clk, writeEnable, address, writeData, readData);
	
	initial begin
	
		address = 32'd0;
		writeData = 32'd32;
		clk = 1'b1;
		writeEnable = 1'b0;
		
		#10;
		
		writeEnable = 1'b1;
		clk = 1'b0;
		
		#10;
		
		writeEnable = 1'b0;
		address = 32'd4;
		clk = 1'b1;
		writeData = 32'd99;
		
		#10;
		
		writeEnable = 1'b1;
		clk = 1'b0;
		
		#10;
		
		writeEnable = 1'b0;
		clk = 1'b1;
	
	end

endmodule 