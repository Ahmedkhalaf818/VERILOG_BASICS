module half_adder_con(
input [3:0] A,B,
output carry,
output [3:0]sum);

assign {carry,sum}=A+B;

endmodule