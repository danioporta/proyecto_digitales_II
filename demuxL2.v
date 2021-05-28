/*`include "demux2x1.v"*/
module demuxL2(
    output [7:0]Salida0,
    output [7:0]Salida1,
    input validSalida0,
    input validSalida1,
    input [7:0]Entrada,
    input validEntrada,
    input selector,
    input clk,
    input reset);

    DeMux2x1 Demux1(
        //Outputs
        .Salida0  (Salida0[7:0]),
        .Salida1  (Salida1[7:0]),  
        .validSalida0 (validSalida0),
        .validSalida1 (validSalida1),
        //Inputs
        .Entrada    (Entrada[7:0]),
        .validEntrada   (validEntrada),
        .selector  (selector),
        .clk       (clk),
        .reset     (reset)
    );
endmodule