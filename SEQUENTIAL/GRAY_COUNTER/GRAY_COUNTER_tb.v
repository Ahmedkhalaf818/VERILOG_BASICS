module GRAY_COUNTER_tb();
reg clk,rst;
wire [1:0]gray_out;
GRAY_COUNTER DUT(.clk(clk),.rst(rst),.gray_out(gray_out));
integer i=0;
integer tc=100;
initial begin
clk=1'b0;
forever #(tc/2) clk=~clk;
end
initial begin
rst=1'b0;
@(posedge clk)
rst=1'b1;
for(i=0 ; i<20 ; i=i+1) begin
@(negedge clk);
end
$stop;
end
endmodule
