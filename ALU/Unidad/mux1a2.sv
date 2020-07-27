module mux1a2 #(parameter N = 8)
		(input logic[N-1:0] result1, result2,
		input logic control,
		output logic[N-1:0] out);
	
	always_comb
		case(control)
			1'b0 : out = result1;
			1'b1 : out = result2;
			default : out = 'z;
		endcase
		
endmodule 