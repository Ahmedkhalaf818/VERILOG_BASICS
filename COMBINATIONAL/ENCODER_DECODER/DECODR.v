
module DECODR(
input [1:0]A,
output reg [3:0]D);
 always @(A)
    begin
        D = 4'b0000;
        case(A)
            0: D = 4'b0001; 
            1: D = 4'b0010;
            2: D = 4'b0100;
            3: D = 4'b1000;
            default: D = 4'b0000;
        endcase
    end  
endmodule