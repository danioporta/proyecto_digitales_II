`include "demuxL1.v"
`include "demuxL2.v"
module demux(
    output [7:0]SalidaF0,
    output [7:0]SalidaF1,
    output [7:0]SalidaF2,
    output [7:0]SalidaF3,
    input validSalidaF0,
    input validSalidaF1,
    input validSalidaF2,
    input validSalidaF3,
    input [7:0]Entrada,
    input validEntrada,
    output valid1,
    output valid2,

    input selector,
    input clk_2f,
    input clk_f,
    input reset);

    wire  [7:0] sal0;
    wire [7:0] sal1;
 

    demuxL2 Demux1F(
        //Outputs
        .Salida0  (sal0[7:0]),
        .Salida1  (sal1[7:0]),  
        .validSalida0 (validSalidaF0),
        .validSalida1 (validSalidaF2),
        //Inputs
        .Entrada    (Entrada[7:0]),
        .validEntrada   (validEntrada),
        .selector  (selector),
        .clk       (clk_f),
        .reset     (reset)
    );

    demuxL1 Demux2F(
        .Salida0 (SalidaF0[7:0]),
        .Salida1 (SalidaF1[7:0]),
        .Salida2 (SalidaF2[7:0]),
        .Salida3 (SalidaF3[7:0]),
        .validSalida0 (validSalidaF0),
        .validSalida1 (validSalidaF1),
        .validSalida2 (validSalidaF2),
        .validSalida3 (validSalidaF3),
        .validEntrada(validEntrada),
        .Entrada0 (sal0[7:0]),
        .Entrada1 (sal1[7:0]),
        .selector  (selector),
        .clk       (clk_2f),
        .reset     (reset)
    );


 


endmodule