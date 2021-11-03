// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VBCD_VERILATOR__SYMS_H_
#define VERILATED_VBCD_VERILATOR__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vbcd_verilator.h"

// INCLUDE MODULE CLASSES
#include "Vbcd_verilator___024root.h"

// SYMS CLASS (contains all model state)
class Vbcd_verilator__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vbcd_verilator* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vbcd_verilator___024root       TOP;

    // CONSTRUCTORS
    Vbcd_verilator__Syms(VerilatedContext* contextp, const char* namep, Vbcd_verilator* modelp);
    ~Vbcd_verilator__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
