module mux2x1 (output reg [7:0] Salida_conductual,
            input validsalida,
            
	    input [7:0] Entrada0,
            input [7:0] Entrada1,
            input validEntrada0,
            input validEntrada1,
            input clk,
            input reset);
            
reg selector;        
        always@(posedge clk) begin
           
        
                if (reset==1)begin //Si el reset es 1 el flop puede tomar el valor de alguna de las dos entradas
                     selector <= 0;
                    case(selector)
                        0:  begin
                            
                          if (validEntrada0==1)
                             Salida_conductual<=Entrada0; // Segun el valor del selector este dato irá a la salida del flop
                                else begin
                                Salida_conductual<=0;
                                end
                             
                                selector <= 1;  //Cambia para toamr Entrada1
                        end

                        1:   begin
                                if(validEntrada1==1)
                                 Salida_conductual<=Entrada1;
                            else begin
                            
                                Salida_conductual<=0;
                                end
                            selector<=0;//Cambia para tomar entrada 0
                        end
                    endcase
                end    
                else begin
                Salida_conductual<=0; //Condicion dada en el enunciado, si el reset es cero el flop toma valor de 00
                selector<=0;
                end
            end
endmodule