`timescale 1ns / 1ps

/************************************************************
*
* Filename: EXMEMRegister.v
*
* Author: Thomas Gansheimer
* 
* Implements the EXMEM pipeline register
*
************************************************************/
module EXMEMRegister(JAddressIn, PCIn, PCAddIn, AIn, ZeroIn, ALUResultIn, BIn, RegDstIn,
     RegWrite, Branch, MemWrite, MemRead, MemToReg, PCSrc, RegWriteMux, SControl, LControl,
     JAddressOut, PCOut, PCAddOut, AOut, ZeroOut, ALUResultOut, BOut, RegDstOut,
     RegWriteOut, BranchOut, MemWriteOut, MemReadOut, MemToRegOut, PCSrcOut, RegWriteMuxOut, 
     SControlOut, LControlOut, Clk, displayIn, displayOut, flush);
     
     input [31:0] JAddressIn, PCIn, PCAddIn, AIn, ALUResultIn, BIn, displayIn;
     input [4:0] RegDstIn;
     input RegWrite, Branch, MemWrite, MemRead, PCSrc, RegWriteMux, Clk, ZeroIn, flush;
     input [1:0] MemToReg, SControl, LControl;
     
     output reg [31:0] JAddressOut, PCOut, PCAddOut, AOut, ALUResultOut, BOut, displayOut;
     output reg [4:0] RegDstOut;
     output reg RegWriteOut, BranchOut, MemWriteOut, MemReadOut, PCSrcOut, RegWriteMuxOut, ZeroOut;
     output reg [1:0] MemToRegOut, SControlOut, LControlOut;
     
    
    always @(posedge Clk)begin
        JAddressOut <= JAddressIn;
        PCOut <= PCIn;
        PCAddOut <= PCAddIn;
        AOut <= AIn;
        ALUResultOut <= ALUResultIn;
        BOut <= BIn;
        RegDstOut <= RegDstIn;
        RegWriteOut <= RegWrite;
        BranchOut <= Branch;
        MemWriteOut <= MemWrite;
        MemReadOut <= MemRead;
        PCSrcOut <= PCSrc;
        RegWriteMuxOut <= RegWriteMux;
        ZeroOut <= ZeroIn;
        MemToRegOut <= MemToReg;
        SControlOut <= SControl;
        LControlOut <= LControl;    
        displayOut <= displayIn;
        
        if(flush == 1'b1)begin
            JAddressOut <= 0;
            PCOut <= 0;
            PCAddOut <= 0;
            AOut <= 0;
            ALUResultOut <= 0;
            BOut <= 0;
            RegDstOut <= 0;
            RegWriteOut <= 0;
            BranchOut <= 0;
            MemWriteOut <= 0;
            MemReadOut <= 0;
            PCSrcOut <= 0;
            RegWriteMuxOut <= 0;
            ZeroOut <= 0;
            MemToRegOut <= 0;
            SControlOut <= 0;
            LControlOut <= 0;    
            displayOut <= 0;
        
        end
    end
endmodule
