;-----------------------------------------------------------
; Procedure: DmsToDeg
; Purpose:   Converts Degrees, Minutes, Seconds (DMS) to Decimal Degrees.
; Inputs:
;   - deg.d : Degrees as a double (can be negative or positive).
;   - min.d : Minutes as a double (should be 0-59).
;   - sec.d : Seconds as a double (should be 0-59.999...).
; Output:
;   - Returns the decimal degrees value (double).
;   - Returns #NaN if input minutes/seconds are out of valid range.
; Usage:
;   result.d = DmsToDeg(12, 34, 56.7)
;-----------------------------------------------------------
Procedure.d DmsToDeg(deg.d, min.d, sec.d)
  ; Error checking for input ranges
  If min < 0 Or min >= 60
    ProcedureReturn NaN()
  EndIf
  If sec < 0 Or sec >= 60
    ProcedureReturn NaN()
  EndIf

  Protected decimal.d
  If deg >= 0
    decimal = deg + min / 60 + sec / 3600
  Else
    decimal = deg - min / 60 - sec / 3600
  EndIf
  ProcedureReturn decimal
EndProcedure

;-----------------------------------------------------------
; Example of Use:
;-----------------------------------------------------------
; Example 1: Convert DMS to Decimal Degrees
; Should print: 12.5824167
Define dec.d
dec = DmsToDeg(12, 34, 56.7)
Debug "DMS to Decimal: " + StrD(dec, 7)
