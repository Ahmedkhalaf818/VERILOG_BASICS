module seq_detector_tb();
  reg clk_tb;reg rst_tb;reg in_tb; wire y_tb;
seq_detector DET0 (.in(in_tb),.clk(clk_tb),.rst(rst_tb),.y(y_tb));
initial begin #450 $finish; end
  localparam T = 20;
  always
    begin
      clk_tb = 1'b0;
      #(T/2);
      clk_tb = 1'b1;
      #(T/2);
    end
  initial begin
      #0 in_tb = 0; rst_tb = 1; @(negedge clk_tb) rst_tb = 0;
      @(negedge clk_tb) in_tb = 1;@(negedge clk_tb) in_tb = 0;
      @(negedge clk_tb) in_tb = 1; @(negedge clk_tb) in_tb = 0;
      @(negedge clk_tb) in_tb = 1;
      @(negedge clk_tb) in_tb = 0;#20 rst_tb = 0;#20 in_tb = 0;#20 in_tb = 0;
      @(negedge clk_tb) in_tb = 1;
         #20 in_tb = 0; #20 in_tb = 0;
      @(negedge clk_tb) in_tb = 1;
         #20 in_tb = 0;#20 in_tb = 0;
      @(negedge clk_tb) in_tb = 1;
         #20 in_tb = 0;
@(negedge clk_tb) in_tb = 0;
	    #20 rst_tb = 0;#20 in_tb = 0;#20 in_tb = 0;
      @(negedge clk_tb) in_tb = 1;
        @(negedge clk_tb) in_tb = 0;
      @(negedge clk_tb) in_tb = 1;
      #15 rst_tb = 1;
    end
always@(*)
begin $monitor("Time=%t input=%b reset=%b Y=%b", $time, in_tb, rst_tb, y_tb);end
endmodule