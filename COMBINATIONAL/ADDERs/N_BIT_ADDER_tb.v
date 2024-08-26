module N_BIT_ADDER_tb();
parameter N=1;
reg [N-1:0] A_tb;
reg [N-1:0] B_tb;
reg [N-1:0] Y_expected;
wire [N-1:0] C_tb;
N_BIT_ADDER #(.N(N)) DUT (A_tb,B_tb,C_tb);
integer i;
initial begin

for(i=0 ; i<99; i=i+1) begin
A_tb=$random;
B_tb=$random;
Y_expected=A_tb+B_tb;
if( C_tb != Y_expected) begin
$display("error ,there are some thing not correct1");
end
#10;
end
$stop;
end
initial begin
$monitor ("A_tb=%b,B_tb=%b,Y_expected=%b,C_tb=%b",A_tb,B_tb,Y_expected,C_tb);
end
endmodule
