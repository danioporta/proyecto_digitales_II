`timescale 1ms/100ps

//`include "demux8_32_v2.v"
`include "Probador_mux.v"
`include "Muxes.v"

/*`include "muxL2.v"*/
`include "synth.v"

/*`include "../lib/cmos_cells.v"*/

module banco_mux;

	wire [7:0] Salida0,Salida1,Salida_condutual,Salida;
	wire [7:0] Entrada0, Entrada1,Entrada2,Entrada3;
	wire clk_f,clk_2f, clk_4f, validSalida0, validSalida1, validEntrada1,validEntrada0,validEntrada2,validEntrada3 ,selector;


      

        muxes muxes1(
		     // Outputs
		     .Salida		(Salida_condutual[7:0]),
		     .validSalida0	(validSalida0),
		     .validSalida1	(validSalida1),
		     // Inputs
		     .Entrada0		(Entrada0[7:0]),
		     .Entrada1		(Entrada1[7:0]),
		     .Entrada2		(Entrada2[7:0]),
		     .Entrada3		(Entrada3[7:0]),
		     .clk_2f		(clk_2f),
		     .clk_4f		(clk_4f),
		     .clk_f		(clk_f),
		     .reset		(reset),
		     .selector		(selector),
		     .validEntrada0	(validEntrada0),
		     .validEntrada1	(validEntrada1),
		     .validEntrada2	(validEntrada2),
		     .validEntrada3	(validEntrada3));



        synth muxes2(
          /*AUTOINST*/
		     // Outputs
		     .Salida		(Salida[7:0]),
		     .validSalida0	(validSalida0),
		     .validSalida1	(validSalida1),
		     // Inputs
		     .Entrada0		(Entrada0[7:0]),
		     .Entrada1		(Entrada1[7:0]),
		     .Entrada2		(Entrada2[7:0]),
		     .Entrada3		(Entrada3[7:0]),
		     .clk_2f		(clk_2f),
		     .clk_4f		(clk_4f),
		     .clk_f		(clk_f),
		     .reset		(reset),
		     .selector		(selector),
		     .validEntrada0	(validEntrada0),
		     .validEntrada1	(validEntrada1),
		     .validEntrada2	(validEntrada2),
		     .validEntrada3	(validEntrada3));

    probador_mux probador(
        .Salida_estructural(Salida[7:0]),
        .Salida_condutual(Salida_condutual[7:0]),
						.validSalida0(validSalida0),
						.validSalida1(validSalida1),
						.validEntrada0(validEntrada0),
                        .validEntrada1(validEntrada1),
                        .validEntrada2(validEntrada2),
                        .validEntrada3(validEntrada3),
                        .Entrada0(Entrada0[7:0]),
						.Entrada1(Entrada1[7:0]),
                        .Entrada2(Entrada2[7:0]),
						.Entrada3(Entrada3[7:0]),
						.clk_4f(clk_4f),
						.clk_2f(clk_2f),
						.clk_f(clk_f),
						.reset(reset),
                        .selector(selector)
    );

endmodule

