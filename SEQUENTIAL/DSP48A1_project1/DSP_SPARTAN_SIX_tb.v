`timescale 1ns / 1ps
module DSP_Spartn_six_tb();
  reg CLK;
  reg [7:0] OPMODE;
  reg [17:0] A;
  reg [17:0] B;
  reg [17:0] BCIN;
  reg [47:0] PCIN;
  reg [47:0] C;
  reg [17:0] D;
  reg CARRYIN;
  reg RSTA, RSTB, RSTM, RSTP, RSTC, RSTD, RSTCARRYIN, RSTOPMODE;
  reg CEA, CEB, CEM, CEP, CEC, CED, CECARRYIN, CEOPMODE;
  wire [17:0] BCOUT;
  wire [47:0] PCOUT;
  wire [47:0] P;
  wire [35:0] M;
  wire CARRYOUT;
  wire CARRYOUTF;
  // Instantiate the DSP48A1 module
  DSP_Spartn_six DSP_instance (
    .CLK(CLK),
    .OPMODE(OPMODE),
    .A(A),
    .B(B),
    .BCIN(BCIN),
    .PCIN(PCIN),
    .C(C),
    .D(D),
    .CARRYIN(CARRYIN),
    .RSTA(RSTA),
    .RSTB(RSTB),
    .RSTM(RSTM),
    .RSTP(RSTP),
    .RSTC(RSTC),
    .RSTD(RSTD),
    .RSTCARRYIN(RSTCARRYIN),
    .RSTOPMODE(RSTOPMODE),
    .CEA(CEA),
    .CEB(CEB),
    .CEM(CEM),
    .CEP(CEP),
    .CEC(CEC),
    .CED(CED),
    .CECARRYIN(CECARRYIN),
    .CEOPMODE(CEOPMODE),
    .BCOUT(BCOUT),
    .PCOUT(PCOUT),
    .P(P),
    .M(M),
    .CARRYOUT(CARRYOUT),
    .CARRYOUTF(CARRYOUTF)
  );
  integer i=0;
integer TC=200;
// Clock generation
 initial begin
   CLK = 0;
   forever #(TC/2) CLK = ~CLK;
  end
  initial begin
    OPMODE = 8'b00000000;
    A = 18'b0000000000000000;
    B = 18'b0000000000000000;
    BCIN = 18'b0000000000000000;
    PCIN = 48'b000000000000000000000000000000000000000000000000;
    C = 48'b000000000000000000000000000000000000000000000000;
    D = 18'b0000000000000000;
    CARRYIN = 0;
    RSTA = 1;
    RSTB = 1;
    RSTM = 1;
    RSTP = 1;
    RSTC = 1;
    RSTD = 1;
    RSTCARRYIN = 1;
    RSTOPMODE = 1;
    CEA = 1;
    CEB = 1;
    CEM = 1;
    CEP = 1;
    CEC = 1;
    CED = 1;
    CECARRYIN = 1;
    CEOPMODE = 1;

    // Apply stimulus
    @(negedge CLK) 
    RSTA = 0;
    RSTB = 0;
    RSTM = 0;
    RSTP = 0;
    RSTC = 0;
    RSTD = 0;
    RSTCARRYIN = 0;
    RSTOPMODE = 0;
    A = 18'b0000000000001111; 
     B = 18'b0000000000000001; 
     D = 18'b00_0000_0000_0000_0100;
     C = 48'b000000000000000000000000000000000000000000000100;
     OPMODE = 8'b00010101;      
                 
    
    // Apply additional stimulus
@(negedge CLK) A = 18'b0000000000001111; 
 B = 18'b0000000011110000; 
 D = 18'b0011000011110000;
 OPMODE = 8'b10101110;     
                  


@(negedge CLK)
 A = 18'b0000000000000100; 
 B = 18'b0000000000000011; 
 D = 18'b0000000000110000;
 OPMODE = 8'b00000100;                        
@(negedge CLK) 
 A = 18'b0000000000000101; 
 B = 18'b0000000000000010; 
OPMODE = 8'b10001000;                      
 @(negedge CLK) ;
for (i=0; i<20 ; i=i+1) begin
    OPMODE = $random;
    A = $urandom_range(1,10);
    B = $urandom_range(1,10);
    BCIN = $urandom_range(1,10);
    PCIN = $random;
    C = $urandom_range(1,10);
    D = $urandom_range(1,10);
    CARRYIN = $random;
@(negedge CLK);
end
@(negedge CLK);
$stop;
end

endmodule


