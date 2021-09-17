`timescale 1ns / 1ps

/************************************************************
*
* Filename: RegisterFile.v
*
* Author: Thomas Gansheimer
* 
* Implements a register to store the built in 32, 32-bit
* registers used in the MIPS architecture
*
************************************************************/

module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, 
Clk, ReadData1, ReadData2, Reset, debug_WriteData);

	input Clk, RegWrite, Reset;
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	(* mark_debug = "true" *)input [31:0] WriteData;
	output reg [31:0] ReadData1, ReadData2;
	output [31:0] debug_WriteData;

	
	reg [31:0] RegFile [0:31];
	
    always @(posedge Clk) begin // Write to register on positive edge of clock
           if(Reset == 1) begin
            RegFile[0] <= 32'h0; RegFile[1] <= 32'h0; RegFile[2] <= 32'h0; RegFile[3] <= 32'h0; RegFile[4] <= 32'h0; RegFile[5] <= 32'h0; RegFile[6] <= 32'h0;
            RegFile[7] <= 32'h0; RegFile[8] <= 32'h0; RegFile[9] <= 32'h0; RegFile[10] <= 32'h0; RegFile[11] <= 32'h0; RegFile[12] <= 32'h0;
            RegFile[13] <= 32'h0; RegFile[14] <= 32'h0; RegFile[15] <= 32'h0; RegFile[16] <= 32'h0; RegFile[17] <= 32'h0; RegFile[18] <= 32'h0;
            RegFile[19] <= 32'h0; RegFile[20] <= 32'h0; RegFile[21] <= 32'h0; RegFile[22] <= 32'h0; RegFile[23] <= 32'h0; RegFile[24] <= 32'h0; RegFile[25] <= 32'h0;
            RegFile[26] <= 32'h0; RegFile[27] <= 32'h0; RegFile[28] <= 32'h0; RegFile[29] <= 32'h0; RegFile[30] <= 32'h0; RegFile[31] <= 32'h0;
           end
           else begin
               if(RegWrite == 1)begin
                   RegFile[WriteRegister] <= WriteData;
                   RegFile[0] <= 32'h0;
               end
           end
           
    end
        
    always @(negedge Clk) begin // Read from register on negative edge of clock
        ReadData1 <= RegFile[ReadRegister1];
        ReadData2 <= RegFile[ReadRegister2];
    end
    
    assign debug_WriteData = WriteData;
endmodule


