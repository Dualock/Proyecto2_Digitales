module demux_4x1 #( //Parametros
    parameter DATA_SIZE = 12
)(//Entradas y Salidas
    input                      clk, reset_L,
    input      [DATA_SIZE-1:0] data_in0, data_in1, data_in2, data_in3,
    input                      valid0, valid1, valid2, valid3,
    output reg [DATA_SIZE-1:0] data_out_mux
);

    always @(*)begin
        data_out_mux = 0;
        if(~reset_L) begin
            data_out_mux = 0;
        end
        else begin
            if (valid0) begin
                data_out_mux = data_in0;
            end
            if (valid1) begin
                data_out_mux = data_in1;
            end
            if (valid2) begin
                data_out_mux = data_in2;
            end
            if (valid3) begin
                data_out_mux = data_in3;
            end
        end
    end

endmodule
