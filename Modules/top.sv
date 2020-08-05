`timescale 1 ps / 1 ps
module top (input logic clk, reset, set,
				output logic [31:0] WriteData, DataAdr,
				output logic MemWrite);
				
	logic [31:0] PC, Instr, ReadData, romAddress, ramAddress, ffData;
	logic WEram, WEFF, carry1, carry2;
	logic [1:0] select;
	logic [7:0] romData, ramData;
	
	restador #(32) restaRom(DataAdr, 32'h4000, romAddress, carry1);
	restador #(32) restaRam(DataAdr, 32'h4600, ramAddress, carry2);

	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	imem imem(PC, Instr);
	
	chipset #(32) chipset(DataAdr, MemWrite, WEram, WEFF, select);
	
	rom rom(romAddress[7:0], romData);
	ram ram(clk, WEram, ramAddress[7:0], WriteData[7:0], ramData);
	register #(32) register(clk, reset, set, WEFF, WriteData, ffData);
	
	mux2a4 #(32) Mux({24'b0, romData}, {24'b0, ramData}, ffData, select, ReadData);
	
	int fd;
	assign fd = $fopen ("./Mensaje.txt", "w");
	always begin
		#5 if (DataAdr >= 'h4600 && DataAdr <= 'h5000 && WEram == 1'b1) begin
			$fdisplay (fd, "s = %s", ramData);
			end
	end

	always begin	
		#25 if (DataAdr >= 'h5200 && ffData == 32'b0) begin
				$fclose(fd);
				$finish;
			end

	end

endmodule 