module instructionMem (input logic [31:0] a,
							  output logic [31:0] rd);
				
	logic [31:0] RAM[255:0];

	initial
		$readmemh("C:/Users/skryf/DecoHEX.txt", RAM);
		assign rd = RAM[a[31:2]];

endmodule 