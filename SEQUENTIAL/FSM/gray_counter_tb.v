module gray_counter_tb();
  reg clk_tb;
  reg rst_tb;
  wire [1:0]y_tb;

 gray_counter GRY0(.clk(clk_tb),.rst(rst_tb),.y(y_tb));
 initial begin #400 $finish; end
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
    #0 rst_tb = 1;
    @(negedge clk_tb) rst_tb = 0;
    #200 rst_tb = 1;
    #20 rst_tb = 0;
     wait(2) rst_tb = 1;  
    #20 rst_tb = 0;
    #45  rst_tb = 1;  
    end
always@(*)
begin $monitor("Time=%t  Y=%b", $time, y_tb);end
endmodule
