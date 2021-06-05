//se incluye el mux mas pequeño
//`include "mux2x1.v"
//Se crea el mux de 4 entradas (bus de 8 bits cada una) y 2 salidas(bus de 8 bits),con sus respectivos valid tanto en entradas como salidas
module muxL1(
    output  [7:0]Salida0,
    output [7:0]Salida1,
    input validsalida0,
    output validsalida1,
    input [7:0]Entrada0,
    input [7:0]Entrada1,
    input [7:0]Entrada2,
    input [7:0]Entrada3,
    input validEntrada0,
    input validEntrada1,
    input validEntrada2,
    input validEntrada3,
    input clk_2f,
    input reset);

    mux2x1 mux1(
        //Salidas
        .Salida_conductual  (Salida0[7:0]),  
        .validsalida (validsalida0),
        //Entradas
        .Entrada0    (Entrada0[7:0]),
        .Entrada1   (Entrada1[7:0]),
        .validEntrada0   (validEntrada0),
        .validEntrada1    (validEntrada1),
        .clk       (clk_2f),
        .reset     (reset)
    );
    mux2x1 mux2(
        //Salidas
        .Salida_conductual  (Salida1[7:0]),  
        .validsalida (validsalida1),
        //Entradas
        .Entrada0    (Entrada2[7:0]),
        .Entrada1   (Entrada3[7:0]),
        .validEntrada0   (validEntrada2),
        .validEntrada1    (validEntrada3),

        .clk       (clk_2f),
        .reset     (reset)
    );
endmodule