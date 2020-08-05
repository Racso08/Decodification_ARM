module register #(parameter N = 32) (input clk, rst, set, we,
												 input [N-1:0] D,
												 output logic [N-1:0] Q);
												
	always_ff @(negedge clk or posedge rst or posedge set)
		if (rst) Q = 0;
		else if (set) Q = 1;
		else if (we) Q = D;
												
endmodule 