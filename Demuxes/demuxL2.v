/* ***********************************************************
                    Universidad de Costa Rica
                 Escuela de Ingenieria Electrica
                            IE-0523
                      Circuitos Digitales 2

                           DeMuxL2.v

Autores: Daniela Oporta Abarca B55160 
         Marlon Jesus Jiménez Acosta B73881
         Roger Castro Rivas B61725
         German Ureña Araya B77809 

Fecha: 01 de junio del 2021

Descripcion:
  

*********************************************************** */

`include "DeMux2x1.v"
module demuxL2(
    output [7:0] out_B,
    output [7:0] out_C,
    output validOut_B,
    output validOut_C,

    input [7:0]in_A,
    input validIn_A,

    input select_L2,
    input clk,
    input reset);

    DeMux2x1 demuxA(
        //Outputs
        .out0  (out_B[7:0]),
        .out1  (out_C[7:0]),  
        .validOut0 (validOut_B),
        .validOut1 (validOut_C),
        //Inputs
        .in    (in_A[7:0]),
        .validIn   (validIn_A),
        .select  (select_L2),
        .clk       (clk),
        .reset     (reset)
    );
endmodule