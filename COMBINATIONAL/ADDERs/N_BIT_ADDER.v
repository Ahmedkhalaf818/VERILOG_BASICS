module N_BIT_ADDER (A,B,C);
parameter N=1;
input [N-1:0] A;
input [N-1:0] B;
input [N-1:0] C;
assign C=A+B;
endmodule
