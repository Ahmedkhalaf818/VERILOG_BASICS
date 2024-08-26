module SLE(
input D,CLK,EN,ALn,ADn,SLn,SD,LAT,
output reg Q
);
always @(posedge CLK or negedge ALn) begin
if(~ALn)
Q<=!ADn;
else if(!LAT) begin 
  if(EN) begin
   if (!SLn) begin
                Q <= SD;  
            end else begin
                Q <= D;  
            end
end
end
end
always @(*) begin
if(~ALn)
Q<=!ADn;
else if(LAT) begin
  if(CLK & EN) begin
   if (!SLn) begin
                Q <= SD;  
            end else begin
                Q <= D;  
            end
end
end
end
endmodule
