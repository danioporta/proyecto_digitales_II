/* ***********************************************************
                    Universidad de Costa Rica
                 Escuela de Ingenieria Electrica
                            IE-0523
                      Circuitos Digitales 2

                           DeMuxL1.v

Autores: Daniela Oporta Abarca B55160 
         Marlon Jesus Jiménez Acosta B73881
         Roger Castro Rivas B61725
         German Ureña Araya B77809 

Fecha: 01 de junio del 2021

Descripcion:
  

*********************************************************** */

`include "DeMux2x1.v"
module demuxL1(
    output [7:0] out_D,
    output [7:0] out_E,
    output [7:0] out_F,
    output [7:0] out_G,

    output validOut_D,
    output validOut_E,
    output validOut_F,
    output validOut_G,

    input [7:0] in_B,
    input [7:0] in_C,

    input validIn_B,
    input validIn_C,
    
    input select_L1,
    input clk,
    input reset);

    // Se instancia el demux
    DeMux2x1 demuxB(
        //Salidas
        .out0  (out_D[7:0]),
        .out1  (out_E[7:0]),  

        .validOut0 (validOut_D),
        .validOut1 (validOut_E),
        //Entradas
        .in    (in_B[7:0]),
        .validIn   (validIn_B),
        .select  (select_L1),
        .clk       (clk),
        .reset     (reset)
    );

    DeMux2x1 demuxC(
        //Salidas
        .out0  (out_F[7:0]),
        .out1  (out_G[7:0]),  
        .validOut0 (validOut_F),
        .validOut1 (validOut_G),
        //Entradas
        .in (in_C[7:0]),
        .validIn   (validIn_C),
        .select  (select_L1),
        .clk       (clk),
        .reset     (reset)
    );
endmodule