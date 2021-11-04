`default_nettype none

module BCDC#( 
    parameter rstat = 10
) (
    input wire clk,
    input wire trigger,
    input wire reset,
    output wire next,
    output wire [3:0] BCD
);

    reg [3:0] istate;
    reg inext;

    assign next = inext;
    assign BCD = istate;
    reg last_trigger;

    always @(posedge clk) begin
        if (!reset) begin
            istate <= 4'b0000;
            inext <= 1'b0;
            last_trigger <= 1'b0;
        end 

        if (last_trigger == 1'b0 & trigger == 1'b1) begin
            last_trigger <= trigger;

            if (istate == rstat) begin
                istate <= 4'b0000;
                inext <= 1'b1;
            end else begin
                if (istate == 4'b0001) begin
                    inext <= 1'b0;
                    istate <= istate + 1'b1;
                end else begin
                    istate <= istate + 1'b1;
                end
            end
        end else begin
            last_trigger <= trigger;

        end
    end
endmodule //BCDC
