;-------------------------------------------------------------
; Procedure: Haversine
; Purpose:   Calculates the great-circle distance between two points on the Earth.
; Arguments: lat1.d, lon1.d - Latitude/longitude of point 1 (degrees)
;            lat2.d, lon2.d - Latitude/longitude of point 2 (degrees)
; Returns:   .d             - Distance in meters
; Example:   Haversine(50, 10, 51, 11)
;-------------------------------------------------------------
XIncludeFile "DegToRad.pb"
  Procedure.d Haversine(lat1.d, lon1.d, lat2.d, lon2.d)
    Protected R.d = 6371000.0 ; Earth radius in meters
    Protected dLat.d = DegToRad(lat2 - lat1)
    Protected dLon.d = DegToRad(lon2 - lon1)
    Protected a.d = Pow(Sin(dLat / 2), 2) + Cos(DegToRad(lat1)) * Cos(DegToRad(lat2)) * Pow(Sin(dLon / 2), 2)
    Protected c.d = 2 * ATan2(Sqr(a), Sqr(1 - a))
    ProcedureReturn R * c
  EndProcedure
  ; Debug Haversine(50, 10, 51, 11)
; IDE Options = PureBasic 6.21 (Windows - x64)
; CursorPosition = 8
; Folding = -
; EnableThread
; EnableXP
; DPIAware