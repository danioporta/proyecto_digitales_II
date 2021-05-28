//se incluye el demux mas pequeño
`include "Yisus.v"
//Se crea el demux de 2 entradas (bus de 8 bits cada una) y 4 salidas(bus de 8 bits),con sus respectivos valid tanto en entradas como salidas
module demuxL1(
    output [7:0]Salida0,
    output [7:0]Salida1,
    output [7:0]Salida2,
    output [7:0]Salida3,
    input validSalida0,
    input validSalida1,
    input validSalida2,
    input validSalida3,
    input [7:0]Entrada0,
    input [7:0]Entrada1,
    input validEntrada,

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
        .validEntrada   (validEntrada),
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
        .Entrada (Entrada1[7:0]),
        .validEntrada   (validEntrada),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
endmodule