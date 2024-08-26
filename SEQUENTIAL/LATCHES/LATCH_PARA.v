module LATCH_PARA #(parameter LAT_WIDTH=4)(
input aset,
input [LAT_WIDTH-1:0]data,
input gate,
input aclr,
output reg [LAT_WIDTH-1:0]q
);
always @(*) begin
if(aclr)
q<=4'b0000;
else if (aset)
q<=4'b1111;
else if (gate)
q<=data;
end
endmodule
