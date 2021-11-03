// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsequential.h for the primary calling header

#include "verilated.h"

#include "Vsequential__Syms.h"
#include "Vsequential___024root.h"

void Vsequential___024root___ctor_var_reset(Vsequential___024root* vlSelf);

Vsequential___024root::Vsequential___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    Vsequential___024root___ctor_var_reset(this);
}

void Vsequential___024root::__Vconfigure(Vsequential__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

Vsequential___024root::~Vsequential___024root() {
}
