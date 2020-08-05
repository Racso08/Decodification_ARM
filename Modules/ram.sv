module ram (input logic clk, we,
				input logic [7:0] a, wd,
				output logic [7:0] rd);
				
	logic [7:0] RAM[255:0];
	
	initial
		$readmemh("C:/arm/RAM.txt", RAM);

		assign rd = RAM[a[7:0]];

		always_ff @(negedge clk)
			if (we) RAM[a[7:0]] <= wd;
	
endmodule 