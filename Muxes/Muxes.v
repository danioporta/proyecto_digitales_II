`include "muxL2.v"
`include "muxL1.v"
module muxes(
                        output  [7:0]Salida,
					    output validSalida0,
						output validSalida1,
						input validEntrada0,
                        input validEntrada1,
                        input validEntrada2,
                        input validEntrada3,
                        input [7:0]Entrada0,
						input [7:0]Entrada1,
                        input [7:0]Entrada2,
						input [7:0]Entrada3,
                        input selector,
						input clk_4f,
						input clk_2f,
						input clk_f,
						input reset
                     
    );
    wire [7:0] salida0, salida1;
    MuxL1 muxl1( .clk(clk_f),
    .selector(selector),
    .reset (reset),
    .validSalida0(validSalida0),
    .validSalida1(validSalida1),
    .validEntrada0(validEntrada0),
    .validEntrada1(validEntrada1),
     .validEntrada2(validEntrada2),
    .validEntrada3(validEntrada3),
    .Entrada0(Entrada0[7:0]), 
    .Entrada1(Entrada0[7:0]), 
    .Entrada2(Entrada2[7:0]), 
    .Entrada3(Entrada3[7:0]), 
    .Salida0(salida0[7:0]),
    .Salida1(salida1[7:0]));


    muxL2 muxitol2( .Salida(Salida[7:0]),
    .validSalida(validSalida0),
    .Entrada0(salida0[7:0]),
    .Entrada1(salida1[7:0]),
    .validEntrada0(validEntrada0),
    .validEntrada1(validEntrada1),
    .clk(clk_2f),
    .selector(selector),
    .reset (reset)



    );
endmodule 