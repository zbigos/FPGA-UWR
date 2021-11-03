#include <iostream>
#include <verilated.h>
#include "Vbcd_verilator.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vbcd_verilator top;
    top.eval();
    top.reset = 1;
    top.eval();
    top.reset = 0;
    top.eval();

    for (int time = 0; time < 2 * (60 * 60 + 100); time++) {
        top.clk = time & 1;
        top.eval();
        if (top.clk) {
            std::cout << (int)top.BCD_MH << (int)top.BCD_ML << ":" << (int)top.BCD_SH << (int)top.BCD_SL << std::endl;
        }
    }
}