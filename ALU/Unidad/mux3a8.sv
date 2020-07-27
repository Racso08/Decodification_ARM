module mux3a8 #(parameter N = 8)
		(input logic[N-1:0] result1, result2, result3, result4, result5, result6, result7, result8,
		input logic[2:0] control,
		output logic[N-1:0] out);
	
	always_comb
		case(control)
			3'd0 : out = result1;
			3'd1 : out = result2;
			3'd2 : out = result3;
			3'd3 : out = result4;
			3'd4 : out = result5;
			3'd5 : out = result6;
			3'd6 : out = result7;
			3'd7 : out = result8;
			default : out = 'z;
		endcase
		
endmodule 