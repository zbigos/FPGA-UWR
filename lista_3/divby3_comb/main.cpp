#include <iostream>
#include <verilated.h>
#include "Vdiv3_comb.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vdiv3_comb top;
    
    for (int testit = 0; testit < 100; testit += 1) {
        int dsum = 0;
        for(int k = 0; k < 48; k++) {
            uint a = random()% 10;
            dsum += a;
            top.BCD[k] = a;
        }

        top.eval();
        std::cout << dsum % 3 << " " << (int)top.divisible << std::endl;
        if (((dsum % 3) == 0) != ((int)top.divisible == 1)) {
            std::cout << "ech" << std::endl;
            exit(1);
        }
    }
}