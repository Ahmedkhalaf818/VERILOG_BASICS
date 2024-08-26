module BCD(D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,Y0,Y1,Y2,Y3);
input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9;
output reg Y0,Y1,Y2,Y3;
always @(*) begin
case({D9,D8,D7,D6,D5,D4,D3,D2,D1,D0})
1: {Y3,Y2,Y1,Y0}=0;
2: {Y3,Y2,Y1,Y0}=1;
4: {Y3,Y2,Y1,Y0}=2;
8: {Y3,Y2,Y1,Y0}=3;
16: {Y3,Y2,Y1,Y0}=4;
32: {Y3,Y2,Y1,Y0}=5;
64: {Y3,Y2,Y1,Y0}=6;
128: {Y3,Y2,Y1,Y0}=7;
256: {Y3,Y2,Y1,Y0}=8;
512: {Y3,Y2,Y1,Y0}=9;
default : {Y3,Y2,Y1,Y0}=0;
endcase
end
endmodule
