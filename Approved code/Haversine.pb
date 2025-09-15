; -----------------------------------------------------------------------------
; Procedure:    Haversine
; Purpose:      Calculates the great-circle distance between two points on the
;               Earth's surface using the Haversine formula.
; Parameters:   lat1.d - Latitude of the first point in degrees
;               lon1.d - Longitude of the first point in degrees
;               lat2.d - Latitude of the second point in degrees
;               lon2.d - Longitude of the second point in degrees
; Returns:      Distance in meters as a double
; Reference:    https://en.wikipedia.org/wiki/Haversine_formula
; -----------------------------------------------------------------------------
Procedure.d Haversine(lat1.d, lon1.d, lat2.d, lon2.d)
  Protected R.d = 6371000.0 ; Earth radius in meters

  ; Convert degrees to radians for latitude and longitude
  Protected lat1Rad.d = lat1 * #PI / 180.0
  Protected lat2Rad.d = lat2 * #PI / 180.0
  Protected deltaLat.d = (lat2 - lat1) * #PI / 180.0
  Protected deltaLon.d = (lon2 - lon1) * #PI / 180.0

  ; Compute the Haversine formula
  Protected a.d = Pow(Sin(deltaLat / 2), 2) + Cos(lat1Rad) * Cos(lat2Rad) * Pow(Sin(deltaLon / 2), 2)
  Protected c.d = 2 * ASin(Sqr(a))

  ; Return the calculated distance in meters
  ProcedureReturn R * c
EndProcedure
