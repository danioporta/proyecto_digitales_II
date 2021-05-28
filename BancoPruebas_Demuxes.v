`timescale 1ms/100ps

//`include "demux8_32_v2.v"
`include "Probador_demuxL2.v"
/*`include "demuxL1.v"
`include "demuxL2.v"*/
`include "DEMUXF.v"
/*`include "sintetizado8a32_cmos.v"
`include "../lib/cmos_cells.v"*/

module banco_demux;

	wire [7:0] Salida0,Salida1,Salida00,Salida11,Salida2,Salida3;
	wire [7:0] Entrada;
	wire reset,clk_f,clk_2f, clk_4f, validSalida0, validSalida1,validSalida2,validSalida3, validEntrada,validEntrada0,validEntrada2,validEntrada3 ,selector;
    wire valid1,valid2;

/*

     

    demuxL2   DemuxL2(
    .Salida0(Salida00[7:0]),
    .Salida1(Salida11[7:0]),
    .validEntrada(validEntrada),
    .Entrada(Entrada[7:0]),
    .validSalida0(validEntrada0),
    .validSalida1(validEntrada1),
    .selector(selector),
    .clk(clk_2f),
    .reset(reset)



    );


   demuxL1   DemuxL1(
    .Salida0(Salida0[7:0]),
    .Salida1(Salida1[7:0]),
    .Salida2(Salida2[7:0]),
    .Salida3(Salida3[7:0]),
    .validEntrada0(validEntrada0),
    .validEntrada1(validEntrada1),
    .Entrada0(Salida00[7:0]),
    .Entrada1(Salida11[7:0]),
    .validSalida0(validSalida0),
    .validSalida1(validSalida1),
    .validSalida2(validSalida2),
    .validSalida3(validSalida3),
    .selector(selector),
    .clk(clk_f),
    .reset(reset)



    );
*/
   demux DEMUX(
    .SalidaF0(Salida0[7:0]),
    .SalidaF1(Salida1[7:0]),
    .SalidaF2(Salida2[7:0]),
    .SalidaF3(Salida3[7:0]),
    .validSalidaF0(validSalida0),
    .validSalidaF1(validSalida1),
    .validSalidaF2(validSalida2),
    .validSalidaF3(validSalida3),
    .Entrada(Entrada[7:0]),
    .validEntrada(validEntrada),
    .valid1(valid1),
    .valid2(valid2),
    .selector(selector),
    .clk_2f(clk_2f),
    .clk_f(clk_f),
    .reset(reset));
 


   probador_demuxL2 probador(
                    
					
						.validSalida0(validSalida0),
                        .validSalida1(validSalida1),
                        .validSalida2(validSalida2),
                        .validSalida3(validSalida3),
                        .Salida0(Salida0[7:0]),
						.Salida1(Salida1[7:0]),
                        .Salida2(Salida2[7:0]),
						.Salida3(Salida3[7:0]),
                        .Entrada(Entrada[7:0]),
                        .validEntrada(validEntrada),
                        .valid1(valid1),
                        .valid2(valid2),
						.clk_4f(clk_4f),
						.clk_2f(clk_2f),
						.clk_f(clk_f),
						.reset(reset),
                        .selector(selector)
    );

endmodule

