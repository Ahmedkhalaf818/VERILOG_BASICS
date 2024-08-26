module SIXTH_K_MAPS (
    input [4:1] x, 
    output f );
    assign f=(x[3]&(!x[1]))|(x[4]&(x[2]));
endmodule

