module probador_trans_layer #(
    //Parametros
    parameter MAIN_QUEUE_SIZE= 3,    //Cantiad de filas del main fifo
    parameter DATA_SIZE = 12

)(//Entradas y salidas
    input [DATA_SIZE-1:0]         data_out0, data_out0_synth,
    input [DATA_SIZE-1:0]         data_out1, data_out1_synth,
    input [DATA_SIZE-1:0]         data_out2, data_out2_synth,
    input [DATA_SIZE-1:0]         data_out3, data_out3_synth,
    input [4:0]                   data_out_cont, data_out_cont_synth,
    input                         valid_cont, valid_cont_synth,
    output reg      [DATA_SIZE-1:0]         data_in,
    output reg                              reset_L, clk, init, req,
    output reg                              push,
    output reg                              pop0, pop1, pop2, pop3,
    output reg      [MAIN_QUEUE_SIZE-1:0]   idx,
    output reg      [MAIN_QUEUE_SIZE-1:0]   th_almost_full, th_almost_empty
);
    initial begin
        reset_L = 0;
        init = 0;
        th_almost_full = 5;
        th_almost_empty = 3;
        data_in = 0;
        req = 0;
        push = 0;
        pop0 = 0;
        pop1 = 0;
        pop2 = 0;
        pop3 = 0;
        idx = 7;
    end
    initial begin
        $dumpfile("verificacion_trans_layer.vcd");
        $dumpvars;

        // Se hace el reset
        @(posedge clk)
        reset_L <= 0;
        init <= 1;
        @(posedge clk)
        @(posedge clk)

        // PRUEBA 1
        // Se libera reset manteniendo la señal de init
        @(posedge clk)
        reset_L <= 1;

        // PRUEBA 2
        // Se modifican dos veces los umbrales y se libera init
        @(posedge clk)
        th_almost_full <= 6;
        th_almost_empty <= 2;
        @(posedge clk)
        th_almost_full <= 4;
        th_almost_empty <= 1;
        init <= 0;

        // PRUEBA 3
        // Se proboca un almost full en el fifo0 de salida
        @(posedge clk)
        data_in <= 'h0F0;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        repeat (10) @(posedge clk);

        // Se libera el almos full de fifo0 de salida
        @(posedge clk)
        pop0 = 1;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop0 = 0;


        // Se proboca un almost full en el fifo1 de salida
        @(posedge clk)
        data_in <= 'h1F0;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        repeat (10) @(posedge clk);

        // Se libera el almos full de fifo1 de salida
        @(posedge clk)
        pop1 = 1;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop1 = 0;

        // Se proboca un almost full en el fifo2 de salida
        @(posedge clk)
        data_in <= 'h2F0;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        repeat (10) @(posedge clk);

        // Se libera el almos full de fifo2 de salida
        @(posedge clk)
        pop2 = 1;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop2 = 0;

        // Se proboca un almost full en el fifo3 de salida
        @(posedge clk)
        data_in <= 'h3F0;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        repeat (10) @(posedge clk);

        // Se libera el almost full de fifo3 de salida
        @(posedge clk)
        pop3 = 1;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop3 = 0;


        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)

        // PRUEBA 4
        // Se provoca un almost full en fifo0 de salida para bloquear al árbitro1
        @(posedge clk)
        data_in <= 'h0F4;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)

        // Se provoca un almost full en el fifo0 de entrada
        @(posedge clk)
        data_in <= 'h0A0;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        repeat (10) @(posedge clk);

        // Se libera el fifo0 de salida para liberar el fifo0 de entrada
        @(posedge clk)
        pop0 = 1;
        @(posedge clk)
        @(posedge clk)
        pop0 = 0;

        // Se provoca un almost full en el fifo1 de entrada
        @(posedge clk)
        data_in <= 'h4A0;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        // Se libera el fifo0 de salida para liberar el fifo1 de entrada
        @(posedge clk)
        pop0 = 1;
        @(posedge clk)
        @(posedge clk)
        pop0 = 0;

        // Se provoca un almost full en el fifo2 de entrada
        @(posedge clk)
        data_in <= 'h8A0;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        // Se libera el fifo0 de salida para liberar el fifo2 de entrada
        @(posedge clk)
        pop0 = 1;
        @(posedge clk)
        @(posedge clk)
        pop0 = 0;

        // Se provoca un almost full en el fifo3 de entrada
        @(posedge clk)
        data_in <= 'hCA0;
        push <= 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        push <= 0;

        // Se libera el fifo0 de salida para liberar el fifo3 de entrada
        @(posedge clk)
        pop0 = 1;
        @(posedge clk)
        @(posedge clk)
        pop0 = 0;

        // Se hace pops en fifo0 de salida hasta limpiar completamente todos los FIFO_0_salida
        @(posedge clk)
        pop0 = 1;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        pop0 = 0;

        repeat (10) @(posedge clk);
        $finish;
    end

    initial clk <= 0;
    always # 200 clk <= ~clk;       //genera señal 4 ns

endmodule
