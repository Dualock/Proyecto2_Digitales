`timescale 1us/1us
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "trans_layer_synth.v"
`include "trans_layer.v"
`include "probador_trans_layer.v"

//Testbench
module BancoPruebas;
  	//Parameters
	parameter MAIN_QUEUE_SIZE = 3;
	parameter DATA_SIZE = 12;
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From probador of probador_trans_layer.v
	wire [DATA_SIZE-1:0] data_in;		// From probador of probador_trans_layer.v
	wire [DATA_SIZE-1:0] data_out0;		// From trans_layer_cond of trans_layer.v
	wire [11:0]	data_out0_synth;	// From trans_layer_estruct of trans_layer_synth.v
	wire [DATA_SIZE-1:0] data_out1;		// From trans_layer_cond of trans_layer.v
	wire [11:0]	data_out1_synth;	// From trans_layer_estruct of trans_layer_synth.v
	wire [DATA_SIZE-1:0] data_out2;		// From trans_layer_cond of trans_layer.v
	wire [11:0]	data_out2_synth;	// From trans_layer_estruct of trans_layer_synth.v
	wire [DATA_SIZE-1:0] data_out3;		// From trans_layer_cond of trans_layer.v
	wire [11:0]	data_out3_synth;	// From trans_layer_estruct of trans_layer_synth.v
	wire [5:0]	data_out_cont;		// From trans_layer_cond of trans_layer.v
	wire [5:0]	data_out_cont_synth;	// From trans_layer_estruct of trans_layer_synth.v
	wire [MAIN_QUEUE_SIZE-1:0] idx;		// From probador of probador_trans_layer.v
	wire		init;			// From probador of probador_trans_layer.v
	wire		pop0;			// From probador of probador_trans_layer.v
	wire		pop1;			// From probador of probador_trans_layer.v
	wire		pop2;			// From probador of probador_trans_layer.v
	wire		pop3;			// From probador of probador_trans_layer.v
	wire		push;			// From probador of probador_trans_layer.v
	wire		req;			// From probador of probador_trans_layer.v
	wire		reset_L;		// From probador of probador_trans_layer.v
	wire [MAIN_QUEUE_SIZE-1:0] th_almost_empty;// From probador of probador_trans_layer.v
	wire [MAIN_QUEUE_SIZE-1:0] th_almost_full;// From probador of probador_trans_layer.v
	wire		valid_cont;		// From trans_layer_cond of trans_layer.v
	wire		valid_cont_synth;	// From trans_layer_estruct of trans_layer_synth.v
	// End of automatics

    //Descripcion conductual
    trans_layer trans_layer_cond(/*AUTOINST*/
				 // Outputs
				 .data_out0		(data_out0[DATA_SIZE-1:0]),
				 .data_out1		(data_out1[DATA_SIZE-1:0]),
				 .data_out2		(data_out2[DATA_SIZE-1:0]),
				 .data_out3		(data_out3[DATA_SIZE-1:0]),
				 .data_out_cont		(data_out_cont[5:0]),
				 .valid_cont		(valid_cont),
				 // Inputs
				 .data_in		(data_in[DATA_SIZE-1:0]),
				 .reset_L		(reset_L),
				 .clk			(clk),
				 .init			(init),
				 .req			(req),
				 .push			(push),
				 .pop0			(pop0),
				 .pop1			(pop1),
				 .pop2			(pop2),
				 .pop3			(pop3),
				 .idx			(idx[MAIN_QUEUE_SIZE-1:0]),
				 .th_almost_full	(th_almost_full[MAIN_QUEUE_SIZE-1:0]),
				 .th_almost_empty	(th_almost_empty[MAIN_QUEUE_SIZE-1:0]));

    //Descripcion estructural
    trans_layer_synth trans_layer_estruct(/*AUTOINST*/
					  // Outputs
					  .data_out0_synth	(data_out0_synth[11:0]),
					  .data_out1_synth	(data_out1_synth[11:0]),
					  .data_out2_synth	(data_out2_synth[11:0]),
					  .data_out3_synth	(data_out3_synth[11:0]),
					  .data_out_cont_synth	(data_out_cont_synth[5:0]),
					  .valid_cont_synth	(valid_cont_synth),
					  // Inputs
					  .clk			(clk),
					  .data_in		(data_in[11:0]),
					  .idx			(idx[2:0]),
					  .init			(init),
					  .pop0			(pop0),
					  .pop1			(pop1),
					  .pop2			(pop2),
					  .pop3			(pop3),
					  .push			(push),
					  .req			(req),
					  .reset_L		(reset_L),
					  .th_almost_empty	(th_almost_empty[2:0]),
					  .th_almost_full	(th_almost_full[2:0]));

    // Probador: generador de senales y monitor
    probador_trans_layer probador(/*AUTOINST*/
				  // Outputs
				  .data_in		(data_in[DATA_SIZE-1:0]),
				  .reset_L		(reset_L),
				  .clk			(clk),
				  .init			(init),
				  .req			(req),
				  .push			(push),
				  .pop0			(pop0),
				  .pop1			(pop1),
				  .pop2			(pop2),
				  .pop3			(pop3),
				  .idx			(idx[MAIN_QUEUE_SIZE-1:0]),
				  .th_almost_full	(th_almost_full[MAIN_QUEUE_SIZE-1:0]),
				  .th_almost_empty	(th_almost_empty[MAIN_QUEUE_SIZE-1:0]),
				  // Inputs
				  .data_out0		(data_out0[DATA_SIZE-1:0]),
				  .data_out0_synth	(data_out0_synth[DATA_SIZE-1:0]),
				  .data_out1		(data_out1[DATA_SIZE-1:0]),
				  .data_out1_synth	(data_out1_synth[DATA_SIZE-1:0]),
				  .data_out2		(data_out2[DATA_SIZE-1:0]),
				  .data_out2_synth	(data_out2_synth[DATA_SIZE-1:0]),
				  .data_out3		(data_out3[DATA_SIZE-1:0]),
				  .data_out3_synth	(data_out3_synth[DATA_SIZE-1:0]),
				  .data_out_cont	(data_out_cont[4:0]),
				  .data_out_cont_synth	(data_out_cont_synth[4:0]),
				  .valid_cont		(valid_cont),
				  .valid_cont_synth	(valid_cont_synth));

endmodule
