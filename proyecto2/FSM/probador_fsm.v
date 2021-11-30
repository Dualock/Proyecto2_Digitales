module probador_fsm #(
    //Parametros
    parameter MAIN_QUEUE_SIZE= 3     //Cantiad de filas del main fifo   

)(//Entradas y salidas       
    input                                idle, idle_synth,
    input      [MAIN_QUEUE_SIZE-1:0]     th_fifos_almost_empty, th_fifos_almost_empty_synth,
    input      [MAIN_QUEUE_SIZE-1:0]     th_fifos_almost_full, th_fifos_almost_full_synth,
    output reg                           clk, reset_L, init,
    output reg [8:0]                     fifos_empty,
    output reg [MAIN_QUEUE_SIZE-1:0]     th_almost_empty, th_almost_full
);
    initial begin
        reset_L = 0;
        init = 0;
        fifos_empty = 'h1FF;
        th_almost_empty = 1;
        th_almost_full = 7;       
    end
    initial begin
        $dumpfile("verificacion_fsm.vcd");
        $dumpvars;
        @(posedge clk)
        reset_L <= 0; 
        @(posedge clk)
        reset_L <= 1;

        repeat (3) begin
            @(posedge clk)
            th_almost_empty = 3; th_almost_full = 5;
        end
        @(posedge clk)
        th_almost_empty = 2; th_almost_full = 4;
        repeat (2) begin
            @(posedge clk)
            fifos_empty = 'h1FF;
        end
        @(posedge clk)
        init = 1;
        repeat (2) @(posedge clk);
        init = 0;

        repeat (4) @(posedge clk);

        repeat (4) begin
            @(posedge clk)
            reset_L = 0;
        end
        
        @(posedge clk)
        reset_L =1;

        @(posedge clk)
        fifos_empty = 'h1FF; 
        repeat (2) @(posedge clk);

        @(posedge clk)
        th_almost_empty = 1; th_almost_full = 3;

        @(posedge clk)
        fifos_empty  = 0; 
        repeat (4) @(posedge clk);
        th_almost_empty = 1; th_almost_full = 6;

        @(posedge clk)
        fifos_empty = 'h1FF;
        @(posedge clk)
        init = 1;
        @(posedge clk)
        th_almost_empty = 2; th_almost_full = 7;

        repeat (5) begin
            @(posedge clk);
        end
        $finish;
    end
  
    initial clk <= 0;
    always # 200 clk <= ~clk;       //genera señal 4 ns 

endmodule
