`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2024 03:23:31 PM
// Design Name: 
// Module Name: MUX_CARRYIN
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


module MUX_CARRYIN(CASCADE,PIN_IN,PIN_OUT);
parameter DFF_SIZE=1;
parameter CARRY_INPUT = "OPCODE5";
input [DFF_SIZE-1:0]CASCADE;
input [DFF_SIZE-1:0]PIN_IN;
output reg [DFF_SIZE-1 :0]PIN_OUT;
always @(*) begin
if(CARRY_INPUT == "OPCODE5")
PIN_OUT=PIN_IN;
else if(CARRY_INPUT == "CARRYIN")
PIN_OUT=CASCADE;
else
PIN_OUT=0;
end			
endmodule

