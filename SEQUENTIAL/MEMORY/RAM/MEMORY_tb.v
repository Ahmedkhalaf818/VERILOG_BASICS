module MEMORY_tb();
parameter MEM_WIDTH=16;
parameter MEM_DEPTH=1024;
parameter ADDER_SIZE=10;
reg wr_en,rd_en,blk_select,clk,rst;
reg [MEM_WIDTH-1 :0]din;
reg [ADDER_SIZE-1 :0]adde_wr;
reg [ADDER_SIZE-1 :0]addr_rd;
wire [MEM_WIDTH-1 :0]dout;

MOMORY #(.MEM_WIDTH(MEM_WIDTH),.MEM_DEPTH(MEM_DEPTH),.ADDER_SIZE(ADDER_SIZE)) m1(.wr_en(wr_en),.rd_en(rd_en),.clk(clk),.blk_select(blk_select),.rst(rst),.din(din),.adde_wr(adde_wr),.addr_rd(addr_rd),.dout(dout) );
integer i;
integer tc=100;
initial begin
clk=0;
forever #(tc/2) clk=~clk;
end
initial begin
$readmemh("mem.data",m1.mem);
rst=1;
@(negedge clk)
rst=0;
rd_en=0;
wr_en=0;
addr_rd=0;
@(negedge clk)
for (i=0; i<10 ; i=i+1) begin
addr_rd=$random;
adde_wr=~addr_rd;
@(negedge clk);
end
rd_en=1;
for (i=0; i<10 ; i=i+1) begin
addr_rd=$random;
adde_wr=~addr_rd;
@(negedge clk);
end
rd_en=0;
wr_en=1;
for (i=0; i<10 ; i=i+1) begin
addr_rd=$random;
adde_wr=~addr_rd;
@(negedge clk);
end
rd_en=1;
for (i=0; i<10 ; i=i+1) begin
addr_rd=$random;
adde_wr=~addr_rd;
@(negedge clk);
end
end 
endmodule
