`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2024 02:27:14 PM
// Design Name: 
// Module Name: mux2X1
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


module mux2X1(D0,D1,SEL,Y);
parameter N=18;
input [N-1:0]D0,D1;
input SEL;
output reg [N-1:0] Y;
always @(*)
begin
if (SEL)
Y = D1;
else
Y = D0;
end			
endmodule


