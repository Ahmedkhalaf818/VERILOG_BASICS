module DSP(A,B,C,D,clk,rst_n,P);
parameter OPERATION="ADD";
input [17:0]A;
input [17:0]B;
input [47:0]C;
input [17:0]D;
input clk;
input rst_n;
output reg [47:0]P;
reg [17:0]A_reg;
reg [17:0]A_reg_delay;
reg [17:0]B_reg;
reg [47:0]C_reg;
reg [17:0]D_reg;
reg [17:0]OP_ONE;
reg [17:0]OP_ONE_delay;
reg [47:0]multiplier_out;
reg [47:0]multiplier_out_delay;
reg [47:0]OP_TWO;
always @(posedge clk) begin
if(~rst_n) begin
A_reg<=0;
B_reg<=0;
C_reg<=0;
D_reg<=0;
OP_ONE_delay=0;
A_reg_delay=0;
multiplier_out_delay=0;
P=0;
end
else begin
A_reg<=A;
B_reg<=B;
C_reg<=C;
D_reg<=D;
OP_ONE_delay<=OP_ONE;
A_reg_delay<=A_reg;
multiplier_out_delay<=multiplier_out;
P<=OP_TWO;
end
end
always @(*) begin
if(OPERATION=="ADD") begin
OP_ONE=B_reg+D_reg;
OP_TWO=multiplier_out_delay + C_reg;
end
else if (OPERATION=="SUBTRACT") begin
OP_ONE=D_reg - B_reg;
OP_TWO=multiplier_out_delay - C_reg;
end
multiplier_out=A_reg_delay * OP_ONE_delay;
end
endmodule