module LFSR_tb();
reg clk,rst,set;
wire [3:0]out;
LFSR DUT (clk, rst, set,out);
integer i;
initial begin
clk=1'b0;
forever
#10 clk=~clk;
end
initial begin 
rst=1'b1;
set=1'b1;
@(negedge clk)
rst=1'b0;
set=1'b0;
for (i=0; i<99 ; i=i+1) begin
@(posedge clk);
end
$stop;
end
endmodule