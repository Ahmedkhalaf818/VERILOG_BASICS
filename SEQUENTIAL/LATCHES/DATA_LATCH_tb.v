module DATA_LATCH_tb();
    reg CLR_tb, D_tb, G_tb;
    wire Q_tb;
    reg Y_expected;
    DATA_LATCH DUT (CLR_tb, D_tb, G_tb, Q_tb);
    integer i;

    initial begin
        G_tb = 1'b0;
        forever #10 G_tb = ~G_tb;
    end

    initial begin 
        CLR_tb = 1'b0;
        D_tb = 1'b1;
        @(negedge G_tb);
        Y_expected = 1'b0;
        if (Y_expected != Q_tb) begin
            $display("error: expected %b, got %b", Y_expected, Q_tb);
            $stop;
        end
        
        CLR_tb = 1'b1;
        @(negedge G_tb);
        for (i = 0; i < 99; i = i + 1) begin
            D_tb = $random;
#0;
            if (~CLR_tb)
                Y_expected = 1'b0;
            else if (G_tb)
                Y_expected = D_tb;
                
            @(negedge G_tb);
            
            if (Y_expected != Q_tb) begin
                $display("error: expected %b, got %b", Y_expected, Q_tb);
                $stop;
            end
        end
        $stop;
    end
endmodule
