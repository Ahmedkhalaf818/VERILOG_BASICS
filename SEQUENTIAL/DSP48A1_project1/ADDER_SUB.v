
module N_BIT_ADDER (D,B,SEL,C);
parameter N=18;
input [N-1:0] B;
input [N-1:0] D;
input SEL;
output reg  [N-1:0] C;
always @(*) begin
if (SEL)
C = D-B;
else
C = D+B;
end
endmodule

