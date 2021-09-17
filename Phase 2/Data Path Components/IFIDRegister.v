`timescale 1ns / 1ps

/************************************************************
*
* Filename: IFIDRegister.v
*
* Author: Thomas Gansheimer
* 
* Implements the IFID pipeline register
*
************************************************************/

module IFIDRegister(PCAddIn, InstructionIn, PCAddOut, InstructionOut, Clk, control, flush, displayIn, displayOut);
    input Clk, control, flush;
    input [31:0] PCAddIn, InstructionIn, displayIn;
    output reg [31:0] PCAddOut, InstructionOut, displayOut;
    
    
    always @(posedge Clk)begin
        if(control !== 1'b1)begin 
            PCAddOut <= PCAddIn;
            InstructionOut <= InstructionIn;
            displayOut <= displayIn;
        end
        if(flush == 1'b1)begin
            PCAddOut <= 32'b0;
            InstructionOut <= 32'b0;
            displayOut <= 32'b0;
        end
     end
endmodule
