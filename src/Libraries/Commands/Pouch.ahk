;--------------scripts-Pouch---------
S_Pouch_Left:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_DLEFT% down}
   sleep 25
   SendInput {%V_DLEFT% up}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
   V_Gui_TimeActive := A_Tickcount
return
S_Pouch_Right:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_DRIGHT% down}
   sleep 25
   SendInput {%V_DRIGHT% up}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
   V_Gui_TimeActive := A_Tickcount
return
S_Pouch_Up:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_DUP% down}
   sleep 25
   SendInput {%V_DUP% up}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
   V_Gui_TimeActive := A_Tickcount
return
S_Pouch_Down:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   gosub P_Down
   SendInput {%V_EVENT_ACTION% up}
   V_Gui_TimeActive := A_Tickcount
return
S_Pouch_5:
   gosub P_Esc
   MouseMove 1750, 470
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_TimeActive := A_Tickcount
return
S_Pouch_6:
   gosub P_Esc
   MouseMove 1840, 470
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_TimeActive := A_Tickcount
return
