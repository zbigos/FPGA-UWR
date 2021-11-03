// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VDIV3_COMB__SYMS_H_
#define VERILATED_VDIV3_COMB__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vdiv3_comb.h"

// INCLUDE MODULE CLASSES
#include "Vdiv3_comb___024root.h"

// SYMS CLASS (contains all model state)
class Vdiv3_comb__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vdiv3_comb* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vdiv3_comb___024root           TOP;

    // CONSTRUCTORS
    Vdiv3_comb__Syms(VerilatedContext* contextp, const char* namep, Vdiv3_comb* modelp);
    ~Vdiv3_comb__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
