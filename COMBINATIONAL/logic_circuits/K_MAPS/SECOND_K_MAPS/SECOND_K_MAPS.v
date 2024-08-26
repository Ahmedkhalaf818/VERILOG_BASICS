module SECOND_K_MAPS(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out =(a&c&d)|(d&c&b)|((~a)&(~d))|((~c)&(~b));
endmodule
