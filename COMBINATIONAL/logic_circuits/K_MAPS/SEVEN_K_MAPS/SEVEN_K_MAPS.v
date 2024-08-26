module SEVEN_K_MAPS (
    input [4:1] x,
    output f
); 
    assign f=(x[3]&x[4]&x[2])|((!x[2])&(!x[4]))|(x[3]&(!x[1]));
endmodule
