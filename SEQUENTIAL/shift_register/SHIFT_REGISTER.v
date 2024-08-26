module SHIFT_REGISTER(clk,rst,load,load_value,PO);
parameter SHIFT_DIRECTION ="LEFT";
parameter SHIFT_AMOUNT =1;
input clk,rst,load;
input [7:0]load_value;
output reg [7:0]PO;
generate
case (SHIFT_DIRECTION) 
"LEFT" : begin
           always @(posedge clk or posedge rst) begin
            if (rst)
            PO<=0;
            else if (load)
            PO<=load_value;
            else 
            case (SHIFT_AMOUNT)
            1: PO<=PO<<1;
            2: PO<=PO<<2;
            3: PO<=PO<<3;
            4: PO<=PO<<4;
            5: PO<=PO<<5;
            6: PO<=PO<<6;
            7: PO<=PO<<7;
            endcase
           end
         end
"RIGHT" : begin
           always @(posedge clk or posedge rst) begin
            if (rst)
            PO<=0;
            else if (load)
            PO<=load_value;
            else 
            case (SHIFT_AMOUNT)
            1: PO<=PO>>1;
            2: PO<=PO>>2;
            3: PO<=PO>>3;
            4: PO<=PO>>4;
            5: PO<=PO>>5;
            6: PO<=PO>>6;
            7: PO<=PO>>7;
            endcase
           end
          end
endcase
endgenerate
endmodule
