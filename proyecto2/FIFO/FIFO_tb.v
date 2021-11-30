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
	wire		valid;			// From FIFO_cond of FIFO.v, ...
	wire		write;			// From probador of probador_FIFO.v
	// End of automatics
	// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
 	wire[MAIN_QUEUE_SIZE-1:0] th_fifos_almost_empty;// To FIFO_cond of FIFO.v, ..., Couldn't Merge
	wire [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_full;// To FIFO_cond of FIFO.v, ..., Couldn't Merge
	// End of automatics


	// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
	// End of automatics


    //Descripcion conductual
    FIFO FIFO_cond(/*AUTOINST*/
		   // Outputs
		   .fifo_empty		(fifo_empty),
		   .fifo_error		(fifo_error),
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   .fifo_full		(fifo_full),
		   .valid		(valid),
		   .fifo_data_out	(fifo_data_out[DATA_SIZE-1:0]),
		   // Inputs
		   .reset_L		(reset_L),
		   .clk			(clk),
		   .read		(read),
		   .write		(write),
		   .data_in		(data_in[DATA_SIZE-1:0]),
		   .th_fifos_almost_full(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
		   .th_fifos_almost_empty(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));

    //Descripcion estructural
    FIFO_synth FIFO_estruct(/*AUTOINST*/
			    // Outputs
			    .almost_empty_synth	(almost_empty_synth),
			    .almost_full_synth	(almost_full_synth),
			    .fifo_data_out_synth(fifo_data_out_synth[11:0]),
			    .fifo_empty_synth	(fifo_empty_synth),
			    .fifo_error_synth	(fifo_error_synth),
			    .fifo_full_synth	(fifo_full_synth),
			    .valid		(valid),
			    // Inputs
			    .clk		(clk),
			    .data_in		(data_in[11:0]),
			    .read		(read),
			    .reset_L		(reset_L),
			    .th_fifos_almost_empty(th_fifos_almost_empty[2:0]),
			    .th_fifos_almost_full(th_fifos_almost_full[2:0]),
			    .write		(write));

    // Probador: generador de senales y monitor
    probador_FIFO probador(/*AUTOINST*/
			   // Outputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .read		(read),
			   .write		(write),
			   .data_in		(data_in[DATA_SIZE-1:0]),
			   .th_fifos_almost_full(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
			   .th_fifos_almost_empty(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]),
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
