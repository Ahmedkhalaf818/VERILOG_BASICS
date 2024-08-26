module four_bit_Ripple(
input clk,rstn,
output [3:0]out
);
wire f1,f2,f3,f4;
D_FLIPFLOP ff1(
.d(out[0]),.rstn(rstn),.clk(clk),.q(f1),.qbar(out[0])
);
D_FLIPFLOP ff2(
.d(out[1]),.rstn(rstn),.clk(f1),.q(f2),.qbar(out[1])
);
D_FLIPFLOP ff3(
.d(out[2]),.rstn(rstn),.clk(f2),.q(f3),.qbar(out[2])
);
D_FLIPFLOP ff4(
.d(out[3]),.rstn(rstn),.clk(f3),.q(f4),.qbar(out[3])
);
endmodule
