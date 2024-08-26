module FIFO #(
    parameter FIFO_WIDTH = 16,
    parameter FIFO_DEPTH = 512
) (
    input [FIFO_WIDTH-1:0] din_a,
    input wen_a,
    input ren_b,
    input clk_a,
    input clk_b,
    input rst,
    output reg [FIFO_WIDTH-1:0] dout_b,
    output full,
    output empty
);
    reg [FIFO_WIDTH-1:0] ram [FIFO_DEPTH-1:0];
    reg [9:0] write_pointer, read_pointer, fifo_count;

    assign full = (FIFO_DEPTH == fifo_count) ? 1'b1 : 1'b0;
    assign empty = (fifo_count == 0) ? 1'b1 : 1'b0;

    always @(posedge clk_a) begin
        if (rst) begin
            write_pointer <= 0;
        end else if (wen_a && !full) begin
            ram[write_pointer] <= din_a;
            write_pointer <= write_pointer + 1;
        end
    end

    always @(posedge clk_b) begin
        if (rst) begin
            read_pointer <= 0;
            dout_b <= 0;
        end else if (ren_b && !empty) begin
            dout_b <= ram[read_pointer];
            read_pointer <= read_pointer + 1;
        end
    end

    always @(posedge clk_a) begin
        if (rst) begin
            fifo_count <= 0;
        end else begin
            if (wen_a && !full && !(ren_b && !empty)) begin
                fifo_count <= fifo_count + 1;
            end 
        end
    end
        always @(posedge clk_b) begin
        if (rst) begin
            fifo_count <= 0;
        end else begin
             if (ren_b && !empty && !(wen_a && !full)) begin
                fifo_count <= fifo_count - 1;
            end
        end
    end

endmodule
