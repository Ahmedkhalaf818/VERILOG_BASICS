module N_BIT_ALU_tb();
parameter N_ALU_tb=4;
reg [N_ALU_tb-1:0] A_tb;
reg [N_ALU_tb-1:0] B_tb;
reg [1:0] opcode_tb;
reg [N_ALU_tb-1:0] Y_expected;
wire [N_ALU_tb-1:0] result_tb;
N_BIT_ALU #(.N_ALU(N_ALU_tb)) DUT (A_tb,B_tb,opcode_tb,result_tb);
integer i;
initial begin
#0;
for(i=0 ; i<99; i=i+1) begin
A_tb=$random;
B_tb=$random;
opcode_tb=$random % 4;
case (opcode_tb)
2'b00: Y_expected=A_tb+B_tb;
2'b01: Y_expected= A_tb|B_tb;
2'b10: Y_expected=A_tb-B_tb;
2'b11: Y_expected=A_tb^B_tb;
endcase
#5
if( result_tb != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
end
$stop;
end
initial begin
$monitor ("A_tb=%b,B_tb=%b,opcode_tb=%b,Y_expected=%b,result_tb=%b",A_tb,B_tb,opcode_tb,Y_expected,result_tb);
end
endmodule