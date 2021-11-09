module probador_FIFO #(
    //Parametros
    parameter DATA_SIZE = 12,             //cantidad de bits de entrada 
    parameter MAIN_QUEUE_SIZE= 3       //Cantiad de filas del main fifo    
)(
    input                           fifo_empty, fifo_empty_synth,  
    input       [DATA_SIZE-1:0]     fifo_data_out, fifo_data_out_synth,          
    input                           fifo_error, fifo_error_synth,
    input                           fifo_pause,fifo_pause_synth,

    output reg                      clk, reset_L, read, write,
    output reg  [DATA_SIZE-1:0]     data_in,
    output reg  [DATA_SIZE-1:0]     th_almost_full,  
    output reg  [DATA_SIZE-1:0]     th_almost_empty,
    output reg error_synth
);
 

 initial begin

    $dumpfile("verificacion_FIFO.vcd");
    $dumpvars;
    write<='b0;
    read<='b0;
    data_in<='b0;
    th_almost_empty= 'b1;
    th_almost_full='h7;

    reset_L <= 	'b0;           
    read    <=  'b0;
    write   <=  'b0;
    #4;
    @(posedge clk);
    @(posedge clk);
//Se sube el reset, a partir de aqui se comienzan a dar cambios en las variables
    reset_L <= 	'b1;
    data_in <= 'hA;//Este dato no se escribe en memoria porque el write esta en 0
    
	//Se escribe durante 4 ciclos de reloj data in + 10
    repeat(2)begin
        @(posedge clk)
	write <= 1;
        data_in<=data_in+'h10;
    end

    
    @(posedge clk)
	data_in<=data_in+'h10;
	//Se comprueba que en estos  ciclos de reloj, no se escriba nada
	repeat(2)begin
	@(posedge clk)
	write <= 0;
	data_in <= data_in + 'hFF;
	end
	//se vuelve al punto donde estaba cuando estaba escribiendo
	@(posedge clk)
	write <= 1;
	data_in <= 'h4A;
    	repeat(2)begin
        @(posedge clk)
        write <= 1;     
        data_in <= data_in + 'h10;
        
    end

    
    @(posedge clk)
        write<=0;
    // Se comprueba que se lean solo los datos terminados en A(Los que se escribieron)
	//A este momento hay 6 datos escritos
	// Sacamos 4 elementos de memoria para quedar con 2, no se alcanza el umbral de empty(1)
    repeat(4)begin
        @(posedge clk)
        read <= 1;
    end
	//Veremos que pasa al alcanzar el umbral empty
	@(posedge clk)
	read <= 1;
        
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
            read <= 1;
    end
	@(posedge clk)
	read = 0;
	//Se comprueba saturando de datos el FIFO para ver una senal de error
    repeat(8)begin
        @(posedge clk)
        write <= 1;
	data_in <= data_in + 'h1;
    end
   repeat(2)begin
        @(posedge clk)
        read<=0;
        write <= 0;
    end

    repeat(2)begin
        @(posedge clk);
    end
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
    always # 20 clk <= ~clk;       //genera señal 4 ns 

endmodule
