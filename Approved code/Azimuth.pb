 ;-------------------------------------------------------------
; Procedure: Azimuth
; Purpose:   Calculates the azimuth (bearing) from point 1 to point 2.
; Arguments: lat1.d, lon1.d - Latitude/longitude of point 1 (degrees)
;            lat2.d, lon2.d - Latitude/longitude of point 2 (degrees)
; Returns:   .d             - Azimuth in degrees
; Example:   Azimuth(50, 10, 51, 11)
;-------------------------------------------------------------
  Procedure.d Azimuth(lat1.d, lon1.d, lat2.d, lon2.d)
    Protected phi1.d = DegToRad(lat1)
    Protected phi2.d = DegToRad(lat2)
    Protected lambda1.d = DegToRad(lon1)
    Protected lambda2.d = DegToRad(lon2)
    Protected dLambda.d = lambda2 - lambda1
    Protected y.d = Sin(dLambda) * Cos(phi2)
    Protected x.d = Cos(phi1) * Sin(phi2) - Sin(phi1) * Cos(phi2) * Cos(dLambda)
    Protected theta.d = ATan2(y, x)
    ProcedureReturn Mod(RadToDeg(theta) + 360.0, 360.0)
  EndProcedure
  ; Debug Azimuth(50, 10, 51, 11)
; IDE Options = PureBasic 6.21 (Windows - x64)
; CursorPosition = 8
; Folding = -
; EnableThread
; EnableXP
; DPIAware