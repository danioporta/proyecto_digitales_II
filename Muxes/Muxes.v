`include "mux2x1.v"
`include "muxL2.v"
`include "muxL1.v"
module Muxes(
                        output  [7:0]Salida_conductual,
					    input validsalida0,
						output validsalida1,
						input validEntrada0,
                        input validEntrada1,
                        input validEntrada2,
                        input validEntrada3,
                        input [7:0]Entrada0,
						input [7:0]Entrada1,
                        input [7:0]Entrada2,
						input [7:0]Entrada3,
						input clk_4f,
						input clk_2f,
						input clk_f,
						input reset
                     
    );
    wire [7:0] Salida0, Salida1;
    muxL1 muxl1( .clk_2f(clk_2f),
    .reset (reset),
    .validsalida0(validsalida0),
    .validsalida1(validsalida1),
    .validEntrada0(validEntrada0),
    .validEntrada1(validEntrada1),
     .validEntrada2(validEntrada2),
    .validEntrada3(validEntrada3),
    .Entrada0(Entrada2[7:0]), 
    .Entrada1(Entrada3[7:0]), 
    .Entrada2(Entrada0[7:0]), 
    .Entrada3(Entrada1[7:0]), 
    .Salida0(Salida0[7:0]),
    .Salida1(Salida1[7:0]));


    muxL2 muxitol2( .Salida_conductual(Salida_conductual[7:0]),
    .validsalida(validsalida0),
    .Entrada0(Salida0[7:0]),
    .Entrada1(Salida1[7:0]),
    .validEntrada0(validEntrada0),
    .validEntrada1(validEntrada1),
    .clk_4f(clk_4f),
    .reset (reset)



    );
endmodule 