ProcedureDLL.d bearing(x1.d,y1.d,x2.d,y2.d)
  result.d = ATan2(y1 - y2, x2 - x1) * 180.0 / #PI
  If result >= 0 And result <= 180
    ProcedureReturn ATan2(y1 - y2, x2 - x1) * 180.0 / #PI
  Else 
    ProcedureReturn (ATan2(y1 - y2, x2 - x1) * 180.0 / #PI) + 360
  EndIf 
EndProcedure
; Debug Round(bearing(50,50,50,60),#PB_Round_Nearest)

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 9
; Folding = -
; EnableThread
; EnableXP