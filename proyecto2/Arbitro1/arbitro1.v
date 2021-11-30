module arbitro1 #( //Parametros
    parameter DATA_SIZE = 12
)(//Entradas y Salidas
    input                      clk, reset_L,
    input      [DATA_SIZE-1:0] data_in,
    input                      fifo_empty0, fifo_empty1, fifo_empty2, fifo_empty3,
    input                      fifo_af0, fifo_af1, fifo_af2, fifo_af3,
    input                      valid0, valid1, valid2, valid3,
    output reg [DATA_SIZE-1:0] data_out,
    output reg                 pop0, pop1, pop2, pop3,
    output reg                 push0, push1, push2, push3,
    output reg           [4:0] cont0, cont1, cont2, cont3
);

    reg [2:0] dest;
    reg [4:0] fifos_almost_full;
    reg [3:0] valids, pops;
    reg [2:0] contp0, contp1, contp2;

    always @(posedge clk) begin
        pop0 <= 0;
        pop1 <= 0;
        pop2 <= 0;
        pop3 <= 0;

        if (~reset_L) begin
            pop0 <= 0;
            pop1 <= 0;
            pop2 <= 0;
            pop3 <= 0;

            contp0 <= 0;
            contp1 <= 0;
            contp2 <= 0;
            cont0 <= 0;
            cont1 <= 0;
            cont2 <= 0;
            cont3 <= 0;
            data_out <= 0;

        end
        else begin
            if(!fifo_empty0 || !fifo_empty1 || !fifo_empty2 || !fifo_empty3) begin
                if (fifos_almost_full == 0) begin
                    if (contp0 == 4) begin
                        if (contp1 == 3) begin
                            if (contp2 == 2) begin
                                if (!fifo_empty3) begin
                                    pop3 <= 1;
                                end
                                contp0 <= 0;
                                contp1 <= 0;
                                contp2 <= 0;
                            end
                            else begin
                                if (!fifo_empty2) begin
                                    contp2 <= contp2 + 1;
                                    pop2 <= 1;
                                end
                                else begin
                                    contp2 <= 2;
                                    //pop2 <= 0;
                                end
                            end
                        end
                        else begin
                            if (!fifo_empty1) begin
                                contp1 <= contp1 + 1;
                                pop1 <= 1;
                            end
                            else begin
                                contp1 <= 3;
                                //pop1 <= 0;
                            end
                        end
                    end
                    else begin
                        if (!fifo_empty0) begin
                            contp0 <= contp0 + 1;
                            pop0 <= 1;
                        end
                        else begin
                            contp0 <= 4;
                            //pop0 <= 0;
                        end
                    end
                end
                else begin
                    contp0 <= 0;
                    contp1 <= 0;
                    contp2 <= 0;
                end
            end
            else begin
                pop0 <= 0;
                pop1 <= 0;
                pop2 <= 0;
                pop3 <= 0;
            end

            if (push0) begin
                    cont0 <= cont0 + 1;
                end
            if (push1) begin
                cont1 <= cont1 + 1;
            end

            if (push2) begin
                cont2 <= cont2 + 1;
            end

            if (push3) begin
                cont3 <= cont3 + 1;
            end
        end
    end

    always @ ( * ) begin
        dest = 4;
        valids = 0;

        push0 = 0;
        push1 = 0;
        push2 = 0;
        push3 = 0;

        fifos_almost_full = 'b11111;

        if (~reset_L) begin
            valids = 0;
            dest = 4;

            push0 = 0;
            push1 = 0;
            push2 = 0;
            push3 = 0;

            fifos_almost_full = 'b11111;
        end
        else begin
            fifos_almost_full = {fifo_af3, fifo_af2, fifo_af1, fifo_af0};
            valids = {valid3, valid2, valid1, valid0};
            if ((valids != 4'b0) && (fifos_almost_full == 4'b0)) begin
                dest = data_in[9:8];
                case (dest)
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

            if (push0 || push1 || push2 || push3) begin
                data_out <= data_in;
            end
            else begin
                data_out <= 0;
            end
        end
    end

endmodule
