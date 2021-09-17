`timescale 1ns / 1ps

/************************************************************
*
* Filename: WBForwarding.v
*
* Author: Thomas Gansheimer
* 
* Implements forwarding from WB stage
*
************************************************************/

module WBForwarding(regWrite, regDst, rs, rt, control1, control2);
    input regWrite;
    input [4:0] regDst, rs, rt;
    output reg control1, control2;
    
    always @* begin
        control1 <= 1'b0; control2 <= 1'b0;
        if(regWrite == 1'b1)begin
            if(regDst == rs)begin
                control1 <= 1'b1;
            end
            if(regDst == rt)begin
                control2 <= 1'b1;
            end
        end
    end
endmodule
