module SEVEN_SEGMENT(A,B,opcode,enable,a,b,c,d,e,f,g);
parameter N_ALU=4;
input [N_ALU-1:0] A;
input [N_ALU-1:0] B;
input [1:0] opcode;
input enable;
output reg a,b,c,d,e,f,g;
wire [N_ALU-1:0]ADD_signal;
 N_BIT_ALU #(.N_ALU(N_ALU)) ALU1(.A(A),.B(B),.opcode(opcode),.result(ADD_signal));
always @(*) begin
if(enable)
	case(ADD_signal)
		0: {a,b,c,d,e,f,g}=7'b1111110;
		1: {a,b,c,d,e,f,g}=7'b0110000;
		2: {a,b,c,d,e,f,g}=7'b1101101;
		3: {a,b,c,d,e,f,g}=7'b1111001;//
		4: {a,b,c,d,e,f,g}=7'b0110011;//
		5: {a,b,c,d,e,f,g}=7'b1011011;//
		6: {a,b,c,d,e,f,g}=7'b1011111;//
		7: {a,b,c,d,e,f,g}=7'b1110000;//
		8: {a,b,c,d,e,f,g}=7'b1111111;//
		9: {a,b,c,d,e,f,g}=7'b1111011;//
		4'hA: {a,b,c,d,e,f,g}=7'b1110111;
		4'hB: {a,b,c,d,e,f,g}=7'b0011111;
		4'hC: {a,b,c,d,e,f,g}=7'b1001110;//
		4'hD: {a,b,c,d,e,f,g}=7'b0111101;//
		4'hE: {a,b,c,d,e,f,g}=7'b1001111;
		4'hF: {a,b,c,d,e,f,g}=7'b1000111;
                default : {a,b,c,d,e,f,g}=7'b0000000;
        endcase
else
{a,b,c,d,e,f,g}=7'b0000000;
end
endmodule
