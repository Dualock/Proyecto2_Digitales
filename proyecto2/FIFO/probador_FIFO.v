module probador_FIFO #(
    //Parametros
    parameter DATA_SIZE = 12,             //cantidad de bits de entrada
    parameter MAIN_QUEUE_SIZE= 3     //Cantiad de filas del main fifo
)(
    input                           fifo_empty, fifo_empty_synth,
    input       [DATA_SIZE-1:0]     fifo_data_out, fifo_data_out_synth,
    input                           fifo_error, fifo_error_synth,
    input                           almost_full, almost_full_synth,
    input                           almost_empty,almost_empty_synth,
    input                           fifo_full, fifo_full_synth,
    output reg                      clk, reset_L, read, write,
    output reg  [DATA_SIZE-1:0]     data_in,
    output reg [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_full, th_fifos_almost_empty,
    output reg error_synth
);

initial begin
    reset_L = 0;
    data_in = 'hA;
    write = 0;
    read = 0;
    th_fifos_almost_full = 6;
    th_fifos_almost_empty = 1;
    end
 initial begin

    $dumpfile("verificacion_FIFO.vcd");
    $dumpvars;

    @(posedge clk);
    @(posedge clk);
    reset_L <= 	'b1;
 //Se sube el reset, a partir de aqui se comienzan a dar cambios en las variables

    // data_in <= 'hA;//Este dato no se escribe en memoria porque el write esta en 0

	//Se escribe durante 4 ciclos de reloj data in + 10
    repeat(1)begin
        @(posedge clk)
	write <= 1;
        data_in<=data_in+'h10;
    end


    @(posedge clk)
    write <= 0;
	data_in<=data_in+'h10;
	//Se comprueba que en estos  ciclos de reloj, no se escriba nada
	repeat(2)begin
	@(posedge clk)
	write <= 0;
	data_in <= data_in + 'hFF;
	end
	//se vuelve al punto donde estaba cuando estaba escribiendo
	// @(posedge clk)
	// write <= 1;
	// data_in <= 'h4A;
    // 	repeat(1)begin
    //     @(posedge clk)
    //     write <= 1;
    //     data_in <= data_in + 'h10;
    //
    // end


    @(posedge clk)
        write<=0;
    // Se comprueba que se lean solo los datos terminados en A(Los que se escribieron)
	//A este momento hay 6 datos escritos
	// Sacamos 4 elementos de memoria para quedar con 2, no se alcanza el umbral de empty(1)
    repeat(1)begin
        @(posedge clk)
        read <= 1;
    end
	//Veremos que pasa al alcanzar el umbral empty
	@(posedge clk)
	read <= 0;


    repeat(2)begin
        @(posedge clk)
            write<=0;
            read <= 0;
    end

    repeat(4)begin
        @(posedge clk)
            read<=0;
    end

	//Se comprueba lectura y escritura al mismo tiempo
	//No esta funcionando
    repeat(4)begin
        @(posedge clk)
            read <= 1;
	    write <= 1;
	    data_in <= data_in + 'h1;
    end
	//Se comprueba leyendo el FIFO vacio para ver la senal de error
    repeat(8)begin
        @(posedge clk)
	    write <= 0;
            read <= 1;
    end
	@(posedge clk)
	read = 0;
	//Se comprueba saturando de datos el FIFO para ver una senal de error
    repeat(10)begin
        @(posedge clk)
        write <= 1;
	data_in <= data_in + 'h1;
    end
   repeat(2)begin
        @(posedge clk)
        read<=0;
        write <= 0;
    end

    repeat(4)begin
        read <= 1;
        @(posedge clk);
    end
    @(posedge clk)
    read <= 0;

    //Se vuelve a leer y escribir 8 veces
    repeat(8) begin
      write <= 1;
      read <= 1;
      data_in <= data_in + 'h1;
      @(posedge clk);
    end

    // Se escribe y lee sólo una vez
    // @(posedge clk)
    // @(posedge clk)
    // @(posedge clk)
    // @(posedge clk)
    // data_in = 'h0FF;
    // write = 1;
    // @(posedge clk)
    // data_in = 'h0FA;
    // @(posedge clk)
    // data_in = 'h0FB;
    // @(posedge clk)
    // data_in = 0;
    // write = 0;
    // @(posedge clk)
    // @(posedge clk)
    // @(posedge clk)
    // @(posedge clk)
    // read = 1;
    // @(posedge clk)
    // @(posedge clk)
    // @(posedge clk)
    // read = 0;
    // @(posedge clk)
    // @(posedge clk)
    // @(posedge clk)
    // @(posedge clk)

    $finish;
end
    // checker
always @ (posedge clk) begin
	//si las salidas no coinciden, levante la bandera de error
	if (fifo_data_out!= fifo_data_out_synth)
		error_synth <= 1;
	else
		error_synth <= 0;
end
    initial clk <= 0;
    always # 200 clk <= ~clk;       //genera señal 4 ns

endmodule
