`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2024 11:21:52 AM
// Design Name: 
// Module Name: MUX_DFF
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Khalaf
// 
// Create Date: 07/28/2024 11:21:52 AM
// Design Name: DATA SELECT REGISER
// Module Name: MUX_DFF
// Project Name: DSP48A1
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


module MUX_DFF(clk,rst,enable,PIN_IN,PIN_OUT);
parameter DFF_SELECT=1;
parameter RSTTYPE="SYNC";
parameter DFF_SIZE=18;
input clk,rst,enable;
input [DFF_SIZE-1:0]PIN_IN;
output reg [DFF_SIZE-1 :0]PIN_OUT;
generate 
case (DFF_SELECT)
0: begin
     always @(*) begin
        PIN_OUT=PIN_IN;
     end
end
1: begin
if(RSTTYPE=="SYNC") begin
   always @(posedge clk) begin
        if(rst)
        PIN_OUT<=0;
        else if (enable)
        PIN_OUT<=PIN_IN;
        end
        end
else if (RSTTYPE=="ASYNC") begin
always @(posedge clk or posedge rst ) begin
        if(rst)
        PIN_OUT<=0;
        else if (enable)
        PIN_OUT<=PIN_IN;
        end
end

end
endcase
endgenerate
endmodule