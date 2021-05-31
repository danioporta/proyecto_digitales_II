`timescale 1ms/100ps

`include "paralelo_serial.v"
`include "probador_paralelo_serial.v"
`include "synth_paralelo.v"

    module banco_paralelo_serial;
		wire [7:0] in_serial;
		wire clk_4f, clk_32f, valid_in, out_serial_conductual, out_serial, reset;

		paralelo_serial p_s(/*AUTOINST*/
				    // Outputs
				    .out_serial_conductual(out_serial_conductual),
				    // Inputs
				    .clk_4f		(clk_4f),
				    .clk_32f		(clk_32f),
				    .in_serial		(in_serial[7:0]),
				    .valid_in		(valid_in),
				    .reset		(reset));

		
		synth_paralelo estructural(/*AUTOINST*/
					   // Outputs
					   .out_serial_estructural(out_serial_estructural),
					   // Inputs
					   .clk_32f		(clk_32f),
					   .clk_4f		(clk_4f),
					   .in_serial		(in_serial[7:0]),
					   .reset		(reset),
					   .valid_in		(valid_in));

		
		probador_paralelo_serial prob_paralelo_serial(/*AUTOINST*/
							      // Outputs
							      .clk_4f		(clk_4f),
							      .reset		(reset),
							      .valid_in		(valid_in),
							      .in_serial	(in_serial[7:0]),
							      .clk_32f		(clk_32f),
							      // Inputs
							      .out_serial_conductual(out_serial_conductual),
							      .out_serial_estructural(out_serial_estructural));

    endmodule
