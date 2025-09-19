; ==============================================================================
; Magnitude.pb
; ------------------------------------------------------------------------------
; Purpose:
;   This file demonstrates how to use a single procedure, Magnitude, to calculate
;   the magnitude (length) of a vector in any dimension (2D, 3D, 4D, etc).
;   The procedure takes an array of doubles representing the vector and its dimension.
;
;   The magnitude formula applied is:
;     |V| = sqrt(x1^2 + x2^2 + ... + xn^2)
;
; Example Inputs & Outputs:
;   Input: 2D vector [3.0, 4.0]
;   Output: 5.0
;
;   Input: 3D vector [1.0, 2.0, 2.0]
;   Output: 3.0
;
;   Input: 4D vector [2.0, 2.0, 2.0, 2.0]
;   Output: 4.0
; ==============================================================================

ProcedureDLL.d Magnitude(*vector, dimension)
  ; Calculates the magnitude of an N-dimensional vector.
  ; *vector: pointer to array of doubles
  ; dimension: number of dimensions (elements in array)
  Protected i, sum.d
  For i = 0 To dimension - 1
    sum + Pow(PeekD(*vector + i * SizeOf(Double)), 2)
  Next
  ProcedureReturn Sqr(sum)
EndProcedure

; ------------------------------------------------------------------------------
; Example usage for 2D, 3D, and 4D vectors
; ------------------------------------------------------------------------------

; --- 2D Vector Example ---
Dim v2d.d(1)
v2d(0) = 3.0
v2d(1) = 4.0
; Input: [3.0, 4.0]
Debug "2D Vector: [3.0, 4.0]"
Debug "2D Magnitude: " + StrD(Magnitude(@v2d(), 2)) ; Output: 5.0

; --- 3D Vector Example ---
Dim v3d.d(2)
v3d(0) = 1.0
v3d(1) = 2.0
v3d(2) = 2.0
; Input: [1.0, 2.0, 2.0]
Debug "3D Vector: [1.0, 2.0, 2.0]"
Debug "3D Magnitude: " + StrD(Magnitude(@v3d(), 3)) ; Output: 3.0

; --- 4D Vector Example ---
Dim v4d.d(3)
v4d(0) = 2.0
v4d(1) = 2.0
v4d(2) = 2.0
v4d(3) = 2.0
; Input: [2.0, 2.0, 2.0, 2.0]
Debug "4D Vector: [2.0, 2.0, 2.0, 2.0]"
Debug "4D Magnitude: " + StrD(Magnitude(@v4d(), 4)) ; Output: 4.0

; ------------------------------------------------------------------------------
; End of Magnitude.pb
; ------------------------------------------------------------------------------
