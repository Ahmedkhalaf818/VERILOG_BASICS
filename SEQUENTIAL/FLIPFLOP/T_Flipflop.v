module T_Flipflop(
input t, rstn, clk,
output reg q,
output  qbar);
always @(posedge clk or negedge rstn) begin 
if (~rstn)
q<=1'b0;
else if(t)
q<=~q;
end
assign qbar=~q;
endmodule


