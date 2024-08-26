module MOMORY (wr_en,rd_en,blk_select,clk,rst,din,adde_wr,addr_rd,dout);
parameter MEM_WIDTH=16;
parameter MEM_DEPTH=1024;
parameter ADDER_SIZE=10;
input wr_en,rd_en,blk_select,clk,rst;
input [MEM_WIDTH-1 :0]din;
input [ADDER_SIZE-1 :0]adde_wr;
input [ADDER_SIZE-1 :0]addr_rd;
output reg [MEM_WIDTH-1 :0]dout;
reg [MEM_WIDTH-1 :0] mem [MEM_DEPTH-1:0];
always @(posedge clk) begin
if(rst)
 dout<=0;
else begin
if(blk_select) begin
if (wr_en)
mem[adde_wr]<=din;
if(rd_en)
dout<=mem[addr_rd];
end
end
end
endmodule
