module T_Flipflop_tb();
reg t, rstn, clk;
wire q;
wire qbar;
T_Flipflop DUT (t, rstn, clk,q,qbar);
integer i;
initial begin
clk=1'b0;
forever
#10 clk=~clk;
end
initial begin 
rstn=1'b0;
t=1'b1;
@(negedge clk) rstn=1'b1;
for (i=0; i<99 ; i=i+1) begin
t=$random;
@(negedge clk);
end
$stop;
end
endmodule
