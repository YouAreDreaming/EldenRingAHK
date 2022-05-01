;-------------------Keys-------------
 
S_USE:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
return

P_E:
   SendInput {%V_ATTACK% down}
   sleep 100
   SendInput {%V_ATTACK% up}
   sleep 10
return
P_B:
   SendInput {%V_USEITEM% down}
   sleep 25
   SendInput {%V_USEITEM% up}
   sleep 25
   V_Gui_Active := A_Tickcount
return
 
P_K:

;   SendInput {%V_GUARD% down}
;   sleep 50
;   SendInput {%V_GUARD% up}
;   sleep 50

  SendInput {%V_ToggleSpell% down}
  sleep 25
  SendInput {%V_ToggleSpell% up}
  sleep 25
  V_Gui_Active := A_Tickcount
return
P_Down:
   SendInput {%V_DDOWN% down}
   sleep 60
   SendInput {%V_DDOWN% up}
   sleep 40
   V_Gui_Active := A_Tickcount
return

P_Up:
   SendInput {%V_DUP% down}   
   sleep 60						; if you are having lost input tweak here and compile.
   SendInput {%V_DUP% up}   
   sleep 40
   V_Gui_Active := A_Tickcount
return
 
H_Down:
   SendInput {%V_DDOWN% down}
   sleep 650
   SendInput {%V_DDOWN% up}
   sleep 25
   V_Gui_Active := A_Tickcount
return
 
; Noting inconsistencies here, it sometimes successfully resets and other times it doesn't.
; Current setting is 550 and inconsistencies are noted.
; Trying a full second now to see if this guarantees a proper reset.
; At 1000 all resets occured consistently so the sweet spot is definately between >550-1000
S_UP:
   SendInput {%V_DUP% down}
   sleep 650
   SendInput {%V_DUP% up}
   sleep 25
   V_Gui_Active := A_Tickcount
return
P_Esc:
   SendInput {Esc down}
   sleep 25
   SendInput {Esc up}
   sleep 25
return