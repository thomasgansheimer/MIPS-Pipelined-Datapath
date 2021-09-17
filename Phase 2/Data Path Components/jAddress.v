`timescale 1ns / 1ps

/************************************************************
*
* Filename: jAddress.v
*
* Author: Thomas Gansheimer
* 
* Implements an address calculator used to determine the address
* to jump to in MIPS j instructions
*
************************************************************/

module jAddress(address, PC, out);
    input [25:0] address;
    input [31:0] PC;
    output reg [31:0] out;
    
    always @* begin
        out <= {PC[31:28], address, 2'b0};
    end
endmodule
