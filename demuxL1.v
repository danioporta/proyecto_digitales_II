//se incluye el demux mas pequeño
`include "demux2x1.v"
//Se crea el demux de 2 entradas (bus de 8 bits cada una) y 4 salidas(bus de 8 bits),con sus respectivos valid tanto en entradas como salidas
module demuxL1(
    input [7:0]Entrada0,
    input [7:0]Entrada1,
    input [7:0]Entrada2,
    input [7:0]Entrada3,
    input validEntrada0,
    input validEntrada1,
    input validEntrada2,
    input validEntrada3,
    input [7:0]Salida0,
    input [7:0]Salida1,
    input validSalida0,
    input validSalida1,
    input selector,
    input clk,
    input reset);

    DeMux2x1 demux1(
        //Salidas
        .Salida0  (Salida0[7:0]),
        .Salida1  (Salida1[7:0]),  
        .validSalida0 (validSalida0),
        .validSalida1 (validSalida1),
        //Entradas
        .Entrada    (Entrada0[7:0]),
        .valid   (validEntrada0),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
    DeMux2x1 demux2(
        //Salidas
        .Salida0  (Salida2[7:0]),
        .Salida1  (Salida3[7:0]),  
        .validSalida0 (validSalida2),
        .validSalida1 (validSalida3),
        //Entradas
        .Entrada    (dataIn1[7:0]),
        .valid   (validEntrada1),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
endmodule