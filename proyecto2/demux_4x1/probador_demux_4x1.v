module probador_demux_4x1 #(
    //Parametros
    parameter DATA_SIZE = 12           //cantidad de bits de entrada
)(
  //Entradas y Salidas
  input [DATA_SIZE-1:0] data_out_mux, data_out_synth_mux,

  output reg            valid0, valid1, valid2, valid3,
  output reg                 clk, reset_L,
  output reg [DATA_SIZE-1:0] data_in0, data_in1, data_in2, data_in3
);

    initial begin
        reset_L = 0;
        data_in0 = 0;
        data_in1 = 0;
        data_in2 = 0;
        data_in3 = 0;
        valid0 = 0;
        valid1 = 0;
        valid2 = 0;
        valid3 = 0;
    end
    initial begin
        $dumpfile("verificacion_demux_4x1.vcd");
        $dumpvars;
        @(posedge clk)
        reset_L <= 0;
        @(posedge clk)
        reset_L <= 1;
        @(posedge clk)
        data_in0 <= 'hAAA;
        data_in1 <= 'hBBB;
        data_in2 <= 'hCCC;
        data_in3 <= 'hDDD;
        @(posedge clk)
        valid0 <= 1;
        @(posedge clk)
        valid0 <= 0;
        valid1 <= 1;
        @(posedge clk)
        valid1 <= 0;
        valid2 <= 1;
        @(posedge clk)
        valid2 <= 0;
        valid3 <= 1;
        @(posedge clk)
        valid3 <= 0;
        repeat (2) begin
            @(posedge clk);
        end
        $finish;
    end


    initial clk <= 0;
    always # 200 clk <= ~clk;       //genera señal 4 ns

endmodule
