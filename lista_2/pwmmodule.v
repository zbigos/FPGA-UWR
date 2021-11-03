`default_nettype none

module pwm(
    input wire [15:0] top,
    input wire [15:0] comp,
    input wire clk,
    input wire rst,
    input wire pol,
    input wire mode, 
    output wire out
);

    reg [15: 0] state;
    reg delta;
    assign out = pol ? (state < comp) : (state >= comp);

    always @(posedge clk) begin
        if (rst) begin
            state <= 16'b0;
            delta <= 1'b1;
        end else begin
        
            // jesli jestem w state 0 to zawsze chce isc do gory
            if (state == 0) begin
                delta <= 1'b1;
                state <= 1'b1;
            end else begin
                if (state >= top) begin
                    if (mode) begin
                        // mode 1 == odwracem delta
                        delta <= 1'b0;
                        state <= top - 1'b1;
                    end else begin
                        // mode 0 == zeruje state
                        delta <= 1'b1;
                        state <= 1'b0;
                    end
                end else begin
                    if (delta) begin 
                        state <= state + 1'b1;
                    end else begin
                        state <= state - 1'b1;
                    end
                end
            end
        end
    end 
endmodule // pwm