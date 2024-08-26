module seq_detector(clk,rst,x,y,count);
  input clk,rst,x;
  output y;
  output reg [9:0] count;
  reg [1:0] state_reg, state_next;
  localparam IDLE = 2'b00;
  localparam ZERO = 2'b01;
  localparam ONE = 2'b10;
  localparam STORE = 2'b11;
     always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_reg <= IDLE;
            count <= 10'b0; // Reset the count as well
        end else begin
            state_reg <= state_next;
            if (state_reg == STORE) begin
                count <= count + 1;
            end end
    end
always @(*)
  begin 
	case (state_reg)
         IDLE: if(x) begin state_next=IDLE; end
             else begin state_next=ZERO; end
         ZERO: if(x) begin state_next=ONE; end
             else begin state_next=ZERO; end
         ONE: if(x) begin state_next=IDLE; end
             else begin state_next=STORE; end
         STORE: if(x) begin state_next=IDLE; end
             else begin state_next=ZERO; end
         default: state_next=IDLE;
	endcase
end
assign y = (state_reg==STORE)?1'b1:1'b0;
endmodule
