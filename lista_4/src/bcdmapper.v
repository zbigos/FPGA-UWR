module bcdmapper(
    input wire [3:0] BCD,
    output wire [7:0] segment
);

    assign segment = ((BCD == 4'b0000) ? 8'b11111100 : 8'b00000000
    | (BCD == 4'b0001) ? 8'b01100000 : 8'b00000000
    | (BCD == 4'b0010) ? 8'b11011010 : 8'b00000000
    | (BCD == 4'b0011) ? 8'b11110010 : 8'b00000000
    | (BCD == 4'b0100) ? 8'b01100110 : 8'b00000000
    | (BCD == 4'b0101) ? 8'b10110110 : 8'b00000000
    | (BCD == 4'b0110) ? 8'b10111110 : 8'b00000000
    | (BCD == 4'b0111) ? 8'b11100000 : 8'b00000000
    | (BCD == 4'b1000) ? 8'b11111110 : 8'b00000000
    | (BCD == 4'b1001) ? 8'b11110110 : 8'b00000000
    | (BCD == 4'b1011) ? 8'b11111111 : 8'b00000000 // minus sign
    | (BCD == 4'b1111) ? 8'b00000000 : 8'b00000000);

endmodule

//  yosys  -l fpga/yosys.log -p 'synth_ice40 -top stoper -json stoper.json' $(SOURCES)
//	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 10 --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc timer.asc --pcf $(ICEBREAKER_PIN_DEF) --json stoper.json
//

/*
	yosys -p "synth_ice40 -blif stoper.blif" src/stoper.v src/displaydriver.v src/bcdmapper.v
	arachne-pnr -d 5k -P sg48 -p fpga/icebreaker.pcf stoper.blif -o stoper.asc

*/