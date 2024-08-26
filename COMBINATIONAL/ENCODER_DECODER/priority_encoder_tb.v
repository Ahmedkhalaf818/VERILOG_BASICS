module PRIORITY_ENCODER_tb();
reg [3:0] X_tb;
reg [1:0] Y_EXPECTED;
wire [1:0] Y_tb;
PRIORITY_ENCODER DUT(X_tb,Y_tb);
/*initial */
integer i;
initial begin
for(i=0 ; i<99; i=i+1) begin
X_tb=$random;
#0;
casex(X_tb)
4'b1xxx : Y_EXPECTED=2'b11;
4'b01xx : Y_EXPECTED=2'b10;
4'b001x : Y_EXPECTED=2'b01;
4'b000x : Y_EXPECTED=2'b00;
endcase
if(Y_EXPECTED != Y_tb) begin
$display("error ,there are some thing not correct1");
end
#10;
end
X_tb=4'b1111;  Y_EXPECTED=2'b00;
if(Y_EXPECTED != Y_tb) begin
$display("error ,there are some thing not correct1");
end
$stop;
end
initial begin

    $monitor("X_tb=%b,Y_EXPECTED=%b,Y_tb=%b",X_tb,Y_EXPECTED,Y_tb);

end
endmodule
