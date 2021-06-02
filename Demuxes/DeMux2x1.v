/* ***********************************************************
                    Universidad de Costa Rica
                 Escuela de Ingenieria Electrica
                            IE-0523
                      Circuitos Digitales 2

                           DeMux2x1.v

Autores: Daniela Oporta Abarca B55160 
         Marlon Jesus Jiménez Acosta B73881
         Roger Castro Rivas B61725
         German Ureña Araya B77809 

Fecha: 01 de junio del 2021

Descripcion:
  

*********************************************************** */

/**

* Salidas:
* output wire[7:0] out0: Bus de 8 bits del puerto A
* output wire[7:0] out1: Bus de 8 bits del puerto B
*
* output validOut0: Valida los datos de out0
* output validOut1: Valida los datos de out1
*
* Entradas:
* input wire[7:0] in: Puerto de salida de un bus de 8 bits.
* input validIn: Valida los datos de in
*
* input wire select: Bit de selección
* input wire clk: Control de clock
* input wire reset: Activa el reset del ff
*
**/

module DeMux2x1(
    output reg [7:0] out0, 
    output reg [7:0] out1,
    output reg validOut0, 
    output reg validOut1,

    input [7:0] in, 
    input validIn,

    input select,
    input clk,
    input reset);

    reg [7:0] out_0;
    reg [7:0] out_1;

    reg validMux0; 
    reg validMux1;

    // Se activa cuando se detecta un cambio en las entradas
    always @(*)
        begin
            out0 = out_0;
            out1 = out_1;
            validMux0 = validOut0;
            validMux1 = validOut1;
            if(select == 1) begin
                out1 = in;
                validMux1 = validIn;
            end
            else if (select == 0) begin
                out0 = in;
                validMux0 = validIn;
            end
        end
    //Flip Flop 
    always @(posedge clk)
        begin
            if (reset == 0)begin
                out0 <= 8'b00000000;
                out1 <= 8'b00000000;
            end
            if (reset == 1)begin
                if (validMux0 == 1)begin
                    out0 <= out_0;
                    validOut0 <= validMux0;
                    end
                else if (validMux0 == 0)begin
                    out0 <= out0; 
                    validOut0 <= validMux0;   
                end
                if (validMux1 == 1)begin
                    out1 <= out_1;
                    validOut1 <= validMux1;
                    end
                else if (validMux1 == 0) begin
                    out1 <= out1; 
                    validOut1 <= validMux1;   
                end
            end
        end


endmodule