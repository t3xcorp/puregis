;-------------------------------------------------------------
; Procedure: RadToDeg
; Purpose:   Converts an angle from radians to degrees.
; Arguments: rad.d   - Angle in radians
; Returns:   .d      - Angle in degrees, or NaN if input invalid
; Example:   d = RadToDeg(#PI)   ; d = 180
;-------------------------------------------------------------
Procedure.d RadToDeg(rad.d)
  ; Check for valid input
  If IsNAN(rad) Or IsInfinity(rad)
    ProcedureReturn 0.0
  EndIf
  ProcedureReturn rad * 180.0 / #PI
EndProcedure
