module Tesla_tb();
reg clk,rst; reg [7:0] speed_limit;reg [7:0]car_speed;reg [6:0]leading_distance;
wire unlook_doors,accelerate_car;
Tesla T0 (.clk(clk),.rst(rst),
.speed_limit(speed_limit),
.car_speed(car_speed),
.leading_distance(leading_distance),
.unlook_doors(unlook_doors),
.accelerate_car(accelerate_car));
  initial begin #600 $finish; end
  localparam T = 20;
  always
    begin
      clk = 1'b0;
      #(T/2);
      clk = 1'b1;
      #(T/2);
    end
initial
begin
#0 begin rst=1; speed_limit= 8'd126;  leading_distance=7'd45; end
#20 begin rst=0; leading_distance=7'd35; car_speed= 8'd128;end 
#40 begin  car_speed=8'd0; end 
#40 begin leading_distance=7'd60; end 
@(negedge clk) begin car_speed=8'd125; end
#40  begin leading_distance=7'd15; end 
#40 begin leading_distance=7'd45; end 
end
always@(*)
begin $monitor("Time=%t speed_limit=%d car_speed=%d leading_distance=%d unlook_doors=%b  accelerate_car=%b",
 $time, speed_limit, car_speed, leading_distance , unlook_doors,accelerate_car );end
endmodule