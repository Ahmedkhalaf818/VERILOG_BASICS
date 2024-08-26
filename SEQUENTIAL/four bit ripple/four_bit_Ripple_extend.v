module four_bit_Ripple_extend (
    input clk,
    input set, 
    output reg [3:0] out,
    output div_2,div_4
);

    always @(posedge clk or negedge set) begin
        if (!set) begin
            out <= 4'b1111; 
        end 
        else begin
            out <= out + 1; 
        end
    end
assign div_2=out[0];
assign div_4=out[1];
endmodule

