`timescale 1ns / 1ps

/************************************************************
*
* Filename: ALU32Bit.v
*
* Author: Thomas Gansheimer
* 
* Implements an Arithmetic Logic Unit that takes two 32 bit
* inputs a performs the desired operation based on the 
* ALUControl signal
*
************************************************************/

module ALU32Bit(ALUControl, A, B, ALUResultLO, ALUResultHI, Zero, HIin, LOin);

	input [4:0] ALUControl;                            
	input [31:0] A, B, HIin, LOin;	    
	output reg [31:0] ALUResultLO;	
	output reg [31:0] ALUResultHI;
	output reg Zero;	    
    
    always@* begin
        ALUResultHI = 32'b0;
        ALUResultLO = 32'b0;
        case(ALUControl)
            5'b00000: ALUResultLO = A + B; // add, addiu, addu, addi, lw, sw, sb, lh, lb, sh, lui
            5'b00001: ALUResultLO = A - B; // beq, sub
            5'b00010: ALUResultLO = $signed(A) * $signed(B); // mul
            5'b00011: ALUResultLO = A&B; //and, 
            5'b00100: ALUResultLO = A|B; //or, ori
            5'b00101: ALUResultLO = ($signed(A) < $signed(B)); //slt, slti
            5'b00110: ALUResultLO =  A < B ; //sltu, sltui
            5'b00111: ALUResultLO = A == B; //bne
            5'b01000: {ALUResultHI, ALUResultLO} = $signed(A) * $signed(B); // mult
            5'b01001: {ALUResultHI, ALUResultLO} = $unsigned(A) * $unsigned(B); //multu
            5'b01010: ALUResultLO = B << {27'b0, A[4:0]}; //sll, sllv
            5'b01011: ALUResultLO = B >> {27'b0, A[4:0]}; //srl, srlv
            5'b01100: ALUResultLO = $signed(A) < 0; // bgez
            5'b01101: ALUResultLO = $signed(A) <= 0; // bgtz
            5'b01110: ALUResultLO = $signed(A) > 0; // blez
            5'b01111: ALUResultLO = $signed(A) >= 0; // bltz
            5'b10000: ALUResultLO = ~(A|B); // nor
            5'b10001: ALUResultLO = A^B; // xor
            5'b10010: ALUResultLO = A; //B == 0; //movn
            5'b10011: ALUResultLO = A;// B != 0; //movz
            5'b10100: ALUResultLO = B >> A | B << (32-A); //rotr, rotrv
            5'b10101: ALUResultLO = $signed(B) >>> A; //sra, srav
            5'b10110: ALUResultLO = 32'b0; //j
            5'b10111: {ALUResultHI, ALUResultLO} = $signed(A) * $signed(B) + {HIin, LOin}; //madd
            5'b11000: {ALUResultHI, ALUResultLO} = {HIin, LOin} - $signed(A) * $signed(B); //msub
            5'b11001: ALUResultHI = A; //mthi
            5'b11010: ALUResultLO = A; //mtlo
            5'b11011: ALUResultLO = HIin; //mfhi
            5'b11100: ALUResultLO = LOin; //mflo
            5'b11101: ALUResultLO = {B[15:0], 16'b0}; //lui
            5'b11110: if(B[7] == 1'b1)begin //seb
                        ALUResultLO = {24'b111111111111111111111111, B[7:0]};
                      end
                      else begin
                        ALUResultLO = {24'b0, B[7:0]};
                      end
            5'b11111: if(B[15] == 1'b1)begin //seh
                        ALUResultLO = {16'b1111111111111111, B[15:0]};
                      end
                      else begin
                        ALUResultLO = {16'b0, B[15:0]};
                      end
        endcase
    end
    
    always@(ALUResultLO, A, B, ALUControl)begin
        if(ALUResultLO == 0)begin
            Zero = 1'b1;
        end
        else begin
            Zero = 1'b0;
        end
    
        if(ALUControl == 5'b10010)begin
            if(B == 0)begin
                Zero = 1'b0;
            end
            else begin
                Zero = 1'b1;
            end
        end
        if(ALUControl == 5'b10011)begin
            if(B == 0)begin
                Zero = 1'b1;
            end
            else begin
                Zero = 1'b0; 
            end
        end
    end
endmodule