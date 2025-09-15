;-------------------------------------------------------------
; Procedure: DegToRad
; Purpose:   Converts an angle from degrees to radians.
; Arguments: deg.d   - Angle in degrees
; Returns:   .d      - Angle in radians
; Example:   r = DegToRad(180)   ; r = 3.1415926535 (PI)
;-------------------------------------------------------------
  Procedure.d DegToRad(deg.d)
    ProcedureReturn deg * #PI / 180.0
  EndProcedure
