module FSM_one_tb();
  reg x_tb;
  reg clk_tb;
  reg rst_tb;
  wire y_tb;
  wire [9:0] count_tb;
FSM_one FSM0 (.x(x_tb),.clk(clk_tb),.rst(rst_tb),.y(y_tb),.count(count_tb));
  initial begin #450 $finish; end
  localparam T = 20;
  always
    begin
      clk_tb = 1'b0;
      #(T/2);
      clk_tb = 1'b1;
      #(T/2);
    end
  initial
    begin
      #0 x_tb = 0; rst_tb = 1;
      @(negedge clk_tb) rst_tb = 0;
         #20 rst_tb = 0;
      @(negedge clk_tb) x_tb = 1;
        @(negedge clk_tb) x_tb = 0;
      @(negedge clk_tb) x_tb = 1;
         @(negedge clk_tb) x_tb = 0;
      @(negedge clk_tb) x_tb = 1;
        @(negedge clk_tb) x_tb = 0;
 	  #40 @(negedge clk_tb) rst_tb = 1;
	    #20 rst_tb = 0;
	    #20 x_tb = 0;
  	    #20 x_tb = 0;
      @(negedge clk_tb) x_tb = 1;
         #20 x_tb = 0;
  	    #20 x_tb = 0;
      @(negedge clk_tb) x_tb = 1;
         #20 x_tb = 0;
  	    #20 x_tb = 0;
      @(negedge clk_tb) x_tb = 1;
         #20 x_tb = 0;
    end
always@(*)
begin $monitor("Time=%t State=%b X=%b Y=%b Count=%d", $time, FSM0.state_reg, x_tb, y_tb , count_tb);end
endmodule

