; Purpose:
;   Converts 3D polar coordinates (longitude, latitude, radius) to Cartesian coordinates (x, y, z).
;
; Input:
;   - lon.d: Longitude in degrees
;   - lat.d: Latitude in degrees
;   - radius.d: Radius (distance from origin)
;
; Output:
;   - *return.point3d: Structure with x, y, z fields containing Cartesian coordinates
;   - Function returns 1 if successful, 0 if input is invalid
;
; --- Structures ---
Structure point3d
  x.d
  y.d
  z.d
EndStructure

Structure polar3d
  lon.d
  lat.d
  radius.d
EndStructure

; --- Procedures ---

Procedure PolarToCartesian(lon.d, lat.d, radius.d, *return.point3d)
  ; Error checking for invalid input
  If *return = 0
    Debug "Error: Output pointer is null."
    ProcedureReturn 0
  EndIf

  If radius < 0
    Debug "Error: Radius cannot be negative."
    ProcedureReturn 0
  EndIf

  If lat < -90 Or lat > 90
    Debug "Error: Latitude must be between -90 and 90 degrees."
    ProcedureReturn 0
  EndIf

  If lon < -180 Or lon > 180
    Debug "Error: Longitude must be between -180 and 180 degrees."
    ProcedureReturn 0
  EndIf

  phi.d = Radian(90 - lat)
  theta.d = Radian(lon)
  *return\x = radius * Sin(phi) * Cos(theta)
  *return\y = radius * Cos(phi)
  *return\z = radius * Sin(phi) * Sin(theta)
  ProcedureReturn 1
EndProcedure

; --- Test/Debug Block ---

Debug "=== Valid input test ==="
Define lon.d = 30
Define lat.d = 45
Define radius.d = 100
Define pt.point3d

Debug "Input Polar:"
Debug "Lon: " + StrD(lon)
Debug "Lat: " + StrD(lat)
Debug "Radius: " + StrD(radius)

If PolarToCartesian(lon, lat, radius, @pt)
  Debug "-> Cartesian:"
  Debug "X: " + StrD(pt\x)
  Debug "Y: " + StrD(pt\y)
  Debug "Z: " + StrD(pt\z)
Else
  Debug "Conversion failed due to invalid input."
EndIf

Debug "=== Invalid input tests ==="
; Test invalid longitude
Define pt_invalid.point3d
Debug "-- Invalid longitude --"
If PolarToCartesian(200, 45, 100, @pt_invalid)
  Debug "Should have failed, but succeeded."
Else
  Debug "Conversion failed due to invalid longitude."
EndIf

; Test invalid latitude
Debug "-- Invalid latitude --"
If PolarToCartesian(30, 100, 100, @pt_invalid)
  Debug "Should have failed, but succeeded."
Else
  Debug "Conversion failed due to invalid latitude."
EndIf

; Test negative radius
Debug "-- Negative radius --"
If PolarToCartesian(30, 45, -10, @pt_invalid)
  Debug "Should have failed, but succeeded."
Else
  Debug "Conversion failed due to negative radius."
EndIf

; Test null pointer
Debug "-- Null pointer --"
If PolarToCartesian(30, 45, 100, 0)
  Debug "Should have failed, but succeeded."
Else
  Debug "Conversion failed due to null pointer."
EndIf
