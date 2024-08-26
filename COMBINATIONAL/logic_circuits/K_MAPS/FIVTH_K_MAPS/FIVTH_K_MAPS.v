module FIVTH_K_MAPS (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_sop=(c&d)|((!a)&(!b)&c);
    assign out_pos=(a|c)&(c|(!d))&((!b)|d)&((!a|d));
endmodule

