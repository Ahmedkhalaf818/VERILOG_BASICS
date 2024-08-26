`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 07:11:38 PM
// Design Name: 
// Module Name: ALSU
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


module ALSU(clk,rst,A,B,cin,opcode,serial_in,red_op_A,red_op_B,direction,bypass_A,bypass_B,out,leds);
input clk;
input rst;
input [2:0] A;
input [2:0] B;
input cin;
input [2:0] opcode;
input serial_in;
input red_op_A;
input red_op_B;
input direction;
input bypass_A;
input bypass_B;
output reg [5:0] out;
output reg [15:0]leds;
parameter FULL_ADDER="ON";
parameter INPUT_PRIORITY="A";
reg [2:0] A_reg;
reg [2:0] B_reg;
reg [2:0] opcode_reg;
reg cin_reg,serial_in_reg,red_op_A_reg,red_op_B_reg,direction_reg,bypass_A_reg,bypass_B_reg;
wire [3:0]out_reg_ins;
wire [3:0]out_reg_ins2;
wire [5:0]out_reg_mult;
wire invalid_red_op,invalid_opcode,invalid;
assign invalid_red_op= (red_op_A_reg | red_op_B_reg)&(opcode_reg[1] | opcode_reg[2]);
assign invalid_opcode = opcode_reg[1]&opcode_reg[2];
assign invalid = (invalid_red_op | invalid_opcode);
c_addsub_0 FULLADDER (
  .A(A_reg),        // input wire [2 : 0] A
  .B(B_reg),        // input wire [2 : 0] B
  .C_IN(cin_reg),  // input wire C_IN
  .S(out_reg_ins)        // output wire [3 : 0] S
);
c_addsub_0 HALFADDER (
  .A(A_reg),        // input wire [2 : 0] A
  .B(B_reg),        // input wire [2 : 0] B
  .C_IN(0),  // input wire C_IN
  .S(out_reg_ins2)        // output wire [3 : 0] S
);
mult_gen_0 MULTIPLER (
  .A(A_reg),  // input wire [2 : 0] A
  .B(B_reg),  // input wire [2 : 0] B
  .P(out_reg_mult)  // output wire [5 : 0] P
);
always @(posedge clk or posedge rst) begin
if(rst) begin
A_reg<=0; 
B_reg<=0;
opcode_reg<=0;
cin_reg<=0;
serial_in_reg<=0;
red_op_A_reg<=0;
red_op_B_reg<=0;
direction_reg<=0;
bypass_A_reg<=0;
bypass_B_reg<=0;
leds<=0;
out<=0;
end
else begin
A_reg<=A; 
B_reg<=B;
opcode_reg<=opcode;
cin_reg<=cin;
serial_in_reg<=serial_in;
red_op_A_reg<=red_op_A;
red_op_B_reg<=red_op_B;
direction_reg<=direction;
bypass_A_reg<=bypass_A;
bypass_B_reg<=bypass_B;
if((bypass_A_reg) & (bypass_B_reg))
	begin
	  if (INPUT_PRIORITY=="A")
	  begin
		out<= A_reg;
	  end
	  else if (INPUT_PRIORITY=="B")
	   begin
	    out<= B_reg;
	   end
	   end
       else if (bypass_A_reg)
	begin
	  out<= A_reg;
	end
       else if (bypass_B_reg)
	begin
	  out<= B_reg;
	end
	else if(invalid)
	begin
	        leds<=~leds; 
            if((bypass_A_reg) & (bypass_B_reg)) begin 
			if(INPUT_PRIORITY=="A") begin out<=A_reg; end
			else if(INPUT_PRIORITY=="B") begin out<=B_reg; end
		    end
             else if(bypass_A_reg) begin out<=A_reg;  end
		     else if(bypass_B_reg) begin out<=B_reg;  end
            else 	out<=0;
	end
    else begin
case (opcode_reg)
3'b000 : begin
           if(red_op_A_reg) begin out<=&A_reg;  end
		  else if(red_op_B_reg) begin out<=&B_reg;  end
          else 	out<=(A_reg & B_reg);
         end
3'b001 : begin
		 if(red_op_A_reg) begin out<=^A_reg;  end
		else if(red_op_B_reg) begin out<=^B_reg;  end
		else 	out<=(A_reg^B_reg);
         end
3'b010 : begin
           	 if (FULL_ADDER=="ON") begin out<={1'b0,1'b0,out_reg_ins}; end
	        else if (FULL_ADDER=="OFF") begin out<={1'b0,1'b0,out_reg_ins2}; end

         end
3'b011 : begin
          out<=out_reg_mult;
         end
3'b100 : begin
         if(direction_reg) begin out<={out[4:0],serial_in_reg}; end
	 	 else begin out<={serial_in_reg,out[5:1]}; end
         end
3'b101 : begin
          if(direction_reg) begin out<={out[4:0],out[5]}; end
	 	  else begin out<={out[0],out[5:1]}; end
         end 
endcase
end
end
end
endmodule