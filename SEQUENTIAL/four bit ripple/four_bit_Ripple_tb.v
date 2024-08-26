module four_bit_Ripple_tb();
    reg clk;
    reg rstn;
    wire [3:0] out;
    four_bit_Ripple uut (.clk(clk),.rstn(rstn),.out(out));
integer i;
initial begin
clk=1'b0;
forever
#10 clk=~clk;
end
initial begin 
rstn=1'b0;
@(negedge clk);
 rstn = 1;
for (i=0; i<99 ; i=i+1) begin
@(negedge clk);
end
$stop;
end


endmodule
