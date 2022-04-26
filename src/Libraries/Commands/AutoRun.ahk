;------------------- Auto-Run ------------------------------
; This enables auto-run when moving forward rather than having to
; hold two keys.  It detects when your dodge key is pressed and will
; interupt to preform a dodge.  After the dodge, it will resume
; auto-run until another dodge interupts it.

; The auto-run sub will check to see if enabled.  Is enabled by default. 
S_AutoRun:
   if !V_DBoolean
   {
      SendInput {%V_DODGE% Down}
      V_DBoolean := 1
      sleep 25
   }
return
; Turns off auto-run from the config but we can also make this a in-game toggle feature.
S_AutoRunOff:
   if V_DBoolean
   V_DBoolean := 0
return

; Holding shift toggles off auto run for those... need to walk moments.
S_Walk:
   if V_DBoolean
   {
      SendInput {%V_DODGE% Up}
      V_DBoolean := 0
      sleep 1000
      return
   }
   ; Sometimes after a dodge roll, it keeps on running
   if GetKeyState( V_DODGE, "P" )
   {
      SendInput {%V_DODGE% Up}
      sleep 1000
   }
return

; This untraps the dodge key during running so it preforms a proper dodge otherwise the character
; just keeps running without dodging.
S_Dodge:
   if V_DBoolean
   {
      SendInput {%V_DODGE% Up}
      sleep 50
      SendInput {%V_DODGE% down}
      sleep 200
      SendInput {%V_DODGE% up}
      sleep 200
      SendInput {%V_DODGE% down}
      sleep 50
   }
return
