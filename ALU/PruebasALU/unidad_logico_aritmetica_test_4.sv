module unidad_logico_aritmetica_test_4();
	logic[3:0] numero1, numero2, resultado;
	logic[3:0] ALUControl;
	logic flagNegativo;
	logic flagCero;
	logic flagOverflow;
	logic flagCarry;



	unidad_logico_aritmetica #(4) PRUEBA(numero1, numero2, ALUControl, resultado,flagNegativo,flagCero,flagOverflow,flagCarry);
	
	initial begin
	
	numero1 = 4'b0111;
	numero2 = 4'b1011;
	

	ALUControl = 4'b0000;//AND

	#15;
	assert(resultado === 4'b0011) $display("Prueba AND correcta"); else $display("Deteccion de error en la operacion AND");
	
	ALUControl = 4'b0001;//OR

	#15;
	assert(resultado === 4'b1111) $display("Prueba OR correcta"); else $display("Deteccion de error en la operacion OR");
		
	ALUControl = 4'b0010;//XOR

	#15;
	assert(resultado === 4'b1100) $display("Prueba XOR correcta"); else $display("Deteccion de error en la operacion XOR");
			
	ALUControl = 4'b0011;//NOT

	#15;
	assert(resultado === 4'b1000) $display("Prueba NOT correcta"); else $display("Deteccion de error en la operacion NOT");
	
	ALUControl = 4'b0100;//A Right shift
 
	#15;
	assert(resultado === 4'b0011) $display("Prueba A RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion A RIGHT SHIFT LOGICAL");
		
	ALUControl = 4'b0101;//A Left shift
 
	#15;
	assert(resultado === 4'b1110) $display("Prueba A LEFT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion A LEFT SHIFT LOGICAL");
	
	ALUControl = 4'b0110;//B Right shift
	 
	#15;
	assert(resultado === 4'b0101) $display("Prueba B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion B RIGHT SHIFT LOGICAL");
	
	
	ALUControl = 4'b0111;//B Left shift
	
	#15;
	assert(resultado === 4'b0110) $display("Prueba B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion B RIGHT SHIFT LOGICAL");
	
		
		
	ALUControl = 4'b1000;//Sumador
	
	#15;
	assert(resultado === 4'b0010) $display("Prueba SUMA correcta"); else $display("Deteccion de error en la operacion SUMA");
	
	
	ALUControl = 4'b1001;//Restador
	
	#15;
	assert(resultado === 4'b1100) $display("Prueba RESTA correcta"); else $display("Deteccion de error en la operacion RESTA");
	
	
	ALUControl = 4'b1010;//A Right shift
	
	#15;
	assert(resultado === 4'b0011) $display("Prueba A RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion A RIGHT SHIFT ARITHMETIC");
		
	ALUControl = 4'b1011;//A Left shift
	
	#15;
	assert(resultado === 4'b1110) $display("Prueba A LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion A LEFT SHIFT ARITHMETIC");
		
	ALUControl = 4'b1100;//B Right shift
	
	#15;
	assert(resultado === 4'b1101) $display("Prueba B RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion B RIGHT SHIFT ARITHMETIC");
		
	ALUControl = 4'b1101;//B Left shift
	
	#15;
	assert(resultado === 4'b0110) $display("Prueba B LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion B LEFT SHIFT ARITHMETIC");
		
	end
	
endmodule 