/*
module stack(
    input wire clk,
    input wire reset,
    output wire [15:0] top,
    output wire empty,
    output wire single,
    input wire [15:0] data,
    input wire push,
    input wire write,
    input wire pop,
);

endmodule

module calculator(
    input wire clk,
    input wire reset,
    input wire push,
    input wire add,
    input wire mul,
);

    reg [15:0] OPa;
    reg [15:0] OPb;
    reg add_job, mul_job;
    reg a_valud, b_valid;

    wire [15:0] opp_sum = OPa + OPb;
    wire [15:0] opp_mul = OPa * OPb;
    

    always @(posedge clk) begin
        if (reset) begin
            
        end else begin
            if(add_job | mul_job) begin // jeśli mam jakieś obliczenie do zrobienia
                if (a_valid & b_valid) begin // jeśli mam operandy, to policz i wypisz wynik
                
                end
            
                if (a_valid & !b_valid) begin // mam a, b czeka
                
                end

                if (!a_valid) begin // nie mam a
                
                end
            end else begin // nie mam nic do policzenia
                
            
            end
        end
    end

endmodule
*/
module topa(
    input wire clk,
    input wire reset,
    input wire [7:0] dip,
    input wire aux1, 
    input wire aux2, 
    input wire aux3,
    output wire [7:0] sseg,
    output wire [7:0] digit,
);
   


    numdriver n(
        .clk(clk),
        .rst(1'b1),
        .BCD1(c[0:3]),
        .BCD2(c[4:7]),
        .BCD3(4'b0000),
        .BCD4(c[8:11]),
        .BCD5(c[12:15]),
        .BCD6(4'b0000),
        .BCD7(c[4:7]),
        .BCD8(c[0:3]),
        .sseg(sseg),
        .digit(digit)
    );
endmodule