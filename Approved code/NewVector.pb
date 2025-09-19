;------------------------------------------------------------------------------
; Purpose:
;   This code defines structures for 2D, 3D, and 4D vectors and provides a procedure
;   for creating new instances of those vectors (dynamically allocating memory).
;   It is useful for mathematical, geometrical, or graphical applications where
;   vectors of various dimensions are needed.
;
; Input:
;   - Dimension (integer): Indicates the type of vector to create (2 for 2D, 3 for 3D, 4 for 4D).
;   - x, y, z, m (double): Coordinate values for the vector. 'z' and 'm' are optional (default 0.0).
;
; Output:
;   - Returns a pointer to the newly created vector structure (Vector2D, Vector3D, or Vector4D),
;     or 0 if the dimension is not valid or memory allocation fails.
;------------------------------------------------------------------------------

; Structure for 2D vector
Structure Vector2D
  x.d
  y.d
EndStructure

; Structure for 3D vector
Structure Vector3D
  x.d
  y.d
  z.d
EndStructure

; Structure for 4D vector
Structure Vector4D
  x.d
  y.d
  z.d
  m.d
EndStructure

; Create a new vector (2D, 3D, or 4D)
Procedure.i NewVector(Dimension.i, x.d, y.d, z.d = 0.0, m.d = 0.0)
  Select Dimension
    Case 2
      *vec2.Vector2D = AllocateMemory(SizeOf(Vector2D))
      If *vec2
        *vec2\x = x
        *vec2\y = y
        ProcedureReturn *vec2
      EndIf
    Case 3
      *vec3.Vector3D = AllocateMemory(SizeOf(Vector3D))
      If *vec3
        *vec3\x = x
        *vec3\y = y
        *vec3\z = z
        ProcedureReturn *vec3
      EndIf
    Case 4
      *vec4.Vector4D = AllocateMemory(SizeOf(Vector4D))
      If *vec4
        *vec4\x = x
        *vec4\y = y
        *vec4\z = z
        *vec4\m = m
        ProcedureReturn *vec4
      EndIf
    Default
      ProcedureReturn 0 ; Invalid dimension
  EndSelect
  
EndProcedure

; Example Usage:

; 2D vector
*v2.Vector2D = NewVector(2, 110.5, 115.5)
Debug ("v2: x=" + StrD(*v2\x) + ", y=" + StrD(*v2\y))

; 3D vector
*v3.Vector3D = NewVector(3, 1.0, 2.0, 3.0)
Debug ("v3: x=" + StrD(*v3\x) + ", y=" + StrD(*v3\y) + ", z=" + StrD(*v3\z))

; 4D vector
*v4.Vector4D = NewVector(4, 4.0, 5.0, 6.0, 7.0)
Debug ("v4: x=" + StrD(*v4\x) + ", y=" + StrD(*v4\y) + ", z=" + StrD(*v4\z) + ", w=" + StrD(*v4\m))
