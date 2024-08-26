module D_FLIPFLOP(
input d, rstn, clk,
output reg q,
output  qbar);
always @(posedge clk or negedge rstn) begin 
if (~rstn)
q<=1'b0;
else
q<=d;
end
assign qbar=~q;
endmodule