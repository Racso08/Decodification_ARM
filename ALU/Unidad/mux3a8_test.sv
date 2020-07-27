module mux3a8_test();
	
	logic[7:0] num1, num2, num3, num4, num5, num6, num7, num8;
	logic[2:0] control;
	logic[7:0] result;
	
	mux4a16 #(8) DUT(num1, num2, num3, num4, num5, num6, num7, num8, control, result);

	
	initial begin 
		num1 = 8'd0;
		num2 = 8'd1;
		num3 = 8'd2;
		num4 = 8'd3;
		num5 = 8'd4;
		num6 = 8'd5;
		num7 = 8'd6;
		num8 = 8'd7;
		
		control = 3'b000;		
		#10;
		
		control = 3'b001;
		#10;
		
		control = 3'b010;
		#10;
		
		control = 3'b011;
		#10;
		
		control = 3'b100;
		#10;
		
		control = 3'b101;
		#10;
		
		control = 3'b110;
		#10;
		
		control = 3'b111;
		#10;
		
	
	end

endmodule 