//se incluye el mux mas pequeño
/*`include "mux2x1.v"*/
//Se crea el mux de 4 entradas (bus de 8 bits cada una) y 2 salidas(bus de 8 bits),con sus respectivos valid tanto en entradas como salidas
module muxL2(
    output [7:0]Salida,
    output validSalida,
    input [7:0]Entrada0,
    input [7:0]Entrada1,
    input validEntrada0,
    input validEntrada1,
    input selector,
    input clk,
    input reset);

    Mux2x1 mux1(
        //Salidas
        .Salida  (Salida[7:0]),  
        .validSalida (validSalida),
        //Entradas
        .Entrada0    (Entrada0[7:0]),
        .Entrada1   (Entrada1[7:0]),
        .validEntrada0   (validEntrada0),
        .validEntrada1    (validEntrada1),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
endmodule