`timescale 1ms/100ps

`include "PSRX.v"
`include "probador_PSRX.v"
`include "synth_PSRX.v"

    module banco_paralelo_serial2;
		wire [7:0] in_serial;
		wire clk_4f, clk_32f, active, out_serial2_conductual,out_serial2_estructural;

		PSRX p_s(/*AUTOINST*/
			 // Outputs
			 .out_serial2_conductual(out_serial2_conductual),
			 // Inputs
			 .clk_4f		(clk_4f),
			 .clk_32f		(clk_32f),
			 .active		(active));

		
		synth_PSRX estructural(/*AUTOINST*/
				       // Outputs
				       .out_serial2_estructural(out_serial2_estructural),
				       // Inputs
				       .active		(active),
				       .clk_32f		(clk_32f),
				       .clk_4f		(clk_4f));	   

		
		probador_PSRX prob_paralelo_serial(/*AUTOINST*/
						   // Outputs
						   .clk_4f		(clk_4f),
						   .active		(active),
						   .clk_32f		(clk_32f),
						   // Inputs
						   .out_serial2_conductual(out_serial2_conductual),
						   .out_serial2_estructural(out_serial2_estructural));

    endmodule
