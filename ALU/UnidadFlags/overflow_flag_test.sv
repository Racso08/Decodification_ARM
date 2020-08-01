module overflow_flag_test();
	logic[3:0] num1, num2, result;
	logic[3:0] ALUControl;
	logic overflow;

	
	flag_overflow DUT(num1[3], num2[3], result[3], ALUControl, overflow);
	
	
	initial begin
		ALUControl = 4'b1000;  // suma
		
		num1 = 4'b1001;
		num2 = 4'b1010; 
		result = 4'b0011; 
		#10;
		assert(overflow === 1) else $error("Deteccion de overflow fallo");
	
		num1 = 4'b0111;
		num2 = 4'b0110; 
		result = 4'b1011;
		#10;
		assert(overflow === 1) else $error("Deteccion de overflow fallo");

		
		ALUControl = 4'b1001; // resta
		
		num1 = 4'b0111;
		num2 = 4'b0110; 
		result = 4'b0011; 
		#10; 
		assert(overflow === 1) else $error("Deteccion de overflow fallo");
	
		
		num1 = 4'b1001;
		num2 = 4'b0010; 
		result = 4'b0011; 
		#10;
		assert(overflow === 1) else $error("Deteccion de overflow fallo");

		
	end

endmodule 
