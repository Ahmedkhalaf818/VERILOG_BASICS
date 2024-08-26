module LFSR(clk,rst,set,out);
input clk,rst,set;
output  [3:0]out;
wire XOR_reg,f0,f1,f2,f3; 
D0_FLIPFLOP ff1(.D(f3),.Clk(clk),.set(set),.Q(f0));
D_FLIPFLOP ff2(.D(XOR_reg),.Clk(clk),.rst(rst),.Q(f1));
D_FLIPFLOP ff3(.D(f1),.Clk(clk),.rst(rst),.Q(f2));
D_FLIPFLOP ff4(.D(f2),.Clk(clk),.rst(rst),.Q(f3));
assign out ={f3,f2,f1,f0};
assign XOR_reg= f0 ^ f3;
endmodule
