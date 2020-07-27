module sumador #(parameter N = 8) (input logic [N-1:0] a, b,
										     input logic cin,
										     output logic [N-1:0] sum_out,
										     output logic cout);
										 
assign {cout, sum_out} = a + b + cin;

endmodule

