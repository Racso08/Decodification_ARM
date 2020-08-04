module corrimiento_circular_test();

	logic [7:0] a, b, c;
 
	corrimiento_circular #(8) DUT(a, b, c);
 
	initial begin
 
		#10 a = 0; b = 1;
		#10 a = 4; b = 5;
		#10 a = 12; b = 6;
		#10 a = 45; b = 7;

	end
	
endmodule 