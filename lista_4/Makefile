# FPGA variables
SOURCES = src/stoper.v src/displaydriver.v src/bcdmapper.v src/pwm.v src/pwm_feeder.v
PROJECT = fpga/$(NAME)
ICEBREAKER_DEVICE = up5k
ICEBREAKER_PIN_DEF = fpga/icebreaker.pcf
ICEBREAKER_PACKAGE = sg48
VSIM_ARGS=-t 1ps
SEED = 1
BOARD_ADDR = 192.168.88.250
BOARD_FPREF = /mnt/ramdisc

make_pwm:
	yosys  -l fpga/yosys.log -p 'synth_ice40 -top pwm -json pwm.json' $(SOURCES)
	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 10 --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc pwm.asc --pcf $(ICEBREAKER_PIN_DEF) --json pwm.json
	icepack pwm.asc pwm.bin
	iceprog pwm.bin

make_timer:
	yosys  -l fpga/yosys.log -p 'synth_ice40 -top stoper -json stoper.json' $(SOURCES)
	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 10 --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc timer.asc --pcf $(ICEBREAKER_PIN_DEF) --json stoper.json
	icepack timer.asc timer.bin
	iceprog timer.bin

make_timer_gui:
	yosys  -l fpga/yosys.log -p 'synth_ice40 -top stoper -json stoper.json' $(SOURCES)
	nextpnr-ice40 -l fpga/nextpnr.log --seed $(SEED) --freq 10 --package $(ICEBREAKER_PACKAGE) --$(ICEBREAKER_DEVICE) --asc timer.asc --pcf $(ICEBREAKER_PIN_DEF) --json stoper.json --gui

show_synth_timer:
	yosys -p "read_verilog src/displaydriver.v; proc; flatten; opt; show -colors 2 -width -signed"

clean:
	rm fpga/nextpnr.log
	rm fpga/yosys.log
	rm timer.blif
	rm stoper.json