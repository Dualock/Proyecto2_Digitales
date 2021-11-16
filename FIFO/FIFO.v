`include "memoria.v"
module FIFO #( //Parametros
	parameter DATA_SIZE  = 12, 			 //Tamaño de bits de entrada
	parameter MAIN_QUEUE_SIZE  = 3,		// Cantiad de entradas en un fifo
	parameter [DATA_SIZE-1:0]  th_almost_full = 6,  //umbral almost full
	parameter [DATA_SIZE-1:0]	th_almost_empty =  1//umbral almost empty
)(
	input 					reset_L, clk, read, write,
	input 		[DATA_SIZE -1:0] 	data_in,

	output reg 				fifo_empty, fifo_error, almost_full, almost_empty, fifo_full,
	output reg 	[DATA_SIZE-1:0] 		fifo_data_out
);
	//Regs internos:
	/*AUTOREGINPUT*/
	// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
	reg [MAIN_QUEUE_SIZE-1:0] ptr_read;	// To mem of memoria.v
	reg [MAIN_QUEUE_SIZE-1:0] ptr_write;	// To mem of memoria.v
	// End of automatics

	//Flags del FIFO
  	reg  [MAIN_QUEUE_SIZE-1:0]	count;
	reg  [DATA_SIZE-1:0] 		data_to_mem;
	reg system_pause;

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
		system_pause = 0;

		if (~reset_L) begin
			fifo_empty = 1;
			fifo_full = 0;
			almost_full = 0;
			almost_empty = 0;
			system_pause = 0;
			fifo_error = 0;
		end
		//FIFO flag control logic
		else begin
			if (count < 1)begin
				fifo_empty = 1;
			end
			if(count == th_almost_empty) begin
				almost_empty = 1;
			end

			if( count == ((2**MAIN_QUEUE_SIZE)-1))begin
				fifo_full = 1;
			end

			if( count == th_almost_full )begin
				almost_full = 1;

			end

			//if( (count <= th_almost_empty) && (count!=0) )begin
			//	almost_empty = 1;
			//end

			if( write && fifo_full && !read )begin
				fifo_error = 1;
				system_pause = 1;
			end

			if( read && fifo_empty && !write)begin
				fifo_error = 1;
				system_pause = 1;
			end
			if(write && !fifo_full) begin
				system_pause = 0;
				fifo_error = 0;
			end
			if(read && !fifo_empty) begin
				system_pause = 0;
				fifo_error = 0;
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
		else begin
			if(system_pause) begin
				ptr_write <= ptr_write;
				count <= count;
				ptr_read <= ptr_read;
			end
			else begin
				if( !fifo_full && !fifo_empty && write && read )begin
					ptr_write <= ptr_write + 1;
					fifo_data_out <= data_out;
					ptr_read <= ptr_read + 1;
				end
				if( !fifo_empty && read && !write ) begin
					ptr_read <= ptr_read + 1;
					fifo_data_out <= data_out;
					count  <= count - 1;
				end
				if(!fifo_full && write && !read) begin
					ptr_write <= ptr_write + 1;
					count <= count + 1;
				end
		end
	end
end


endmodule
