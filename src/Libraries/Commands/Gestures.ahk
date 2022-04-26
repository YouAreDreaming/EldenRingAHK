;----------scripts-Gestures----------
; This is based on your screen resolution so if it doesn't work, you'll have to right-click on the hotkey icon in the taskbar
; and look at the window-spy then hover over the gestures and update the x-y to fit.  I set this to my 4K display, the commented
; x,y values are for HD 1920x1080
S_gesture_1:
   gosub P_Esc
   MouseMove 3470, 1225 ; 1750, 620
   sleep 25
   gosub P_E    
   sleep 25
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
S_gesture_2:
   gosub P_Esc
   MouseMove 3660, 1225 ; 1840, 620
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
S_gesture_3:
   gosub P_Esc
   MouseMove 3470, 1410 ; 1750, 710
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
S_gesture_4:
   gosub P_Esc
   MouseMove 3660, 1410 ; 1840, 710
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
S_gesture_5:
   gosub P_Esc
   MouseMove 3470, 1600 ; 1750, 800
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
S_gesture_6:
   gosub P_Esc
   MouseMove 3660, 1600 ; 1840, 800
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
