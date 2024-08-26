module GRAY_COUNTER_FSM(
  input clk,rst,
 output reg [1:0]y);
  reg [1:0] state_reg, state_next;
  localparam A = 2'b00;
  localparam B = 2'b01;
  localparam C = 2'b11;
  localparam D = 2'b10;
  always @(posedge clk or posedge rst)
  begin
    if (rst)
    begin state_reg <= A;end
    else
    begin state_reg <= state_next; end end
always @(*)
  begin 
	case (state_reg)
         A:   state_next=B; 
         B:  state_next=C; 
         C:   state_next=D; 
         D:  state_next=A; 
	endcase
end
always @(*)
  begin 
	case (state_reg)
         A:   y=A; 
         B:   y=B; 
         C:   y=C; 
         D:   y=D; 
	endcase
end
endmodule


