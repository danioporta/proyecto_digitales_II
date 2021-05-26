module Mux2x1 (output reg [7:0] Salida,
            output reg validSalida,
            
	    input [7:0] Entrada0,
            input [7:0] Entrada1,
            input validEntrada0,
            input validEntrada1,
            input selector, 
            input clk,
            input reset);
            
            always@(posedge clk) begin
                if (reset==1) //Si el reset es 1 el flop puede tomar el valor de alguna de las dos entradas
                    if(selector==0)
                        Salida<=Entrada0; // Segun el valor del selector este dato irá a la salida del flop
                    else
                        Salida<=Entrada1;
                else
                Salida<=2'b00; //Condicion dada en el enunciado, si el reset es cero el flop toma valor de 00
            end
endmodule