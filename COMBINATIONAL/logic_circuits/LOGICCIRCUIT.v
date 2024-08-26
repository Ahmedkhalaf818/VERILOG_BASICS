module Logiccircuit(A,out);
input [3:0]A;
output out;
assign out =(A[2]&(!A[3]))|(A[0]&A[1]&(!A[3]));
endmodule
