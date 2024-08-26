module ALSU_tb();
reg clk;
reg rst;
reg [2:0] A;
reg [2:0] B;
reg cin;
reg [2:0] opcode;
reg serial_in;
reg red_op_A;
reg red_op_B;
reg direction;
reg bypass_A;
reg bypass_B;
wire [5:0] out;
wire [15:0]leds;
parameter FULL_ADDER="ON";
parameter INPUT_PRIORITY="A";
ALSU #(.FULL_ADDER(FULL_ADDER),.INPUT_PRIORITY(INPUT_PRIORITY))DUT (.clk(clk),.rst(rst),.A(A),.B(B),.cin(cin),.opcode(opcode),.serial_in(serial_in),.red_op_A(red_op_A),.red_op_B(red_op_B),.direction(direction),.bypass_A(bypass_A),.bypass_B(bypass_B),.out(out),.leds(leds));
integer tc=100;
initial begin
clk=1'b0;
forever #(tc/2) clk=~clk;
end
initial begin
rst=1;
A=7;
B=5;
cin=1'b0;
serial_in=1'b0;
red_op_A=1'b0;
red_op_B=1'b0;
bypass_A=1'b0;
bypass_B=1'b0;
direction=1'b0;
opcode=3'b000;
@(negedge clk) 
rst=0;
A=5;
B=4;
cin=1'b0;
serial_in=1'b0;
red_op_A=1'b0;
red_op_B=1'b0;
bypass_A=1'b1;
bypass_B=1'b1;
direction=1'b0;
opcode=3'b000;
repeat(2) @(negedge clk)
A=2;
B=3;
cin=1'b0;
serial_in=1'b0;
red_op_A=1'b1;
red_op_B=1'b1;
bypass_A=1'b1;
bypass_B=1'b0;
direction=1'b0;
opcode=3'b00;
repeat(2) @(negedge clk)
A=1;
B=4;
cin=1'b0;
serial_in=1'b0;
red_op_A=1'b1;
red_op_B=1'b0;
bypass_A=1'b0;
bypass_B=1'b0;
direction=1'b0;
opcode=3'b111;
repeat(2) @(negedge clk);
$stop;
end
endmodule
