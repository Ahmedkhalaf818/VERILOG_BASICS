module MUX_2X1(D0,D1,SEL,Y);
input D0,D1,SEL;
output reg Y;
always @(*)
begin
if (SEL)
Y = D0
else
Y = D1;
end			
endmodule
