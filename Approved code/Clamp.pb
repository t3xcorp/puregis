;-------------------------------------------------------------
; Procedure : Clamp
; Purpose   : Restricts a value to a specified [min, max] range.
; Arguments : value.d - Value to clamp
;           : min.d   - Minimum allowed value
;           : max.d   - Maximum allowed value
; Returns   : .d      - Clamped value
; Example   : Clamp(5, 0, 3)   ; returns 3
;-------------------------------------------------------------
Procedure.d Clamp(value.d, min.d, max.d)
  ; Ensure min <= max, otherwise swap (optional safety)
  If min > max
    Swap min, max
  EndIf
  ProcedureReturn Min(Max(value, min), max)
EndProcedure
