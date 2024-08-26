module THIRD_K_MAPS(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out =a|(c&(!b))|(d&a);
endmodule
