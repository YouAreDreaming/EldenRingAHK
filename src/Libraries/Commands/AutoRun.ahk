;------------------- Auto-Run ------------------------------
; This enables auto-run when moving forward rather than having to
; hold two keys.  It detects when your dodge key is pressed and will
; interupt to preform a dodge.  After the dodge, it will resume
; auto-run until another dodge interupts it.

; The auto-run sub will check to see if enabled.  Is enabled by default. 
S_AutoRun:
   if V_AutoRun
   {
      SendInput {%V_DODGE% Down}      
      sleep 100
	  gDebugMessage := "AutoRun is active"
   }
return
; Turns off auto-run from the config but we can also make this a in-game toggle feature.
S_AutoRunOff:
   if V_AutoRun {
		SendInput {%V_DODGE% Up}		
		gDebugMessage := "AutoRun is Off"
		sleep 50
   }
return

; Holding shift toggles off auto run for those... need to walk moments.
S_Walk:
   if V_AutoRun
   {
      SendInput {%V_DODGE% Up}
	  gDebugMessage := "AutoRun is Off"
      sleep 50
      return
   }
   ; Sometimes after a dodge roll, it keeps on running
   ;if GetKeyState( V_DODGE, "P" )
   ;{
    ;  SendInput {%V_DODGE% Up}
	;  gDebugMessage := "Dodge is Off"
    ;  sleep 20
   ;}
return

; This untraps the dodge key during running so it preforms a proper dodge otherwise the character
; just keeps running without dodging.
S_Dodge:
   if V_AutoRun
   {
	  gDebugMessage := "AutoRun is Dodging"
      SendInput {%V_DODGE% Up}
      sleep 50
      SendInput {%V_DODGE% down}
      sleep 200
      SendInput {%V_DODGE% up}
      sleep 200
	  
	  SendInput { %V_MOVE_FORWARD% up }
	  sleep 50
	  SendInput { %V_MOVE_FORWARD% down }
	  sleep 100
	  
      ;SendInput {%V_DODGE% down}
      ;sleep 100
	  gDebugMessage := "AutoRun Dodge complete"
	  gosub S_AutoRun
   }
return
