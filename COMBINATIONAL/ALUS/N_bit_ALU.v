module N_BIT_ALU(A,B,opcode,result);
parameter N_ALU=4;
input [N_ALU-1:0] A;
input [N_ALU-1:0] B;
input [1:0] opcode;
output reg [N_ALU-1:0] result;
wire [N_ALU-1:0]ADD_signal;
 N_BIT_ADDER #(.N(N_ALU)) ADDER0(.A(A),.B(B),.C(ADD_signal));
always @(*) begin
case (opcode)
2'b00: result = ADD_signal;
2'b01: result = A | B;
2'b10: result = A-B;
2'b11: result = A^B;
endcase
end
endmodule
