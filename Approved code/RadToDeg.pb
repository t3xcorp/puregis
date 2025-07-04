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
;Debug RadToDeg(#PI)
; IDE Options = PureBasic 6.21 (Windows - x64)
; CursorPosition = 7
; Folding = -
; EnableThread
; EnableXP
; DPIAware