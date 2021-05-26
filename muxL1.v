//se incluye el mux mas pequeño
//`include "mux2x1.v"
//Se crea el mux de 4 entradas (bus de 8 bits cada una) y 2 salidas(bus de 8 bits),con sus respectivos valid tanto en entradas como salidas
module MuxL1(
    output  [7:0]Salida0,
    output [7:0]Salida1,
    output validSalida0,
    output validSalida1,
    input [7:0]Entrada0,
    input [7:0]Entrada1,
    input [7:0]Entrada2,
    input [7:0]Entrada3,
    input validEntrada0,
    input validEntrada1,
    input validEntrada2,
    input validEntrada3,
    input selector,
    input clk,
    input reset);

    Mux2x1 mux1(
        //Salidas
        .Salida  (Salida0[7:0]),  
        .validSalida (validSalida0),
        //Entradas
        .Entrada0    (Entrada0[7:0]),
        .Entrada1   (Entrada1[7:0]),
        .validEntrada0   (validEntrada0),
        .validEntrada1    (validEntrada1),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
    Mux2x1 mux2(
        //Salidas
        .Salida  (Salida1[7:0]),  
        .validSalida (validSalida1),
        //Entradas
        .Entrada0    (Entrada2[7:0]),
        .Entrada1   (Entrada3[7:0]),
        .validEntrada0   (validEntrada2),
        .validEntrada1    (validEntrada3),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
endmodule