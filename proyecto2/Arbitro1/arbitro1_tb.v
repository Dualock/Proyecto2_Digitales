`timescale 1us/1us
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "arbitro1_synth.v"
`include "arbitro1.v"
`include "probador_arbitro1.v"
`include "../FIFO/FIFO.v"
`include "../demux_4x1/demux_4x1.v"
//`include "cmos_cells.v"

//Testbench
module BancoPruebas;
  	//Param
	parameter DATA_SIZE = 12 ;
	parameter MAIN_QUEUE_SIZE = 3;

	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From probador of probador_arbitro1.v
	wire [4:0]	cont0;			// From arbitro1_cond of arbitro1.v
	wire [4:0]	cont0_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire [4:0]	cont1;			// From arbitro1_cond of arbitro1.v
	wire [4:0]	cont1_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire [4:0]	cont2;			// From arbitro1_cond of arbitro1.v
	wire [4:0]	cont2_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire [4:0]	cont3;			// From arbitro1_cond of arbitro1.v
	wire [4:0]	cont3_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire [DATA_SIZE-1:0] data_in;		// From probador of probador_arbitro1.v
	wire [DATA_SIZE-1:0] data_out;		// From arbitro1_cond of arbitro1.v
	wire [11:0]	data_out_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		fifo_af0;		// From probador of probador_arbitro1.v
	wire		fifo_af1;		// From probador of probador_arbitro1.v
	wire		fifo_af2;		// From probador of probador_arbitro1.v
	wire		fifo_af3;		// From probador of probador_arbitro1.v
	wire		pop0;			// From arbitro1_cond of arbitro1.v
	wire		pop0_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		pop1;			// From arbitro1_cond of arbitro1.v
	wire		pop1_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		pop2;			// From arbitro1_cond of arbitro1.v
	wire		pop2_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		pop3;			// From arbitro1_cond of arbitro1.v
	wire		pop3_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		push0;			// From arbitro1_cond of arbitro1.v
	wire		push0_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		push1;			// From arbitro1_cond of arbitro1.v
	wire		push1_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		push2;			// From arbitro1_cond of arbitro1.v
	wire		push2_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		push3;			// From arbitro1_cond of arbitro1.v
	wire		push3_synth;		// From arbitro1_estruct of arbitro1_synth.v
	wire		reset_L;		// From probador of probador_arbitro1.v
	wire		write_0;		// From probador of probador_arbitro1.v
	wire		write_1;		// From probador of probador_arbitro1.v
	wire		write_2;		// From probador of probador_arbitro1.v
	wire		write_3;		// From probador of probador_arbitro1.v
	wire [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_full, th_fifos_almost_empty;

	// End of automatics


	// Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
	wire		fifo_empty0;		// To arbitro1_cond of arbitro1.v, ...
	wire		fifo_empty1;		// To arbitro1_cond of arbitro1.v, ...
	wire		fifo_empty2;		// To arbitro1_cond of arbitro1.v, ...
	wire		fifo_empty3;		// To arbitro1_cond of arbitro1.v, ...
	wire 		[DATA_SIZE-1:0] data_in0;
	wire 		[DATA_SIZE-1:0] data_in1;
	wire 		[DATA_SIZE-1:0] data_in2;
	wire 		[DATA_SIZE-1:0] data_in3;
	wire 		[DATA_SIZE-1:0] data_in_below0;
	wire 		[DATA_SIZE-1:0] data_in_below1;
	wire 		[DATA_SIZE-1:0] data_in_below2;
	wire 		[DATA_SIZE-1:0] data_in_below3;
	wire 		[DATA_SIZE-1:0] data_out_mux;
	wire 		[DATA_SIZE-1:0] data_outF0;
	wire 		[DATA_SIZE-1:0] data_outF1;
	wire 		[DATA_SIZE-1:0] data_outF2;
	wire 		[DATA_SIZE-1:0] data_outF3;
	wire 		popProbador0;
	wire 		popProbador1;
	wire 		popProbador2;
	wire 		popProbador3;
	wire 		valid0;
	wire 		valid1;
	wire 		valid2;
	wire 		valid3;

	// End of automatics

		 FIFO FIFO_0_entrada (
 			// Outputs
 			   //.almost_full		(fifo_af0),
				 .fifo_empty			(fifo_empty0),
				 .fifo_data_out 	(data_in0),
				 .valid (valid0),
 			   // Inputs
 			   .reset_L		(reset_L),
 			   .clk			(clk),
 			   .write		(write_0),
 			   .data_in		(data_in_below0),
 			   .read		(pop0),
	   		   .th_fifos_almost_full (th_fifos_almost_full),
	   		   .th_fifos_almost_empty (th_fifos_almost_empty));
		 FIFO FIFO_1_entrada (
 			// Outputs
 			   //.almost_full		(fifo_af0),
				 .fifo_empty			(fifo_empty1),
				 .fifo_data_out 	(data_in1),
				 .valid (valid1),
 			   // Inputs
 			   .reset_L		(reset_L),
 			   .clk			(clk),
 			   .write		(write_1),
 			   .data_in		(data_in_below1),
 			   .read		(pop1),
	   		   .th_fifos_almost_full (th_fifos_almost_full),
	   		   .th_fifos_almost_empty (th_fifos_almost_empty));
		 FIFO FIFO_2_entrada (
 			// Outputs
 			   //.almost_full		(fifo_af0),
				.fifo_empty (fifo_empty2),
				.fifo_data_out (data_in2),
				.valid (valid2),
 			   // Inputs

 			   .reset_L		(reset_L),
 			   .clk			(clk),
 			   .write		(write_2),
 			   .data_in		(data_in_below2),
 			   .read		(pop2),
	   		   .th_fifos_almost_full (th_fifos_almost_full),
	   		   .th_fifos_almost_empty (th_fifos_almost_empty));
		 FIFO FIFO_3_entrada (
 			// Outputs
 			   //.almost_full		(fifo_af0),
				  .fifo_empty			(fifo_empty3),
					.fifo_data_out 	(data_in3),
					.valid (valid3),
 			   // Inputs
 			   .reset_L		(reset_L),
 			   .clk			(clk),
 			   .write		(write_3),
 			   .data_in		(data_in_below3),
 			   .read		(pop3),
	   		   .th_fifos_almost_full (th_fifos_almost_full),
	   		   .th_fifos_almost_empty (th_fifos_almost_empty));

		 demux_4x1 demux(
	 			//outputs
	 			.valid0		(valid0),
	 			.valid1		(valid1),
	 			.valid2		(valid2),
	 			.valid3		(valid3),
	 			.data_out_mux (data_out_mux),
	 			//inputs
	 			.reset_L		(reset_L),
	 			.clk			(clk),
	 			.data_in0		(data_in0),
	 			.data_in1		(data_in1),
	 			.data_in2		(data_in2),
	 			.data_in3		(data_in3));

		 FIFO FIFO_0_salida (
 			// Outputs
 			   //.almost_full		(fifo_af0),
			   //.fifo_empty			(fifo_empty0),
			   .fifo_data_out (data_outF0),
 			   // Inputs
 			   .reset_L		(reset_L),
 			   .clk			(clk),
 			   .write		(push0),
 			   .data_in		(data_out),
 			   .read		(popProbador0),
	   		   .th_fifos_almost_full (th_fifos_almost_full),
	   		   .th_fifos_almost_empty (th_fifos_almost_empty)
				 );

		 FIFO FIFO_1_salida (
 			// Outputs
 			   //.almost_full		(fifo_af0),
			   //.fifo_empty			(fifo_empty1),
			   .fifo_data_out 	(data_outF1),
 			   // Inputs
 			   .reset_L		(reset_L),
 			   .clk			(clk),
 			   .write		(push1),
 			   .data_in		(data_out),
 			   .read		(popProbador1),
	   		   .th_fifos_almost_full (th_fifos_almost_full),
	   		   .th_fifos_almost_empty (th_fifos_almost_empty)
				 );
		 FIFO FIFO_2_salida (
 			// Outputs
 			   //.almost_full		(fifo_af0),
			   	.fifo_data_out 	(data_outF2),
				//.fifo_empty			(fifo_empty2),
 			   // Inputs
 			   .reset_L		(reset_L),
 			   .clk			(clk),
 			   .write		(push2),
 			   .data_in		(data_out),
		 	   .read		(popProbador2),
	   		   .th_fifos_almost_full (th_fifos_almost_full),
	   		   .th_fifos_almost_empty (th_fifos_almost_empty)
						 );
		 FIFO FIFO_3_salida (
 			// Outputs
 			   //.almost_full		(fifo_af0),
			   //.fifo_empty			(fifo_empty3),
			   .fifo_data_out 	(data_outF3),
 			   // Inputs
 			   .reset_L		(reset_L),
 			   .clk			(clk),
 			   .write		(push3),
 			   .data_in		(data_out),
		 	   .read		(popProbador3),
	   		   .th_fifos_almost_full (th_fifos_almost_full),
	   		   .th_fifos_almost_empty (th_fifos_almost_empty)
						 );
	 // Descripcion conductual
    arbitro1 arbitro1_cond(
			   // Outputs
			   .data_out		(data_out[DATA_SIZE-1:0]),
			   .pop0		(pop0),
			   .pop1		(pop1),
			   .pop2		(pop2),
			   .pop3		(pop3),
			   .push0		(push0),
			   .push1		(push1),
			   .push2		(push2),
			   .push3		(push3),
			   .cont0		(cont0[4:0]),
			   .cont1		(cont1[4:0]),
			   .cont2		(cont2[4:0]),
			   .cont3		(cont3[4:0]),
			   // Inputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .data_in		(data_out_mux),
			   .fifo_empty0		(fifo_empty0),
			   .fifo_empty1		(fifo_empty1),
			   .fifo_empty2		(fifo_empty2),
			   .fifo_empty3		(fifo_empty3),
			   .fifo_af0		(fifo_af0),
			   .fifo_af1		(fifo_af1),
			   .fifo_af2		(fifo_af2),
			   .fifo_af3		(fifo_af3),
			   .valid0			(valid0),
			   .valid1			(valid1),
			   .valid2			(valid2),
			   .valid3			(valid3));

    //Descripcion estructural
    arbitro1_synth arbitro1_estruct(
				    // Outputs
				    .cont0_synth	(cont0_synth[4:0]),
				    .cont1_synth	(cont1_synth[4:0]),
				    .cont2_synth	(cont2_synth[4:0]),
				    .cont3_synth	(cont3_synth[4:0]),
				    .data_out_synth	(data_out_synth[11:0]),
				    .pop0_synth		(pop0_synth),
				    .pop1_synth		(pop1_synth),
				    .pop2_synth		(pop2_synth),
				    .pop3_synth		(pop3_synth),
				    .push0_synth	(push0_synth),
				    .push1_synth	(push1_synth),
				    .push2_synth	(push2_synth),
				    .push3_synth	(push3_synth),
				    // Inputs
				    .clk		(clk),
				    .data_in		(data_out_mux),
				    .fifo_af0		(fifo_af0),
				    .fifo_af1		(fifo_af1),
				    .fifo_af2		(fifo_af2),
				    .fifo_af3		(fifo_af3),
				    .fifo_empty0	(fifo_empty0),
				    .fifo_empty1	(fifo_empty1),
				    .fifo_empty2	(fifo_empty2),
				    .fifo_empty3	(fifo_empty3),
				    .reset_L		(reset_L),
					.valid0			(valid0),
	 			   	.valid1			(valid1),
	 			   	.valid2			(valid2),
	 			   	.valid3			(valid3));

    // Probador: generador de senales y monitor
    probador_arbitro1 probador(
			       // Outputs
			       .data_in_below0	(data_in_below0[DATA_SIZE-1:0]),
			       .data_in_below1	(data_in_below1[DATA_SIZE-1:0]),
			       .data_in_below2	(data_in_below2[DATA_SIZE-1:0]),
			       .data_in_below3	(data_in_below3[DATA_SIZE-1:0]),
			       .fifo_af0	(fifo_af0),
			       .fifo_af1	(fifo_af1),
			       .fifo_af2	(fifo_af2),
			       .fifo_af3	(fifo_af3),
			       .write_0		(write_0),
			       .write_1		(write_1),
			       .write_2		(write_2),
			       .write_3		(write_3),
			       .clk		(clk),
			       .reset_L		(reset_L),
				   .popProbador0 (popProbador0),
				   .popProbador1 (popProbador1),
				   .popProbador2 (popProbador2),
				   .popProbador3 (popProbador3),
		  		   .th_fifos_almost_full (th_fifos_almost_full),
		   		   .th_fifos_almost_empty (th_fifos_almost_empty),
			       // Inputs
				   .data_outF0 (data_outF0),
				   .data_outF1 (data_outF1),
				   .data_outF2 (data_outF2),
				   .data_outF3 (data_outF3),
			       .push0		(push0),
			       .push0_synth	(push0_synth),
			       .push1		(push1),
			       .push1_synth	(push1_synth),
			       .push2		(push2),
			       .push2_synth	(push2_synth),
			       .push3		(push3),
			       .push3_synth	(push3_synth),
			       .pop0		(pop0),
			       .pop0_synth	(pop0_synth),
			       .pop1		(pop1),
			       .pop1_synth	(pop1_synth),
			       .pop2		(pop2),
			       .pop2_synth	(pop2_synth),
			       .pop3		(pop3),
			       .pop3_synth	(pop3_synth),
			       .cont0		(cont0[4:0]),
			       .cont0_synth	(cont0_synth[4:0]),
			       .cont1		(cont1[4:0]),
			       .cont1_synth	(cont1_synth[4:0]),
			       .cont2		(cont2[4:0]),
			       .cont2_synth	(cont2_synth[4:0]),
			       .cont3		(cont3[4:0]),
			       .cont3_synth	(cont3_synth[4:0]),
			       .fifo_empty0	(fifo_empty0),
			       .fifo_empty1	(fifo_empty1),
			       .fifo_empty2	(fifo_empty2),
			       .fifo_empty3	(fifo_empty3));

endmodule
