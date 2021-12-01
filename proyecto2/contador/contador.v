module contador (
    //Entradas y salidas
    input pop0, pop1, pop2, pop3, pop4,
    input req, clk, reset_L, idle,
    input [2:0] idx,
    output reg valid,
    output reg [4:0] data_out
);

reg [4:0] contador_0, contador_1, contador_2, contador_3, contador_4 ;

// Lógica de conteo de FIFOS
always @(posedge clk)begin
    if(!reset_L)begin       //Estado de RESET -> reinicia contadores
        contador_0 <= 5'b00000;
        contador_1 <= 5'b00000;
        contador_2 <= 5'b00000;
        contador_3 <= 5'b00000;
        contador_4 <= 5'b00000;
    end
    else begin

        if (pop0 == 1'b1)begin
            contador_0 <= contador_0 + 1;
        end
        if (pop1 == 1'b1)begin
            contador_1 <= contador_1 + 1;
        end
        if (pop2 == 1'b1)begin
            contador_2 <= contador_2 + 1;
        end
        if (pop3 == 1'b1)begin
            contador_3 <= contador_3 + 1;
        end

        if (pop4 == 1'b1)begin
            contador_4 <= contador_4 + 1;
        end
    end
end

// Lógica de lectura de contadores
always @(posedge clk)begin

    if(!reset_L)begin
        data_out <= 5'b0;
        valid <= 0;
    end
    else begin
        if(idle ==1 && req ==1)begin    // IDLE = 0100
            if(idx == 3'b000)begin
                data_out <= contador_0;
                valid <= 1;
            end
            if(idx == 3'b001)begin
                data_out <= contador_1;
                valid <= 1;
            end
            if(idx == 3'b010)begin
                data_out <= contador_2;
                valid <= 1;
            end
            if(idx == 3'b011)begin
                data_out <= contador_3;
                valid <= 1;
            end
            if(idx == 3'b100)begin
                data_out <= contador_4;
                valid <= 1;
            end
        end
        else begin
            valid <= 0;
        end
    end
end

endmodule
