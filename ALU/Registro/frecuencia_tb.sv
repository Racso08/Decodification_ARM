module frecuencia_tb ();

logic clk;
logic reset;
logic [3:0]d;
logic [3:0]control;
logic out;

logic[7:0] numero1, numero2, resultado;
logic[3:0] ALUControl;
logic flagNegativo;
logic flagCero;
logic flagOverflow;
logic flagCarry;

register #(3) PRIMERO (clk,reset,d,control);

unidad_logico_aritmetica #(8) PRUEBA(numero1, numero2, control, resultado,flagNegativo,flagCero,flagOverflow,flagCarry);

register #(3) SEGUNDO (~clk,reset,resultado,out);


initial begin
	clk=0;
	reset = 0;
end

	always #5 clk =! clk;
	
initial begin 
	d = 000;
	numero1 = 8'b10110101;
	numero2 = 8'b10101011;
end
	
endmodule 