`timescale 1ns / 1ps

/************************************************************
*
* Filename: MEMWBRegister.v
*
* Author: Thomas Gansheimer
* 
* Implements the MEMWB pipeline register
*
************************************************************/

module MEMWBRegister(PCIn, ZeroIn, ReadDataIn, ALUIn, RegDstIn, MemToReg, RegWriteMux, RegWrite,
    PCOut, ZeroOut, ReadDataOut, ALUOut, RegDstOut, MemToRegOut, RegWriteMuxOut, RegWriteOut, Clk, displayIn, displayOut);
    
    input [31:0] PCIn, ReadDataIn, ALUIn, displayIn;
    input [4:0] RegDstIn;
    input ZeroIn, RegWrite, RegWriteMux, Clk;
    input [1:0] MemToReg;
    
    output reg [31:0] PCOut, ReadDataOut, ALUOut, displayOut;
    output reg [4:0] RegDstOut;
    output reg ZeroOut, RegWriteOut, RegWriteMuxOut;
    output reg [1:0] MemToRegOut;
    
    always @(posedge Clk)begin
        PCOut <= PCIn;
        ReadDataOut <= ReadDataIn;
        ALUOut <= ALUIn;
        RegDstOut <= RegDstIn;
        ZeroOut <= ZeroIn;
        RegWriteOut <= RegWrite;
        RegWriteMuxOut <= RegWriteMux;
        MemToRegOut <= MemToReg;
        displayOut <= displayIn;
    end
endmodule
