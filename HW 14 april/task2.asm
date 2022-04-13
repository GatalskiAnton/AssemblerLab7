.model flat, C 

.data
    two real4 2.0;
    upper real4 10.0
    lower real4 -10.0
    fLower real8 0.0;
    fUpper real8 0.0;
.code
    second_task PROC, a:REAL8, b:REAL8, d:REAL8
        fld upper
        fmul b
        fld upper
        fmul upper
        fmul a
        fld upper
        fmul upper
        fmul upper
        fadd d
        faddp st(1), st(0)
        faddp st(1), st(0)
        fstp fUpper

        fld lower
        fmul b
        fld lower
        fmul lower
        fmul a
        fld lower
        fmul lower
        fmul lower
        fadd d
        faddp st(1), st(0)
        faddp st(1), st(0)
        fstp fLower

        fld fLower
        fld fUpper
        fmul
        
        mov EAX, 0
        ftst
        fstsw AX
        test AX, 4500h
        jz _out

        faddp st(0), st(0)
        fld upper
        fld lower

    _start:
        fadd
        fdiv two

        fld two
        fld upper
        fxch st(2)
        fst st(1)
        fst st(2)

        fmul st(1), st(0)
        fmul st(2), st(0)
        fmul st(2), st(0)

        fmul b
        fxch st(1)
        fmul a

        FADD d
        FADD st(0), st(1)
        FADD st(0), st(2)

        mov EAX, 0
        FTST
        FSTSW AX
        TEST AX, 4000h
        jnz _out

        FMUL fLower
        mov EAX, 0
        FTST
        FSTSW AX
        TEST AX, 0100h
        jnz _neg

        FDIV fLower
        FST fLower

        FADDP st(0), st(0)
        FADDP st(0), st(0)
        FADDP st(0), st(0)

        FLD upper
        FLD lower
        FADD upper
        FDIV two
        FST lower
            jmp _start

    _neg:
        FDIV fLower
        FST fUpper

        FADDP st(0), st(0)
        FADDP st(0), st(0)
        FADDP st(0), st(0)

        FLD lower
        FLD upper
        FADD lower
        FDIV two
        FST upper
        jmp _start

    _out:
        FADDP st(0), st(0)
        FXCH st(1)
        FADDP st(0), st(0)
        FDIV b
        
        ret
    second_task ENDP
end