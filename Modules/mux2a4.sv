module mux2a4 #(parameter N = 32) (input logic[7:0] result1, result2, result3,
											  input logic[1:0] control,
											  output logic[31:0] out);
	always_comb
		case(control)
			3'd0 : out = {24'b0, result1};
			3'd1 : out = {24'b0, result2};
			3'd2 : out = {24'b0, result3};
			default : out = 'z;
		endcase
		
endmodule 