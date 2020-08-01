module chipset_tb();

logic [31:0] DataAdr;
logic MemWrite, WEram, WEtimer, select_zero, select_one;

chipset DUT(DataAdr, MemWrite, WEram, WEtimer, select_zero, select_one);

initial
	begin
	
		MemWrite = 0; 
		DataAdr = 'h020;
		#20;
		
		MemWrite = 0; 
		DataAdr = 'h150;
		#20;
		
		MemWrite = 0; 
		DataAdr = 'h220;
		#20;
		
		MemWrite = 1; 
		DataAdr = 'h020;
		#20;
		
		MemWrite = 1; 
		DataAdr = 'h150;
		#20;
		
		MemWrite = 1; 
		DataAdr = 'h220;
		#20;
		
	end
	
endmodule 