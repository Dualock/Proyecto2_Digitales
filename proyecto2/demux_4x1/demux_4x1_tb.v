`timescale 1us/1us
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "demux_4x1_synth.v"
`include "demux_4x1.v"
`include "probador_demux_4x1.v"
//`include "../FIFO/FIFO.v"

//Testbench
module BancoPruebas;
  	//Param
	parameter DATA_SIZE = 12 ;

	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From probador of probador_demux_4x1.v
	wire [DATA_SIZE-1:0] data_in0;		// From probador of probador_demux_4x1.v
	wire [DATA_SIZE-1:0] data_in1;		// From probador of probador_demux_4x1.v
	wire [DATA_SIZE-1:0] data_in2;		// From probador of probador_demux_4x1.v
	wire [DATA_SIZE-1:0] data_in3;		// From probador of probador_demux_4x1.v
	wire [DATA_SIZE-1:0] data_out_mux;	// From demux_4x1_cond of demux_4x1.v
	wire [11:0]	data_out_synth_mux;	// From demux_4x1_estruct of demux_4x1_synth.v
	wire		reset_L;		// From probador of probador_demux_4x1.v
	wire		valid0;			// From probador of probador_demux_4x1.v
	wire		valid1;			// From probador of probador_demux_4x1.v
	wire		valid2;			// From probador of probador_demux_4x1.v
	wire		valid3;			// From probador of probador_demux_4x1.v
	// End of automatics


	/*AUTOREGINPUT*/

	 //Descripcion conductual
    demux_4x1 demux_4x1_cond(/*AUTOINST*/
			     // Outputs
			     .data_out_mux	(data_out_mux[DATA_SIZE-1:0]),
			     // Inputs
			     .clk		(clk),
			     .reset_L		(reset_L),
			     .data_in0		(data_in0[DATA_SIZE-1:0]),
			     .data_in1		(data_in1[DATA_SIZE-1:0]),
			     .data_in2		(data_in2[DATA_SIZE-1:0]),
			     .data_in3		(data_in3[DATA_SIZE-1:0]),
			     .valid0		(valid0),
			     .valid1		(valid1),
			     .valid2		(valid2),
			     .valid3		(valid3));

    //Descripcion estructural
    demux_4x1_synth demux_4x1_estruct(/*AUTOINST*/
				      // Outputs
				      .data_out_synth_mux(data_out_synth_mux[11:0]),
				      // Inputs
				      .clk		(clk),
				      .data_in0		(data_in0[11:0]),
				      .data_in1		(data_in1[11:0]),
				      .data_in2		(data_in2[11:0]),
				      .data_in3		(data_in3[11:0]),
				      .reset_L		(reset_L),
				      .valid0		(valid0),
				      .valid1		(valid1),
				      .valid2		(valid2),
				      .valid3		(valid3));

    // Probador: generador de senales y monitor
    probador_demux_4x1 probador(/*AUTOINST*/
				// Outputs
				.valid0		(valid0),
				.valid1		(valid1),
				.valid2		(valid2),
				.valid3		(valid3),
				.clk		(clk),
				.reset_L	(reset_L),
				.data_in0	(data_in0[DATA_SIZE-1:0]),
				.data_in1	(data_in1[DATA_SIZE-1:0]),
				.data_in2	(data_in2[DATA_SIZE-1:0]),
				.data_in3	(data_in3[DATA_SIZE-1:0]),
				// Inputs
				.data_out_mux	(data_out_mux[DATA_SIZE-1:0]),
				.data_out_synth_mux(data_out_synth_mux[DATA_SIZE-1:0]));

endmodule
