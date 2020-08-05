`timescale 1 ps / 1 ps
module testbench();

logic clk;
logic reset;
logic set;
logic [31:0] WriteData, DataAdr;
logic MemWrite;

// instantiate device to be tested
top dut(clk, reset, set, WriteData, DataAdr, MemWrite);

// initialize test
initial
	begin
		reset <= 1; # 5; reset <= 0;
		set <= 1; # 5; set <= 0;
	end
	
// generate clock to sequence tests
always
	begin
		clk <= 1; # 5; 
		clk <= 0; # 5;
	end 

endmodule 	