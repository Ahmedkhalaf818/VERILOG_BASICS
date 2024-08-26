module MUX_1(A,B,C,D,E,F,sel,out,out_bar);
input A,B,C,D,E,F,sel;
output out,out_bar;
wire AND_1,XNOR_1;
assign AND_1=A&B&C;
assign XNOR_1=~((D^E)^F);
assign out = (sel==1)?XNOR_1:AND_1;
assign out_bar=~out;
endmodule
