`timescale 1ns / 1ps

/************************************************************
*
* Filename: Mux32Bit2to1.v
*
* Author: Thomas Gansheimer
* 
* Implements a 32 bit 2x1 mux that uses a control bit to 
* select between 2 inputs
*
************************************************************/

module Mux32Bit2to1(A, B, out, control);
    input [31:0] A, B;
    input control;
    output reg [31:0] out;
    
    always @*begin
        if(control == 1'b1)begin
            out <= B;
        end
        
        else begin
            out <= A;
        end
    end
endmodule
