module COMPARATOR(
input [3:0]A,
input [3:0]B,
output Ie,Ig,Il
);
assign Ie=(A==B)?1:0;
assign Ig=(A>B)?1:0;
assign Il=(A<B)?1:0;

endmodule
