;----------------------------------------------------------
; Procedure: sphericalAzimuth
; Purpose:   Compute azimuth (direction angle) from point 1 to point 2 on a sphere
; Arguments: 
;   lon1.d - Longitude of point 1 (in radians, -PI to +PI)
;   lat1.d - Latitude of point 1 (in radians, -PI/2 to +PI/2)
;   lon2.d - Longitude of point 2 (in radians, -PI to +PI)
;   lat2.d - Latitude of point 2 (in radians, -PI/2 to +PI/2)
; Returns:
;   Azimuth angle in radians [0, 2*PI) if inputs valid
;   Returns -1 if any input is out of range
; Usage:
;   azimuth.d = sphericalAzimuth(lon1, lat1, lon2, lat2)
;----------------------------------------------------------

Procedure.d sphericalAzimuth(lon1.d, lat1.d, lon2.d, lat2.d)
  ;-------------------------------
  ; Input validation
  ;-------------------------------
  If lat1 < -#PI/2 Or lat1 > #PI/2 Or lat2 < -#PI/2 Or lat2 > #PI/2
    ProcedureReturn -1
  EndIf
  If lon1 < -#PI Or lon1 > #PI Or lon2 < -#PI Or lon2 > #PI
    ProcedureReturn -1
  EndIf

  ;-------------------------------
  ; Calculate spherical azimuth
  ;-------------------------------
  Protected dLon.d = lon2 - lon1
  Protected cosLat2.d = Cos(lat2)
  Protected y.d = cosLat2 * Sin(dLon)
  Protected x.d = Cos(lat1) * Sin(lat2) - Sin(lat1) * cosLat2 * Cos(dLon)

  Protected azimuth.d = ATan2(x, y) ; PureBasic: ATan2(x, y)

  ;-------------------------------
  ; Normalize azimuth to [0, 2*PI)
  ;-------------------------------
  If azimuth < 0
    azimuth = azimuth + 2 * #PI
  EndIf

  ProcedureReturn azimuth
EndProcedure

;----------------------------------------------------------
; Debug/Test Data for sphericalAzimuth
;----------------------------------------------------------

Procedure Test_sphericalAzimuth()
  Define lon1.d, lat1.d, lon2.d, lat2.d, result.d

  ; Test case 1: Equator, zero meridian to 90°E
  lon1 = 0 : lat1 = 0 : lon2 = #PI/2 : lat2 = 0
  result = sphericalAzimuth(lon1, lat1, lon2, lat2)
  Debug "Test 1 (Equator, 0° to 90°E): " + StrD(result)

  ; Test case 2: North pole to equator
  lon1 = 0 : lat1 = #PI/2 : lon2 = 0 : lat2 = 0
  result = sphericalAzimuth(lon1, lat1, lon2, lat2)
  Debug "Test 2 (North pole to equator): " + StrD(result)

  ; Test case 3: Input out of range (latitude)
  lon1 = 0 : lat1 = #PI : lon2 = 0 : lat2 = 0
  result = sphericalAzimuth(lon1, lat1, lon2, lat2)
  Debug "Test 3 (Latitude out of range): " + StrD(result)

  ; Test case 4: Input out of range (longitude)
  lon1 = 2 * #PI : lat1 = 0 : lon2 = 0 : lat2 = 0
  result = sphericalAzimuth(lon1, lat1, lon2, lat2)
  Debug "Test 4 (Longitude out of range): " + StrD(result)

  ; Test case 5: Random valid input
  lon1 = 0.1 : lat1 = 0.2 : lon2 = 1.0 : lat2 = -0.5
  result = sphericalAzimuth(lon1, lat1, lon2, lat2)
  Debug "Test 5 (Random valid input): " + StrD(result)

EndProcedure
; Summary of results:
; 
;     Test 1 (Equator, 0° To 90°E): 1.5707963268 (π/2, east)
;     Test 2 (North pole To equator): 3.1415926536 (π, south)
;     Test 3 (Latitude out of range): -1
;     Test 4 (Longitude out of range): -1
;     Test 5 (Random valid input): 2.2701391538 (valid, in [0, 2π))

;----------------------------------------------------------
; Uncomment to run tests
;----------------------------------------------------------
; Test_sphericalAzimuth()
