; https://www.reddit.com/r/AutoHotkey/comments/pcp2uf/dynamically_create_helpgui_from_the_contents_of/?msclkid=8e9f3025c63511ecb336aeacc4aad90c
class C_Gui 
{
	static settings := []
	static bActive := 0
    __New()
    {
        ToolTip, C_Gui Constructed
		C_Gui.bActive := ! C_Gui.bActive
		C_Gui.settings["testlabel"] := "Testing Gui"
		C_Gui.settings["testvar"] := "VarLabel"
		Gui, +AlwaysOnTop +Owner +HwndGuiClassHwnd				;+Disabled -SysMenu
		this.addElementsFromArray( C_Gui.settings )
		Gui, Add, Button, default, OK
		this.show("Gui Class")
		while C_Gui.bActive	
			sleep 10
		return
        
    }
	__Get(aName)
    {
        setting := C_Gui.settings[aName]
        if (setting != "")  
            return setting        
    }

    __Set(aName, aValue)
    {
        C_Gui.settings[aName] := aValue       
    }
	addElementsFromArray( ar )
	{
		ToolTip, Adding Array Elements to Gui
		sleep 500
	    For Key, Value in ar
		{
			ToolTip, % Key Value
			sleep 500
			Gui, Add, Text, , %Key%
			Gui, Add, Edit, v%Key%, %Value%; ym 
		}
	}
	show(aText)
	{
	   Gui, show,, aText
	}
    __Delete()
    {
		For Key, Value in C_Gui.settings
		{
			ToolTip,  "Key: " Key "Value:" Value
			sleep 1000			
		}
        ToolTip "Gui deleted"
		sleep 1000
		Gui, Destroy
		ExitApp
    }
}
 ButtonOK:
	C_Gui.bActive := !C_Gui.bActive	
 return
