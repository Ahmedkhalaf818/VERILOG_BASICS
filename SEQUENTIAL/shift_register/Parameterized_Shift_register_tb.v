module Parameterized_Shift_register_tb();
parameter LOAD_AVALUE=1;
parameter SHIFT_DIRECTION="LEFT";
parameter LOAD_SVALUE=1;
parameter SHIFT_WIDTH=8;
 reg sclr,sset,shiftin,load,clock,enable,aclr,aset;
 reg [SHIFT_WIDTH-1:0]data;
 wire shiftout;
 wire [SHIFT_WIDTH-1:0]q;
 Parameterized_Shift_register #(.LOAD_AVALUE(LOAD_AVALUE),.SHIFT_DIRECTION(SHIFT_DIRECTION),.LOAD_SVALUE(LOAD_SVALUE),.SHIFT_WIDTH(SHIFT_WIDTH)) DUT(
    .sclr(sclr),.sset(sset),.shiftin(shiftin),.load(load),.clock(clock),.enable(enable),.aclr(aclr),.aset(aset),.data(data),.shiftout(shiftout),.q(q));
    integer i;
initial begin
clock=1'b0;
forever
#10 clock=~clock;
end
initial begin
sclr=1; sset=1; shiftin=1; load=1; enable=0; aclr=0; aset=1; data=9;
@(negedge clock) aclr=1; aset=0; enable=1; sset=0;
@(negedge clock) load=0;
@(negedge clock) aset=1;
@(negedge clock) aset=0; sclr=0;
@(negedge clock) sclr=1; 
@(negedge clock) sset=1;
@(negedge clock) sset=0;
@(negedge clock);
for(i=0 ; i<1000 ; i=i+1) begin
shiftin=$random; load=$random; enable=$random; data=$random;@(negedge clock);
end
$stop;
end
endmodule
