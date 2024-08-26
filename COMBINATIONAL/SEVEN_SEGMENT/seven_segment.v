module seven_segment #(parameter N = 4)(
    input [N-1:0] A,input [N-1:0] B,
    input [1:0] opcode,input enable,
    output reg a,b,c,d,e,f,g );
wire [N-1:0]result; reg [6:0]result_wires;
ALU_OP_test #(.N(N)) ALU(A,B,opcode,result);
always @(*)
begin
 if(enable)
	case (result)
	0: result_wires=7'b1111110;
	1: result_wires=7'b0110000;
	2: result_wires=7'b1101101;
	3: result_wires=7'b1111001;
	4: result_wires=7'b0110011;
	5: result_wires=7'b1011011;
	6: result_wires=7'b1011111;
	7: result_wires=7'b1110000;
	8: result_wires=7'b1111111;
	9: result_wires=7'b1111011;
	10: result_wires=7'b1110111;
	11: result_wires=7'b0011111;
	12: result_wires=7'b1001110;
	13: result_wires=7'b0111101;
	14: result_wires=7'b1001111;
	15: result_wires=7'b1000111;
	default result_wires=7'b0000000;
	endcase
else 
begin result_wires=7'b0000000; end

{a,b,c,d,e,f,g}=result_wires;
end
endmodule