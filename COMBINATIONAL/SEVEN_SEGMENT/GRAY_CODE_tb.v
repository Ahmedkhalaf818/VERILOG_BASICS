module GRAY_CODE_tb();
parameter USE_GRAY=0;
reg [2:0] A_tb;
wire [6:0] B_tb;
GRAY_CODE #(.USE_GRAY(USE_GRAY)) DUT (
    .A(A_tb),
    .B(B_tb)
);
integer i;

initial begin
    // Apply test vectors
    for (i = 0; i < 8; i = i + 1) begin
        A_tb = i;
        #10;
    end
end

initial begin
    $monitor("USE_GRAY=%b, A_tb=%b, B_tb=%b", USE_GRAY, A_tb, B_tb);
end

endmodule
