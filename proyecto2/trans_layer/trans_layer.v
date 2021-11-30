`include "../FIFO/FIFO.v"
`include "../FSM/fsm.v"
`include "../contador/contador.v"
`include "../Arbitro1/arbitro1.v"
`include "../Arbitro2/arbitro2.v"
`include "../demux_4x1/demux_4x1.v"

module trans_layer#(//Parametros
    parameter MAIN_QUEUE_SIZE = 3,
    parameter DATA_SIZE = 12
)(//Entradas y salidas
    input      [DATA_SIZE-1:0]         data_in,
    input                              reset_L, clk, init, req,
    input                              push,
    input                              pop0, pop1, pop2, pop3,
    input      [MAIN_QUEUE_SIZE-1:0]   idx,
    input      [MAIN_QUEUE_SIZE-1:0]   th_almost_full, th_almost_empty,
    output     [DATA_SIZE-1:0]         data_out0, data_out1, data_out2, data_out3,
    output     [5:0]                   data_out_cont,
    output                             valid_cont
);
    //Wires internos Arbitro1
    wire [DATA_SIZE-1:0] data_in_arbitro1;
    wire [DATA_SIZE-1:0] data_out_arbitro1;
    wire		pop0_arbitro1;			// From arbitro1 of arbitro1.v
    wire		pop1_arbitro1;			// From arbitro1 of arbitro1.v
    wire		pop2_arbitro1;			// From arbitro1 of arbitro1.v
    wire		pop3_arbitro1;			// From arbitro1 of arbitro1.v
    wire		push0_arbitro1;			// From arbitro1 of arbitro1.v, ...
    wire		push1_arbitro1;			// From arbitro1 of arbitro1.v, ...
    wire		push2_arbitro1;			// From arbitro1 of arbitro1.v, ...
    wire		push3_arbitro1;			// From arbitro1 of arbitro1.v, ...
    wire fifo_af0_arbitro1; wire fifo_af1_arbitro1;
    wire fifo_af2_arbitro1; wire fifo_af3_arbitro1;

    //Wires internos fsm
    wire [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_empty;// From fsm of fsm.v
    wire [MAIN_QUEUE_SIZE-1:0] th_fifos_almost_full;// From fsm of fsm.v
    wire		               idle;			// From fsm of fsm.v
    wire [8:0]		           fifos_empty; // From fsm of fsm.v


    //Wires internos Arbitro2
    wire fifo_af0_arbitro2; wire fifo_af1_arbitro2;
    wire fifo_af2_arbitro2; wire fifo_af3_arbitro2;
    wire [DATA_SIZE-1:0] data_in_arbitro2;
    wire [DATA_SIZE-1:0] data_out_arbitro2;		// From arbitro2 of arbitro2.v, ...
    wire		pop_arbitro2;			// From arbitro2 of arbitro2.v
    wire		push0_arbitro2;			// From arbitro2 of arbitro2.v, ...
    wire		push1_arbitro2;			// From arbitro2 of arbitro2.v, ...
    wire		push2_arbitro2;			// From arbitro2 of arbitro2.v, ...
    wire		push3_arbitro2;			// From arbitro2 of arbitro2.v, ...
    wire        valid_entrada;

    //Wires internos demux
    wire [DATA_SIZE-1:0]    data_in0_demux, data_in1_demux, data_in2_demux, data_in3_demux;
    wire		            valid0, valid1, valid2, valid3;			// From fifo_entrada of FIFO.v, ...

    //Wires internos contador
    wire		            valid4, valid5, valid6, valid7;

    fsm fsm(
	    // Outputs
	    .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
	    .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]),
	    .idle			(idle),
	    // Inputs
	    .clk			(clk),
	    .reset_L			(reset_L),
	    .init			(init),
	    .th_almost_full		(th_almost_full[MAIN_QUEUE_SIZE-1:0]),
	    .th_almost_empty		(th_almost_empty[MAIN_QUEUE_SIZE-1:0]),
	    .fifos_empty		(fifos_empty[8:0]));

    FIFO fifo_entrada(
        // Outputs
        .fifo_empty	(fifos_empty[0]),
        .fifo_data_out	(data_in_arbitro2[DATA_SIZE-1:0]),
        .valid (valid_entrada),
        // Inputs
        .reset_L		(reset_L),
        .clk		(clk),
        .read		(pop_arbitro2),
        .write		(push),
        .data_in		(data_in[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));

    arbitro2 arbitro2(
        // Outputs
        .data_out		(data_out_arbitro2[DATA_SIZE-1:0]),
        .push0		(push0_arbitro2),
        .push1		(push1_arbitro2),
        .push2		(push2_arbitro2),
        .push3		(push3_arbitro2),
        .pop		(pop_arbitro2),
        // Inputs
        .clk		(clk),
        .reset_L		(reset_L),
        .valid      (valid_entrada),
        .data_in		(data_in_arbitro2[DATA_SIZE-1:0]),
        .fifo_empty	(fifos_empty[0]),
        .fifo0_almost_full(fifo_af0_arbitro2),
        .fifo1_almost_full(fifo_af1_arbitro2),
        .fifo2_almost_full(fifo_af2_arbitro2),
        .fifo3_almost_full(fifo_af3_arbitro2));

    FIFO fifo_c0 (
        // Outputs
        .fifo_empty		(fifos_empty[1]),
        .almost_full		(fifo_af0_arbitro2),
        .valid		(valid0),
        .fifo_data_out	(data_in0_demux[DATA_SIZE-1:0]),
        // Inputs
        .reset_L		(reset_L),
        .clk			(clk),
        .read			(pop0_arbitro1),
        .write		(push0_arbitro2),
        .data_in		(data_out_arbitro2[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));

    FIFO fifo_c1 (
            // Outputs
        .fifo_empty		(fifos_empty[2]),
        .almost_full		(fifo_af1_arbitro2),
        .valid		(valid1),
        .fifo_data_out	(data_in1_demux[DATA_SIZE-1:0]),
        // Inputs
        .reset_L		(reset_L),
        .clk			(clk),
        .read			(pop1_arbitro1),
        .write		(push1_arbitro2),
        .data_in		(data_out_arbitro2[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));
    FIFO fifo_c2 (
        // Outputs
        .fifo_empty		(fifos_empty[3]),
        .almost_full		(fifo_af2_arbitro2),
        .valid		(valid2),
        .fifo_data_out	(data_in2_demux[DATA_SIZE-1:0]),
        // Inputs
        .reset_L		(reset_L),
        .clk			(clk),
        .read			(pop2_arbitro1),
        .write		(push2_arbitro2),
        .data_in		(data_out_arbitro2[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));
    FIFO fifo_c3 (
        // Outputs
        .fifo_empty		(fifos_empty[4]),
        .almost_full		(fifo_af3_arbitro2),
        .valid		(valid3),
        .fifo_data_out	(data_in3_demux[DATA_SIZE-1:0]),
        // Inputs
        .reset_L		(reset_L),
        .clk			(clk),
        .read			(pop3_arbitro1),
        .write		(push3_arbitro2),
        .data_in		(data_out_arbitro2[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));

    demux_4x1 demux(
        //Outputs
        .data_out_mux   (data_in_arbitro1[DATA_SIZE-1:0]),
        //Inputs
        .clk            (clk),
        .reset_L        (reset_L),
        .data_in0       (data_in0_demux),
        .data_in1       (data_in1_demux),
        .data_in2       (data_in2_demux),
        .data_in3       (data_in3_demux),
        .valid0         (valid0),
        .valid1         (valid1),
        .valid2         (valid2),
        .valid3         (valid3));

    arbitro1 arbitro1(
        // Outputs
        .data_out		(data_out_arbitro1[DATA_SIZE-1:0]),
        .pop0		(pop0_arbitro1),
        .pop1		(pop1_arbitro1),
        .pop2		(pop2_arbitro1),
        .pop3		(pop3_arbitro1),
        .push0		(push0_arbitro1),
        .push1		(push1_arbitro1),
        .push2		(push2_arbitro1),
        .push3		(push3_arbitro1),
        // Inputs
        .clk		(clk),
        .reset_L		(reset_L),
        .data_in		(data_in_arbitro1[DATA_SIZE-1:0]),
        .fifo_empty0	(fifos_empty[1]),
        .fifo_empty1	(fifos_empty[2]),
        .fifo_empty2	(fifos_empty[3]),
        .fifo_empty3	(fifos_empty[4]),
        .fifo_af0		(fifo_af0_arbitro1),
        .fifo_af1		(fifo_af1_arbitro1),
        .fifo_af2		(fifo_af2_arbitro1),
        .fifo_af3		(fifo_af3_arbitro1),
        .valid0		(valid0),
        .valid1		(valid1),
        .valid2		(valid2),
        .valid3		(valid3));

    FIFO fifo_d0 (
        // Outputs
        .fifo_empty		(fifos_empty[5]),
        .almost_full		(fifo_af0_arbitro1),
        .fifo_data_out	(data_out0[DATA_SIZE-1:0]),
        .valid (valid4),
        // Inputs
        .reset_L		(reset_L),
        .clk			(clk),
        .read			(pop0),
        .write		(push0_arbitro1),
        .data_in		(data_out_arbitro1[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));
    FIFO fifo_d1 (
        // Outputs
        .fifo_empty		(fifos_empty[6]),
        .almost_full		(fifo_af1_arbitro1),
        .fifo_data_out	(data_out1[DATA_SIZE-1:0]),
        .valid (valid5),
        // Inputs
        .reset_L		(reset_L),
        .clk			(clk),
        .read			(pop1),
        .write		(push1_arbitro1),
        .data_in		(data_out_arbitro1[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));
    FIFO fifo_d2 (
        // Outputs
        .fifo_empty		(fifos_empty[7]),
        .almost_full		(fifo_af2_arbitro1),
        .fifo_data_out	(data_out2[DATA_SIZE-1:0]),
        .valid (valid6),
        // Inputs
        .reset_L		(reset_L),
        .clk			(clk),
        .read			(pop2),
        .write		(push2_arbitro1),
        .data_in		(data_out_arbitro1[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));
    FIFO fifo_d3 (
        // Outputs
        .fifo_empty		(fifos_empty[8]),
        .almost_full		(fifo_af3_arbitro1),
        .fifo_data_out	(data_out3[DATA_SIZE-1:0]),
        .valid (valid7),
        // Inputs
        .reset_L		(reset_L),
        .clk			(clk),
        .read			(pop3),
        .write		(push3_arbitro1),
        .data_in		(data_out_arbitro1[DATA_SIZE-1:0]),
        .th_fifos_almost_full	(th_fifos_almost_full[MAIN_QUEUE_SIZE-1:0]),
        .th_fifos_almost_empty	(th_fifos_almost_empty[MAIN_QUEUE_SIZE-1:0]));

    contador cont(
        //Outputs
        .valid      (valid_cont),
        .data_out   (data_out_cont),
        //Inputs
        .pop0       (valid4),
        .pop1       (valid5),
        .pop2       (valid6),
        .pop3       (valid7),
        .pop4       (valid_entrada),
        .req        (req),
        .clk        (clk),
        .reset_L    (reset_L),
        .idle       (idle),
        .idx        (idx));
endmodule
