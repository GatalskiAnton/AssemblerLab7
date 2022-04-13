.586
.model flat

.const
    two real4 2.0;
.data
    upper real4 10.0
    lower real4 -10.0
    fLower real8 0.0;
    fUpper real8 0.0;
.code

first_task proc C, x:QWORD, y:QWORD 
  finit
 
  fld y
  fld x
 
  fdiv st(0), st(1)			;st(0) - x/y

  fptan
  
  fld x
  fmul st(0), st(0)			;st(0) - x^2

  fmul st(0), st(2)			;st(0) - x^2 * tan(x/y)
 
  fld y
  fld x
  
  fdiv st(0), st(1)			;st(0) - x/y

  fptan 

  fdiv st(0), st(1)			;st(0) - ctg(x/y) = 1/tan(x/y)

  fld y
  
  fmul st(0), st(0)			;st(0) - y^2

  fmul st(0), st(1)			;st(0) - y^2 * ctg(x/y)

  fadd st(0), st(4)			;st(4) - x^2 * tan(x/y)

ret
first_task endp

end