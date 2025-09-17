Structure Point2D
  x.d
  y.d
EndStructure

Structure Point3D
  x.d
  y.d
  z.d
EndStructure

Structure Point4D
  x.d
  y.d
  z.d
  w.d
EndStructure

; --- 2D Polygon Centroid ---
Procedure compute2DPolygonCentroid(Array vertices.Point2D(1), *resultCentroid.Point2D)
  Protected.d signedArea = 0.0, cx = 0.0, cy = 0.0
  Protected.i n = ArraySize(vertices())
  Protected.i i, j
  Protected.d x0, y0, x1, y1, a

  For i = 0 To n - 1
    j = (i + 1) % n
    x0 = vertices(i)\x
    y0 = vertices(i)\y
    x1 = vertices(j)\x
    y1 = vertices(j)\y
    a = x0 * y1 - x1 * y0
    signedArea + a
    cx + (x0 + x1) * a
    cy + (y0 + y1) * a
  Next

  signedArea * 0.5
  If Abs(signedArea) > 1e-12
    *resultCentroid\x = cx / (6.0 * signedArea)
    *resultCentroid\y = cy / (6.0 * signedArea)
  Else
    *resultCentroid\x = 0.0
    *resultCentroid\y = 0.0
  EndIf
EndProcedure

; --- 3D Polyhedron Centroid (vertex average, not weighted by volume, for demo purposes) ---
Procedure compute3DPolyhedronCentroid(Array vertices.Point3D(1), *resultCentroid.Point3D)
  Protected.d cx = 0.0, cy = 0.0, cz = 0.0
  Protected.i n = ArraySize(vertices())
  Protected.i i

  For i = 0 To n
    cx + vertices(i)\x
    cy + vertices(i)\y
    cz + vertices(i)\z
  Next

  If n > 0
    *resultCentroid\x = cx / (n + 1)
    *resultCentroid\y = cy / (n + 1)
    *resultCentroid\z = cz / (n + 1)
  Else
    *resultCentroid\x = 0.0
    *resultCentroid\y = 0.0
    *resultCentroid\z = 0.0
  EndIf
EndProcedure

; --- 4D Polychoron Centroid (vertex average, for demo purposes) ---
Procedure compute4DPolychoronCentroid(Array vertices.Point4D(1), *resultCentroid.Point4D)
  Protected.d cx = 0.0, cy = 0.0, cz = 0.0, cw = 0.0
  Protected.i n = ArraySize(vertices())
  Protected.i i

  For i = 0 To n
    cx + vertices(i)\x
    cy + vertices(i)\y
    cz + vertices(i)\z
    cw + vertices(i)\w
  Next

  If n > 0
    *resultCentroid\x = cx / (n + 1)
    *resultCentroid\y = cy / (n + 1)
    *resultCentroid\z = cz / (n + 1)
    *resultCentroid\w = cw / (n + 1)
  Else
    *resultCentroid\x = 0.0
    *resultCentroid\y = 0.0
    *resultCentroid\z = 0.0
    *resultCentroid\w = 0.0
  EndIf
EndProcedure

; --- Dispatcher ---
Procedure computePolygonCentroid(dimension.i, Array *vertices(1), *resultCentroid)
  Select dimension
    Case 2
      compute2DPolygonCentroid(*vertices, *resultCentroid)
    Case 3
      compute3DPolyhedronCentroid(*vertices, *resultCentroid)
    Case 4
      compute4DPolychoronCentroid(*vertices, *resultCentroid)
    Default
      Debug "Unsupported dimension: " + Str(dimension)
  EndSelect
EndProcedure

; --- Example Usage ---

Define dimension = 2 ; Change to 3 or 4 for other tests

If dimension = 2
  Dim polygon.Point2D(11)
  ; ... (fill polygon() as before)
  polygon(0)\x =264279.902711004
  polygon(0)\y =1347354.6435074657
  ; etc...
  Define resultCentroid.Point2D
  computePolygonCentroid(2, polygon(), @resultCentroid)
  Debug "Centroid X: " + StrD(resultCentroid\x)
  Debug "Centroid Y: " + StrD(resultCentroid\y)
ElseIf dimension = 3
  Dim polyhedron.Point3D(4)
  ; ... (fill polyhedron() with 3D points)
  polyhedron(0)\x = 1.0 : polyhedron(0)\y = 2.0 : polyhedron(0)\z = 3.0
  ; etc...
  Define resultCentroid.Point3D
  computePolygonCentroid(3, polyhedron(), @resultCentroid)
  Debug "Centroid X: " + StrD(resultCentroid\x)
  Debug "Centroid Y: " + StrD(resultCentroid\y)
  Debug "Centroid Z: " + StrD(resultCentroid\z)
ElseIf dimension = 4
  Dim polychoron.Point4D(3)
  ; ... (fill polychoron() with 4D points)
  polychoron(0)\x = 1.0 : polychoron(0)\y = 2.0 : polychoron(0)\z = 3.0 : polychoron(0)\w = 4.0
  ; etc...
  Define resultCentroid.Point4D
  computePolygonCentroid(4, polychoron(), @resultCentroid)
  Debug "Centroid X: " + StrD(resultCentroid\x)
  Debug "Centroid Y: " + StrD(resultCentroid\y)
  Debug "Centroid Z: " + StrD(resultCentroid\z)
  Debug "Centroid W: " + StrD(resultCentroid\w)
EndIf
