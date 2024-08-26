module FIFO_tb();
    // Parameters
    parameter FIFO_WIDTH = 16;
    parameter FIFO_DEPTH = 512;
    reg [FIFO_WIDTH-1:0] din_a;
    reg wen_a, ren_b, clk_a, clk_b, rst;
    wire [FIFO_WIDTH-1:0] dout_b;
    wire full, empty;
    FIFO #(
        .FIFO_WIDTH(FIFO_WIDTH),
        .FIFO_DEPTH(FIFO_DEPTH)
    ) DUT_fifo (
        .din_a(din_a),
        .wen_a(wen_a),
        .ren_b(ren_b),
        .clk_a(clk_a),
        .clk_b(clk_b),
        .rst(rst),
        .dout_b(dout_b),
        .full(full),
        .empty(empty)
    );
        integer i=0;
        integer TC_a=10;
        integer TC_b=14;
    initial begin
        clk_a = 0;
        forever #(TC_a/2) clk_a = ~clk_a; // 100MHz clock
    end

    initial begin
        clk_b = 0;
        forever #(TC_b/2) clk_b = ~clk_b; // 71.43MHz clock
    end
    initial begin
     $readmemb("ram.dat",DUT_fifo.ram,0,255);
      rst=1; din_a=$random;
      repeat(2) @(negedge clk_a) rst=0; wen_a=1; ren_b=0;
            for(i=0 ; i<544 ;i=i+1) begin
            @(negedge clk_a)    din_a=$random; 
            end
            repeat(2) @(negedge clk_a)  wen_a=0; ren_b=1;
            for(i=0 ; i<600 ;i=i+1) begin
            @(negedge clk_b);
            end
            repeat(2) @(negedge clk_a) $stop;
    end
endmodule

