module SLE_tb ();
    reg D,CLK,EN,ALn, ADn, SLn, SD,LAT;
    wire Q;
    SLE DUT (.D(D),.CLK(CLK),.EN(EN),.ALn(ALn),.ADn(ADn),.SLn(SLn),.SD(SD),.LAT(LAT),.Q(Q));
    integer i;
initial begin
CLK=1'b0;
forever
#10 CLK=~CLK;
end
initial begin
        D = 1; EN = 1; ALn = 0;ADn = 0;SLn = 1;SD = 1;LAT = 0;
#15   ALn = 1;  LAT = 1;  SLn = 0;  SD = 0;
#20 SLn = 1;
#20 LAT = 1;  EN = 0;  SLn = 0;
@(negedge CLK)  LAT = 0; EN = 1; 
@(negedge CLK) SLn = 1;  D = 1;
@(negedge CLK) EN = 0; 
#10;
for(i =0 ; i< 99 ; i = i+1) begin
        D = $random;
        EN = $random;
        ALn = $random;
        ADn = $random;
        SLn = $random;
        SD = $random;
        LAT = $random;
        @(negedge CLK);
end
$stop;
end
endmodule
