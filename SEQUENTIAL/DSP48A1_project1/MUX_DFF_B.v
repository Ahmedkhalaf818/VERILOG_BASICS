`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2024 12:24:19 PM
// Design Name: 
// Module Name: MUX_DFF_B
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX_DFF_B(clk,rst,enable,CASCADE,PIN_IN,PIN_OUT);
parameter DFF_SELECT=1;
parameter RSTTYPE="SYNC";
parameter DFF_SIZE=18;
parameter B_INPUT = "CASCADE";
input clk,rst,enable;
input [DFF_SIZE-1:0]CASCADE;
input [DFF_SIZE-1:0]PIN_IN;
output reg [DFF_SIZE-1 :0]PIN_OUT;
generate
case (DFF_SELECT)
0: begin
     always @(*) begin
        if ( B_INPUT == "DIRECT")
        PIN_OUT<=PIN_IN;
        else if (B_INPUT == "CASCADE") 
        PIN_OUT<=CASCADE;
        end
     end
1: begin
if(RSTTYPE=="SYNC") begin
   always @(posedge clk) begin
        if(rst)
        PIN_OUT<=0;
        else if (enable) begin
       if ( B_INPUT == "DIRECT")
        PIN_OUT<=PIN_IN;
        else if (B_INPUT == "CASCADE") 
        PIN_OUT<=CASCADE;
        end
        end
        end
else if (RSTTYPE=="ASYNC") begin
always @(posedge clk or posedge rst ) begin
        if(rst)
        PIN_OUT<=0;
         else if (enable) begin
       if ( B_INPUT == "DIRECT")
        PIN_OUT<=PIN_IN;
        else if (B_INPUT == "CASCADE") 
        PIN_OUT<=CASCADE;
        end
        end
end

end
endcase
endgenerate
endmodule

