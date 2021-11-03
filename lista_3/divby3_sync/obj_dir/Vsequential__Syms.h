// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VSEQUENTIAL__SYMS_H_
#define VERILATED_VSEQUENTIAL__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vsequential.h"

// INCLUDE MODULE CLASSES
#include "Vsequential___024root.h"

// SYMS CLASS (contains all model state)
class Vsequential__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vsequential* const __Vm_modelp;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vsequential___024root          TOP;

    // CONSTRUCTORS
    Vsequential__Syms(VerilatedContext* contextp, const char* namep, Vsequential* modelp);
    ~Vsequential__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
