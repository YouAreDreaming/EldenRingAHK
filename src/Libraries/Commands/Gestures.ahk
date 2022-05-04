;----------scripts-Gestures----------
; This is based on your screen resolution so if it doesn't work, you'll have to right-click on the hotkey icon in the taskbar
; and look at the window-spy then hover over the gestures and update the x-y to fit.  I set this to my 4K display, the commented
; x,y values are for HD 1920x1080
S_gesture_1:
   activateGesture( 3470, 1225 )
   V_Gui_TimeActive := A_Tickcount
return
S_gesture_2:
	activateGesture( 3660, 1225 )  
   V_Gui_TimeActive := A_Tickcount
return
S_gesture_3:   
   activateGesture( 3470, 1410 )   
   V_Gui_TimeActive := A_Tickcount
return
S_gesture_4:  
   activateGesture( 3660, 1410 )   
   V_Gui_TimeActive := A_Tickcount
return
S_gesture_5:   
   activateGesture( 3470, 1600 )     
   V_Gui_TimeActive := A_Tickcount
return
S_gesture_6:
	activateGesture( 3660, 1600 )        
   V_Gui_TimeActive := A_Tickcount
return

activateGesture( x, y ){
   SendInput {Esc down}
   sleep 300   
   MouseClick, left, x, y, , 20
   sleep 25   
   SendInput {LButton down }
   sleep 100
   SendInput {LButton Up }
   sleep 20
   SendInput {Esc up}
   sleep 100
   SendInput {Esc down}
   sleep 25 
   SendInput {Esc up}
   
}
