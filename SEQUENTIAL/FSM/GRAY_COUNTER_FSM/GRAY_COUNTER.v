module gray_COUNTER(clk,rst,gray_out);
input clk,rst;
output  reg [1:0]gray_out;
reg [1:0]BINARY_CODE;
always @(posedge clk or posedge rst) begin
if (rst)
BINARY_CODE<=0;
else 
BINARY_CODE<=BINARY_CODE+1;
end
always @(*) begin
gray_out[0]=^BINARY_CODE[1:0];
gray_out[1]=^BINARY_CODE[1];
end
endmodule

