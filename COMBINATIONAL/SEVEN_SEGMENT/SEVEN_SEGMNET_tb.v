module SEVEN_SEGMENT_tb();
parameter N_ALU_tb=4;
reg [N_ALU_tb-1:0] A_tb;
reg [N_ALU_tb-1:0] B_tb;
reg enable_tb;
reg [1:0] opcode_tb;
reg [6:0] Y_expected;
wire a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb;
//wire [N_ALU_tb-1:0] result_tb;
SEVEN_SEGMENT #(.N_ALU(N_ALU_tb)) DUT (.A(A_tb),
    .B(B_tb),
    .opcode(opcode_tb),
    .enable(enable_tb),
    .a(a_tb),
    .b(b_tb),
    .c(c_tb),
    .d(d_tb),
    .e(e_tb),
    .f(f_tb),
    .g(g_tb));
initial begin
#0 A_tb=0;B_tb=0;enable_tb=1;opcode_tb=0;Y_expected=7'b1111110;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=3;B_tb=2;enable_tb=1;opcode_tb=2;Y_expected=7'b0110000;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=2;B_tb=2;enable_tb=1;opcode_tb=1;Y_expected=7'b1101101;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=2;B_tb=1;opcode_tb=0;Y_expected=7'b1111001;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=0;B_tb=4;opcode_tb=11;Y_expected=7'b0110011;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=1;B_tb=4;opcode_tb=00;Y_expected=7'b1011011;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=2;B_tb=4;Y_expected=7'b1011111;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=6;B_tb=1;Y_expected=7'b1110000;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=6;B_tb=2;Y_expected=7'b1111111;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=6;B_tb=3;Y_expected=7'b1111011;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=4'hA;B_tb=0;Y_expected=7'b1110111;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=4'hA;B_tb=1;Y_expected=7'b0011111;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=4'hA;B_tb=2;Y_expected=7'b1001110;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=4'hA;B_tb=3;Y_expected=7'b0111101;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=4'hC;B_tb=2;Y_expected=7'b1001111;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
 A_tb=4'hB;B_tb=4;Y_expected=7'b1000111;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
enable_tb=0;Y_expected=7'b0000000;
#5;
if( {a_tb,b_tb,c_tb,d_tb,e_tb,f_tb,g_tb} != Y_expected) begin
$display("error ,there are some thing not correct1");
$stop;
end
#10;
$stop;
end
initial begin
    $monitor ("A_tb=%b, B_tb=%b, opcode_tb=%b, enable_tb=%b, Y_expected=%b, {a_tb, b_tb, c_tb, d_tb, e_tb, f_tb, g_tb}=%b",
A_tb, B_tb, opcode_tb, enable_tb, Y_expected, {a_tb, b_tb, c_tb, d_tb, e_tb, f_tb, g_tb});
end
endmodule
