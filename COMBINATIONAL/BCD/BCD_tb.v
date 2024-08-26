module BCD_tb();
reg D0_tb,D1_tb,D2_tb,D3_tb,D4_tb,D5_tb,D6_tb,D7_tb,D8_tb,D9_tb;
wire Y0_tb1,Y1_tb1,Y2_tb1,Y3_tb1;
wire Y0_tb2,Y1_tb2,Y2_tb2,Y3_tb2;
BCD  DUT1(D0_tb,D1_tb,D2_tb,D3_tb,D4_tb,D5_tb,D6_tb,D7_tb,D8_tb,D9_tb,Y0_tb1,Y1_tb1,Y2_tb1,Y3_tb1);
BCD2 DUT2(D0_tb,D1_tb,D2_tb,D3_tb,D4_tb,D5_tb,D6_tb,D7_tb,D8_tb,D9_tb,Y0_tb2,Y1_tb2,Y2_tb2,Y3_tb2);
integer i;
initial begin
#0 {D0_tb,D1_tb,D2_tb,D3_tb,D4_tb,D5_tb,D6_tb,D7_tb,D8_tb,D9_tb}=2;
if({Y0_tb1,Y1_tb1,Y2_tb1,Y3_tb1} != {Y0_tb2,Y1_tb2,Y2_tb2,Y3_tb2}) begin
$display("error ,there are some thing not correct1");
end
#10;
for(i=0 ; i<255; i=i+1) begin
{D0_tb,D1_tb,D2_tb,D3_tb,D4_tb,D5_tb,D6_tb,D7_tb,D8_tb,D9_tb}=$random;
if({Y0_tb1,Y1_tb1,Y2_tb1,Y3_tb1} != {Y0_tb2,Y1_tb2,Y2_tb2,Y3_tb2}) begin
$display("error ,there are some thing not correct1");
end
#10;
end
$stop;
end
initial begin

    $monitor("{D0_tb,D1_tb,D2_tb,D3_tb,D4_tb,D5_tb,D6_tb,D7_tb,D8_tb,D9_tb}=%b,{Y0_tb1,Y1_tb1,Y2_tb1,Y3_tb1}=%b,{Y0_tb2,Y1_tb2,Y2_tb2,Y3_tb2}=%b",{D0_tb,D1_tb,D2_tb,D3_tb,D4_tb,D5_tb,D6_tb,D7_tb,D8_tb,D9_tb},{Y0_tb1,Y1_tb1,Y2_tb1,Y3_tb1},{Y0_tb2,Y1_tb2,Y2_tb2,Y3_tb2});

end
endmodule
