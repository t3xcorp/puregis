; Calculates the bearing between two geographical coordinates (latitude/longitude).
; Altitude is ignored if present.
; Returns bearing in degrees (0..360), or -1 if input is invalid.
;
; Parameters:
;    lat1, lon1 - origin coordinates (degrees)
;    lat2, lon2 - destination coordinates (degrees)
;
; Example:
;    deg = Bearing(48.8584, 2.2945, 51.5007, -0.1246) ; Paris to London

ProcedureDLL.d Bearing(lat1.d, lon1.d, lat2.d, lon2.d)
  ; Helper: Check if value is NaN
  Macro IsNAN(x)
    (x <> x)
  EndMacro

  ; Validate input ranges
  If lat1 < -90 Or lat1 > 90 Or lat2 < -90 Or lat2 > 90 Or lon1 < -180 Or lon1 > 180 Or lon2 < -180 Or lon2 > 180
    ProcedureReturn -1
  EndIf
  ; NaN check
  If IsNAN(lat1) Or IsNAN(lon1) Or IsNAN(lat2) Or IsNAN(lon2)
    ProcedureReturn -1
  EndIf
  ; Coincident points? Bearing undefined, but you could return 0 or -1
  If lat1 = lat2 And lon1 = lon2
    ProcedureReturn -1
  EndIf

  ; Calculate bearing
  Protected phi1.d = Radian(lat1)
  Protected phi2.d = Radian(lat2)
  Protected dLon.d = Radian(lon2 - lon1)
  Protected y.d = Sin(dLon) * Cos(phi2)
  Protected x.d = Cos(phi1) * Sin(phi2) - Sin(phi1) * Cos(phi2) * Cos(dLon)
  Protected bearing.d = Degree(ATan2(y, x))
  ProcedureReturn Mod(bearing + 360, 360)
EndProcedure
