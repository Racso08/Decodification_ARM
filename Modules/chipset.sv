module chipset #(parameter N=32)(input logic [N-1:0] DataAdr,
											input logic MemWrite,
											output logic WEram, WEFF, 
											output logic [1:0] select);
						
	always_comb
		
		case(MemWrite)
		
		0:
			begin
			
				if(DataAdr >= 'h4000 && DataAdr <= 'h4400)	//ROM
					begin
						WEFF = 0;
						WEram = 0;
						select = 2'b00;
					end
					
				else if (DataAdr >= 'h4600 && DataAdr <= 'h5000)	//RAM
					begin
						WEFF = 0;
						WEram = 0;
						select = 2'b01;
					end
					
				else if (DataAdr >= 'h5200)	//FF
					begin
						WEFF = 0;
						WEram = 0;
						select = 2'b10;
					end
				
				else	//exception
					begin
						WEFF = 'z;
						WEram = 'z;
						select = 'z;
					end
		
			end
			
		1:
			begin
			
				if(DataAdr >= 'h4000 && DataAdr <= 'h4400)	//ROM
					begin
						WEFF = 0;
						WEram = 0;
						select = 2'b00;
					end
					
				else if (DataAdr >= 'h4600 && DataAdr <= 'h5000)	//RAM
					begin
						WEFF = 0;
						WEram = 1;
						select = 2'b01;
					end
					
				else if (DataAdr >= 'h5200)	//FF
					begin
						WEFF = 1;
						WEram = 0;
						select = 2'b10;
					end
				
				else	//exception
					begin
						WEFF = 'z;
						WEram = 'z;
						select = 'z;
					end
		
			end
			
	endcase
	
endmodule 