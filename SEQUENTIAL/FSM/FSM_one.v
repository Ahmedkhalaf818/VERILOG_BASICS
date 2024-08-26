module FSM_one(
  input x,input clk,input rst, // active high
  output y,output [9:0] count);
  reg [1:0] state_reg, state_next;
  reg [9:0] count_reg, count_next;
  localparam ZERO = 2'b00;
  localparam ONE = 2'b01;
  localparam IDLE = 2'b11;
  localparam STORE = 2'b10;
  always @(posedge clk or posedge rst)
  begin
    if (rst)
    begin state_reg <= IDLE;count_reg <= 10'b0;end
    else
    begin state_reg <= state_next;count_reg <= count_next; end end
  always @(*)
  begin
    if (rst)
    begin state_next = IDLE;count_next = 10'b0; end
     else
    begin
      case (state_reg)
        IDLE: begin
            if (x) state_next = IDLE;
            else state_next = ZERO; end
	ZERO: begin
            if (x) state_next = ONE;
            else state_next = ZERO; end
        ONE: begin
            if (x) state_next = IDLE;
            else state_next = STORE; end
        STORE: begin
            count_next = count_reg + 1;
            if (x) state_next = IDLE;
            else state_next = ZERO; end
      endcase
    end
  end
  assign y = (state_reg == STORE);
  assign count = count_reg;
endmodule

