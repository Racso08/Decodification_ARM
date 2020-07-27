module unidad_logico_aritmetica_test();
	logic[3:0] numero1, numero2, resultado;
	logic[3:0] ALUControl;
	logic flagNegativo;
	logic flagCero;
	logic flagOverflow;
	logic flagCarry;



	unidad_logico_aritmetica #(4) PRUEBA(numero1, numero2, ALUControl, resultado,flagNegativo,flagCero,flagOverflow,flagCarry);
	
	initial begin
	
	
	//--------------------------------------------AND TESTS-------------------------------------------------------------------------

	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	
	ALUControl = 4'b0000;//AND

	#15;
	assert(resultado === 4'b0010) $display("Prueba 1 AND correcta"); else $display("Deteccion de error en la operacion 1 AND");
	
	
	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	

	#15;
	assert(resultado === 4'b1000) $display("Prueba 2 AND correcta"); else $display("Deteccion de error en la operacion 2 AND");
	
	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;
	


	#15;
	assert(resultado === 4'b0010) $display("Prueba 3 AND correcta"); else $display("Deteccion de error en la operacion 3 AND");
	

	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;
	


	#15;
	assert(resultado === 4'b0011) $display("Prueba 4 AND correcta"); else $display("Deteccion de error en la operacion 4 AND");
	
	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;
	


	#15;
	assert(resultado === 4'b0101) $display("Prueba 5 AND correcta"); else $display("Deteccion de error en la operacion 5 AND");
	
	
	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	


	#15;
	assert(resultado === 4'b0100) $display("Prueba 6 AND correcta"); else $display("Deteccion de error en la operacion 6 AND");
	
	//------------------------------PRUEBAS OR------------------------------------------------------------------
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	
	ALUControl = 4'b0001;//OR

	#15;
	assert(resultado === 4'b1110) $display("Prueba 1 OR correcta"); else $display("Deteccion de error en la operacion 1 OR");
	
	
	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	
	#15;
	assert(resultado === 4'b1110) $display("Prueba 2 OR correcta"); else $display("Deteccion de error en la operacion 2 OR");
	
	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;
	
	#15;
	assert(resultado === 4'b0111) $display("Prueba 3 OR correcta"); else $display("Deteccion de error en la operacion 3 OR");
	
	
	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;
	
	#15;
	assert(resultado === 4'b1111) $display("Prueba 4 OR correcta"); else $display("Deteccion de error en la operacion 4 OR");
	
	
	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;
	
	
	#15;
	assert(resultado === 4'b0101) $display("Prueba 5 OR correcta"); else $display("Deteccion de error en la operacion 5 OR");
	
		
	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	#15;
	assert(resultado === 4'b0110) $display("Prueba 6 OR correcta"); else $display("Deteccion de error en la operacion 6 OR");
		
	
	//------------------------------PRUEBAS XOR------------------------------------------------------------------
	ALUControl = 4'b0010;//XOR
	
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	#15;
	assert(resultado === 4'b1100) $display("Prueba 1 XOR correcta"); else $display("Deteccion de error en la operacion 1 XOR");

	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;

	
	#15;
	assert(resultado === 4'b0110) $display("Prueba 2 XOR correcta"); else $display("Deteccion de error en la operacion 2 XOR");
			
	
	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;

	
	#15;
	assert(resultado === 4'b0101) $display("Prueba 3 XOR correcta"); else $display("Deteccion de error en la operacion 3 XOR");
		

	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;


	#15;
	assert(resultado === 4'b1100) $display("Prueba 4 XOR correcta"); else $display("Deteccion de error en la operacion 4 XOR");
			
			
	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	#15;
	assert(resultado === 4'b0000) $display("Prueba 5 XOR correcta"); else $display("Deteccion de error en la operacion 5 XOR");
			

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	

	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 6 XOR correcta"); else $display("Deteccion de error en la operacion 6 XOR");
		
			
	
	//------------------------------PRUEBAS NOT------------------------------------------------------------------
	ALUControl = 4'b0011;//NOT
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;

	
	#15;
	assert(resultado === 4'b0101) $display("Prueba 1 NOT correcta"); else $display("Deteccion de error en la operacion 1 NOT");
	

	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;

	
	#15;
	assert(resultado === 4'b0001) $display("Prueba 2 NOT correcta"); else $display("Deteccion de error en la operacion 2 NOT");
	
	
	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;

	
	#15;
	assert(resultado === 4'b1000) $display("Prueba 3 NOT correcta"); else $display("Deteccion de error en la operacion 3 NOT");
	

	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;

	
	#15;
	assert(resultado === 4'b1000) $display("Prueba 4 NOT correcta"); else $display("Deteccion de error en la operacion 4 NOT");
	

	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	
	#15;
	assert(resultado === 4'b1010) $display("Prueba 5 NOT correcta"); else $display("Deteccion de error en la operacion 5 NOT");
	

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	
	#15;
	assert(resultado === 4'b1001) $display("Prueba 6 NOT correcta"); else $display("Deteccion de error en la operacion 6 NOT");
	

	
	//------------------------------PRUEBAS A RIGHT SHIFT LOGICAL------------------------------------------------------------------
	
	ALUControl = 4'b0100;//A Right shift
 
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	
	#15;
	assert(resultado === 4'b0101) $display("Prueba 1 A RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 1 A RIGHT SHIFT LOGICAL");
		

	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;

	
	#15;
	assert(resultado === 4'b0111) $display("Prueba 2 A RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 2 A RIGHT SHIFT LOGICAL");
		
	
	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;

	
	#15;
	assert(resultado === 4'b0011) $display("Prueba 3 A RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 3 A RIGHT SHIFT LOGICAL");
		

	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;

	
	#15;
	assert(resultado === 4'b0011) $display("Prueba 4 A RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 4 A RIGHT SHIFT LOGICAL");
		

	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 5 A RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 5 A RIGHT SHIFT LOGICAL");
		

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	#15;
	assert(resultado === 4'b0011) $display("Prueba 6 A RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 6 A RIGHT SHIFT LOGICAL");
		
	
	//------------------------------PRUEBAS A LEFT SHIFT LOGICAL-----------------------------------------------------------------
	
	ALUControl = 4'b0101;//A Left shift
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	
	#15;
	assert(resultado === 4'b0100) $display("Prueba 1 A LEFT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 1 A LEFT SHIFT LOGICAL");
	


	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;

	
	#15;
	assert(resultado === 4'b1100) $display("Prueba 2 A LEFT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 2 A LEFT SHIFT LOGICAL");
	
	
	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;

	
	#15;
	assert(resultado === 4'b1110) $display("Prueba 3 A LEFT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 3 A LEFT SHIFT LOGICAL");
	

	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;

	
	#15;
	assert(resultado === 4'b1110) $display("Prueba 4 A LEFT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 4 A LEFT SHIFT LOGICAL");
	

	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	
	#15;
	assert(resultado === 4'b1010) $display("Prueba 5 A LEFT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 5 A LEFT SHIFT LOGICAL");
	

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
 
	
	#15;
	assert(resultado === 4'b1100) $display("Prueba 6 A LEFT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 6 A LEFT SHIFT LOGICAL");
	
	
	//------------------------------PRUEBAS B RIGTH SHIFT LOGICAL-----------------------------------------------------------------
	
	
	ALUControl = 4'b0110;//B Right shift
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;

	
	#15;
	assert(resultado === 4'b0011) $display("Prueba 1 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 1 B RIGHT SHIFT LOGICAL");
	

	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	
	 
	#15;
	assert(resultado === 4'b0100) $display("Prueba 2 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 2 B RIGHT SHIFT LOGICAL");
	

	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;

	
	#15;
	assert(resultado === 4'b0001) $display("Prueba 3 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 3 B RIGHT SHIFT LOGICAL");
	

	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;

	
	#15;
	assert(resultado === 4'b0101) $display("Prueba 4 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 4 B RIGHT SHIFT LOGICAL");
	

	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 5 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 5 B RIGHT SHIFT LOGICAL");
	

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 6 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 6 B RIGHT SHIFT LOGICAL");
	
	 
	//------------------------------PRUEBAS B LEFT SHIFT LOGICAL-----------------------------------------------------------------
	
	ALUControl = 4'b0111;//B Left shift
	
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	
	#15;
	assert(resultado === 4'b1100) $display("Prueba 1 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 1 B RIGHT SHIFT LOGICAL");
	


	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;

	
	#15;
	assert(resultado === 4'b0000) $display("Prueba 2 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 2 B RIGHT SHIFT LOGICAL");
	
	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;


	#15;
	assert(resultado === 4'b0100) $display("Prueba 3 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 3 B RIGHT SHIFT LOGICAL");
	
	
	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;

	
	#15;
	assert(resultado === 4'b0110) $display("Prueba 4 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 4 B RIGHT SHIFT LOGICAL");
	

	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	
	#15;
	assert(resultado === 4'b1010) $display("Prueba 5 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 5 B RIGHT SHIFT LOGICAL");
	
		

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	
	#15;
	assert(resultado === 4'b1000) $display("Prueba 6 B RIGHT SHIFT LOGICAL correcta"); else $display("Deteccion de error en la operacion 6 B RIGHT SHIFT LOGICAL");
	
	
	//------------------------------PRUEBAS SUMADOR-----------------------------------------------------------------
	
		
	ALUControl = 4'b1000;//Sumador
	
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	
	#15;
	assert(resultado === 4'b0000) $display("Prueba 1 SUMA correcta"); else $display("Deteccion de error en la operacion 1 SUMA");


	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	
	
	#15;
	assert(resultado === 4'b0110) $display("Prueba 2 SUMA correcta"); else $display("Deteccion de error en la operacion 2 SUMA");
	

	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;
	
	
	#15;
	assert(resultado === 4'b1001) $display("Prueba 3 SUMA correcta"); else $display("Deteccion de error en la operacion 3 SUMA");
	


	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;

	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 4 SUMA correcta"); else $display("Deteccion de error en la operacion 4 SUMA");
	

	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	
	#15;
	assert(resultado === 4'b1010) $display("Prueba 5 SUMA correcta"); else $display("Deteccion de error en la operacion 5 SUMA");
	
	

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	
	#15;
	assert(resultado === 4'b1010) $display("Prueba 6 SUMA correcta"); else $display("Deteccion de error en la operacion 6 SUMA");
	
	
	
	//------------------------------PRUEBAS SUMADOR-----------------------------------------------------------------
	
	
	
	ALUControl = 4'b1001;//Restador
	
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	
	#15;
	assert(resultado === 4'b0100) $display("Prueba 1 RESTA correcta"); else $display("Deteccion de error en la operacion 1 RESTA");
	


	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	
	
	#15;
	assert(resultado === 4'b0110) $display("Prueba 2 RESTA correcta"); else $display("Deteccion de error en la operacion 2 RESTA");
	

	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;


	
	#15;
	assert(resultado === 4'b0101) $display("Prueba 3 RESTA correcta"); else $display("Deteccion de error en la operacion 3 RESTA");
	
	
	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;

	
	#15;
	assert(resultado === 4'b1100) $display("Prueba 4 RESTA correcta"); else $display("Deteccion de error en la operacion 4 RESTA");
	

	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	
	#15;
	assert(resultado === 4'b0000) $display("Prueba 5 RESTA correcta"); else $display("Deteccion de error en la operacion 5 RESTA");
	

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 6 RESTA correcta"); else $display("Deteccion de error en la operacion 6 RESTA");
	
	
	//------------------------------PRUEBAS A RIGHT SHIFT ARITHMETIC-----------------------------------------------------------------
	
	ALUControl = 4'b1010;//A Right shift
	
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;

	#15;
	assert(resultado === 4'b1101) $display("Prueba 1 A RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 1 A RIGHT SHIFT ARITHMETIC");
	

	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	
	
	#15;
	assert(resultado === 4'b1111) $display("Prueba 2 A RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 2 A RIGHT SHIFT ARITHMETIC");
	

	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;

	
	#15;
	assert(resultado === 4'b0011) $display("Prueba 3 A RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 3 A RIGHT SHIFT ARITHMETIC");
		

	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;
	
	
	#15;
	assert(resultado === 4'b0011) $display("Prueba 4 A RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 4 A RIGHT SHIFT ARITHMETIC");
		


	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;
	
	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 5 A RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 5 A RIGHT SHIFT ARITHMETIC");
		


	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	
	#15;
	assert(resultado === 4'b0011) $display("Prueba 6 A RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 6 A RIGHT SHIFT ARITHMETIC");
		
	
	//------------------------------PRUEBAS A LEFT SHIFT ARITHMETIC-----------------------------------------------------------------
	
	ALUControl = 4'b1011;//A Left shift
		
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;
	
	
	#15;
	assert(resultado === 4'b0100) $display("Prueba 1 A LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 1 A LEFT SHIFT ARITHMETIC");
	


	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	
	
	#15;
	assert(resultado === 4'b1100) $display("Prueba 2 A LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 2 A LEFT SHIFT ARITHMETIC");
	

	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;
	
	
	#15;
	assert(resultado === 4'b1110) $display("Prueba 3 A LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 3 A LEFT SHIFT ARITHMETIC");
		


	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;
	
	
	#15;
	assert(resultado === 4'b1110) $display("Prueba 4 A LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 4 A LEFT SHIFT ARITHMETIC");
		


	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;
	
	
	#15;
	assert(resultado === 4'b1010) $display("Prueba 5 A LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 5 A LEFT SHIFT ARITHMETIC");
		


	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	
	#15;
	assert(resultado === 4'b1100) $display("Prueba 6 A LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 6 A LEFT SHIFT ARITHMETIC");
		
		
	//------------------------------PRUEBAS B RIGHT SHIFT ARITHMETIC-----------------------------------------------------------------
	
	ALUControl = 4'b1100;//B Right shift
	
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;

	#15;
	assert(resultado === 4'b0011) $display("Prueba 1 B RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 1 B RIGHT SHIFT ARITHMETIC");
		

	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	
	
	#15;
	assert(resultado === 4'b1100) $display("Prueba 2 B RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 2 B RIGHT SHIFT ARITHMETIC");
		

	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;
	
	
	#15;
	assert(resultado === 4'b0001) $display("Prueba 3 B RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 3 B RIGHT SHIFT ARITHMETIC");
	


	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;
	
	
	#15;
	assert(resultado === 4'b1101) $display("Prueba 4 B RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 4 B RIGHT SHIFT ARITHMETIC");
		


	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;

	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 5 B RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 5 B RIGHT SHIFT ARITHMETIC");
		

	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	#15;
	assert(resultado === 4'b0010) $display("Prueba 6 B RIGHT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 6 B RIGHT SHIFT ARITHMETIC");
			
	//------------------------------PRUEBAS B RIGHT SHIFT ARITHMETIC-----------------------------------------------------------------	
	
	
	ALUControl = 4'b1101;//B Left shift
	
	numero1 = 4'b1010;//PRUEBA 1
	numero2 = 4'b0110;

	#15;
	assert(resultado === 4'b1100) $display("Prueba 1 B LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 1 B LEFT SHIFT ARITHMETIC");
	

	numero1 = 4'b1110;//PRUEBA 2
	numero2 = 4'b1000;
	
	
	#15;
	assert(resultado === 4'b0000) $display("Prueba 2 B LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 2 B LEFT SHIFT ARITHMETIC");
		

	numero1 = 4'b0111;//PRUEBA 3
	numero2 = 4'b0010;

	#15;
	assert(resultado === 4'b0100) $display("Prueba 3 B LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 3 B LEFT SHIFT ARITHMETIC");
	

	numero1 = 4'b0111;//PRUEBA 4
	numero2 = 4'b1011;

	
	#15;
	assert(resultado === 4'b0110) $display("Prueba 4 B LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 4 B LEFT SHIFT ARITHMETIC");
		

	numero1 = 4'b0101;//PRUEBA 5
	numero2 = 4'b0101;
	
	
	#15;
	assert(resultado === 4'b1010) $display("Prueba 5 B LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion 5 B LEFT SHIFT ARITHMETIC");
		


	numero1 = 4'b0110;//PRUEBA 6
	numero2 = 4'b0100;
	
	
	#15;
	assert(resultado === 4'b1000) $display("Prueba 6 B LEFT SHIFT ARITHMETIC correcta"); else $display("Deteccion de error en la operacion6 B LEFT SHIFT ARITHMETIC");
		
	
	//-----------------------------------------------FIN---------------------------------------------------------------
	end
	
endmodule 