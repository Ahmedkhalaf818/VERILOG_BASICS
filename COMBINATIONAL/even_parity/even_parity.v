module even_parity
parameter N=8(
input [N-1:0]A,
output [N:0]out_even_parity );
wire even_parity;
assign even_parity= ^A ;  //if  zero there are even pirity
assign out_even_parity = {even_parity,A};
endmodule
