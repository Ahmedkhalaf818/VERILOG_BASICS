module gRAY_COUNTER_FSM_tb();
reg clk_tb;
reg rst_tb;
wire [1:0]y_tb;
wire [1:0]gray_out;
GRAY_COUNTER_FSM DET0 (.clk(clk_tb),.rst(rst_tb),.y(y_tb));
gray_COUNTER DUT(.clk(clk_tb),.rst(rst_tb),.gray_out(gray_out));
integer i=0;
localparam T = 20;
initial
    begin
      clk_tb = 1'b0;
      forever begin
      #(T/2);
      clk_tb = ~clk_tb;
      end
    end
  initial begin
      rst_tb = 1; 
      @(negedge clk_tb) rst_tb = 0;
      for(i = 0; i<99; i=i+1 ) begin
      @(negedge clk_tb);
      if(y_tb != gray_out) begin
      $display("error");
      $stop;
      end
      end
      $stop;
    end
endmodule

