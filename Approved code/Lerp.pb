;--------------------------------------------------------
; Linear Interpolation (Lerp) Procedure
; Calculates the interpolated value between a and b by t.
; Parameters:
;   a.d - The start value (double)
;   b.d - The end value (double)
;   t.d - The interpolation factor (double, usually between 0.0 and 1.0)
; Returns:
;   Interpolated value between a and b
;--------------------------------------------------------
Procedure.d Lerp(a.d, b.d, t.d)
  ; Ensure t is in the [0.0, 1.0] range
  If t < 0.0
    t = 0.0
    ; Debug "Warning: t is less than 0.0, clamped to 0.0"
  ElseIf t > 1.0
    t = 1.0
    ; Debug "Warning: t is greater than 1.0, clamped to 1.0"
  EndIf

  ProcedureReturn a + (b - a) * t
EndProcedure
