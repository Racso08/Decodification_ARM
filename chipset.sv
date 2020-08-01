module chipset (	input logic [31:0] DataAdr,
						input logic MemWrite,
						output logic WEram, WEtimer, 
						output logic select_zero, select_one);
						
	always_comb
		
		case(MemWrite)
		
		0:
			begin
			
				if(DataAdr < 'h400)	//RAM
					begin
						WEtimer = 0;
						WEram = 0;
						select_zero = 1;
						select_one = 0;
					end
					
				else if (DataAdr >= 'h400 && DataAdr < 'h801)	//ROM
					begin
						WEtimer = 0;
						WEram = 0;
						select_zero = 0;
						select_one = 1;
					end
				
				else	//Timer
					begin
						WEtimer = 0;
						WEram = 0;
						select_zero = 0;
						select_one =0;
					end
		
			end
			
		1:
			begin
			
				if(DataAdr < 'h400)	//RAM
					begin
						WEtimer = 0;
						WEram = 1;
						select_zero = 1;
						select_one = 1;
					end
					
				else if (DataAdr >= 'h400 && DataAdr < 'h801)	//ROM
					begin
						WEtimer = 0;
						WEram = 0;
						select_zero = 1;
						select_one = 1;
					end
				
				else	//Timer
					begin
						WEtimer = 1;
						WEram = 0;
						select_zero = 1;
						select_one =1;
					end
		
			end
			
	endcase
	
endmodule 