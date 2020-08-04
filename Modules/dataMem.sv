module dataMem (input logic clk, we,
					 input logic [31:0] a, wd,
					 output logic [31:0] rd);
				
	logic [31:0] RAM[255:0];
	
	initial
		$readmemh("C:/Users/skryf/DataMemory.txt", RAM);

		assign rd = RAM[a[31:2]];

		always_ff @(negedge clk)
			if (we) RAM[a[31:2]] <= wd;
	
endmodule 