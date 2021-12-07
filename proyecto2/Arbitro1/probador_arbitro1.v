module probador_arbitro1 #(
    //Parametros
    parameter DATA_SIZE = 12,           //cantidad de bits de entrada
    parameter MAIN_QUEUE_SIZE = 3
)(
  //Entradas y Salidas
  input [DATA_SIZE-1:0] data_outF0, data_outF1, data_outF2, data_outF3,
  input                 push0, push0_synth,
  input                 push1, push1_synth,
  input                 push2, push2_synth,
  input                 push3, push3_synth,
  input                 pop0, pop0_synth,
  input                 pop1, pop1_synth,
  input                 pop2, pop2_synth,
  input                 pop3, pop3_synth,
  input           [4:0] cont0, cont0_synth,
  input           [4:0] cont1, cont1_synth,
  input           [4:0] cont2, cont2_synth,
  input           [4:0] cont3, cont3_synth,
  input                 fifo_empty0, fifo_empty1, fifo_empty2, fifo_empty3,

  output reg [DATA_SIZE-1:0] data_in,
  output reg [DATA_SIZE-1:0] data_in_below0, data_in_below1, data_in_below2, data_in_below3,
  output reg      fifo_af0, fifo_af1, fifo_af2, fifo_af3,
  output reg      write_0, write_1,write_2, write_3,
  output reg                 clk, reset_L,
  output reg        popProbador0, popProbador1, popProbador2, popProbador3,
  output reg [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_full, th_fifos_almost_empty

);

    initial begin
        reset_L = 0;
        data_in = 0;
        fifo_af0 = 0;
        fifo_af1 = 0;
        fifo_af2 = 0;
        fifo_af3 = 0;
        write_0 = 0;
        write_1 = 0;
        write_2 = 0;
        write_3 = 0;
        data_in_below0 = 0;
        data_in_below1 = 0;
        data_in_below2 = 0;
        data_in_below3 = 0;
        popProbador0 = 0;
        popProbador1 = 0;
        popProbador2 = 0;
        popProbador3 = 0;
        th_fifos_almost_full = 6;
        th_fifos_almost_empty = 1;
    end
    initial begin
        $dumpfile("verificacion_arbitro1.vcd");
        $dumpvars;
        @(posedge clk)
        reset_L <= 0;
        @(posedge clk)
        reset_L <= 1;
        @(posedge clk)
        @(posedge clk)
        data_in_below0 <= 'h0A0;
        data_in_below1 <= 'h5B0;
        data_in_below2  <= 'hAC0;
        data_in_below3 <= 'hFD0;
        write_0 <= 1;
        write_1 <= 1;
        write_2 <= 1;
        write_3 <= 1;
        // Se escribe 3 veces en p0 inferior
        repeat (3) begin
            @(posedge clk)
            data_in_below0 <= data_in_below0+1;
            data_in_below1 <= data_in_below1 + 1;
            data_in_below2  <= data_in_below2 + 1;
            data_in_below3 <= data_in_below3 + 1;
        end
        @(posedge clk)
        write_0 <= 0;
        write_1 <= 0;
        write_2 <= 0;
        write_3 <= 0;

        repeat (30) begin
            @(posedge clk);
        end
        $finish;
    end


    initial clk <= 0;
    always # 200 clk <= ~clk;       //genera señal 4 ns

endmodule
