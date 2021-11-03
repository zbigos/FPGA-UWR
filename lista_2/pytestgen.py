def hexify(v):
    if v > 15:
        return hex(v)[2:]
    return '0' + hex(v)[2:]

def emit(opa, opb, ea, aluop, neg):
    ha = hexify(opa)
    hb = hexify(opb)
    hea = hexify(ea)
    alu_i = hexify(aluop << 6 | neg << 5)
    if neg:
        hea = hexify(255 - ea)
    print("".join([ha, hb, hea, alu_i]))

def gentest(A, B):
    sum__ = A + B
    emit(A, B, (A + B) & 0xff, 0, False)
    emit(A, B, (A + B) & 0xff, 0, True)
    emit(A, B, (A - B) & 0xff, 1, False)
    emit(A, B, (A - B) & 0xff, 1, True)
    emit(A, B, (A & B) & 0xff, 2, False)
    emit(A, B, (A & B) & 0xff, 2, True)
    emit(A, B, (A | B) & 0xff, 3, False)
    emit(A, B, (A | B) & 0xff, 3, True)
    

for A in range(0, 2**8):
    for B in range(0, 2**8):
        gentest(A, B)

print("FFFFFFFF")