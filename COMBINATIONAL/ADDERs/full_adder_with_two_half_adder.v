module full_adder_with_two_half_adder(X,Y,Cin,sum_adder,carry_adder);
input X,Y,Cin;
output sum_adder,carry_adder;
wire c1,c2,s1;
half_adder_gate_level HA0(
.A(X),
.B(Y),
.sum(s1),
.carry(c1));
half_adder_gate_level HA1(
.A(Cin),
.B(s1),
.sum(sum_adder),
.carry(c2));

assign carry_adder=c1|c2;
endmodule