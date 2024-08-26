module Prime_Number(A,out);
input [2:0]A;
output out;
assign out = (A[1] & (!A[2])) | (A[0] & A[2]);
endmodule 
