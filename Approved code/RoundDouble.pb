;-------------------------------------------------------------
; Procedure: RoundDouble
; Purpose:   Rounds a double to a specified number of decimal places.
; Arguments: value.d    - Value to round
;            decimals.i - Number of decimal places
; Returns:   .d         - Rounded value
; Example:   RoundDouble(123.456789, 2)   ; returns 123.46
;-------------------------------------------------------------
Procedure.d RoundDouble(value.d, decimals.i)
  Protected factor.d = Pow(10.0, decimals)
  ProcedureReturn Round(value * factor, #PB_Round_Nearest) / factor
EndProcedure
; Debug RoundDouble(123.456789, 2)
