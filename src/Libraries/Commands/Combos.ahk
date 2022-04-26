;--------------Attack Combos----------
; Parry+Light Attack
S_Parry:
   SendInput {%V_SKILL% down}
   sleep 25
   SendInput {%V_SKILL% up}
   sleep 300
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
; Crouch+Attack
S_Crouch:
   SendInput {%V_CROUCH% down}
   sleep 25
   SendInput {%V_CROUCH% up}
   sleep 100
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
; Jump+Attack
S_Jump:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
; Jump+Dual-Wield Combo Attack
S_JumpDualWeild:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_GUARD% down}
   sleep 25
   SendInput {%V_GUARD% up}
return
 
; Jump+Strong+Attack
S_JumpStrong:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_SATTACK% down}
   sleep 300
   SendInput {%V_SATTACK% up}
return