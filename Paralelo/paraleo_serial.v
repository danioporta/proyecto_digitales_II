module paralelo_serial(input clk_4f,
                        input clk_32f,
                        input [7:0] in_serial,
                        input valid_in,
                        input reset,
                        output reg out_serial );

    reg [2:0] selector;
    reg [2:0] selector_2;

    always @(posedge clk_32f) begin

        if (reset == 1) begin
            if(valid_in == 1) begin
                selector <= 0;
                case (selector_2)
                    0: out_serial <= in_serial[7];
                    1: out_serial <= in_serial[6];
                    2: out_serial <= in_serial[5];
                    3: out_serial <= in_serial[4];
                    4: out_serial <= in_serial[3];
                    5: out_serial <= in_serial[2];
                    6: out_serial <= in_serial[1];
                    7: begin
                       out_serial <= in_serial[0];
                        selector_2 <= 0;
                    end
                endcase
                selector_2 <= selector_2 + 1;
            end
            else begin
                selector_2 <= 0;
                case (selector)
                    0: out_serial <= 1;
                    1:out_serial<= 0;
                    2:out_serial <= 1;
                    3:out_serial <= 1;
                    4:out_serial <= 1;
                    5:out_serial <= 1;
                    6:out_serial<= 0;
                    7: begin
                       out_serial <= 0;
                        selector <= 0;
                    end
                endcase
                selector <= selector + 1;
            end
        end
        
        else begin
            out_serial <= 0;
            {selector, selector_2} <= 0;
        end
    end
endmodule
