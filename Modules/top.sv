module top (input logic clk, reset, set,
				output logic [31:0] WriteData, DataAdr,
				output logic MemWrite);
				
	logic [31:0] PC, Instr, ReadData, romAddress, ramAddress;
	logic WEram, WEFF, carry1, carry2;
	logic [1:0] select;
	logic [7:0] romData, ramData, ffData;
	
	restador #(32) restaRom(DataAdr, 32'h4000, romAddress, carry1);
	restador #(32) restaRam(DataAdr, 32'h4600, ramAddress, carry2);

	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	imem imem(PC, Instr);
	
	chipset #(32) chipset(DataAdr, MemWrite, WEram, WEFF, select);
	
	rom rom(romAddress[7:0], clk, romData);
	ram ram(ramAddress[7:0], clk, WriteData[7:0], WEram, ramData);
	register #(32) register(clk, reset, set, WEFF, WriteData, ffData);
	
	mux2a4 #(8) Mux(romData, ramData, ffData, select, ReadData);

endmodule 