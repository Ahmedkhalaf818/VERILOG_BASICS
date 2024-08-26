module always_half_adder(
input A,B,
output reg sum,carry);

always@(A,B)
begin
	sum=A ^ B;
	carry=A & B;
end
endmodule