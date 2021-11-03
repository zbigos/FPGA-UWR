`default_nettype none

module timert(
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
endmodule //timert

module testbench;
    reg reset = 0;
    reg clk = 0;
    wire [3:0] BCD_SL;
    wire [3:0] BCD_SH;
    wire [3:0] BCD_ML;
    wire [3:0] BCD_MH;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, testbench);
        #2 reset = 0;
        #2 reset = 1;
        #2 reset = 0;
        #7400 $finish;
    end

    always #1 clk = !clk;

    timert t(
        .clk(clk), .reset(reset),
        .BCD_SL(BCD_SL),
        .BCD_SH(BCD_SH),
        .BCD_ML(BCD_ML),
        .BCD_MH(BCD_MH)
    );

    initial $monitor ($time, clk, reset, BCD_SL, BCD_SH, BCD_ML, BCD_MH);

    always #1 clk = !clk;
endmodule //testbench
