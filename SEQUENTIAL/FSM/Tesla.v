module TESLA(clk,rst,speed_limit,car_speed,leading_distance,unlook_doors,accelerate_car);
  input clk,rst;
  input [7:0]speed_limit;
  input [7:0] car_speed;
  input [6:0]leading_distance;
  output unlook_doors,accelerate_car;
  reg [1:0] state_reg, state_next;
  parameter MIN_DISTANCE=7'd40;
  parameter STOP = 2'b00;
  parameter ACCELERATE = 2'b01;
  parameter DECELERATE = 2'b10;
// logic state memory
  always @(posedge clk or posedge rst) begin
    if (rst)begin state_reg <= STOP;end
    else begin state_reg <= state_next; end 
end
// logic next state memory
always @(*)begin 
case(state_reg)
STOP: if(leading_distance>=MIN_DISTANCE)begin state_next=ACCELERATE; end
      else begin state_next=STOP; end
ACCELERATE: if((leading_distance>=MIN_DISTANCE)&& (car_speed < speed_limit))
	    begin state_next=ACCELERATE; end
            else begin state_next=DECELERATE; end
DECELERATE: if((leading_distance<MIN_DISTANCE)|| (car_speed > speed_limit))
		begin state_next=DECELERATE; end
	    else if((leading_distance>=MIN_DISTANCE)&& (car_speed < speed_limit))
	    begin state_next=ACCELERATE; end
            else if (car_speed==0) begin state_next=STOP; end
	    else begin state_next=STOP; end
	    default: state_next=STOP;
	endcase 
end
// output state logic
assign unlook_doors = (state_reg==STOP);
assign accelerate_car = (state_reg==ACCELERATE);
endmodule