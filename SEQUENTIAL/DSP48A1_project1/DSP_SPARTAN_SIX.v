`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2024 12:25:43 PM
// Design Name: 
// Module Name: DSP_Spartn_six
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// MUX_CARRYIN
//////////////////////////////////////////////////////////////////////////////////
module DSP_Spartn_six(CLK,OPMODE,A,B,BCIN,PCIN,C,D,CARRYIN,RSTA, RSTB, RSTM, RSTP, RSTC, RSTD, RSTCARRYIN, RSTOPMODE,CEA, CEB, CEM, CEP, CEC, CED, CECARRYIN, CEOPMODE,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);
parameter A0REG = 0;
parameter A1REG = 1;
parameter B0REG = 0;
parameter B1REG = 1;
parameter CREG = 1;
parameter DREG = 1;
parameter MREG = 1;
parameter PREG = 1;
parameter CARRYINREG = 1;
parameter CARRYOUTREG = 1;
parameter OPMODEREG = 1;
parameter CARRYINSEL = "OPMODE5";
parameter B_INPUT = "DIRECT";
parameter RSTTYPE = "SYNC"; 
    input CLK;
    input [7:0] OPMODE;
    input [17:0] A;
    input [17:0] B;
    input [17:0] BCIN;
    input [47:0] PCIN;
    input [47:0] C;
    input [17:0] D;
    input CARRYIN;
    input RSTA, RSTB, RSTM, RSTP, RSTC, RSTD, RSTCARRYIN, RSTOPMODE;
    input CEA, CEB, CEM, CEP, CEC, CED, CECARRYIN, CEOPMODE;
    output [17:0] BCOUT;
    output [47:0] PCOUT;
    output [47:0] P;
    output [35:0] M;
    output CARRYOUT;
    output CARRYOUTF; 
    wire [17:0] Q_A0REG,Q_A1REG;
    wire [17:0] Q_DREG;
    wire [47:0] Q_CREG;
    wire [17:0] Q_B0REG,Q_B1REG;
    wire [7:0] Q_OPMODEREG;
    wire [17:0] pre_add_sub;
    wire [17:0] pre_add_sub_mux;
    wire [35:0] MUl_REG;
    wire [35:0] M_REG;
    wire [47:0] MUX_REGX;
    wire [47:0] MUX_REGZ;
    wire mux_carryin;
    wire MUX_CARRYIN_REG;
    wire [47:0]P_sum;
    wire P_carry;
    wire [47:0]P_sum_reg;
    wire P_carry_reg;
    MUX_DFF #(.DFF_SELECT(A0REG),.RSTTYPE(RSTTYPE),.DFF_SIZE(18)) A0REG_DESIGN (.clk(CLK),.rst(RSTA),.enable(CEA),.PIN_IN(A),.PIN_OUT(Q_A0REG));
    MUX_DFF #(.DFF_SELECT(DREG),.RSTTYPE(RSTTYPE),.DFF_SIZE(18)) DREG_DESIGN (.clk(CLK),.rst(RSTD),.enable(CED),.PIN_IN(D),.PIN_OUT(Q_DREG));
    MUX_DFF #(.DFF_SELECT(CREG),.RSTTYPE(RSTTYPE),.DFF_SIZE(48)) CREG_DESIGN (.clk(CLK),.rst(RSTC),.enable(CEC),.PIN_IN(C),.PIN_OUT(Q_CREG));
    MUX_DFF_B #(.DFF_SELECT(B0REG),.RSTTYPE(RSTTYPE),.DFF_SIZE(18),.B_INPUT(B_INPUT)) B0REG_DESIGN (.clk(CLK),.rst(RSTB),.enable(CEB),.PIN_IN(B),.CASCADE(BCIN),.PIN_OUT(Q_B0REG));
    MUX_DFF #(.DFF_SELECT(OPMODEREG),.RSTTYPE(RSTTYPE),.DFF_SIZE(8)) OPCODEREG_DESIGN (.clk(CLK),.rst(RSTOPMODE),.enable(CEOPMODE),.PIN_IN(OPMODE),.PIN_OUT(Q_OPMODEREG));
    N_BIT_ADDER #(.N(18)) ADDER (.D(Q_DREG),.B(Q_B0REG),.SEL(Q_OPMODEREG[6]),.C(pre_add_sub));
    mux2X1  #(.N(18)) mux2x1_design(.D0(Q_B0REG),.D1(pre_add_sub),.SEL(Q_OPMODEREG[4]),.Y(pre_add_sub_mux));
    MUX_DFF #(.DFF_SELECT(A1REG),.RSTTYPE(RSTTYPE),.DFF_SIZE(18)) A1REG_DESIGN (.clk(CLK),.rst(RSTA),.enable(CEA),.PIN_IN(Q_A0REG),.PIN_OUT(Q_A1REG));
    MUX_DFF #(.DFF_SELECT(B1REG),.RSTTYPE(RSTTYPE),.DFF_SIZE(18)) B1REG_DESIGN (.clk(CLK),.rst(RSTB),.enable(CEB),.PIN_IN(pre_add_sub_mux),.PIN_OUT(Q_B1REG));
    N_BIT_Multiplier #(.N(18)) N_BIT_Multiplier_design (.D(Q_B1REG),.B(Q_A1REG),.Out(MUl_REG));
    MUX_DFF #(.DFF_SELECT(MREG),.RSTTYPE(RSTTYPE),.DFF_SIZE(36)) MREG_DESIGN (.clk(CLK),.rst(RSTM),.enable(CEM),.PIN_IN(MUl_REG),.PIN_OUT(M_REG));
    N_BIT_MUX4X1 #(.N(48)) N_BIT_MUX4X1_design(.D0(48'b0),.D1({12'b0,M_REG}),.D2(P),.D3({Q_DREG[11:0],Q_A1REG,Q_B1REG}),.S0(Q_OPMODEREG[0]),.S1(Q_OPMODEREG[1]),.Y(MUX_REGX));
    N_BIT_MUX4X1 #(.N(48)) N_BIT_MUX4X1_design2(.D0(48'b0),.D1(PCIN),.D2(P),.D3(Q_CREG),.S0(Q_OPMODEREG[2]),.S1(Q_OPMODEREG[3]),.Y(MUX_REGZ));
    MUX_CARRYIN #(.DFF_SIZE(1),.CARRY_INPUT(CARRYINSEL)) MUX_CARRYIN_DESIGN (.CASCADE(CARRYIN),.PIN_IN(Q_OPMODEREG[5]),.PIN_OUT(mux_carryin));
    MUX_DFF #(.DFF_SELECT(CARRYINREG),.RSTTYPE(RSTTYPE),.DFF_SIZE(1)) CARRYIN_DESIGN (.clk(CLK),.rst(RSTCARRYIN),.enable(CECARRYIN),.PIN_IN(mux_carryin),.PIN_OUT(MUX_CARRYIN_REG));
    FUll_adder_con #(.N(48)) ADDER2 (.A(MUX_REGZ),.B(MUX_REGX),.SEL(Q_OPMODEREG[7]),.CIN(MUX_CARRYIN_REG),.carry(P_carry),.sum(P_sum));
    MUX_DFF #(.DFF_SELECT(PREG),.RSTTYPE(RSTTYPE),.DFF_SIZE(48)) PREG_DESIGN (.clk(CLK),.rst(RSTP),.enable(CEP),.PIN_IN(P_sum),.PIN_OUT(P_sum_reg));
    MUX_DFF #(.DFF_SELECT(CARRYOUTREG),.RSTTYPE(RSTTYPE),.DFF_SIZE(1)) CARRYOUTREG_DESIGN (.clk(CLK),.rst(RSTCARRYIN),.enable(CECARRYIN),.PIN_IN(P_carry),.PIN_OUT(P_carry_reg));
assign BCOUT=Q_B1REG;
assign PCOUT=P_sum_reg;
assign P=P_sum_reg;
assign M=M_REG;
assign CARRYOUT=P_carry_reg;
assign CARRYOUTF=CARRYOUT;
endmodule
