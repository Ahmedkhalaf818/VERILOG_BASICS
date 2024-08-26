module DSP_tb();
parameter OPERATION="ADD";
reg[17:0]A;
reg [17:0]B;
reg [47:0]C;
reg [17:0]D;
reg clk;
reg rst_n;
wire [47:0]P;
DSP #(.OPERATION(OPERATION)) DUT (.A(A),.B(B),.C(C),.D(D),.clk(clk),.rst_n(rst_n),.P(P));
integer TC=100;
initial begin
clk=0;
forever
#(TC/2) clk=~clk;
end
initial begin
A=1;
B=2;
C=5;
D=9;
rst_n=0;
@(negedge clk) 
rst_n=1;
A=1;
B=2;
C=5;
D=9;
@(negedge clk);
A=2;
B=3;
C=7;
D=11;
@(negedge clk);
A=9;
B=7;
C=2;
D=4;
@(negedge clk);
A=8;
B=4;
C=3;
D=2;
@(negedge clk);
A=11;
B=6;
C=7;
D=5;
@(negedge clk);
A=0;
B=5;
C=4;
D=0;
@(negedge clk);
A=0;
B=2;
C=1;
D=0;
@(negedge clk);
A=7;
B=4;
C=5;
D=9;
@(negedge clk);
$stop;


end
endmodule
