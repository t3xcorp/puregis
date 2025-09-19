;---------------------------------------------------------------------------------
; Procedure: CartesianToPolar
; Purpose  : Converts 3D Cartesian coordinates (x, y, z) into polar coordinates
;            (radius, latitude, longitude) with selectable axis orientation.
;
; Input    : *cart.point3d      - Pointer to structure holding x, y, z values
;            *out.polar3d       - Pointer to structure for output radius, lat, lon
;            axisOrientation.i  - Axis orientation constant:
;                                  #AXIS_Y_UP (0): Latitude from Y, Longitude from X/Z (graphics default)
;                                  #AXIS_Z_UP (1): Latitude from Z, Longitude from X/Y (math default)
;
; Output   : Fills *out.polar3d with calculated radius, latitude, and longitude.
;            Latitude in degrees from pole, Longitude in degrees (-180 to 180).
;
; Example  : See usage at the bottom.
;---------------------------------------------------------------------------------

#AXIS_Y_UP = 0   ; Use latitude from Y, longitude from X/Z (graphics default)
#AXIS_Z_UP = 1   ; Use latitude from Z, longitude from X/Y (math default)

Structure point3d
  x.d
  y.d
  z.d
EndStructure

Structure polar3d
  radius.d
  lat.d
  lon.d
EndStructure

ProcedureDLL CartesianToPolar(*cart.point3d, *out.polar3d, axisOrientation.i)
  Protected radius.d, lat.d, lon.d
  radius = Sqr(*cart\x * *cart\x + *cart\y * *cart\y + *cart\z * *cart\z)
  If radius = 0
    *out\lon = 0
    *out\lat = 0
    *out\radius = 0
    ProcedureReturn
  EndIf

  Select axisOrientation
    Case #AXIS_Y_UP
      lat = 90 - Degree(ACos(*cart\y / radius))
      lon = Degree(ATan2(*cart\x, *cart\z))
    Case #AXIS_Z_UP
      lat = 90 - Degree(ACos(*cart\z / radius))
      lon = Degree(ATan2(*cart\x, *cart\y))
    Default
      lat = 90 - Degree(ACos(*cart\y / radius))
      lon = Degree(ATan2(*cart\x, *cart\z))
  EndSelect

  If lon > 180
    lon = lon - 360
  EndIf

  *out\lon = lon
  *out\lat = lat
  *out\radius = radius
EndProcedure

; ----- Example Usage -----
Define cart.point3d
Define polar.polar3d

cart\x = 10
cart\y = 20
cart\z = 30

Define axisOrientation.i
axisOrientation = #AXIS_Y_UP   ; Change to #AXIS_Z_UP for Z-up orientation

CartesianToPolar(@cart, @polar, axisOrientation)

Debug "Input Cartesian: x=" + StrD(cart\x) + " y=" + StrD(cart\y) + " z=" + StrD(cart\z)
Debug "Axis orientation: " + Str(axisOrientation)
Debug "Output Polar: radius=" + StrD(polar\radius) + " lat=" + StrD(polar\lat) + " lon=" + StrD(polar\lon)
