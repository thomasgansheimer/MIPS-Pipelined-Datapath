`timescale 1ns / 1ps

/************************************************************
*
* Filename: DataMemory.v
*
* Author: Thomas Gansheimer
* 
* Implements a memory of 1k words that has read and write capabilites.
* Also has ability to write to specified byte of each word
*
************************************************************/

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, SControl, LControl); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 
    input [1:0] SControl, LControl;
    output reg[31:0] ReadData; // Contents of memory location at Address
    
    reg [31:0] memory [0:1023];
    integer Index;
    (*keep = "true"*)reg [31:0] memIn;
    initial begin
        for(Index = 0; Index < 1024; Index = Index + 1)begin
            memory[Index] = 32'b0;
        end
        $readmemh("data_memory.txt", memory);
    end

	always @(posedge Clk) begin
        if (MemWrite == 1'b1) begin
            memIn = memory[Address[11:2]];
            if(SControl == 2'b10)begin //sb
                if(Address[1:0] == 2'b11)begin 
                    memIn[7:0] = WriteData[7:0];
                end
                if(Address[1:0] == 2'b10)begin
                    memIn[15:8] = WriteData[7:0];
                end
                if(Address[1:0] == 2'b01)begin
                    memIn[23:16] = WriteData[7:0];
                end
                if(Address[1:0] == 2'b00)begin
                    memIn[31:24] = WriteData[7:0];
                end
            end
            if(SControl == 2'b11)begin //sh
                if(Address[1:0] == 2'b01)begin
                    memIn[15:0] = WriteData[15:0];
                end
                if(Address[1:0] == 2'b00)begin
                    memIn[31:16] = WriteData[15:0];
                end
            end
            if(SControl == 2'b00)begin //sw
                memIn = WriteData;
            end
            memory[Address[11:2]] <= memIn;
        end
    end    
    
    always @(*) begin
        if (MemRead == 1'b1) begin //lw
            ReadData <= 32'b0;
            if(LControl == 2'b00)begin
                ReadData <= memory[Address[11:2]];
            end
            if(LControl == 2'b10)begin //lb
                if(Address[1:0] == 2'b11)begin
                    if(memory[Address[11:2]][7] == 1'b1)begin
                        ReadData <= {24'b111111111111111111111111, memory[Address[11:2]][7:0]};
                    end
                    else begin
                        ReadData <= {24'b0, memory[Address[11:2]][7:0]};
                    end
                end
                if(Address[1:0] == 2'b10)begin
                    if(memory[Address[11:2]][15] == 1'b1)begin
                        ReadData <= {24'b111111111111111111111111, memory[Address[11:2]][15:8]};
                    end
                    else begin
                        ReadData <= {24'b0, memory[Address[11:2]][15:8]};
                    end
                end
                if(Address[1:0] == 2'b01)begin
                    if(memory[Address[11:2]][23] == 1'b1)begin
                        ReadData <= {24'b111111111111111111111111, memory[Address[11:2]][23:16]};
                    end
                    else begin
                        ReadData <= {24'b0, memory[Address[11:2]][23:16]};
                    end
                end
                if(Address[1:0] == 2'b00)begin
                    if(memory[Address[11:2]][31] == 1'b1)begin
                        ReadData <= {24'b111111111111111111111111, memory[Address[11:2]][31:24]};
                    end
                    else begin
                        ReadData <= {24'b0, memory[Address[11:2]][31:24]};
                    end
                end
            end
            
            if(LControl == 2'b11)begin //lh
                if(Address[1:0] == 2'b01)begin
                    if(memory[Address[11:2]][15] == 1'b1)begin
                        ReadData <= {16'b1111111111111111, memory[Address[11:2]][15:0]};
                    end
                    else begin
                        ReadData <= {16'b0, memory[Address[11:2]][15:0]};
                    end
                end
                if(Address[1:0] == 2'b00)begin
                if(memory[Address[11:2]][31] == 1'b1)begin
                        ReadData <= {16'b1111111111111111, memory[Address[11:2]][31:16]};
                    end
                    else begin
                        ReadData <= {16'b0, memory[Address[11:2]][31:16]};
                    end
                end
            end
        end
        else
            ReadData <= 32'h0;    
    end    
endmodule