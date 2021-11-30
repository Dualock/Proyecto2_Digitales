module arbitro2 #( //Parametros
    parameter DATA_SIZE = 12
)(//Entradas y Salidas
    input                      clk, reset_L,
    input      [DATA_SIZE-1:0] data_in,
    input                      fifo_empty,
    input                      fifo0_almost_full, fifo1_almost_full, fifo2_almost_full, fifo3_almost_full,
    input                      valid,
    output reg [DATA_SIZE-1:0] data_out,
    output reg                 push0, push1, push2, push3,
    output reg                 pop,
    output reg [4:0]           cont4
);

    reg [2:0] clase;
    reg [3:0] fifos_almost_full;

    always @(*)begin
        clase = 4;
        data_out = 0;
        push0 = 0; push1 = 0;
        push2 = 0; push3 = 0;
        if (~reset_L) begin
            push0 = 0; push1 = 0;
            push2 = 0; push3 = 0;
            clase = 4;
            pop = 0;
            data_out = 0;
        end

        //Logica pop-push con respecto a las flags del fifo.

        else begin
            // push0 = 0; push1 = 0;
            // push2 = 0; push3 = 0;
            fifos_almost_full = {fifo3_almost_full, fifo2_almost_full, fifo1_almost_full, fifo0_almost_full};
            if ((fifos_almost_full == 4'b0) && !fifo_empty) begin
                pop = 1;
            end
            else begin
                pop = 0;
            end

            if (valid) begin
                data_out = data_in;
                clase = data_in[11:10];
                case (clase)
                    0: begin
                        push0 = 1;
                    end
                    1: begin
                        push1 = 1;
                    end
                    2: begin
                        push2 = 1;
                    end
                    3: begin
                        push3 = 1;
                    end

                endcase
            end
        end
    end

    always @(posedge clk)begin
        if (!reset_L) begin
            cont4 <= 0;
        end
        else begin

            if (valid) begin
                cont4 <= cont4 + 1;
            end
        end
    end
endmodule
