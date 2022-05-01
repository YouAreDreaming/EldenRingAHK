;-------------------------------------------------------------------------
;-------------------------------------------------------------------------
;----- don´t touch anything below unless you know what you are doing
;-------------------------------------------------------------------------
;-------------------------------------------------------------------------
^!+x::								; Leaving this out of dynamic configuration so user can always exist app.	
   MsgBox Eldenring Script stopped.
   exitapp

^!+q::gosub S_TOGGLEKEYS			; leaving this out of dynamic configuration just incase it disabled itself.
    
;---- CTRL-ALT_SHIFT+C to display variables and hotkey values for debugging ------
^!+c::gosub H_VARDEBUG				; This is just a List for debugging not really for the user so left out of dynamic config.
	H_VARDEBUG:
	ListHotkeys
return

^!+a::gosub LaunchGui				; User should always be able to access the menu so to prevent loss of access by error leaving this out of dynamic config.

^!+s::gosub S_TOGGLEAUTOLOCK

