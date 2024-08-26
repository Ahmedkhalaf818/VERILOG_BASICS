`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2024 03:51:04 PM
// Design Name: 
// Module Name: FUll_adder_con
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

module FUll_adder_con( A,CIN,B,SEL,carry,sum);
parameter N=48;
input [N-1:0] A,B;
input CIN,SEL;
output reg carry;
output reg [N-1:0]sum;
always @(*) begin
if (SEL)
{carry,sum}=A+B+CIN;
else
{carry,sum}=A-(B+CIN);
end
endmodule


