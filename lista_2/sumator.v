module top;
    parameter tabsize = 64;
    reg [7:0] in [tabsize-1: 0];
    integer i;
    reg [7:0] out = 0;

    task automatic sumator(
        input integer range_l,
        input integer range_p,
        output reg [7:0] sum
    );

        reg [7:0] sl, sp;
        integer middle;
        
        begin
            sl = 0;
            sp = 0;
            if (range_l == range_p) begin
                sum = in[range_l];
            end else begin
                middle = (range_l + range_p) / 2;

                fork
                    sumator(range_l, middle, sl);
                    sumator(middle + 1, range_p, sp);
                join
                sum = sl + sp;
            end
            $write(range_l, "-", range_p, "-", sum, "\n");
        end
    endtask // sumator

    initial begin
        for (i = 0; i < tabsize; i = i + 1) begin
            in[i] = 8'b1;
        end

        sumator(0, tabsize - 1, out);
        $write(out, " OK \n");
    end
endmodule // top