module restador #(parameter N = 8) 
					  (input logic [N-1:0] a, b,
					   output logic [N-1:0] rest_out,
						output logic cout);

assign {cout, rest_out} = a - b;

endmodule
