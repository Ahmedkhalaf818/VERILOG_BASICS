`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2024 02:53:27 PM
// Design Name: 
// Module Name: N_BIT_MUX4X1
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


module N_BIT_MUX4X1(D0,D1,D2,D3,S0,S1,Y);
parameter N=48;
input [N-1:0]D0,D1,D2,D3;
input S0,S1;
output reg [N-1:0] Y;
always @(*) begin
case ({S0,S1})
2'b00 : Y=D0;
2'b01 : Y=D1;
2'b10 : Y=D2;
2'b11 : Y=D3;
endcase
end			
endmodule

