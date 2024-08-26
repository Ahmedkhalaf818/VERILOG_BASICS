module N_bit_parameterized_adder(a,b,clk,cin,rst,cout,sum);
parameter WIDTH=4;
parameter PIPELINE_ENABLE=1;
parameter USE_FULL_ADDER="high";
input [WIDTH-1:0]a;
input [WIDTH-1:0]b;
input clk,cin,rst;
output reg cout;
output reg [WIDTH-1:0]sum;
wire ADD;
c_addsub_0 your_instance_name (
  .A(a),    // input wire [3 : 0] A
  .B(b),    // input wire [14 : 0] B
  .CE(CE),  // input wire CE
  .S(ADD)    // output wire [15 : 0] S
);
generate
case (PIPELINE_ENABLE)
1: begin
     always @(posedge clk) begin
     if(rst)
     {cout,sum}<=0;
     else
       if(USE_FULL_ADDER=="high")
       {cout,sum}<=a+b+cin;
       else if (USE_FULL_ADDER=="low")
       {cout,sum}<=a+b;
     end
   end
0:  begin
    always @(*) begin
      if(USE_FULL_ADDER=="high")
        {cout,sum}=a+b+cin;
       else if (USE_FULL_ADDER=="low")
     {cout,sum}=a+b;
   end
   end
endcase
endgenerate
endmodule
