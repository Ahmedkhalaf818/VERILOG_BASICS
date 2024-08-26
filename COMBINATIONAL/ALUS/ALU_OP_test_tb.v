module ALU_OP_test_tb ;
parameter N = 4;
reg [N-1:0] A_tb;
reg [N-1:0] B_tb;
reg [1:0] opcode_tb;
wire [N-1:0] result_tb; 
ALU_OP_test #(.N(N)) DUT (
.A(A_tb),
.B(B_tb),
.opcode(opcode_tb),
.result(result_tb)
);
initial begin
#100 $finish;
end
initial
begin
#0 begin A_tb=4'h5; B_tb=4'h9; opcode_tb=2'h0; end
#10 begin A_tb=4'hA; B_tb=4'h2; opcode_tb=2'h0; end
#10 begin A_tb=4'h5; B_tb=4'hA; opcode_tb=2'h3; end
#10 begin A_tb=4'h8; B_tb=4'h0; opcode_tb=2'h3; end
#10 begin A_tb=4'h9; B_tb=4'h1; opcode_tb=2'h2; end
#10 begin A_tb=4'h5; B_tb=4'h8; opcode_tb=2'h2; end
#10 begin A_tb=4'hB; B_tb=4'h6; opcode_tb=2'h1; end
#10 begin A_tb=4'h4; B_tb=4'h9; opcode_tb=2'h1; end
end
always @(A_tb or B_tb or opcode_tb or result_tb)
begin
 $monitor ("%t A_tb=%h B_tb=%h opcode_tb=%h result_tb=%h",$time,A_tb,B_tb,opcode_tb,result_tb );
end
endmodule