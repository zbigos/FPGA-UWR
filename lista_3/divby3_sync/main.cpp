#include <iostream>
#include <verilated.h>
#include "Vsequential.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vsequential top;
    top.eval();
    top.reset = 1;
    top.eval();
    top.reset = 0;
    top.eval();

    int digitsum = 0;
    for (int time = 0; time < 2 * (60 * 60 + 100); time++) {
        top.clk = time & 1;
        if (top.clk) {
            top.eval();
            std::cout << "got: " << (int)top.divisible;
            std::cout << " expected: " << ((digitsum % 3) ? "0" : "1");
            std::cout << std::endl;
            
            if (((digitsum % 3) == 0) != ((int)top.divisible == 1)) {
                std::cout << "ech" << std::endl;
                exit(1);
            }

        } else {
            uint in = random() % 10;
            digitsum += in;
            top.BCD = in;
            top.eval();
        }
    }
}