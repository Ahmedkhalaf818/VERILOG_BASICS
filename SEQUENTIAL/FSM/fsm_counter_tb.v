module fsm_counter_tb(

    );
    reg clk, reset_n, en;
    wire [2:0] num;
    
    // Instantiate modules under test
    
    fsm_counter uut0(
        .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .num(num)
    );
    
        
    // Generating a clk signal
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial
    begin
        reset_n = 1'b0;
        en = 1'b0;
        @(negedge clk);
        reset_n = 1'b1;
        en = 1'b1;
        
        repeat(20) @(negedge clk);          
        $finish;
    end
    
endmodule
