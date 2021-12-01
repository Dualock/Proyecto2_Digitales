
module probador_contador(
    //FIFOS
    
    output reg clk,
    output reg pop0, pop1, pop2, pop3, pop4,

    // Contadores
    output reg req, reset_L, idle,
    output reg [2:0] idx,
    input valid_c, valid_synth,
    input [4:0] data_out, data_out_synth
);

initial clk=0;
always #2 clk=~clk;

initial begin
    idle<=1'b0;
    pop0 = 1'b0;
    pop1 = 1'b0;
    pop2 = 1'b0;
    pop3 = 1'b0;
    pop4 = 1'b0;
    
end
initial begin
        $dumpfile("verificacion_contador.vcd");
        $dumpvars;

        @(posedge clk)
        reset_L <= 0;
        @(posedge clk)
        reset_L <= 1;

        req<=0;
        idx <= 0;
        idle <= 1'b0;

        // @(posedge clk)
        @(posedge clk)
        idle<=1'b0;
        pop0 <= 1'b0;
        pop1 <= 1'b0;
        pop2 <= 1'b0;
        pop3 <= 1'b0;
        pop4 <= 1'b0;



        idle <= 1'b1; //  IDLE = 0100


        repeat(4) begin
            @(posedge clk)
            pop0 <= 1'b1;
            @(posedge clk)
            pop0 <= 1'b0;
            req<=1;
            idx <= 3'b000;
        end



        repeat(4) begin
            @(posedge clk)
            pop1 <= 1'b1;
            @(posedge clk)
            //pop1 <= 1'b0;
            req<=1;
            idx <= 3'b001;
        end
        pop1 <= 1'b0;



        repeat(4) begin
            @(posedge clk)
            pop2 <= 1'b1;
            @(posedge clk)
            pop2 <= 1'b0;
            req<=1;
            idx <= 3'b010;
        end

        repeat(4) begin
            @(posedge clk)
            pop3 <= 1'b1;
            @(posedge clk)
            pop3 <= 1'b0;
            req<=1;
            idx <= 3'b011;
        end

        repeat(4) begin
            @(posedge clk)
            pop4 <= 1'b1;
            @(posedge clk)
            pop4 <= 1'b0;
            req<=1;
            idx <= 3'b100;
        end

        @(posedge clk)
        @(posedge clk)

        #25 $finish;

    end

endmodule