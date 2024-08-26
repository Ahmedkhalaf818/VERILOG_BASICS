module BCD2(D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,Y0,Y1,Y2,Y3);
input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9;
output reg Y0,Y1,Y2,Y3;

always @(*) begin
    if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0000000001)
        {Y3, Y2, Y1, Y0} = 4'b0000;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0000000010)
        {Y3, Y2, Y1, Y0} = 4'b0001;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0000000100)
        {Y3, Y2, Y1, Y0} = 4'b0010;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0000001000)
        {Y3, Y2, Y1, Y0} = 4'b0011;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0000010000)
        {Y3, Y2, Y1, Y0} = 4'b0100;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0000100000)
        {Y3, Y2, Y1, Y0} = 4'b0101;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0001000000)
        {Y3, Y2, Y1, Y0} = 4'b0110;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0010000000)
        {Y3, Y2, Y1, Y0} = 4'b0111;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b0100000000)
        {Y3, Y2, Y1, Y0} = 4'b1000;
    else if ({D9, D8, D7, D6, D5, D4, D3, D2, D1, D0} == 10'b1000000000)
        {Y3, Y2, Y1, Y0} = 4'b1001;
    else
        {Y3, Y2, Y1, Y0} = 4'b0000;
end

endmodule

