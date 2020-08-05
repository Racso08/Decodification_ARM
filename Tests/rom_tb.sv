module rom_tb();

	logic [7:0] address, data;

	rom dut(address, data);
	
	initial begin
	
		address = 7'd0;
		#10;
		address = 7'd1;
		#10;
		address = 7'd2;
		#10;
		address = 7'd3;
		#10;
		address = 7'd4;
		#10;
		address = 7'd5;
		#10;
	
	end

endmodule 