`timescale 1ns / 1ps

/************************************************************
*
* Filename: IDEXRegister.v
*
* Author: Thomas Gansheimer
* 
* Implements the IDEX pipeline register
*
************************************************************/


module IDEXRegister(Instruction250In, PCAddIn, ReadData1In, ReadData2In, SignExtenIn,
Instruction2016In, Instruction1511In, Instruction106In, RegWrite, ALUSrcA, ALUSrcB, ALUOp,
RegDst, Branch, MemWrite, MemRead, MemToReg, PCSrc, RegWriteMux, HIWrite,
LOWrite,SControl, LControl, Instruction250Out, PCAddOut, ReadData1Out, ReadData2Out, SignExtenOut,
Instruction2016Out, Instruction1511Out, Instruction106Out, RegWriteOut, ALUSrcAOut, ALUSrcBOut, ALUOpOut,
RegDstOut, BranchOut, MemWriteOut, MemReadOut, MemToRegOut, PCSrcOut, RegWriteMuxOut, HIWriteOut,
LOWriteOut, SControlOut, LControlOut, Clk, displayIn, displayOut, flush);

input [25:0] Instruction250In;
input [31:0] PCAddIn, ReadData1In, ReadData2In, SignExtenIn, displayIn;
input [4:0] Instruction2016In, Instruction1511In, Instruction106In, ALUOp;
input RegWrite, ALUSrcA, ALUSrcB, Branch, MemWrite, MemRead, PCSrc, RegWriteMux, HIWrite,
LOWrite, Clk, flush;
input [1:0] MemToReg, RegDst, SControl, LControl;

output reg [25:0] Instruction250Out;
output reg [31:0] PCAddOut, SignExtenOut, displayOut;
output reg [31:0] ReadData1Out, ReadData2Out;
output reg [4:0] Instruction2016Out, Instruction1511Out, Instruction106Out, ALUOpOut;
output reg RegWriteOut, ALUSrcAOut, ALUSrcBOut, BranchOut, MemWriteOut, MemReadOut, PCSrcOut, RegWriteMuxOut, HIWriteOut,
LOWriteOut;
output reg [1:0] MemToRegOut, RegDstOut, SControlOut, LControlOut;

always @(posedge Clk)begin
    Instruction250Out <= Instruction250In;
    PCAddOut <= PCAddIn;
    ReadData1Out <= ReadData1In;
    ReadData2Out <= ReadData2In;
    SignExtenOut <= SignExtenIn;
    Instruction2016Out <= Instruction2016In;
    Instruction1511Out <= Instruction1511In;
    Instruction106Out <= Instruction106In;
    ALUOpOut <= ALUOp;
    RegWriteOut <= RegWrite;
    ALUSrcAOut <= ALUSrcA;
    ALUSrcBOut <= ALUSrcB;
    BranchOut <= Branch;
    MemWriteOut <= MemWrite;
    MemReadOut <= MemRead;
    PCSrcOut <= PCSrc;
    RegWriteMuxOut <= RegWriteMux;
    HIWriteOut <= HIWrite;
    LOWriteOut <= LOWrite;
    MemToRegOut <= MemToReg;
    RegDstOut <= RegDst;
    SControlOut <= SControl;
    LControlOut <= LControl;  
    displayOut <= displayIn; 
    
    if(flush == 1'b1)begin
        Instruction250Out <= 0;
        PCAddOut <= 0;
        ReadData1Out <= 0;
        ReadData2Out <= 0;
        SignExtenOut <= 0;
        Instruction2016Out <= 0;
        Instruction1511Out <= 0;
        Instruction106Out <= 0;
        ALUOpOut <= 0;
        RegWriteOut <= 0;
        ALUSrcAOut <= 0;
        ALUSrcBOut <= 0;
        BranchOut <= 0;
        MemWriteOut <= 0;
        MemReadOut <= 0;
        PCSrcOut <= 0;
        RegWriteMuxOut <= 0;
        HIWriteOut <= 0;
        LOWriteOut <= 0;
        MemToRegOut <= 0;
        RegDstOut <= 0;
        SControlOut <= 0;
        LControlOut <= 0;  
        displayOut <= 0;
    end 
end

endmodule
