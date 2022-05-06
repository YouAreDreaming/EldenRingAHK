; These HotKeys are conditional based on AutoRun and pass the key stroke into the subroutines.
; Not part of dynamic config for now as they have a unique requirement.  
HotKey, ~%V_MOVE_FORWARD%, S_AutoRun
HotKey, ~*%V_MOVE_FORWARD% up, S_AutoRunOff
HotKey, ~+%V_MOVE_FORWARD%, S_Walk
HotKey, ~%V_DODGE%, S_Dodge

HotKey, ~%V_MOVE_BACKWARDS%, S_AutoRun
HotKey, ~*%V_MOVE_BACKWARDS% up, S_AutoRunOff
