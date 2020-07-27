module correr_derecha_aritmetico_test();
	
	logic signed[3:0] num;
	logic signed[3:0] result;
	
	correr_derecha_aritmetico #(4) DUT(num, result);

	
	initial begin 
	
		num = 4'b1000;		
		#10;
		
	end

endmodule 