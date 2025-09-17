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
  phi.d = Radian(90 - lat)
  theta.d = Radian(lon)
  *return\x = radius * Sin(phi) * Cos(theta)
  *return\y = radius * Cos(phi)
  *return\z = radius * Sin(phi) * Sin(theta)
EndProcedure

; --- Test/Debug Block ---

Define lon.d = 30
Define lat.d = 45
Define radius.d = 100
Define pt.point3d
Define polarOut.polar3d

Debug "Input Polar:"
Debug "Lon: " + StrD(lon)
Debug "Lat: " + StrD(lat)
Debug "Radius: " + StrD(radius)

PolarToCartesian(lon, lat, radius, @pt)
Debug "-> Cartesian:"
Debug "X: " + StrD(pt\x)
Debug "Y: " + StrD(pt\y)
Debug "Z: " + StrD(pt\z)
