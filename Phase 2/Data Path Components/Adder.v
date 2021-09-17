`timescale 1ns / 1ps

/************************************************************
*
* Filename: Adder.v
*
* Author: Thomas Gansheimer
* 
* Implements a 32-bit adder
*
************************************************************/

module Adder(A, B, out);
    input [31:0] A, B;
    output reg [31:0] out;
    
    always @*begin
        out <= A + B;
    end
endmodule
