S_LeftArmement:	
	send {%V_DLEFT% Down}
	sleep 50
	send {%V_DLEFT% Up}
	sleep 50
	V_Gui_TimeActive := A_Tickcount
return

S_RightArmement:
	send {%V_DRIGHT% Down}
	sleep 50
	send {%V_DRIGHT% Up}
	sleep 50
	V_Gui_TimeActive := A_Tickcount
return

;--------------scripts-2H------------
S_2H_Right:
	SendInput {%V_EVENT_ACTION% down}
	sleep 25
	SendInput {%V_ATTACK% down}
	sleep 25
	SendInput {%V_ATTACK% up}
	sleep 25
	SendInput {%V_EVENT_ACTION% up}
return

S_2H_Left:
	SendInput {%V_EVENT_ACTION% down}
	sleep 25
	SendInput {%V_GUARD% down}
	sleep 25
	SendInput {%V_GUARD% up}
	sleep 25
	SendInput {%V_EVENT_ACTION% up}
return
