module LATCH_PARA_tb;
    parameter LAT_WIDTH = 4;
    reg aset;
    reg [LAT_WIDTH-1:0] data;
    reg gate;
    reg aclr;
    wire [LAT_WIDTH-1:0] q;
    LATCH_PARA #(LAT_WIDTH) DUT (
        .aset(aset), 
        .data(data), 
        .gate(gate), 
        .aclr(aclr), 
        .q(q)
    );
integer i;
    initial begin
        aset = 1;
        data = 5;
        gate = 1;
        aclr = 1;
        #100
        aclr = 1; 
        aset = 0;
        #100;
        aclr = 0;
        aset = 1;
        #100;
        aset = 0;
        #100;
        gate = 1;
        for(i= 0;i<99 ;i=i+1) begin
         data=$random;
         #($random);
          gate = $random;
        end
 end
endmodule

