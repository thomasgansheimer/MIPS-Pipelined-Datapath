`timescale 1ns / 1ps

/************************************************************
*
* Filename: InstructionMemory.v
*
* Author: Thomas Gansheimer
* 
* Implements an Instruction memory that reads and stores a 
* file of 32 bit MIPS instructions
*
************************************************************/

module InstructionMemory(Address, Instruction); 

    input [31:0] Address; // Input Address 

    output reg [31:0] Instruction; // Instruction at memory location Address
    
    reg [31:0] memory [0:127]; // creates 128 x 32 memory
    integer Index;
    
    initial begin
    for(Index = 0; Index < 128; Index = Index + 1)begin
        memory[Index] = 32'b0;
    end
    
    $readmemh("Instruction_memory.txt", memory); // Initialize memory with 32 bit instructions from file
    end
    
    always @* begin
        Instruction <= memory[Address[10:2]];
    end
    
endmodule
