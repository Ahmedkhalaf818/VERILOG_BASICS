`timescale 1ns / 1ps

module tb_RAM_SYN();
    parameter MEM_WIDTH = 16;
    parameter MEM_DEPTH = 1024;
    parameter ADDER_SIZE = 10;
    parameter ADDER_PIPELINE = "TRUE";
    parameter DOUT_PIPELINE = "TRUE";
    parameter PARITY_ENABLE = 1;

    reg wr_en;
    reg rd_en;
    reg blk_select;
    reg clk;
    reg rst;
    reg dout_en;
    reg addr_en;
    reg [MEM_WIDTH-1:0] din;
    reg [ADDER_SIZE-1:0] addr;
    wire [MEM_WIDTH-1:0] dout;
    wire parity_out;

    RAM_SYN #(
        .MEM_WIDTH(MEM_WIDTH),.MEM_DEPTH(MEM_DEPTH),.ADDER_SIZE(ADDER_SIZE),.ADDER_PIPELINE(ADDER_PIPELINE),.DOUT_PIPELINE(DOUT_PIPELINE),.PARITY_ENABLE(PARITY_ENABLE)
    ) RAM (
        .wr_en(wr_en),.rd_en(rd_en),.blk_select(blk_select),
        .clk(clk),.rst(rst),.dout_en(dout_en),.addr_en(addr_en),.din(din),.addr(addr),.dout(dout),.parity_out(parity_out)
    );
    integer i=0;
    integer tc=50;
    initial begin
     clk=1'b0;
     forever #(tc/2) clk=~clk;
    end
    initial begin
        $readmemh("mem.dat",RAM.mem,0,1024);
        rst = 1;
        wr_en = 0; rd_en = 0;
        blk_select = 0; dout_en = 0;
       addr_en = 1;din = 0;addr = 0;
        @(negedge clk) rst = 0;  blk_select = 1;
        for ( i = 0; i < 8; i = i + 1) begin
            @(negedge clk) begin
                addr = $random;din = $random;dout_en= $random;
            end
        end
        @(negedge clk)   blk_select = 1;  wr_en = 1;rd_en = 0;
        for ( i = 0; i < 8; i = i + 1) begin
            @(negedge clk) begin
                addr = $random; din = $random; dout_en= $random;
            end
        end
        @(negedge clk)   blk_select = 1;  wr_en = 0; rd_en = 1;
        for ( i = 0; i < 8; i = i + 1) begin
            @(negedge clk) begin
                addr = $random;din = $random;dout_en= $random;
            end
        end 
        @(negedge clk)   blk_select = 1;  wr_en = 1; rd_en = 1;
        for ( i = 0; i < 8; i = i + 1) begin
            @(negedge clk) begin
                addr = $random; din = $random; dout_en= $random;
            end
        end 
        @(negedge clk) $stop;                        
    end
endmodule



