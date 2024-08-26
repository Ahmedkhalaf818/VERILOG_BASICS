module DATA_LATCH(CLR,D,G,Q);
input CLR,D,G;
output reg Q;
always @(*) begin 
if(~CLR)
Q<= 1'b0;
else if (G)
Q<= D;
end
endmodule
