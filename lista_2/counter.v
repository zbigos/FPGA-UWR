`default_nettype none

module counter(
    input wire clk,
    input wire reset,
    input wire zero,
    input wire dir,
    output wire [15: 0] state
);

    reg [15: 0] cval;
    assign state = cval;

    always @(posedge clk or posedge zero) begin
        if (reset | zero) begin
            cval = 16'b0;
        end else begin
            if (dir) begin
                cval = cval + 1;
            end else begin
                cval = cval - 1;
            end
        end
    end
endmodule //counter


module testbench;
    reg clk = 0;
    reg rst = 0;
    reg zero = 0;
    reg dir = 0;
    wire [15: 0] state;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, testbench);
        #2 rst = 0;
        #2 rst = 1;
        #8 rst = 0;
        #1000000 dir = 0;
        #1000000 dir = 1;
        #1000000 zero =  1;
        #8 zero = 0;
        #1000000 $finish;
    end

    always #1 clk = !clk;

    counter p(
        .clk(clk),
        .reset(rst),
        .zero(zero),
        .dir(dir),
        .state(state)
    );

    initial $monitor ($time, clk, rst, zero, dir, state);

endmodule //testbench