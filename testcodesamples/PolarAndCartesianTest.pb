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

ProcedureDLL PolarToCartesian(lon.d, lat.d, radius.d, *return.point3d)
  phi.d = Radian(90 - lat)
  theta.d = Radian(lon)
  *return\x = radius * Sin(phi) * Cos(theta)
  *return\y = radius * Cos(phi)
  *return\z = radius * Sin(phi) * Sin(theta)
EndProcedure

ProcedureDLL CartesianToPolar(*cart.point3d, *out.polar3d)
  Protected radius.d, lat.d, lon.d
  radius = Sqr(*cart\x * *cart\x + *cart\y * *cart\y + *cart\z * *cart\z)
  If radius = 0
    *out\lon = 0
    *out\lat = 0
    *out\radius = 0
    ProcedureReturn
  EndIf
  lat = 90 - Degree(ACos(*cart\y / radius))
  lon = Degree(ATan2(*cart\x, *cart\z)) ; <<< FIXED!
  If lon > 180
    lon = lon - 360
  EndIf
  *out\lon = lon
  *out\lat = lat
  *out\radius = radius
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

Debug "ATan2(z, x): " + StrD(Degree(ATan2(pt\z, pt\x)))
Debug "ATan2(x, z): " + StrD(Degree(ATan2(pt\x, pt\z)))

CartesianToPolar(@pt, @polarOut)
Debug "-> Back to Polar:"
Debug "Lon: " + StrD(polarOut\lon)
Debug "Lat: " + StrD(polarOut\lat)
Debug "Radius: " + StrD(polarOut\radius)
