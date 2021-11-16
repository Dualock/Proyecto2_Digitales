`timescale 1us/1us
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "FIFO_synth.v"
`include "FIFO.v"
`include "probador_FIFO.v"

//Testbench
module BancoPruebas;
  	//Param
	parameter DATA_SIZE = 12 ;
	parameter MAIN_QUEUE_SIZE = 3;
	parameter [DATA_SIZE-1:0]  th_almost_full = 7;  //umbral almost full
	parameter [DATA_SIZE-1:0]	th_almost_empty =  1;//umbral almost empty 

	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		almost_empty;		// From FIFO_cond of FIFO.v
	wire		almost_empty_synth;	// From FIFO_estruct of FIFO_synth.v
	wire		almost_full;		// From FIFO_cond of FIFO.v
	wire		almost_full_synth;	// From FIFO_estruct of FIFO_synth.v
	wire		clk;			// From probador of probador_FIFO.v
	wire [DATA_SIZE-1:0] data_in;		// From probador of probador_FIFO.v
	wire		error_synth;		// From probador of probador_FIFO.v
	wire [DATA_SIZE-1:0] fifo_data_out;	// From FIFO_cond of FIFO.v
	wire [11:0]	fifo_data_out_synth;	// From FIFO_estruct of FIFO_synth.v
	wire		fifo_empty;		// From FIFO_cond of FIFO.v
	wire		fifo_empty_synth;	// From FIFO_estruct of FIFO_synth.v
	wire		fifo_error;		// From FIFO_cond of FIFO.v
	wire		fifo_error_synth;	// From FIFO_estruct of FIFO_synth.v
	wire		fifo_full;		// From FIFO_cond of FIFO.v
	wire		fifo_full_synth;	// From FIFO_estruct of FIFO_synth.v
	wire		read;			// From probador of probador_FIFO.v
	wire		reset_L;		// From probador of probador_FIFO.v
	wire		write;			// From probador of probador_FIFO.v
	// End of automatics

	/*AUTOREGINPUT*/


    //Descripcion conductual
    FIFO FIFO_cond(/*AUTOINST*/
		   // Outputs
		   .fifo_empty		(fifo_empty),
		   .fifo_error		(fifo_error),
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   .fifo_full		(fifo_full),
		   .fifo_data_out	(fifo_data_out[DATA_SIZE-1:0]),
		   // Inputs
		   .reset_L		(reset_L),
		   .clk			(clk),
		   .read		(read),
		   .write		(write),
		   .data_in		(data_in[DATA_SIZE-1:0]));

    //Descripcion estructural
    FIFO_synth FIFO_estruct(/*AUTOINST*/
			    // Outputs
			    .almost_empty_synth	(almost_empty_synth),
			    .almost_full_synth	(almost_full_synth),
			    .fifo_data_out_synth(fifo_data_out_synth[11:0]),
			    .fifo_empty_synth	(fifo_empty_synth),
			    .fifo_error_synth	(fifo_error_synth),
			    .fifo_full_synth	(fifo_full_synth),
			    // Inputs
			    .clk		(clk),
			    .data_in		(data_in[11:0]),
			    .read		(read),
			    .reset_L		(reset_L),
			    .write		(write));

    // Probador: generador de senales y monitor
    probador_FIFO probador(/*AUTOINST*/
			   // Outputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .read		(read),
			   .write		(write),
			   .data_in		(data_in[DATA_SIZE-1:0]),
			   .error_synth		(error_synth),
			   // Inputs
			   .fifo_empty		(fifo_empty),
			   .fifo_empty_synth	(fifo_empty_synth),
			   .fifo_data_out	(fifo_data_out[DATA_SIZE-1:0]),
			   .fifo_data_out_synth	(fifo_data_out_synth[DATA_SIZE-1:0]),
			   .fifo_error		(fifo_error),
			   .fifo_error_synth	(fifo_error_synth),
			   .almost_full		(almost_full),
			   .almost_full_synth	(almost_full_synth),
			   .almost_empty	(almost_empty),
			   .almost_empty_synth	(almost_empty_synth),
			   .fifo_full		(fifo_full),
			   .fifo_full_synth	(fifo_full_synth));

endmodule

