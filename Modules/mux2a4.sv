module mux2a4 #(parameter N = 32) (input logic[N-1:0] result1, result2, result3,
											  input logic[1:0] control,
											  output logic[N-1:0] out);
	always_comb
		case(control)
			3'd0 : out = result1;
			3'd1 : out = result2;
			3'd2 : out = result3;
			default : out = 'z;
		endcase
		
endmodule 