module gray_counter(
  input clk,input rst, output [1:0] y);
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
    if (rst) begin state_next = A; end
	else
	case (state_reg)
		A: state_next=B;
		B: state_next=C;
		C: state_next=D;
		D: state_next=A;
	endcase

end
assign y = state_reg;
endmodule