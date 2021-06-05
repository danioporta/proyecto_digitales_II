`timescale 1ms/100ps

//`include "demux8_32_v2.v"
`include "Probador_mux.v"
`include "Muxes.v"

/*`include "muxL2.v"*/
`include "synth.v"

`include "cmos_cells.v"

module banco_mux;

	wire [7:0] Salida_conductual,Salida_estructural,Salida0,Salida1;
	wire [7:0] Entrada0, Entrada1,Entrada2,Entrada3;
	wire clk_f,clk_2f, clk_4f, validSalida0, validSalida1, validEntrada1,validEntrada0,validEntrada2,validEntrada3;


      

        Muxes muxes1(/*AUTOINST*/
		     // Outputs
		     .Salida_conductual	(Salida_conductual[7:0]),
		     .validsalida1	(validsalida1),
		     // Inputs
		     .validsalida0	(validsalida0),
		     .validEntrada0	(validEntrada0),
		     .validEntrada1	(validEntrada1),
		     .validEntrada2	(validEntrada2),
		     .validEntrada3	(validEntrada3),
		     .Entrada0		(Entrada0[7:0]),
		     .Entrada1		(Entrada1[7:0]),
		     .Entrada2		(Entrada2[7:0]),
		     .Entrada3		(Entrada3[7:0]),
		     .clk_4f		(clk_4f),
		     .clk_2f		(clk_2f),
		     .clk_f		(clk_f),
		     .reset		(reset));



        synth muxes2(
          /*AUTOINST*/
		     // Outputs
		     .Salida_estructural(Salida_estructural[7:0]),
		     .validsalida1	(validsalida1),
		     // Inputs
		     .Entrada0		(Entrada0[7:0]),
		     .Entrada1		(Entrada1[7:0]),
		     .Entrada2		(Entrada2[7:0]),
		     .Entrada3		(Entrada3[7:0]),
		     .clk_2f		(clk_2f),
		     .clk_4f		(clk_4f),
		     .clk_f		(clk_f),
		     .reset		(reset),
		     .validEntrada0	(validEntrada0),
		     .validEntrada1	(validEntrada1),
		     .validEntrada2	(validEntrada2),
		     .validEntrada3	(validEntrada3),
		     .validsalida0	(validsalida0));

    Probador_mux probador(/*AUTOINST*/
			  // Outputs
			  .validSalida0		(validSalida0),
			  .validSalida1		(validSalida1),
			  .validEntrada0	(validEntrada0),
			  .validEntrada1	(validEntrada1),
			  .validEntrada2	(validEntrada2),
			  .validEntrada3	(validEntrada3),
			  .Entrada0		(Entrada0[7:0]),
			  .Entrada1		(Entrada1[7:0]),
			  .Entrada2		(Entrada2[7:0]),
			  .Entrada3		(Entrada3[7:0]),
			  .clk_4f		(clk_4f),
			  .clk_2f		(clk_2f),
			  .clk_f		(clk_f),
			  .reset		(reset),
			  // Inputs
			  .Salida_estructural	(Salida_estructural[7:0]),
			  .Salida_conductual	(Salida_conductual[7:0]));

endmodule

