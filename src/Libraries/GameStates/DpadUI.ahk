; Sets GUI active when D-Pad is used to bump +1 increments for spell/belt
getGuiActive()
{
	global V_Gui_Active
	global V_GUIFade
	if( V_Gui_Active = 0 )
	{
		V_Gui_Active := A_Tickcount		
		return 1
	}Else
	{
		time:=A_Tickcount - V_Gui_Active
		if( time > V_GUIFade ) 
		{
			V_Gui_Active := A_Tickcount			
			return 1
		} else {			
			; ToolTip, % "Time" time
			return 0
		}
	}	
}
