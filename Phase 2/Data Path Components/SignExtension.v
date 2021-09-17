`timescale 1ns / 1ps

/************************************************************
*
* Filename: SignExtension.v
*
* Author: Thomas Gansheimer
* 
* Implements a sign extender to extend the sign bit of a 16-bit
* input to a 32-bit output
*
************************************************************/

module SignExtension(in, out, control);
    input [15:0] in;
    input control;
    output reg [31:0] out;
    
    always @* begin
        if(control == 1'b1)begin // control bit used to force zero extension
            out <= {16'b0, in};
        end
        else begin
            if(in[15] == 0)begin
                out <= {16'b0000000000000000, in};
            end
            else begin
                out <= {16'b1111111111111111, in};
            end
        end
     end
endmodule
