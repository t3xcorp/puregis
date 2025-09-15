;-------------------------------------------------------------
; Procedure: Clamp
; Purpose:   Restricts a value to a specified range.
; Arguments: value.d - Value to clamp
;            min.d   - Minimum allowed value
;            max.d   - Maximum allowed value
; Returns:   .d      - Clamped value
; Example:   Clamp(5, 0, 3)   ; returns 3
;-------------------------------------------------------------
Procedure.d Clamp(value.d, min.d, max.d)
  If value < min
    ProcedureReturn min
  ElseIf value > max
    ProcedureReturn max
  Else
    ProcedureReturn value
  EndIf
EndProcedure
