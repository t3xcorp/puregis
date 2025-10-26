;-----------------------------------------------------------
; Procedure: DegToDms
; Purpose:   Converts Decimal Degrees to Degrees, Minutes, Seconds (DMS).
; Inputs:
;   - decimal.d        : Decimal degrees value (can be negative or positive).
;   - *deg.Integer     : Pointer to integer to receive degrees (output, signed).
;   - *min.Integer     : Pointer to integer to receive minutes (output, always positive).
;   - *sec.Double      : Pointer to double to receive seconds (output, always positive, may have fractional part).
; Output:
;   - No direct return value; results are returned via pointers by reference.
;   - If any pointer is #Null, the procedure does nothing.
; Usage:
;   DegToDms(-12.5824167, @deg, @min, @sec)
;   ; deg = -12, min = 34, sec ≈ 56.7001
;-----------------------------------------------------------
ProcedureDLL DegToDms(decimal.d, *deg.Integer, *min.Integer, *sec.Double)
  ; Error checking for output pointers
  If *deg = #Null Or *min = #Null Or *sec = #Null
    ProcedureReturn
  EndIf

  Protected absDec.d = Abs(decimal)   ; Absolute value for component extraction
  Protected degrees.i = Int(absDec)   ; Integer degrees
  Protected minutes.i = Int((absDec - degrees) * 60) ; Integer minutes
  Protected seconds.d = ((absDec - degrees) * 60 - minutes) * 60 ; Double seconds

  ; Clamp seconds in case of floating point rounding errors (should never be exactly 60)
  If seconds >= 60
    seconds = 59.999999
  EndIf

  ; Preserve the sign for degrees
  If decimal < 0
    degrees = -degrees
  EndIf

  ; Output results via pointers
  *deg\i = degrees
  *min\i = minutes
  *sec\d = seconds
EndProcedure
; Example 1: Convert Decimal Degrees to DMS
; Should print: -12° 34' 56.7001"
Define deg.i, min.i
Define sec.d
DegToDms(-12.5824167, @deg, @min, @sec)
Debug "Decimal to DMS: " + Str(deg) + "° " + Str(min) + "' " + StrD(sec, 4) + Chr(34)
