
; ------------------------------------------------------------------------------
; Procedure: Azimuth
; Purpose  : Calculates the azimuth (bearing angle) from point 1 (lat1, lon1)
;            to point 2 (lat2, lon2) on the Earth's surface.
;
; Parameters:
;   lat1.d  - Latitude of the first point in degrees (valid range: -90 to 90)
;   lon1.d  - Longitude of the first point in degrees (valid range: -180 to 180)
;   lat2.d  - Latitude of the second point in degrees (valid range: -90 to 90)
;   lon2.d  - Longitude of the second point in degrees (valid range: -180 to 180)
;
; Returns:
;   Bearing in degrees within [0, 360) if inputs are valid.
;   Returns a negative error code on failure:
;     -1.0 : Invalid latitude
;     -2.0 : Invalid longitude
;     -3.0 : Points are identical or azimuth is undefined
;     -4.0 : Input is NaN or Infinity
;
; Notes:
;   - The function checks for valid coordinate ranges and degenerate cases.
;   - Debug messages are printed if an error occurs.
; ------------------------------------------------------------------------------

Procedure.d Azimuth(lat1.d, lon1.d, lat2.d, lon2.d)
  ; Check for NaN or Infinity inputs
  If IsNAN(lat1) Or IsNAN(lon1) Or IsNAN(lat2) Or IsNAN(lon2) Or IsInfinity(lat1) Or IsInfinity(lon1) Or IsInfinity(lat2) Or IsInfinity(lon2)
    Debug "Error: One or more inputs are NaN or Infinity."
    ProcedureReturn -4.0
  EndIf

  ; Latitude [-90, 90], Longitude [-180, 180]
  If (lat1 < -90.0 Or lat1 > 90.0 Or lat2 < -90.0 Or lat2 > 90.0)
    Debug "Error: Latitude values must be between -90 and 90 degrees."
    ProcedureReturn -1.0
  EndIf
  If (lon1 < -180.0 Or lon1 > 180.0 Or lon2 < -180.0 Or lon2 > 180.0)
    Debug "Error: Longitude values must be between -180 and 180 degrees."
    ProcedureReturn -2.0
  EndIf

  Protected phi1.d = lat1 * #PI / 180.0
  Protected phi2.d = lat2 * #PI / 180.0
  Protected lambda1.d = lon1 * #PI / 180.0
  Protected lambda2.d = lon2 * #PI / 180.0
  Protected dLambda.d = lambda2 - lambda1

  Protected y.d = Sin(dLambda) * Cos(phi2)
  Protected x.d = Cos(phi1) * Sin(phi2) - Sin(phi1) * Cos(phi2) * Cos(dLambda)

  If (Abs(x) < 1E-12 And Abs(y) < 1E-12)
    Debug "Error: Points are identical or too close; azimuth is undefined."
    ProcedureReturn -3.0
  EndIf

  Protected theta.d = ATan2(y, x)
  ProcedureReturn Mod(theta * 180.0 / #PI + 360.0, 360.0)
EndProcedure

