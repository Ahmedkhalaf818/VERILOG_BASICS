module D_FLIPFLOP(
input D, rst, Clk,
output reg Q
);
always @(posedge Clk or posedge rst) begin 
if (rst)
Q<=1'b0;
else
Q<=D;
end
endmodule