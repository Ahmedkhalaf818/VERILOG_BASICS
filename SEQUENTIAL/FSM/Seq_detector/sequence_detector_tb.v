module Seq_detector_tb();
reg clk_tb;reg rst_tb;reg in_tb; wire y_tb;
Seq_detector DET0 (.in(in_tb),.clk(clk_tb),.rst(rst_tb),.y(y_tb));
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
     #0 in_tb = 0; rst_tb = 1; 
      @(negedge clk_tb) rst_tb = 0;@(negedge clk_tb) in_tb = 1;@(negedge clk_tb) in_tb = 0;@(negedge clk_tb) in_tb = 1;@(negedge clk_tb) in_tb = 0;
 @(negedge clk_tb) in_tb = 1;  @(negedge clk_tb) in_tb = 0;   @(negedge clk_tb) rst_tb = 0;   @(negedge clk_tb) in_tb = 0;    @(negedge clk_tb) in_tb = 0;
 @(negedge clk_tb) in_tb = 1; @(negedge clk_tb) in_tb = 0;  @(negedge clk_tb) in_tb = 0;  @(negedge clk_tb) in_tb = 1; 
         @(negedge clk_tb) in_tb = 0;
         @(negedge clk_tb) in_tb = 0;
           @(negedge clk_tb) in_tb = 1; 
            @(negedge clk_tb) in_tb = 0; 
             @(negedge clk_tb) in_tb = 0;
	    @(negedge clk_tb) rst_tb = 0;
     @(negedge clk_tb) in_tb = 0;
      @(negedge clk_tb) in_tb = 0;
      @(negedge clk_tb) in_tb = 1;
        @(negedge clk_tb) in_tb = 0;
      @(negedge clk_tb) in_tb = 1;
      #15 rst_tb = 1;
      @(negedge clk_tb)
      $stop;
    end
endmodule
