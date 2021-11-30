module fsm #(//Parametros
    parameter MAIN_QUEUE_SIZE = 3
)(//Entradas y salidas
    input                                clk, reset_L, init,
    input       [MAIN_QUEUE_SIZE-1:0]    th_almost_full, th_almost_empty,
    input       [8:0]                    fifos_empty,
    output reg  [MAIN_QUEUE_SIZE-1:0]    th_fifos_almost_full, th_fifos_almost_empty,
    output reg                           idle
);
    //Registros  internos
    reg [3:0] state , nxt_state;
    reg [MAIN_QUEUE_SIZE-1:0]  mem_th_fifos_almost_full, mem_th_fifos_almost_empty;

    //Codificacion de los estados one-hot
    parameter RESET = 0;
    parameter INIT = 1;
    parameter IDLE = 2;
    parameter ACTIVE = 4;

    always @(posedge clk) begin
        if (!reset_L) begin 
            state <= RESET;
            th_fifos_almost_empty <= 1;
            th_fifos_almost_full <= 7;
        end
        else begin
            state <= nxt_state;
            if (state == INIT) begin
                th_fifos_almost_empty <= mem_th_fifos_almost_empty;
                th_fifos_almost_full <= mem_th_fifos_almost_full;
            end
        end
    end

    always @ (*) begin 
        idle = 0;
        nxt_state = state;
        mem_th_fifos_almost_empty = 0;
        mem_th_fifos_almost_full = 0;
        case (state)
            RESET: begin
                if (reset_L) begin
                    nxt_state = INIT;
                    
                end
            end
            INIT: begin
                mem_th_fifos_almost_full = th_almost_full;
                mem_th_fifos_almost_empty = th_almost_empty;
                if (!reset_L) begin
                    nxt_state = RESET;
                end
                else if (init) begin
                    nxt_state = INIT;
                end
                else begin
                    nxt_state = IDLE;
                end
            end
            IDLE: begin
                idle = 1;
                if (!reset_L) begin
                    nxt_state = RESET;
                end
                else if (init) begin
                    nxt_state = INIT;
                end
                else if (fifos_empty != 'h1FF) begin
                    nxt_state = ACTIVE;
                end
                else begin
                    nxt_state = IDLE;
                end
            end
            ACTIVE: begin
                if (!reset_L) begin
                    nxt_state = RESET;
                end
                else if (fifos_empty == 'h1FF) begin
                    nxt_state = IDLE;
                end
                else begin
                    nxt_state = ACTIVE;
                end
            end
        endcase
    end

endmodule