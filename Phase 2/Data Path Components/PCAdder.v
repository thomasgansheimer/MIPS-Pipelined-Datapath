`timescale 1ns / 1ps

/************************************************************
*
* Filename: PCAdder.v
*
* Author: Thomas Gansheimer
* 
* Increments the current address by 4, used to move to the 
* next instruction in Instruction Memory
*
************************************************************/

module PCAdder(PCResult, PCAddResult);

    input [31:0] PCResult;
    output reg [31:0] PCAddResult;

    always @ (PCResult)begin
        PCAddResult <= PCResult + 3'b100;
    end

endmodule