// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vbcd_verilator.h for the primary calling header

#include "verilated.h"

#include "Vbcd_verilator__Syms.h"
#include "Vbcd_verilator___024root.h"

void Vbcd_verilator___024root___ctor_var_reset(Vbcd_verilator___024root* vlSelf);

Vbcd_verilator___024root::Vbcd_verilator___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    Vbcd_verilator___024root___ctor_var_reset(this);
}

void Vbcd_verilator___024root::__Vconfigure(Vbcd_verilator__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

Vbcd_verilator___024root::~Vbcd_verilator___024root() {
}
