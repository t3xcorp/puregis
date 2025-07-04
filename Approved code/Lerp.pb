;-------------------------------------------------------------
; Procedure: Lerp
; Purpose:   Performs linear interpolation between two values.
; Arguments: a.d   - Start value
;            b.d   - End value
;            t.d   - Interpolation factor (0..1)
; Returns:   .d    - Interpolated value
; Example:   Lerp(0, 10, 0.5)   ; returns 5
;-------------------------------------------------------------
Procedure.d Lerp(a.d, b.d, t.d)
  ProcedureReturn a + (b - a) * t
EndProcedure
; Debug Lerp(0, 10, 0.5)
; IDE Options = PureBasic 6.21 (Windows - x64)
; CursorPosition = 12
; Folding = -
; EnableThread
; EnableXP
; DPIAware