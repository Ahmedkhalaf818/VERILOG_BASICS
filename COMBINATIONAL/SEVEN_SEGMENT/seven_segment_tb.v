module seven_segment_tb();
parameter N = 4;
reg [N-1:0] A_tb;
reg [N-1:0] B_tb;
reg enable_tb;
reg [1:0] opcode_tb;
wire a,b,c,d,e,f,g;
seven_segment #(.N(N)) DUT (
.A(A_tb),.B(B_tb),.enable(enable_tb),.opcode(opcode_tb),
.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g)
);
initial begin #200 $finish;end
initial
begin
#0 begin A_tb=4'h5; B_tb=4'h9; opcode_tb=2'h0; enable_tb=1; end
#10 begin A_tb=4'hA; B_tb=4'h2; opcode_tb=2'h0; enable_tb=1; end
#10 begin A_tb=4'h5; B_tb=4'hA; opcode_tb=2'h3; enable_tb=1;  end
#10 begin A_tb=4'h8; B_tb=4'h0; opcode_tb=2'h3; enable_tb=1; end
#10 begin A_tb=4'h9; B_tb=4'h1; opcode_tb=2'h2; enable_tb=1; end
#10 begin A_tb=4'h5; B_tb=4'h8; opcode_tb=2'h2; enable_tb=1; end
#10 begin A_tb=4'hB; B_tb=4'h6; opcode_tb=2'h1; enable_tb=1; end
#10 begin A_tb=4'h4; B_tb=4'h9; opcode_tb=2'h1; enable_tb=1; end
#10 begin A_tb=4'hF; B_tb=4'h1; opcode_tb=2'h2; enable_tb=0; end
#10 begin A_tb=4'h5; B_tb=4'h8; opcode_tb=2'h1; enable_tb=1; end
#10 begin A_tb=4'h9; B_tb=4'h6; opcode_tb=2'h3; enable_tb=0; end
#10 begin A_tb=4'h4; B_tb=4'h9; opcode_tb=2'h0; enable_tb=1; end
end
always @(A_tb or B_tb or opcode_tb or a or b or c or d or e or f or g or enable_tb)
begin
 $monitor ("%t A_tb=%h B_tb=%h opcode_tb=%h enable_tb=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b  ",
$time,A_tb,B_tb,opcode_tb,enable_tb,a,b,c,d,e,f,g );
end
endmodule
