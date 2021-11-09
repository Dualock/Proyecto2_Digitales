`include "memoria.v"

module FIFO #( //Parametros
	parameter DATA_SIZE  = 12, 			 //Tamaño de bits de entrada
	parameter MAIN_QUEUE_SIZE  = 3		// Cantiad de entradas en un fifo
)(	
	input 					reset_L, clk, read, write,
	input 		[DATA_SIZE -1:0] 	data_in,
	input      	[DATA_SIZE-1:0] 	th_almost_full,   //umbral almost full
	input       	[DATA_SIZE-1:0]         	th_almost_empty, //umbral almost empty
	output reg 				fifo_empty, fifo_pause, fifo_error,
	output reg 	[DATA_SIZE-1:0] 		fifo_data_out
);	
	//Regs internos:
	/*AUTOREGINPUT*/
	// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
	reg [MAIN_QUEUE_SIZE-1:0] ptr_read;	// To mem of memoria.v
	reg [MAIN_QUEUE_SIZE-1:0] ptr_write;	// To mem of memoria.v
	// End of automatics

	reg 				almost_full, almost_empty, fifo_full; //Flags del FIFO
  	reg  [DATA_SIZE-1:0]		count;
	reg  [DATA_SIZE-1:0] 		data_to_mem;

	//Cable internos:	
	/*AUTOWIRE*/
	wire [DATA_SIZE-1:0] 		data_out;	
	


	
	//Instancia memeoria:
	memoria #(/*AUTOINSTPARAM*/
		  // Parameters
		  .DATA_SIZE		(DATA_SIZE),
		  .MAIN_QUEUE_SIZE	(MAIN_QUEUE_SIZE))mem(/*AUTOINST*/
							      // Outputs
							      .data_out		(data_out[DATA_SIZE-1:0]),
							      // Inputs
							      .data_in		(data_in[DATA_SIZE-1:0]),
							      .ptr_write	(ptr_write[MAIN_QUEUE_SIZE-1:0]),
							      .ptr_read		(ptr_read[MAIN_QUEUE_SIZE-1:0]),
							      .reset_L		(reset_L),
							      .clk		(clk),
							      .read		(read),
							      .write		(write));

	always@(*) begin
		fifo_empty = 0;
        fifo_full = 0;
        almost_full = 0;
        almost_empty = 0;
        fifo_error = 0;
        fifo_pause=0;
		if (~reset_L) begin
			fifo_empty = 1;
			fifo_full = 0;
			almost_full = 0;
			almost_empty = 0;
			fifo_pause = 0;
			fifo_error = 0;
		end
		//FIFO flag control logic
		else begin
			if (!count)begin
				fifo_empty = 1;
				fifo_pause = 0;
			end
			else begin
				if(count <= th_almost_empty) begin
					almost_empty = 1;
					fifo_pause = 0;
				end
			end

			if( count == ((2**MAIN_QUEUE_SIZE)))begin
				fifo_full = 1;
			end

			if( count >= th_almost_full )begin
				almost_full = 1;
				fifo_pause=1;
			end

			if( (count <= th_almost_empty) && (count!=0) )begin
				almost_empty = 1;
				fifo_pause = 0;
			end
			if( write && fifo_full && !read )begin
				fifo_error = 1;
			end

			if( read && fifo_empty && !write)begin //Le agregue el !write
				fifo_error = 1;
			end
		end
	end

	always@( posedge clk)begin
        if ( !reset_L ) begin
            count <= 'b0;
            fifo_data_out <= 'b0;
            ptr_write          <= 'b0;
            ptr_read          <= 'b0;
        end 
//********************Cambios *************************
	//Write and read logic
	else begin
	if( !fifo_full && write )begin
                ptr_write <= ptr_write + 1; 
		// Le quite los !fifo empty porque al estar escribiendo el fifo no va a estar empty, no tiene sentido
                if (read )begin
                    ptr_read <= ptr_read + 1;            
                    count <= count;

		    fifo_data_out <= data_out;

                end 
		//Esto bien bien se implementa solo con un else, pero antes la logica no estaba asi y me da pereza cambiarlo
		else begin
			if(!read) begin
                    		ptr_read <= ptr_read;
                    		count <= count + 1;
				fifo_empty <= 0;
                	end
			else begin
				count <= count;
			end
		end
	end

	else if( !fifo_empty && read ) begin
                ptr_read <= ptr_read + 1;
		fifo_data_out <= data_out;
		// Le quite los !fifo full porque al estar escribiendo el fifo no va a estar empty, no tiene sentido
		if (write)begin
             		ptr_write <= ptr_write + 1;            
             		count <= count;
          	end
     	
                else begin
			//Esto bien bien se implementa solo con un else, pero antes la logica no estaba asi y me da pereza cambiarlo
			if(!write) begin
			ptr_write <= ptr_write;        
		        count  <= count - 1;
		        fifo_data_out <= data_out;
			fifo_full <= 0;
			end
		end

            end 
	else begin //Este else es solo para cerrar el if
                ptr_read <= ptr_read; 
            end
//********************* Hasta aqui los cambios ************************** 
        end
    end



endmodule
