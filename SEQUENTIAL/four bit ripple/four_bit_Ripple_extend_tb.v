module four_bit_Ripple_extend_tb;
    reg clk;
    reg set;
    wire [3:0] out;
wire div_2,div_4;
wire [3:0] out_expecteded;
    four_bit_Ripple_extend DUT1 (
        .clk(clk),
        .set(set),
        .out(out),
        .div_2(div_2),
        .div_4(div_4)
    );
four_bit_Ripple DUT2(
        .clk(clk),
        .rstn(set),
        .out(out_expecteded));
integer i;
initial begin
clk=1'b0;
forever
#10 clk=~clk;
end
initial begin 
set=1'b0;
@(negedge clk) 
if( out_expecteded != out ) begin
$display ("error");
$stop;
end
set=1'b1;
for (i=0; i<99 ; i=i+1) begin
@(negedge clk);
if( out_expecteded != out ) begin
$display ("error");
$stop;
end
end
$stop;
end

endmodule

