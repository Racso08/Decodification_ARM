module overflow_flag_test();

	logic[3:0] num1, num2, result;
	logic[1:0] ALUControl;
	logic overflow;

	
	flag_overflow DUT(num1[3], num2[3], result[3], ALUControl, overflow);
	
	
	initial begin
	
		ALUControl = 2'b00;  // suma
		
		num1 = 4'b1001;
		num2 = 4'b1010; 
		#10;
		
		assert(overflow === 1) else $error("Deteccion de overflow fallo");
	
		num1 = 4'b0111;
		num2 = 4'b0110; 
		#10;
		
		assert(overflow === 1) else $error("Deteccion de overflow fallo");

		
		ALUControl = 4'b01; // resta
		
		num1 = 4'b0111;
		num2 = 4'b0110;  
		#10; 
		
		assert(overflow === 1) else $error("Deteccion de overflow fallo");
	
		
		num1 = 4'b1001;
		num2 = 4'b0010; 
		#10;
		
		assert(overflow === 1) else $error("Deteccion de overflow fallo");

	end

endmodule 
