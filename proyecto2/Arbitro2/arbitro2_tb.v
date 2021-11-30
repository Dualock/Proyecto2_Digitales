`timescale 1us/1us
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "arbitro2_synth.v"
`include "arbitro2.v"
`include "probador_arbitro2.v"
`include "../FIFO/FIFO.v"

//Testbench
module BancoPruebas;
  	//Param
	parameter DATA_SIZE = 12 ;
	parameter MAIN_QUEUE_SIZE = 3;


	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From probador of probador_arbitro2.v
	wire [DATA_SIZE-1:0] data_in;		// From probador of probador_arbitro2.v
	wire		fifo_empty;		// From probador of probador_arbitro2.v
	wire 		fifo0_almost_full;
	wire 		fifo1_almost_full;
	wire 		fifo2_almost_full;
	wire 		fifo3_almost_full;// From probador of probador_arbitro2.v
	wire		reset_L;		// From probador of probador_arbitro2.v
	wire		write;			// From probador of probador_arbitro2.v
	// End of automatics

	wire [DATA_SIZE-1:0] fifo_data_out;
	wire [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_full, th_fifos_almost_empty;
	// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
	wire [4:0]	cont4, cont4_synth;			// To probador of probador_arbitro2.v
	wire [DATA_SIZE-1:0] data_out, data_out_synth;		// To probador of probador_arbitro2.v
	//wire [DATA_SIZE-1:0] data_out1;		// To probador of probador_arbitro2.v
	//wire [DATA_SIZE-1:0] data_out2;		// To probador of probador_arbitro2.v
	//wire [DATA_SIZE-1:0] data_out3;		// To probador of probador_arbitro2.v
	wire		pop, pop_synth;			// To probador of probador_arbitro2.v
	wire 		push0, push0_synth;			// To probador of probador_arbitro2.v
	wire 		push1, push1_synth;
	wire 		push2, push2_synth;
	wire 		push3, push3_synth;
	wire 		valid_entrada;
	// End of automatics

	FIFO FIFO_entrada(
		//Outputs
		.fifo_empty		(fifo_empty),
		.fifo_data_out	(fifo_data_out),
		.valid 			(valid_entrada),
		// Inputs
		.data_in 		(data_in),
		.reset_L		(reset_L),
		.clk			(clk),
		.read			(pop),
		.write 			(write),
		.th_fifos_almost_full (th_fifos_almost_full),
		.th_fifos_almost_empty (th_fifos_almost_empty));

	 //Descripcion conductual
    arbitro2 arbitro2_cond(
			   // Outputs
			   .data_out		(data_out[DATA_SIZE-1:0]),
			   .push0		(push0),
			   .push1		(push1),
			   .push2		(push2),
			   .push3		(push3),
			   .pop			(pop),
			   .cont4		(cont4[4:0]),
			   // Inputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .data_in		(fifo_data_out),
			   .fifo_empty		(fifo_empty),
			   .valid			(valid_entrada),
			   .fifo0_almost_full	(fifo0_almost_full),
			   .fifo1_almost_full	(fifo1_almost_full),
			   .fifo2_almost_full	(fifo2_almost_full),
			   .fifo3_almost_full	(fifo3_almost_full));

    //Descripcion estructural
    arbitro2_synth arbitro2_estruct(
				    // Outputs
				    .cont4_synth	(cont4_synth[4:0]),
				    .data_out_synth	(data_out_synth[11:0]),
				    .pop_synth		(pop_synth),
				    .push0_synth	(push0_synth),
				    .push1_synth	(push1_synth),
				    .push2_synth	(push2_synth),
				    .push3_synth	(push3_synth),
				    // Inputs
				    .clk		(clk),
				    .data_in		(fifo_data_out),
					.valid			(valid_entrada),
				    .fifo0_almost_full	(fifo0_almost_full),
				    .fifo1_almost_full	(fifo1_almost_full),
				    .fifo2_almost_full	(fifo2_almost_full),
				    .fifo3_almost_full	(fifo3_almost_full),
				    .fifo_empty		(fifo_empty),
				    .reset_L		(reset_L));

	FIFO FIFO_0_salida (
		// Outputs
		   .almost_full		(fifo0_almost_full),
		   // Inputs
		   .reset_L		(reset_L),
		   .clk			(clk),
		   .write		(push0),
		   .data_in		(data_out),
		   .th_fifos_almost_full (th_fifos_almost_full),
   		   .th_fifos_almost_empty (th_fifos_almost_empty));
	FIFO FIFO_1_salida (
		// Outputs
		   .almost_full		(fifo1_almost_full),
		   // Inputs
		   .reset_L		(reset_L),
		   .clk			(clk),
		   .write		(push1),
		   .data_in		(data_out),
		   .th_fifos_almost_full (th_fifos_almost_full),
   		   .th_fifos_almost_empty (th_fifos_almost_empty));
	FIFO FIFO_2_salida (
		// Outputs
		   .almost_full		(fifo2_almost_full),
		   // Inputs
		   .reset_L		(reset_L),
		   .clk			(clk),
		   .write		(push2),
		   .data_in		(data_out),
		   .th_fifos_almost_full (th_fifos_almost_full),
   		   .th_fifos_almost_empty (th_fifos_almost_empty));

	FIFO FIFO_3_salida (
		// Outputs
		   .almost_full		(fifo3_almost_full),
		   // Inputs
		   .reset_L		(reset_L),
		   .clk			(clk),
		   .write		(push3),
		   .data_in		(data_out),
		   .th_fifos_almost_full (th_fifos_almost_full),
   		   .th_fifos_almost_empty (th_fifos_almost_empty));



    // Probador: generador de senales y monitor
    probador_arbitro2 probador(/*AUTOINST*/
			       // Outputs
			       .clk		(clk),
			       .reset_L		(reset_L),
			       .data_in		(data_in[DATA_SIZE-1:0]),
			       .write		(write),
			       .th_fifos_almost_full(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
			       .th_fifos_almost_empty(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]),
			       // Inputs
			       .data_out	(data_out[DATA_SIZE-1:0]),
			       .data_out_synth	(data_out_synth[DATA_SIZE-1:0]),
			       .push0		(push0),
			       .push0_synth	(push0_synth),
			       .push1		(push1),
			       .push1_synth	(push1_synth),
			       .push2		(push2),
			       .push2_synth	(push2_synth),
			       .push3		(push3),
			       .push3_synth	(push3_synth),
			       .pop		(pop),
			       .pop_synth	(pop_synth),
			       .cont4		(cont4[4:0]),
			       .cont4_synth	(cont4_synth[4:0]),
			       .fifo_empty	(fifo_empty),
			       .fifo0_almost_full(fifo0_almost_full),
			       .fifo1_almost_full(fifo1_almost_full),
			       .fifo2_almost_full(fifo2_almost_full),
			       .fifo3_almost_full(fifo3_almost_full),
			       .valid_entrada	(valid_entrada));

endmodule
