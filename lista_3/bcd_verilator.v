`default_nettype none

/* verilator lint_off DECLFILENAME */
module BCDC#( 
    parameter rstat = 10
) (
    input wire trigger,
    input wire reset,
    output wire next,
    output wire [3:0] BCD
);

    reg [3:0] istate;
    reg inext;

    assign next = inext;
    assign BCD = istate;

    always @(posedge trigger or posedge reset) begin
        if (reset) begin
            istate <= 4'b0000;
            inext <= 1'b0;
        end else begin
            if (istate == rstat) begin
                istate <= 4'b0000;
                inext <= 1'b1;
            end else begin
                if (istate == 4'b0001) begin
                    inext <= 1'b0;
                end 
                istate <= istate + 1'b1;
            end
        end
    end
endmodule //BCDC
/* verilator lint_on DECLFILENAME */

module bcd_verilator(
    input wire clk,
    input wire reset,
    output wire [3:0] BCD_SL,
    output wire [3:0] BCD_SH,
    output wire [3:0] BCD_ML,
    output wire [3:0] BCD_MH
);

    wire SHT, MLT, MHT, trash;
    BCDC #(.rstat(9)) SL(.trigger(clk), .reset(reset), .next(SHT), .BCD(BCD_SL));
    BCDC #(.rstat(5)) SH(.trigger(SHT), .reset(reset), .next(MLT), .BCD(BCD_SH));
    BCDC #(.rstat(9)) ML(.trigger(MLT), .reset(reset), .next(MHT), .BCD(BCD_ML));
    BCDC #(.rstat(5)) MH(.trigger(MHT), .reset(reset), .next(trash), .BCD(BCD_MH));

endmodule //bcd_verilator
