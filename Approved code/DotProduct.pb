;==========================================================
; Procedure:  DotProduct
; Purpose:    Calculate the dot product of two N-dimensional vectors (supports 2D, 3D, 4D)
; Arguments:  
;   dimension   - Integer (2, 3, or 4) specifying the number of vector dimensions
;   *a          - Pointer to vector structure matching dimension:
;                   - dimension=2: *a.vector2D
;                   - dimension=3: *a.vector3D
;                   - dimension=4: *a.vector4D
;   *b          - Pointer to vector structure matching dimension:
;                   - dimension=2: *b.vector2D
;                   - dimension=3: *b.vector3D
;                   - dimension=4: *b.vector4D
; Returns:
;   The dot product as a double (.d)
;   Returns 0.0 if dimension is not 2, 3, or 4,
;   or if either pointer is zero (null)
; Usage:
;   Define v2.vector2D, w2.vector2D
;   v2\x = 1 : v2\y = 2
;   w2\x = 3 : w2\y = 4
;   result.d = DotProduct(2, @v2, @w2)
;   
;   Define v3.vector3D, w3.vector3D
;   v3\x = 1 : v3\y = 2 : v3\z = 3
;   w3\x = 4 : w3\y = 5 : w3\z = 6
;   result.d = DotProduct(3, @v3, @w3)
;
;   Define v4.vector4D, w4.vector4D
;   v4\x = 1 : v4\y = 2 : v4\z = 3 : v4\m = 4
;   w4\x = 5 : w4\y = 6 : w4\z = 7 : w4\m = 8
;   result.d = DotProduct(4, @v4, @w4)
;----------------------------------------------------------

Structure vector2D
  x.d
  y.d
EndStructure

Structure vector3D
  x.d
  y.d
  z.d
EndStructure

Structure vector4D
  x.d
  y.d
  z.d
  m.d
EndStructure

ProcedureDLL.d DotProduct(dimension, *a, *b)
  ; Check for null pointers and valid dimension
  If (*a = 0) Or (*b = 0)
    ProcedureReturn 0.0 ; Error: one or both vectors not provided
  EndIf

  Select dimension
    Case 2
      Protected *pa2.vector2D = *a
      Protected *pb2.vector2D = *b
      ProcedureReturn *pa2\x * *pb2\x + *pa2\y * *pb2\y
    Case 3
      Protected *pa3.vector3D = *a
      Protected *pb3.vector3D = *b
      ProcedureReturn *pa3\x * *pb3\x + *pa3\y * *pb3\y + *pa3\z * *pb3\z
    Case 4
      Protected *pa4.vector4D = *a
      Protected *pb4.vector4D = *b
      ProcedureReturn *pa4\x * *pb4\x + *pa4\y * *pb4\y + *pa4\z * *pb4\z + *pa4\m * *pb4\m
    Default
      ProcedureReturn 0.0 ; Error: unsupported dimension
  EndSelect
EndProcedure

Procedure testcode()
  ;----------------------------------------------------------
; Example Testing of DotProduct
;----------------------------------------------------------
If #PB_Compiler_IsMainFile
  Define v2.vector2D, w2.vector2D, r2.d
  v2\x = 1 : v2\y = 2
  w2\x = 3 : w2\y = 4
  r2 = DotProduct(2, @v2, @w2)
  Debug "DotProduct 2D: " + StrD(r2) ; Output: 11.0

  Define v3.vector3D, w3.vector3D, r3.d
  v3\x = 1 : v3\y = 2 : v3\z = 3
  w3\x = 4 : w3\y = 5 : w3\z = 6
  r3 = DotProduct(3, @v3, @w3)
  Debug "DotProduct 3D: " + StrD(r3) ; Output: 32.0

  Define v4.vector4D, w4.vector4D, r4.d
  v4\x = 1 : v4\y = 2 : v4\z = 3 : v4\m = 4
  w4\x = 5 : w4\y = 6 : w4\z = 7 : w4\m = 8
  r4 = DotProduct(4, @v4, @w4)
  Debug "DotProduct 4D: " + StrD(r4) ; Output: 70.0

  ; Example of error handling
  rBad = DotProduct(5, @v2, @w2)
  Debug "DotProduct Bad dimension: " + StrD(rBad) ; Output: 0.0

  rNull = DotProduct(2, 0, @w2)
  Debug "DotProduct Null pointer: " + StrD(rNull) ; Output: 0.0
EndIf
EndProcedure
;----------------------------------------------------------
; Uncomment to run tests
;----------------------------------------------------------
;testcode()
