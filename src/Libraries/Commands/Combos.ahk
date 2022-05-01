;--------------Attack Combos----------
; Parry+Light Attack
S_Parry:
	paKey := A_ThisHotkey
	G_HotKeys[paKey].active 		:= 1	
	G_HotKeys[paKey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_SKILL% down}
   G_HotKeys[paKey].down 		:= 1
   G_HotKeys[paKey].up 			:= 0
   sleep 100
   
	   SendInput {%V_ATTACK% down}  
	   G_HotKeys[paKey].down 		:= 1 
	   sleep 60
	   
	   SendInput {%V_ATTACK% up}
	   sleep 10
	   G_HotKeys[paKey].up 			:= 0
	   G_HotKeys[paKey].down 		:= 0   
	   G_HotKeys[paKey].active 		:= 0
   
   SendInput {%V_SKILL% up}
   G_HotKeys[paKey].down 		:= 0
   G_HotKeys[paKey].up 			:= 1
return
 
; Crouch+Attack
S_Crouch: 
	caKey := A_ThisHotkey
   G_HotKeys[caKey].active 		:= 1	
   G_HotKeys[caKey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_CROUCH% down}
   G_HotKeys[caKey].down 		:= 1   
   gDebugMessage := "Down Completed"
   sleep 100
   
	   SendInput {%V_ATTACK% down}  	  
	   sleep 60
	  
	   SendInput {%V_ATTACK% up}
	   sleep 10
	   
   SendInput {%V_CROUCH% up}
   G_HotKeys[caKey].down 		:= 0
   
   
   gDebugMessage := "Up Completed"
   G_HotKeys[caKey].up 			:= 0
   G_HotKeys[caKey].down 		:= 0   
   G_HotKeys[caKey].active 		:= 0
return
 
; Jump+Attack
S_Jump:  

   jgkey := A_ThisHotkey		
   G_HotKeys[jgkey].active 			:= 1	
   G_HotKeys[jgkey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_JUMP% down}
   G_HotKeys[jgkey].down 			:= 1      
   sleep 100
   
	   SendInput {%V_ATTACK% down}    
	   gDebugMessage := "Down Completed"
	   sleep 60
	   
	   SendInput {%V_ATTACK% up}  
	   G_HotKeys[jgkey].active 		:= 0
	   sleep 10
   
   SendInput {%V_JUMP% up}
   G_HotKeys[jgkey].down 		:= 0
   G_HotKeys[jgkey].up 			:= 0
   G_HotKeys[jgkey].down 		:= 0   
   gDebugMessage := "Up Completed"
return
 
; Jump+Dual-Wield Combo Attack
S_JumpDualWeild(){
	global gHotKeys	
	global V_JUMP
	global V_GUARD
	global gDebugMessage
	
	jdkey := A_ThisHotkey			; this can change during sleep timers with other key press so lock it in.
   G_HotKeys[jdkey].active 		:= 1	
   G_HotKeys[jdkey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_JUMP% down}
   G_HotKeys[jdkey].down 		:= 1
   G_HotKeys[jdkey].up 			:= 0
   sleep 100
   
   
	   SendInput {%V_GUARD% down}  
	   G_HotKeys[jdkey].down 		:= 1 
	   gDebugMessage := "Down Completed"
	   sleep 60
	   
	   SendInput {%V_GUARD% up}
	   G_HotKeys[jdkey].up 			:= 0
	   G_HotKeys[jdkey].down 		:= 0   
	   G_HotKeys[jdkey].active 		:= 0
   
   sleep 10
   
   SendInput {%V_JUMP% up}
   G_HotKeys[jdkey].down 		:= 0
   G_HotKeys[jdkey].up 			:= 1
   gDebugMessage := "Up Completed"
return
}
 
; Jump+Strong+Attack
S_JumpStrong(){ 

	global G_HotKeys
	global V_JUMP
	global V_SATTACK
	global gDebugMessage
	jkey := A_ThisHotkey			; this can change during sleep timers with other key press so lock it in.
   G_HotKeys[jkey].active 		:= 1	
   G_HotKeys[jkey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_JUMP% down}
   G_HotKeys[jkey].down 		:= 1
   G_HotKeys[jkey].up 			:= 0
   sleep 100   
  
   
	   SendInput {%V_SATTACK% down}  
	   G_HotKeys[jkey].down 		:= 1 
	   gDebugMessage := "Down Completed"
	   sleep 60
	   SendInput {%V_SATTACK% up}
	   G_HotKeys[jkey].up 			:= 0
	   G_HotKeys[jkey].down 		:= 0   
	   G_HotKeys[jkey].active 		:= 0
	   
   
   sleep 10
   SendInput {%V_JUMP% up}
   G_HotKeys[jkey].down 		:= 0
   G_HotKeys[jkey].up 			:= 1
   gDebugMessage := "Up Completed"
return
}