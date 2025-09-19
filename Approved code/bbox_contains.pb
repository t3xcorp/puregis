;------------------------------------------------------------------------------
; Purpose:
;   This file provides a robust bounding box containment check in 2D, 3D, and 4D.
;   It validates input and reports errors for invalid pointers, dimensions, and box ranges.
;
; Input:
;   - Pointers to bounding box structures (allocated as bbox_max)
;   - Dimension (2, 3, or 4)
;   - Bounding box min/max values for each dimension
;
; Output:
;   - Returns 1 (True) if box A contains box B in the given dimension
;   - Returns 0 (False) if not, or if input is invalid
;   - Prints debug messages for invalid input scenarios
;
; Example output:
;   2D contains: 1
;   3D contains: 1
;   4D contains: 1
;   Invalid pointer test:
;   Invalid input: Null pointer
;   Invalid dimension test:
;   Invalid input: Dimension must be 2, 3, or 4
;   Invalid range test:
;   Invalid input: Box min/max values not logical for 2D
;------------------------------------------------------------------------------

Structure bbox2D
  xmin.d
  ymin.d
  xmax.d
  ymax.d
EndStructure

Structure bbox3D
  xmin.d
  ymin.d
  zmin.d
  xmax.d
  ymax.d
  zmax.d
EndStructure

Structure bbox4D
  xmin.d
  ymin.d
  zmin.d
  tmin.d
  xmax.d
  ymax.d
  zmax.d
  tmax.d
EndStructure

Structure bbox_max
  xmin.d
  ymin.d
  zmin.d
  tmin.d
  xmax.d
  ymax.d
  zmax.d
  tmax.d
EndStructure

Procedure bbox_contains(*a.bbox_max, *b.bbox_max, dimension)
  Protected contains = #True

  ; Check for null pointers
  If *a = 0 Or *b = 0
    Debug "Invalid input: Null pointer"
    ProcedureReturn #False
  EndIf

  ; Check for valid dimension
  If dimension < 2 Or dimension > 4
    Debug "Invalid input: Dimension must be 2, 3, or 4"
    ProcedureReturn #False
  EndIf

  ; Check for fields present and logical values
  If dimension >= 2
    If *a\xmin >= *a\xmax Or *a\ymin >= *a\ymax Or *b\xmin >= *b\xmax Or *b\ymin >= *b\ymax
      Debug "Invalid input: Box min/max values not logical for 2D"
      ProcedureReturn #False
    EndIf
    If Not (*a\xmin < *b\xmin And *a\xmax > *b\xmax And *a\ymin < *b\ymin And *a\ymax > *b\ymax)
      contains = #False
    EndIf
  EndIf
  If dimension >= 3
    If *a\zmin >= *a\zmax Or *b\zmin >= *b\zmax
      Debug "Invalid input: Box min/max values not logical for 3D"
      ProcedureReturn #False
    EndIf
    If Not (*a\zmin < *b\zmin And *a\zmax > *b\zmax)
      contains = #False
    EndIf
  EndIf
  If dimension = 4
    If *a\tmin >= *a\tmax Or *b\tmin >= *b\tmax
      Debug "Invalid input: Box min/max values not logical for 4D"
      ProcedureReturn #False
    EndIf
    If Not (*a\tmin < *b\tmin And *a\tmax > *b\tmax)
      contains = #False
    EndIf
  EndIf
  ProcedureReturn contains
EndProcedure

; Example usage for 2D bounding boxes
*boxA.bbox_max = AllocateStructure(bbox_max)
*boxB.bbox_max = AllocateStructure(bbox_max)

*boxA\xmin = 0
*boxA\ymin = 0
*boxA\xmax = 10
*boxA\ymax = 10

*boxB\xmin = 2
*boxB\ymin = 2
*boxB\xmax = 8
*boxB\ymax = 8

result2D = bbox_contains(*boxA, *boxB, 2)
Debug "2D contains: " + Str(result2D)

; Example usage for 3D bounding boxes
*boxA3D.bbox_max = AllocateStructure(bbox_max)
*boxB3D.bbox_max = AllocateStructure(bbox_max)

*boxA3D\xmin = 0
*boxA3D\ymin = 0
*boxA3D\zmin = 0
*boxA3D\xmax = 10
*boxA3D\ymax = 10
*boxA3D\zmax = 10

*boxB3D\xmin = 2
*boxB3D\ymin = 2
*boxB3D\zmin = 2
*boxB3D\xmax = 8
*boxB3D\ymax = 8
*boxB3D\zmax = 8

result3D = bbox_contains(*boxA3D, *boxB3D, 3)
Debug "3D contains: " + Str(result3D)

; Example usage for 4D bounding boxes
*boxA4D.bbox_max = AllocateStructure(bbox_max)
*boxB4D.bbox_max = AllocateStructure(bbox_max)

*boxA4D\xmin = 0
*boxA4D\ymin = 0
*boxA4D\zmin = 0
*boxA4D\tmin = 0
*boxA4D\xmax = 10
*boxA4D\ymax = 10
*boxA4D\zmax = 10
*boxA4D\tmax = 10

*boxB4D\xmin = 2
*boxB4D\ymin = 2
*boxB4D\zmin = 2
*boxB4D\tmin = 2
*boxB4D\xmax = 8
*boxB4D\ymax = 8
*boxB4D\zmax = 8
*boxB4D\tmax = 8

result4D = bbox_contains(*boxA4D, *boxB4D, 4)
Debug "4D contains: " + Str(result4D)

; Example of invalid input
Debug "Invalid pointer test:"
resultInvalid = bbox_contains(0, *boxB, 2) ; Should print error and return 0

Debug "Invalid dimension test:"
resultInvalidDim = bbox_contains(*boxA, *boxB, 5) ; Should print error and return 0

Debug "Invalid range test:"
*boxC.bbox_max = AllocateStructure(bbox_max)
*boxC\xmin = 10
*boxC\xmax = 5
*boxC\ymin = 0
*boxC\ymax = 10
resultInvalidRange = bbox_contains(*boxC, *boxB, 2) ; Should print error and return 0
