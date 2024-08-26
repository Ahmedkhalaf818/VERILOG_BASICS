module ALU_OP_test #(parameter N = 4)(
    input [N-1:0] A,
    input [N-1:0] B,
    input [1:0] opcode,
    output reg[N-1:0] result
);
wire [N-1:0]w1;
Nbit_HA #(.N(N))HA (A,B,w1);

    always @(*)
    begin
        result = 'b0;
        if (opcode == 2'b00)
        begin
            result = w1;
        end
        else if (opcode == 2'b10)
        begin
            result = A - B;
        end
        else if (opcode == 2'b01)
        begin
            result = A | B;
        end
        else if (opcode == 2'b11)
        begin
            result = A ^ B;
        end
        else
        begin
            result = 'b0;
        end
    end
endmodule

