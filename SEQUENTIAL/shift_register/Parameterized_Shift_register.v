
module Parameterized_Shift_register(sclr,sset,shiftin,load,clock,enable,aclr,aset,data,shiftout,q);
parameter LOAD_AVALUE=1;
parameter SHIFT_DIRECTION="LEFT";
parameter LOAD_SVALUE=1;
parameter SHIFT_WIDTH=8;
input sclr,sset,shiftin,load,clock,enable,aclr,aset;
input [SHIFT_WIDTH-1:0]data;
output reg shiftout;
output reg [SHIFT_WIDTH-1:0]q;
generate
case(SHIFT_DIRECTION)
"LEFT" : begin
           always @(posedge clock or negedge aclr or posedge aset ) begin
                   if (~aclr)
                      q<=0;
                      else if(aset)
                      q<=LOAD_AVALUE;
                   else if(enable)begin
                        if(~sclr) 
                        q<=0;
                        else if(ss et)
                         q<=LOAD_SVALUE;
                        else if(load)begin
                          q<=data;
                        end
                       else 
                          q<={q[SHIFT_WIDTH-2:0],shiftin};
                          shiftout<=q[SHIFT_WIDTH - 1];
                   end    
           end
         end
"RIGHT" : begin
              always @(posedge clock or negedge aclr or posedge aset ) begin
                   if (~aclr)
                      q<=0;
                      else if(aset)
                      q<=LOAD_AVALUE;
                   else if(enable)begin
                        if(~sclr) 
                        q<=0;
                        else if(sset)
                         q<=LOAD_SVALUE;
                        else if(load)begin
                          q<=data;
                        end
                       else 
                          q<={shiftin, {q[SHIFT_WIDTH-2:0]}};
                          shiftout<=q[0];
                   end    
           end  
         end         
endcase
endgenerate

endmodule