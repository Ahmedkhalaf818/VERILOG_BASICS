module GRAY_CODE (
    input [2:0] A,
    output reg [6:0] B
);
parameter USE_GRAY = 1;

generate
    if (USE_GRAY) begin 
        always @(*) begin
            case (A)
                3'b000: B = 7'b0000000;
                3'b001: B = 7'b0000001;
                3'b010: B = 7'b0000011;
                3'b011: B = 7'b0000010;
                3'b100: B = 7'b0000110;
                3'b101: B = 7'b0000111;
                3'b110: B = 7'b0000101;
                3'b111: B = 7'b0000100;
                default: B = 7'b0000000;
            endcase
        end
    end else begin 
        always @(*) begin
            case (A)
		3'b000: B = 7'b0000000;
                3'b001: B = 7'b0000001;
                3'b010: B = 7'b0000010;
                3'b011: B = 7'b0000100;
                3'b100: B = 7'b0001000;
                3'b101: B = 7'b0010000;
                3'b110: B = 7'b0100000;
                3'b111: B = 7'b1000000;
                default: B = 7'b0000000;
            endcase
        end
    end
endgenerate

endmodule

