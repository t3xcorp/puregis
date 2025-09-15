;------------------------------------------------------------
; Structure for 2D vector
Structure Vector2D
  x.f   ; X coordinate (float)
  y.f   ; Y coordinate (float)
EndStructure

;------------------------------------------------------------
; Create a new vector
; Parameters:
;   x.f - X coordinate
;   y.f - Y coordinate
; Returns:
;   Pointer to the newly allocated Vector2D structure
Procedure.i NewVector2D(x.f, y.f)
  *vec.Vector2D = AllocateMemory(SizeOf(Vector2D)) ; Allocate memory for the vector
  If *vec
    *vec\x = x   ; Set the X coordinate
    *vec\y = y   ; Set the Y coordinate
  EndIf
  ProcedureReturn *vec ; Return pointer to the vector
EndProcedure

;------------------------------------------------------------
; Example Usage:
; Create a new vector with x=110.5 and y=115.5
*v1.Vector2D = NewVector2D(110.5, 115.5)

;------------------------------------------------------------
; Debug output to display vector coordinates
; Shows: v1: x=110.5, y=115.5
Debug ("v1: x=" + StrD(*v1\x) + ", y=" + StrD(*v1\y))
