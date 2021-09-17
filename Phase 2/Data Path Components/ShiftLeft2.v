`timescale 1ns / 1ps

/************************************************************
*
* Filename: ShiftLeft2.v
*
* Author: Thomas Gansheimer
* 
* Takes an input and shifts it left by 2 bits
*
************************************************************/

module ShiftLeft2(in, out);
    input [31:0] in;
    output reg [31:0] out;
    
    always @*begin
        out <= in << 2'd2;
    end
endmodule
