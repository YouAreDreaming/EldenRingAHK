;--------------Attack Combos----------
; Parry+Light Attack
S_Parry:
	G_HotKeys[A_ThisHotkey].active 		:= 1	
	G_HotKeys[A_ThisHotkey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_SKILL% down}
   G_HotKeys[A_ThisHotkey].down 		:= 1
   G_HotKeys[A_ThisHotkey].up 			:= 0
   sleep 25
   
   SendInput {%V_SKILL% up}
   G_HotKeys[A_ThisHotkey].down 		:= 0
   G_HotKeys[A_ThisHotkey].up 			:= 1
   
   sleep 300
   SendInput {%V_ATTACK% down}  
   G_HotKeys[A_ThisHotkey].down 		:= 1 
   
   sleep 25
   SendInput {%V_ATTACK% up}
   G_HotKeys[A_ThisHotkey].up 			:= 0
   G_HotKeys[A_ThisHotkey].down 		:= 0   
   G_HotKeys[A_ThisHotkey].active 		:= 0
return
 
; Crouch+Attack
S_Crouch:   
   G_HotKeys[A_ThisHotkey].active 		:= 1	
   G_HotKeys[A_ThisHotkey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_CROUCH% down}
   G_HotKeys[A_ThisHotkey].down 		:= 1
   G_HotKeys[A_ThisHotkey].up 			:= 0
   sleep 25
   
   SendInput {%V_CROUCH% up}
   G_HotKeys[A_ThisHotkey].down 		:= 0
   G_HotKeys[A_ThisHotkey].up 			:= 1
   
   sleep 100
   SendInput {%V_ATTACK% down}  
   G_HotKeys[A_ThisHotkey].down 		:= 1 
   
   sleep 25
   SendInput {%V_ATTACK% up}
   G_HotKeys[A_ThisHotkey].up 			:= 0
   G_HotKeys[A_ThisHotkey].down 		:= 0   
   G_HotKeys[A_ThisHotkey].active 		:= 0
return
 
; Jump+Attack
S_Jump:   
   G_HotKeys[A_ThisHotkey].active 		:= 1	
   G_HotKeys[A_ThisHotkey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_JUMP% down}
   G_HotKeys[A_ThisHotkey].down 		:= 1
   G_HotKeys[A_ThisHotkey].up 			:= 0
   sleep 300
   
   SendInput {%V_JUMP% up}
   G_HotKeys[A_ThisHotkey].down 		:= 0
   G_HotKeys[A_ThisHotkey].up 			:= 1
   
   sleep 25
   SendInput {%V_ATTACK% down}  
   G_HotKeys[A_ThisHotkey].down 		:= 1 
   
   sleep 25
   SendInput {%V_ATTACK% up}
   G_HotKeys[A_ThisHotkey].up 			:= 0
   G_HotKeys[A_ThisHotkey].down 		:= 0   
   G_HotKeys[A_ThisHotkey].active 		:= 0
return
 
; Jump+Dual-Wield Combo Attack
S_JumpDualWeild(){
	global gHotKeys	
	global V_JUMP
	global V_GUARD
	
   G_HotKeys[A_ThisHotkey].active 		:= 1	
   G_HotKeys[A_ThisHotkey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_JUMP% down}
   G_HotKeys[A_ThisHotkey].down 		:= 1
   G_HotKeys[A_ThisHotkey].up 			:= 0
   sleep 300
   
   SendInput {%V_JUMP% up}
   G_HotKeys[A_ThisHotkey].down 		:= 0
   G_HotKeys[A_ThisHotkey].up 			:= 1
   
   sleep 25
   SendInput {%V_GUARD% down}  
   G_HotKeys[A_ThisHotkey].down 		:= 1 
   
   sleep 25
   SendInput {%V_GUARD% up}
   G_HotKeys[A_ThisHotkey].up 			:= 0
   G_HotKeys[A_ThisHotkey].down 		:= 0   
   G_HotKeys[A_ThisHotkey].active 		:= 0
   ;MsgBox JumpDualWeild Success!
return
}
 
; Jump+Strong+Attack
S_JumpStrong(){ 

	global G_HotKeys
	global V_JUMP
	global V_SATTACK
	
  jkey := A_ThisHotkey
   G_HotKeys[jkey].active 		:= 1	
   G_HotKeys[jkey].lastpressed 	:= A_Tickcount		
   
   SendInput {%V_JUMP% down}
   G_HotKeys[jkey].down 		:= 1
   G_HotKeys[jkey].up 			:= 0
   sleep 300
   
   SendInput {%V_JUMP% up}
   G_HotKeys[jkey].down 		:= 0
   G_HotKeys[jkey].up 			:= 1
   
   sleep 25
   SendInput {%V_SATTACK% down}  
   G_HotKeys[jkey].down 		:= 1 
   
   sleep 300
   SendInput {%V_SATTACK% up}
   G_HotKeys[jkey].up 			:= 0
   G_HotKeys[jkey].down 		:= 0   
   G_HotKeys[jkey].active 		:= 0
return
}