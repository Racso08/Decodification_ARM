module messageMem (input logic [31:0] a,
							  output logic [31:0] rd);
				
	logic [31:0] ROM[255:0];

	initial
		$readmemh("C:/Users/skryf/MessageMemory.txt", ROM);
		assign rd = ROM[a[31:2]];

endmodule 