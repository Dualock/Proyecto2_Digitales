module memoria #( //Parametros
	parameter DATA_SIZE  = 12, 			 //Tamaño de bits de entrada
	parameter MAIN_QUEUE_SIZE  = 3		// Cantiad de entradas en un fifo
)(	input 		[DATA_SIZE -1:0] 		data_in,
	input 		[MAIN_QUEUE_SIZE-1:0] 	ptr_write,
	input 		[MAIN_QUEUE_SIZE-1:0] 	ptr_read,
	input 							  	reset_L, clk, read, write,
	output reg 	[DATA_SIZE-1:0] 	  	data_out
);	

	reg [DATA_SIZE-1:0] mem [2**MAIN_QUEUE_SIZE-1:0];
	integer i;

	always@(posedge clk) begin
		if(~reset_L) begin
			for(i = 0; i<2**MAIN_QUEUE_SIZE; i = i+1 )begin 
				mem[i] <= 'b0; //Se pone en bajo las posiciones en la memoria
			end
		end 
		else begin  
			if (write) begin
				mem[ptr_write] <= data_in;//Escribimos el dato de entrada en la posicion	
			end
		end
	end

	always@(*) begin
		data_out =0;
		if (read) data_out= mem[ptr_read];
	end


endmodule
