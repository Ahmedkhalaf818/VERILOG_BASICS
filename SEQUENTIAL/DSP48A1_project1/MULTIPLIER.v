`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2024 02:11:50 PM
// Design Name: 
// Module Name: N_BIT_Multiplier
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


module N_BIT_Multiplier (B,D,Out);
parameter N=18;
localparam N_local=2*N;
input  [N-1:0] B;
input  [N-1:0] D;
output  [N_local-1:0] Out;
reg [N_local-1:0]out_reg;
always @(*) begin
out_reg= B * D;
end
assign Out=out_reg;
endmodule

