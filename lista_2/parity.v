module parity #(
    parameter wordsize = 8
) (
    input wire [wordsize - 1: 0] word,
    output wire parity
);
    assign parity = ^word;
endmodule //parity


module testbench;
    localparam wordsize = 16;
    reg [wordsize - 1: 0] word;
    wire out;
    integer x;
    reg ep = 0;
    parity #(wordsize) p (.word(word), .parity(out));

    initial begin
        for (x = 0; x < (1 << wordsize); x = x + 1) begin
            word = x ^ (x >> 1);
            
            // forces to fail.
            //if (x == 45) begin
            //    ep = 0;
            //end

            $write("x = %d, word = %b, parity = %b, expected = %b", x, word, out, ep);
            if (out == ep) begin
                $write(", OK \n");
            end else begin
                $write(", FAIL \n");
                $finish;
            end
            ep = !ep;
            #1;
        end

        $write("all ok.\n");
    end

endmodule
