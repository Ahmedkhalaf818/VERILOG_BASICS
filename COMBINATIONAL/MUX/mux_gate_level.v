module mux_gate_level(
input A,B,sel,
output out

);

wire w1,w2,z;
not(z,sel);
and(w1,A,sel);
and(w2,B,sel);
or(out ,w1,w2);
endmodule