module MUX_3X1_tb();
reg D0_tb,D1_tb,D2_tb,S0_tb,S1_tb;
wire Y_DUT,Y_expected;
MUX_3X1 DUT1 (D0_tb,D1_tb,D2_tb,S0_tb,S1_tb,Y_DUT);
MUX_3X1_CODE DUT2 (D0_tb,D1_tb,D2_tb,S0_tb,S1_tb,Y_ecpected);
integer i;
initial
begin
 for(i=0;i<1000;i=i+1)
 begin
  D0_tb=$random;
  D1_tb=$random;
  D2_tb=$random;
  S0_tb=$random;
  S1_tb=$random;
#10;
  if(Y_DUT!=Y_ecpected)
  begin
	$display("ERROR");
        $stop;
  end

 end
$stop;
end
initial
begin
$monitor("time=%t,D0=%b,D1=%b,D2=%b,S0=%b,S1=%b,Y_DUT=%b,Y_ecpected=%b",D0_tb,D1_tb,D2_tb,S0_tb,S1_tb,Y_DUT,Y_ecpected);
end
endmodule