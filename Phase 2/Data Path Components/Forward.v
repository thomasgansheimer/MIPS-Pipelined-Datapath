`timescale 1ns / 1ps

/************************************************************
*
* Filename: Forward.v
*
* Author: Thomas Gansheimer
* 
* Implements a forwarding unit to account of data dependencies 
* between instructions
*
************************************************************/

module Forward(EXMEMRegWrite, EXMEMRd, MEMWBRegWrite, MEMWBRd, IDEXRt, IDEXRs, Amux, Bmux);
    input EXMEMRegWrite, MEMWBRegWrite;
    input [4:0] EXMEMRd, MEMWBRd, IDEXRt, IDEXRs;
    output reg [1:0] Amux, Bmux;
    
    always @* begin
        Amux <= 2'b0;
        Bmux <= 2'b0;
        
        if(EXMEMRegWrite && (EXMEMRd != 0) && (EXMEMRd == IDEXRs))begin
            Amux <= 2'b01;
        end
        else if(MEMWBRegWrite && (MEMWBRd != 0) && (MEMWBRd == IDEXRs))begin
            Amux <= 2'b10;
        end
        
        if(EXMEMRegWrite && (EXMEMRd != 0) && (EXMEMRd == IDEXRt))begin
            Bmux <= 2'b01;
        end
        else if(MEMWBRegWrite && (MEMWBRd != 0) && (MEMWBRd == IDEXRt))begin
            Bmux <= 2'b10;
        end  
    end
endmodule
