module RAM_SYN (wr_en,rd_en,blk_select,clk,rst,din,addr_en,addr,dout_en,dout,parity_out);
parameter MEM_WIDTH=16;
parameter MEM_DEPTH=1024;
parameter ADDER_SIZE=10;
parameter ADDER_PIPELINE="TRUE";
parameter DOUT_PIPELINE="TRUE";
parameter PARITY_ENABLE=1;
input wr_en,rd_en,blk_select,clk,rst,dout_en,addr_en;
input [MEM_WIDTH-1 :0]din;
input [ADDER_SIZE-1 :0]addr;
output  [MEM_WIDTH-1 :0]dout;
output  parity_out;
reg [MEM_WIDTH-1 :0] mem [MEM_DEPTH-1:0];
wire [ADDER_SIZE-1 :0]addr_in;
reg [ADDER_SIZE-1 :0]addr_reg;
reg [MEM_WIDTH-1 :0]dout_reg,mem_out;

always @(posedge clk) begin
        if(rst) begin
         addr_reg<=0;
                end
       else if(addr_en==1) begin
        addr_reg<=addr;
        end
end
assign addr_in=(ADDER_PIPELINE=="TRUE")?addr_reg:addr;
always @(posedge clk) begin
        if(rst) begin
         mem_out<=0;
         end
       else 
       if(blk_select) begin
             if (rd_en)
                mem_out <= mem[addr_in];
            if (wr_en)
                mem[addr_in] <= din;
       end
end
always @(posedge clk) begin
        if(rst) begin
                  dout_reg<=0;
                end
       else if(dout_en==1) begin
        dout_reg<=mem_out;
        end
end
assign dout= (DOUT_PIPELINE=="TRUE")? dout_reg : mem_out;
assign parity_out = (PARITY_ENABLE==1) ? ~(^dout) : 1'b1;
endmodule