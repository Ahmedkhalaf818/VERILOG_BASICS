module N_bit_parameterized_adder_tb();
parameter WIDTH=4;
parameter PIPELINE_ENABLE=0;
parameter USE_FULL_ADDER="low";
reg [WIDTH-1:0]a;
reg [WIDTH-1:0]b;
reg clk,cin,rst;
wire  cout;
wire  [WIDTH-1:0]sum;
N_bit_parameterized_adder #(.WIDTH(WIDTH),.PIPELINE_ENABLE(PIPELINE_ENABLE),.USE_FULL_ADDER(USE_FULL_ADDER)) DUT(.a(a),.b(b),.clk(clk),.cin(cin),.rst(rst),.cout(cout),.sum(sum) );
integer i=0;
integer tc=100;
initial begin
clk=1'b0;
forever #(tc/2) clk=~clk;
end
initial begin
rst=1'b1;
a=4;
b=5;
cin=1;
@(negedge clk)
rst=1'b0;
@(negedge clk);
for (i=0; i<99 ; i=i+1) begin
a=$random;
b=$random;
cin=$random;
@(negedge clk);
end
$stop;
end
endmodule
