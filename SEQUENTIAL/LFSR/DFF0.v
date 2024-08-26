module D0_FLIPFLOP(
input D, set, Clk,
output reg Q
);
always @(posedge Clk or posedge set) begin 
if (set)
Q<=1'b1;
else
Q<=D;
end
endmodule