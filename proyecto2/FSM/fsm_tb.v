`timescale 1us/1us
// escala unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "fsm_synth.v"
`include "fsm.v"
`include "probador_fsm.v"

//Testbench
module BancoPruebas;
  	//Param
	parameter MAIN_QUEUE_SIZE = 3;

	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From probador of probador_fsm.v
	wire		idle;			// From fsm_cond of fsm.v
	wire		idle_synth;		// From fsm_estruct of fsm_synth.v
	wire		init;			// From probador of probador_fsm.v
	wire		reset_L;		// From probador of probador_fsm.v
	wire [MAIN_QUEUE_SIZE-1:0] th_almost_empty;// From probador of probador_fsm.v
	wire [MAIN_QUEUE_SIZE-1:0] th_almost_full;// From probador of probador_fsm.v
	wire [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_empty;// From fsm_cond of fsm.v
	wire [2:0]	th_fifos_almost_empty_synth;// From fsm_estruct of fsm_synth.v
	wire [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_full;// From fsm_cond of fsm.v
	wire [2:0]	th_fifos_almost_full_synth;// From fsm_estruct of fsm_synth.v
	// End of automatics
	wire [8:0]	fifos_empty;


    //Descripcion conductual
    fsm fsm_cond(/*AUTOINST*/
		 // Outputs
		 .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
		 .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]),
		 .idle			(idle),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .init			(init),
		 .th_almost_full	(th_almost_full[MAIN_QUEUE_SIZE-1:0]),
		 .th_almost_empty	(th_almost_empty[MAIN_QUEUE_SIZE-1:0]),
		 .fifos_empty		(fifos_empty[8:0]));

    //Descripcion estructural
    fsm_synth fsm_estruct(/*AUTOINST*/
			  // Outputs
			  .idle_synth		(idle_synth),
			  .th_fifos_almost_empty_synth(th_fifos_almost_empty_synth[2:0]),
			  .th_fifos_almost_full_synth(th_fifos_almost_full_synth[2:0]),
			  // Inputs
			  .clk			(clk),
			  .fifos_empty		(fifos_empty[8:0]),
			  .init			(init),
			  .reset_L		(reset_L),
			  .th_almost_empty	(th_almost_empty[2:0]),
			  .th_almost_full	(th_almost_full[2:0]));

    // Probador: generador de senales y monitor
    probador_fsm probador(/*AUTOINST*/
			  // Outputs
			  .clk			(clk),
			  .reset_L		(reset_L),
			  .init			(init),
			  .fifos_empty		(fifos_empty[8:0]),
			  .th_almost_empty	(th_almost_empty[MAIN_QUEUE_SIZE-1:0]),
			  .th_almost_full	(th_almost_full[MAIN_QUEUE_SIZE-1:0]),
			  // Inputs
			  .idle			(idle),
			  .idle_synth		(idle_synth),
			  .th_fifos_almost_empty(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]),
			  .th_fifos_almost_empty_synth(th_fifos_almost_empty_synth[MAIN_QUEUE_SIZE-1:0]),
			  .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
			  .th_fifos_almost_full_synth(th_fifos_almost_full_synth[MAIN_QUEUE_SIZE-1:0]));

endmodule

