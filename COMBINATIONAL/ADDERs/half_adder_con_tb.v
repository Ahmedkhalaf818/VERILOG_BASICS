module half_adder_con_tb();
//signal Decleration
reg A,B;
wire sum,carry;
reg expected_sum,expected_carry;

// ista
half_adder_con DUT(A,B,sum,carry);


initial
begin
#0 	A=0;
	B=0;
	expected_sum=0;
	expected_carry=0;
#10	A=0;
	B=0;
	expected_sum=0;
	expected_carry=0;
#10 
	A=0;
	B=0;
	expected_sum=0;
	expected_carry=0;
#10	A=0;
	B=0;
	expected_sum=0;
	expected_carry=0;
end