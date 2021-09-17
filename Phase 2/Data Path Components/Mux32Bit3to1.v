`timescale 1ns / 1ps

/************************************************************
*
* Filename: Mux32Bit3to1.v
*
* Author: Thomas Gansheimer
* 
* Implements a 3 to 1 mux with 2, 1-bit control inputs
*
************************************************************/

module Mux32Bit3to1(A, B, C, out, control);
    input [31:0] A, B, C;
    input [1:0] control;
    output reg [31:0] out;
    
    always @* begin
        out <= A;
        if(control == 2'b00)begin
            out <= A;
        end
        if(control == 2'b01)begin
            out <= B;
        end
        if(control == 2'b10)begin
            out <= C;
        end
    end
endmodule