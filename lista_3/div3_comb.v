/*
    ukradniete z https://www.edaboard.com/threads/how-to-declare-two-dimensional-input-ports-in-verilog.80929/
    bo verilog sie sapal o wielowymiarowe argumenty
*/
`define PACK_ARRAY(PK_WIDTH,PK_LEN,PK_SRC,PK_DEST)    genvar pk_idx; generate for (pk_idx=0; pk_idx<(PK_LEN); pk_idx=pk_idx+1) begin; assign PK_DEST[((PK_WIDTH)*pk_idx+((PK_WIDTH)-1)):((PK_WIDTH)*pk_idx)] = PK_SRC[pk_idx][((PK_WIDTH)-1):0]; end; endgenerate
`define UNPACK_ARRAY(PK_WIDTH,PK_LEN,PK_DEST,PK_SRC)  genvar unpk_idx; generate for (unpk_idx=0; unpk_idx<(PK_LEN); unpk_idx=unpk_idx+1) begin; assign PK_DEST[unpk_idx][((PK_WIDTH)-1):0] = PK_SRC[((PK_WIDTH)*unpk_idx+(PK_WIDTH-1)):((PK_WIDTH)*unpk_idx)]; end; endgenerate

`default_nettype none

module bcd_preprocessor(input wire [3:0] BCD, output reg zero, one, two);
    always @ * begin
        case(BCD)
            4'b0000 : {zero, one, two} = 3'b100; //0
            4'b0001 : {zero, one, two} = 3'b010; //1
            4'b0010 : {zero, one, two} = 3'b001; //2
            4'b0011 : {zero, one, two} = 3'b100; //3
            4'b0100 : {zero, one, two} = 3'b010; //4
            4'b0101 : {zero, one, two} = 3'b001; //5
            4'b0110 : {zero, one, two} = 3'b100; //6
            4'b0111 : {zero, one, two} = 3'b010; //7
            4'b1000 : {zero, one, two} = 3'b001; //8
            4'b1001 : {zero, one, two} = 3'b100; //9
        endcase
    end
endmodule // bcd_preprocessor

module reducer(
    input wire a_zero, a_one, a_two,
    input wire b_zero, b_one, b_two,
    output reg zero, one, two
);
    always @ * begin
        case({a_zero, a_one, a_two, b_zero, b_one, b_two})
            6'b100100 : {zero, one, two} = 3'b100; //  0 + 0
            6'b100010 : {zero, one, two} = 3'b010; //  0 + 1
            6'b100001 : {zero, one, two} = 3'b001; //  0 + 2
            6'b010100 : {zero, one, two} = 3'b010; //  1 + 0
            6'b010010 : {zero, one, two} = 3'b001; //  1 + 1
            6'b010001 : {zero, one, two} = 3'b100; //  1 + 2
            6'b001100 : {zero, one, two} = 3'b001; //  2 + 0
            6'b001010 : {zero, one, two} = 3'b100; //  2 + 1
            6'b001001 : {zero, one, two} = 3'b010; //  2 + 2
        endcase
    end
endmodule //reducer

module reductor#(
    parameter digits = 4
) (
    input wire [(3 * digits) - 1: 0] modstream,
    output wire divisible
);
    
    genvar i;

    generate
        if(digits == 1) begin
            assign divisible = (modstream[0] == 1'b1 && modstream[1] == 1'b0 && modstream[2] == 1'b0);
        end else begin
            if((digits % 2) == 0) begin
                wire [((3 * (digits / 2)) - 1): 0] stagestream;
                
                for (i = 0; i < (digits/2); i = i + 1) begin
                    reducer r(
                        .a_zero(modstream[i * 6 + 0]), 
                        .a_one(modstream[i * 6 + 1]), 
                        .a_two(modstream[i * 6 + 2]),
                        .b_zero(modstream[i * 6 + 3]), 
                        .b_one(modstream[i * 6 + 4]), 
                        .b_two(modstream[i * 6 + 5]),
                        .zero(stagestream[i * 3 + 0]),
                        .one(stagestream[i * 3 + 1]),
                        .two(stagestream[i * 3 + 2])
                    );    
                end

                reductor #(
                    .digits(digits / 2)
                ) q(
                    .modstream(stagestream), 
                    .divisible(divisible)
                );
            end
        end
    endgenerate
endmodule // reductor

module divby3 #(
    parameter digits = 8
) (
    input wire [(4 * digits) - 1: 0] bcd_stream,
    output wire divisible
);
    
    genvar i;
    wire [(3 * digits) - 1: 0] optimized;

    generate
        for(i = 0; i < digits; i = i + 1) begin : bcd_preproc
            bcd_preprocessor preprocessor(
                .BCD(bcd_stream[(1 + i) * 4 - 1 : i * 4]), 
                .zero(optimized[3 * i + 0]), 
                .one(optimized[3 * i + 1]), 
                .two(optimized[3 * i + 2])
            );
        end
    endgenerate

    reductor #(
        .digits(digits)
    ) r(
        .modstream(optimized), 
        .divisible(divisible)
    );
endmodule //divby3
