;------------------------------------------------------------------------------
; Procedure:   TanD(deg.d)
; Purpose:     Compute the tangent of an angle given in degrees.
; 
; Input:
;   - deg.d: Angle in degrees (any real value). Large magnitudes are allowed.
;
; Processing:
;   - Performs range reduction modulo 180° to improve numerical stability.
;   - Maps the reduced angle to the principal interval (-90°, 90°].
;   - Converts degrees to radians, then computes the tangent.
;
; Return:
;   - Result.d: The tangent of the input angle (unitless).
;
; Notes / Edge cases:
;   - At odd multiples of 90° (e.g., 90°, 270°, ...), Tan is undefined and may
;     overflow to +/-Infinity depending on platform/IEEE behavior.
;   - If 'deg' is NaN, the result will be NaN.
;   - This function does not allocate memory or modify global state.
;------------------------------------------------------------------------------
EnableExplicit

Procedure.d TanD(deg.d)
  ; Reduce the angle modulo 180° to improve numeric stability for large |deg|
  Protected.d a = deg - 180.0 * Int(deg / 180.0) ; range-reduction to [0, 180)

  ; Shift to principal range (-90°, 90°] for best Tan accuracy
  If a > 90.0
    a = a - 180.0                                ; e.g., 135° -> -45°
  ElseIf a <= -90.0
    a = a + 180.0                                ; e.g., -135° -> 45°
  EndIf

  ; Convert to radians and return tangent
  ProcedureReturn Tan(Radian(a))
EndProcedure

; Helper: reduce any degree input to principal range (-90°, 90°]
Procedure.d ReduceAngle180(deg.d)
  Protected.d a = deg - 180.0 * Int(deg / 180.0)
  If a > 90.0
    a = a - 180.0
  ElseIf a <= -90.0
    a = a + 180.0
  EndIf
  ProcedureReturn a
EndProcedure

; Helper: detect undefined tan (cos ~ 0 after range reduction)
Procedure.b IsTanUndefined(deg.d)
  Protected.d a = ReduceAngle180(deg)
  Protected.d c = Cos(Radian(a))
  If Abs(c) < 1.0e-15
    ProcedureReturn #True
  EndIf
  ProcedureReturn #False
EndProcedure

;------------------------------------------------------------------------------
; Runnable examples (Debug output only)
;------------------------------------------------------------------------------
CompilerIf #PB_Compiler_IsMainFile
  Define.d deg, reducedA, got, expected, eps
  Define.s verdict$

  eps = 1.0e-12

  Debug "TanD examples (degrees -> result) with expected values"
  Debug "------------------------------------------------------"

  ; 0°
  deg = 0.0 : got = TanD(deg) : expected = 0.0
  If Abs(got-expected) <= eps : verdict$ = "PASS" : Else : verdict$ = "CLOSE" : EndIf
  Debug "TanD(0.0)      = " + StrD(got, 16) + "  ; should be 0                              -> " + verdict$

  ; 30°
  deg = 30.0 : got = TanD(deg) : expected = 1.0 / Sqr(3.0)
  If Abs(got-expected) <= eps : verdict$ = "PASS" : Else : verdict$ = "CLOSE" : EndIf
  Debug "TanD(30.0)     = " + StrD(got, 16) + "  ; should be ~0.5773502691896257 (1/sqrt(3)) -> " + verdict$

  ; 45°
  deg = 45.0 : got = TanD(deg) : expected = 1.0
  If Abs(got-expected) <= eps : verdict$ = "PASS" : Else : verdict$ = "CLOSE" : EndIf
  Debug "TanD(45.0)     = " + StrD(got, 16) + "  ; should be 1                              -> " + verdict$

  ; 60°
  deg = 60.0 : got = TanD(deg) : expected = Sqr(3.0)
  If Abs(got-expected) <= eps : verdict$ = "PASS" : Else : verdict$ = "CLOSE" : EndIf
  Debug "TanD(60.0)     = " + StrD(got, 16) + "  ; should be ~1.7320508075688772 (sqrt(3))   -> " + verdict$

  ; 90° (asymptote, undefined)
  deg = 90.0 : got = TanD(deg)
  If IsTanUndefined(deg)
    Debug "TanD(90.0)     = undefined (+/-Infinity)"
  Else
    Debug "TanD(90.0)     = " + StrD(got, 16) + "  ; near asymptote"
  EndIf

  ; 135°
  deg = 135.0 : got = TanD(deg) : expected = -1.0
  If Abs(got-expected) <= eps : verdict$ = "PASS" : Else : verdict$ = "CLOSE" : EndIf
  Debug "TanD(135.0)    = " + StrD(got, 16) + "  ; should be -1                             -> " + verdict$

  ; -45°
  deg = -45.0 : got = TanD(deg) : expected = -1.0
  If Abs(got-expected) <= eps : verdict$ = "PASS" : Else : verdict$ = "CLOSE" : EndIf
  Debug "TanD(-45.0)    = " + StrD(got, 16) + "  ; should be -1                             -> " + verdict$

  ; -90° and 270° (asymptotes)
  deg = -90.0 : got = TanD(deg)
  If IsTanUndefined(deg)
    Debug "TanD(-90.0)    = undefined (+/-Infinity)"
  Else
    Debug "TanD(-90.0)    = " + StrD(got, 16) + "  ; near asymptote"
  EndIf

  deg = 270.0 : got = TanD(deg)
  If IsTanUndefined(deg)
    Debug "TanD(270.0)    = undefined (+/-Infinity)"
  Else
    Debug "TanD(270.0)    = " + StrD(got, 16) + "  ; near asymptote"
  EndIf

  ; Near-asymptote behavior (sign check)
  Debug "TanD(89.999)   = " + StrD(TanD(89.999), 16) + "  ; should be very large positive"
  Debug "TanD(90.001)   = " + StrD(TanD(90.001), 16) + "  ; should be very large negative"

  ; Large input with range reduction demonstration
  deg = 1000000.0 : got = TanD(deg)
  reducedA = ReduceAngle180(deg)
  expected = TanD(reducedA)
  If Abs(got-expected) <= eps : verdict$ = "PASS" : Else : verdict$ = "FAIL" : EndIf
  Debug "TanD(1000000)  = " + StrD(got, 16) + "  ; should be same as TanD(" + StrD(reducedA, 6) + ") = " + StrD(expected, 16) + "  -> " + verdict$

CompilerEndIf
