module DUMUX_tb();
reg D_tb;
reg [1:0]S_tb;
wire[3:0]Y_tb;
reg [3:0] Y_expected;

DUMUX DUT(D_tb,S_tb,Y_tb);
integer i,j;
initial begin
#0;
for(i=0 ; i<=1 ; i=i+1) begin
D_tb=i;
for(j=0 ; j<=3 ; j=j+1) begin
S_tb=j;
#1
case(S_tb)
2'b00: Y_expected={3'b000,D_tb};
2'b01: Y_expected={2'b00,D_tb,1'b0};
2'b10: Y_expected={1'b0,D_tb,2'b00};
2'b11: Y_expected={D_tb,3'b000};
default : Y_expected=4'b0000;
endcase
#5;
if(Y_expected != Y_tb ) begin
$display("error");
$stop;
end
#10;
end
end
end
initial begin
$monitor ("D_tb=%b,S_tb=%b,Y_expected=%b,Y_tb=%b",D_tb,S_tb,Y_expected,Y_tb);
end
endmodule
