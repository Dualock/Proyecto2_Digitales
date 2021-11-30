module probador_arbitro2 #(
    //Parametros
    parameter DATA_SIZE = 12,           //cantidad de bits de entrada
    parameter MAIN_QUEUE_SIZE = 3
)(
  //Entradas y Salidas
    input [DATA_SIZE-1:0] data_out, data_out_synth,
    input                 push0, push0_synth,
    input                 push1, push1_synth,
    input                 push2, push2_synth,
    input                 push3, push3_synth,
    input                 pop,pop_synth,
    input [4:0]           cont4, cont4_synth,
    input                 fifo_empty, fifo0_almost_full, fifo1_almost_full, fifo2_almost_full, fifo3_almost_full,
    input                 valid_entrada,

    output reg                 clk, reset_L,
    output reg [DATA_SIZE-1:0] data_in,
    output reg                 write,
    output reg [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_full, th_fifos_almost_empty

);

    initial begin
        reset_L = 0;
        data_in = 0;
        write = 0;
        th_fifos_almost_full = 6;
        th_fifos_almost_empty = 1;
    end
    initial begin
        $dumpfile("verificacion_arbitro2.vcd");
        $dumpvars;
        @(posedge clk)
        reset_L <= 0;
        @(posedge clk)
        reset_L <= 1;
        //Se inicializa y escribe el primer dato
        @(posedge clk)
        write <= 1;
        data_in <= 'h03FF;
        //Se escribe ese mismo dato en lso 3fifos de salida
        repeat (3) begin
            @(posedge clk)
            data_in <= data_in + 'h400;
        end
        @(posedge clk)
        write <= 0;
        @(posedge clk)
        @(posedge clk)
        write <= 1;
        data_in <= 'h10;
        repeat (8) begin
            @(posedge clk)
            data_in <= data_in + 'hA;
        end
        @(posedge clk)
        data_in <= data_in + 'h400;


        repeat (5) begin
            @(posedge clk);
        end
        $finish;
    end

     // checker

        initial clk <= 0;
        always # 200 clk <= ~clk;       //genera señal 4 ns

endmodule
