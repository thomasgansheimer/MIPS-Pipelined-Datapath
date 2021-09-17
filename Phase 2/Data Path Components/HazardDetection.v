`timescale 1ns / 1ps

/************************************************************
*
* Filename: HazardDetection.v
*
* Author: Thomas Gansheimer
* 
* Implements a hazard detection scheme to detect and prevent memory
* hazards
*
************************************************************/

module HazardDetection(IDEXMemRead, Instruct2521, Instruct2016, IDEXRt, ControlMux, IFIDWrite, PCWrite, IDEXRegWriteMux, IDEXRd);
    input IDEXMemRead, IDEXRegWriteMux;
    input [4:0] Instruct2521, Instruct2016, IDEXRt, IDEXRd;
    output reg ControlMux, IFIDWrite, PCWrite;
    
    always @* begin
        ControlMux <= 1'b0; IFIDWrite <= 1'b0; PCWrite <= 1'b0; 
       
        if(IDEXMemRead == 1'b1)begin
            if((IDEXRt == Instruct2521) || (IDEXRt == Instruct2016))begin
                ControlMux <= 1'b1; IFIDWrite <= 1'b1; PCWrite <= 1'b1;
            end 
        end
        
        if(IDEXRegWriteMux == 1'b1)begin
            if((IDEXRd == Instruct2521) || (IDEXRd == Instruct2016))begin
                ControlMux <= 1'b1; IFIDWrite <= 1'b1; PCWrite <= 1'b1;
            end  
        end
    end
endmodule