module D_FLIPFLOP_tb();
reg d, rstn, clk;
wire q;
wire qbar;
D_FLIPFLOP DUT (d, rstn, clk,q,qbar);
integer i;
initial begin
clk=1'b0;
forever
#10 clk=~clk;
end
initial begin 
rstn=1'b0;
d=1'b1;
@(negedge clk) rstn=1'b1;
for (i=0; i<99 ; i=i+1) begin
d=$random;
@(negedge clk);
end
$stop;
end
endmodule
