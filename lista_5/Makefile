# FPGA variables
SOURCES = src/mem.v src/numdriver.v src/bcdmapper.v src/polish_calc.v

PROJECT = fpga/$(NAME)
ICEBREAKER_DEVICE = up5k
ICEBREAKER_PIN_DEF = fpga/icebreaker.pcf
ICEBREAKER_PACKAGE = sg48
VSIM_ARGS=-t 1ps
SEED = 1
BOARD_ADDR = 192.168.88.250
BOARD_FPREF = /mnt/ramdisc

make_mem:
	yosys  -l fpga/yosys.log -p 'synth_ice40 -top top -json mem.json' $(SOURCES)
	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 10 --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc mem.asc --pcf $(ICEBREAKER_PIN_DEF) --json mem.json
	icepack mem.asc mem.bin
	iceprog mem.bin

make_calc:
	yosys  -l fpga/yosys.log -p 'synth_ice40 -top topa -json calc.json' $(SOURCES)
	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 10 --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc calc.asc --pcf $(ICEBREAKER_PIN_DEF) --json calc.json
	icepack calc.asc calc.bin
	iceprog calc.bin

make_timer_gui:
	yosys  -l fpga/yosys.log -p 'synth_ice40 -top topa -json topa.json' $(SOURCES)
	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 10 --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc timer.asc --pcf $(ICEBREAKER_PIN_DEF) --json topa.json --gui

show_synth_timer:
	yosys -p "read_verilog src/polish_calc.v; proc; flatten; opt; show -colors 2 -width -signed"

clean:
	rm fpga/nextpnr.log
	rm fpga/yosys.log
	rm timer.blif
	rm stoper.json