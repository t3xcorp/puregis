;-------------------------------------------------------------
; Procedure: RadToDeg
; Purpose:   Converts an angle from radians to degrees.
; Arguments: rad.d   - Angle in radians
; Returns:   .d      - Angle in degrees
; Example:   d = RadToDeg(#PI)   ; d = 180
;-------------------------------------------------------------
Procedure.d RadToDeg(rad.d)
  ProcedureReturn rad * 180.0 / #PI
EndProcedure
