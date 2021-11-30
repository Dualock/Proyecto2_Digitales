`timescale 1us/1us


`include "probador_contador.v"
`include "contador.v"
`include "contador_synth.v"


module BancoPruebas; // Testbench
	
	parameter DATA_SIZE  = 12;			 //Tamaño de bits de entrada
	parameter MAIN_QUEUE_SIZE  = 3;	// Cantiad de entradas en un fifo

    wire [5:0] data_out, data_out_synth;
    wire valid_c, valid_synth;
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		clk;			// From probador of probador_contador.v
    wire		idle;			// From probador of probador_contador.v
    wire [2:0]		idx;			// From probador of probador_contador.v
    wire		pop0;			// From probador of probador_contador.v
    wire		pop1;			// From probador of probador_contador.v
    wire		pop2;			// From probador of probador_contador.v
    wire		pop3;			// From probador of probador_contador.v
    wire		pop4;			// From probador of probador_contador.v
    wire		req;			// From probador of probador_contador.v
    wire		reset_L;		// From probador of probador_contador.v
    // End of automatics
    



    /////////////////////////////////// Probador ////////////////////////////////

	probador_contador probador (

            .data_out_synth(data_out_synth),
            .valid_c(valid_c),
            .valid_synth(valid_synth),
        /*AUTOINST*/
				    // Outputs
				    .clk		(clk),
				    .pop0		(pop0),
				    .pop1		(pop1),
				    .pop2		(pop2),
				    .pop3		(pop3),
				    .pop4		(pop4),
				    .req		(req),
				    .reset_L		(reset_L),
				    .idle		(idle),
				    .idx		(idx[2:0]),
				    // Inputs
				    .data_out		(data_out[4:0]));



    /////////////////////////////////// Contador conductual ////////////////////////

    contador contador_conductual(

            .data_out(data_out),
            .valid(valid_c),
        /*AUTOINST*/
				 // Inputs
				 .pop0			(pop0),
				 .pop1			(pop1),
				 .pop2			(pop2),
				 .pop3			(pop3),
				 .pop4			(pop4),
				 .req			(req),
				 .clk			(clk),
				 .reset_L		(reset_L),
				 .idle			(idle),
				 .idx			(idx[2:0]));

    ////////////////////////////////// Contador estructual //////////////////////////

    contador_synth Contador_estructural(

            .data_out_synth(data_out_synth),
            .valid_synth(valid_synth),
        /*AUTOINST*/
					// Inputs
					.clk		(clk),
					.idle		(idle),
					.idx		(idx[2:0]),
					.pop0		(pop0),
					.pop1		(pop1),
					.pop2		(pop2),
					.pop3		(pop3),
					.pop4		(pop4),
					.req		(req),
					.reset_L	(reset_L));




    
endmodule

