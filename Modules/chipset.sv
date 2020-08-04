module chipset #(parameter N=32)(input logic [N-1:0] DataAdr,
											input logic MemWrite,
											output logic WEram, WEtimer, 
											output logic select_zero, select_one);
						
	always_comb
		
		case(MemWrite)
		
		0:
			begin
			
				if(DataAdr >= 'h4000 && DataAdr <= 'h4400)	//RAM
					begin
						WEtimer = 0;
						WEram = 0;
						select_zero = 1;
						select_one = 0;
					end
					
				else if (DataAdr >= 'h4600 && DataAdr <= 'h5000)	//ROM
					begin
						WEtimer = 0;
						WEram = 0;
						select_zero = 0;
						select_one = 1;
					end
					
				else if (DataAdr >= 'h5200)	//Timer
					begin
						WEtimer = 0;
						WEram = 0;
						select_zero = 0;
						select_one = 0;
					end
				
				else	//exception
					begin
						WEtimer = 'z;
						WEram = 'z;
						select_zero = 'z;
						select_one ='z;
					end
		
			end
			
		1:
			begin
			
				if(DataAdr >= 'h4000 && DataAdr <= 'h4400)	//RAM
					begin
						WEtimer = 0;
						WEram = 1;
						select_zero = 1;
						select_one = 1;
					end
					
				else if (DataAdr >= 'h4600 && DataAdr <= 'h5000)	//ROM
					begin
						WEtimer = 0;
						WEram = 0;
						select_zero = 1;
						select_one = 1;
					end
					
				else if (DataAdr >= 'h5200)	//Timer
					begin
						WEtimer = 1;
						WEram = 0;
						select_zero = 1;
						select_one = 1;
					end
				
				else	//exception
					begin
						WEtimer = 'z;
						WEram = 'z;
						select_zero = 'z;
						select_one ='z;
					end
		
			end
			
	endcase
	
endmodule 