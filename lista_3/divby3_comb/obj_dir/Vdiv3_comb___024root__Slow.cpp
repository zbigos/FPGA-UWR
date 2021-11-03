// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdiv3_comb.h for the primary calling header

#include "verilated.h"

#include "Vdiv3_comb__Syms.h"
#include "Vdiv3_comb___024root.h"

void Vdiv3_comb___024root___ctor_var_reset(Vdiv3_comb___024root* vlSelf);

Vdiv3_comb___024root::Vdiv3_comb___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    Vdiv3_comb___024root___ctor_var_reset(this);
}

void Vdiv3_comb___024root::__Vconfigure(Vdiv3_comb__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

Vdiv3_comb___024root::~Vdiv3_comb___024root() {
}
