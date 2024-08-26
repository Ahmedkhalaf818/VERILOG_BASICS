module SHIFT_REGISTER_tb();
parameter SHIFT_DIRECTION ="RIGHT";
parameter SHIFT_AMOUNT =2;
reg   clk,load,rst;
reg   [7:0]load_value;
wire  [7:0]PO;
SHIFT_REGISTER #(.SHIFT_DIRECTION(SHIFT_DIRECTION),.SHIFT_AMOUNT(SHIFT_AMOUNT)) DUT(.clk(clk),.load(load),.rst(rst),.load_value(load_value),.PO(PO) );
integer tc=100;
initial begin
clk=1'b0;
forever #(tc/2) clk=~clk;
end
initial begin
rst=1'b1;
load=1;
load_value=$random;
@(negedge clk)
rst=1'b0;
load=1;
load_value=$random;
@(negedge clk)
load=0;
@(negedge clk)
load=1; //another load
load_value=$random;
@(negedge clk)
load=0; //another shift1
@(negedge clk)
load=0; //another shift2
@(negedge clk)
#100;
$stop;
end
endmodule

