`timescale 1ns / 1ps

/************************************************************
*
* Filename: ProgramCounter.v
*
* Author: Thomas Gansheimer
* 
* Implements a program counter to iterate through instructions
* stored in Instruction Memory
*
************************************************************/

module ProgramCounter(Address, PCResult, Reset, Clk, control, debug_PC, debug_control);

	input [31:0] Address;
	(* mark_debug = "true" *)input Reset, Clk, control;

	(* mark_debug = "true" *)output reg [31:0] PCResult;
	output [31:0] debug_PC;
	output debug_control;

    always@(posedge Clk) begin
        if(Reset == 1)begin // reset to address 0
            PCResult = 32'h00000000;
        end
        else begin
            if(control !== 1'b1)begin 
                PCResult = Address; // load next address to PCResult
            end
        end
    end
assign debug_PC = PCResult;
assign debug_control = control;
endmodule
