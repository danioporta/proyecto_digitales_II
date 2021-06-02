module PSRX(input clk_4f,
                        input clk_32f,
                        input active,
                        output reg out_serial2_conductual );

    reg [2:0] selector;
    reg [2:0] selector_2;

    always @(posedge clk_32f) begin

      
            if(active == 1) begin
                selector <= 0;
                case (selector_2)
                    0: out_serial2_conductual <= 0;
                    1: out_serial2_conductual <= 1;
                    2: out_serial2_conductual <= 1;
                    3: out_serial2_conductual <= 1;
                    4: out_serial2_conductual <= 1;
                    5: out_serial2_conductual <= 1;
                    6: out_serial2_conductual <= 0;
                    7: begin
                       out_serial2_conductual <= 0;
                        selector_2 <= 0;
                    end
                endcase
                selector_2 <= selector_2 + 1;
            end
            else begin
                selector_2 <= 0;
                case (selector)
                    0: out_serial2_conductual <= 1;
                    1:out_serial2_conductual<= 0;
                    2:out_serial2_conductual <= 1;
                    3:out_serial2_conductual <= 1;
                    4:out_serial2_conductual <= 1;
                    5:out_serial2_conductual <= 1;
                    6:out_serial2_conductual<= 0;
                    7: begin
                       out_serial2_conductual <= 0;
                        selector <= 0;
                    end
                endcase
                selector <= selector + 1;
            end        
        
        
    end
    
endmodule