`timescale 1ns / 1ps

/************************************************************
*
* Filename: Mux32Bit4to1.v
*
* Author: Thomas Gansheimer
* 
* Implements a 4 to 1 mux with 2, 1-bit control inputs
*
************************************************************/

module Mux32Bit4to1(A, B, C, D, out, control1, control2);
    input [31:0] A, B, C, D;
    input control1, control2;
    output reg [31:0] out;
    
    
    always @*begin
        out <= A;
        if(control1 == 1'b0 && control2 == 1'b0)begin
            out <= A;
        end
        if(control1 == 1'b0 && control2 == 1'b1)begin
            out <= B;
        end
        if(control1 == 1'b1 && control2 == 1'b0)begin
            out <= C;
        end
        if(control1 == 1'b1 && control2 == 1'b1)begin
            out <= D;
        end 
    end

endmodule
