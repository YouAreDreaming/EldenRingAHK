; Sets GUI active when D-Pad is used to bump +1 increments for spell/belt
getGuiActive()
{
	global V_Gui_TimeActive
	global V_GUIFade
	global V_AutoLock
	global gAutoLock
	global gDebugMessage
	IF( gAutoLock.active && V_Gui_TimeActive > 0 )
		return 0
		
	if( V_Gui_TimeActive == 0)
	{
		V_Gui_TimeActive := A_Tickcount		
		return 1
	}Else
	{
		time:=A_Tickcount - V_Gui_TimeActive
		if( time > V_GUIFade) 
		{
			V_Gui_TimeActive := A_Tickcount			
			return 1
		} else {			
			; ToolTip, % "Time" time
			return 0
		}
	}	
}
