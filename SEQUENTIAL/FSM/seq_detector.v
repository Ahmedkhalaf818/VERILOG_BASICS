module seq_detector(
  input clk,rst,in,
 output y);
  reg [1:0] state_reg, state_next;
  localparam S0 = 2'b00;
  localparam S1 = 2'b01;
  localparam S2 = 2'b10;
  localparam S3 = 2'b11;
  always @(posedge clk or posedge rst)
  begin
    if (rst)
    begin state_reg <= S0;end
    else
    begin state_reg <= state_next; end end
always @(*)
  begin 
    if (rst) begin state_next = S0; end
	else
	case (state_reg)
         S0: if(in) begin state_next=S1; end
             else begin state_next=S0; end
         S1: if(in) begin state_next=S2; end
             else begin state_next=S1; end
         S2: if(in) begin state_next=S3; end
             else begin state_next=S2; end
         S3: if(in) begin state_next=S1; end
             else begin state_next=S0; end
         default: state_next=S0;
	endcase
end
assign y = ((state_reg==S3)&in);
endmodule
