`timescale 1ns / 1ps

/************************************************************
*
* Filename: HIReg.v
*
* Author: Thomas Gansheimer
* 
* Implements a register that is used to store the high and 
* low output from the ALU
*
************************************************************/

module HIReg(HIin, ALUResultHI, HIWrite, Clk, Reset, debugOut);
    input [31:0] ALUResultHI;
    input Clk, HIWrite, Reset;
    (* mark_debug = "true" *)output reg [31:0] HIin;
    output [31:0] debugOut;
    
    reg [31:0] RegFile;
    
    always @(negedge Clk)begin
        if(Reset == 1'b1)begin
            RegFile <= 32'b0;
        end
        if(HIWrite == 1'b1)begin
            RegFile <= ALUResultHI;
        end
    end
    
    always @*begin
        HIin <= RegFile;
    end
    assign debugOut = HIin;
endmodule
