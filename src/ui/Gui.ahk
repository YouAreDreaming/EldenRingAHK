; https://www.reddit.com/r/AutoHotkey/comments/pcp2uf/dynamically_create_helpgui_from_the_contents_of/?msclkid=8e9f3025c63511ecb336aeacc4aad90c
#Persistent
class C_Gui 
{
	static settings
	static bActive := 0
    __New( settings )
    {
		C_Gui.settings := settings
        ToolTip, C_Gui Constructed
		C_Gui.bActive := ! C_Gui.bActive
		;C_Gui.settings["V_BBReset"] := "0"
		;C_Gui.settings["V_BSReset"] := "1"
		Gui, +AlwaysOnTop +Owner +HwndGuiClassHwnd				;+Disabled -SysMenu
		this.addElementsFromArray( C_Gui.settings )
		Gui, Add, Button, default, OK
		this.show("Gui Class")
		
		;this.addGuiControlsFromArray( C_Gui.settings )
		
		
		;while C_Gui.bActive	
		;	sleep 10
		;return
        
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
	
	; Gui, [Add], [ControlType] , [Options], [Text]
	
	addElementsFromArray( ar )
	{
	
		i := 0
		
		For aKey, aValue in ar
		{
			vLabel = v%akey%	; passing v%Key% throws warn.
			this.guiElement( "Add", "Text", "section", aKey ) ; ys option starts a new column
			this.guiElement( "Add", "Edit", vLabel, aValue )						
			
			i := i + 1
			
			if( i > 10 ) {
				break 
			}
		}
	}
	submit()
	{
		ToolTip, User Submitted 
		sleep 5000
	}
	;addGuiControlsFromArray( ar )
	;{
	;	For Key, Value in ar
	;	{
	;		vLabel = hwnd%key%	; passing v%Key% throws warn.			
	;		this.guiControl( value, key )			
	;	}
	;}
	; The Gui arguments 
	; subCommand 	:- new|add|show etc see: https://www.autohotkey.com/docs/commands/Gui.htm#SubCommands
	; 	controlType : based on the subCommand type for example Add uses Text|Button|Listbox etc see: https://www.autohotkey.com/docs/commands/Gui.htm#Add
	;		Options : See controlType for it's options  see: https://www.autohotkey.com/docs/commands/Gui.htm#ControlOptions
	;		Text    : Text to be displayed.
	guiElement( subCommand, controlType, Options :="", sText="" )
    {
		GUI %subCommand%, %controlType%, % Options, %sText%
	}	
	guiControl( var1, myedit )
	{
		ControlSetText,, %var1%, ahk_id %myedit%
	}
	
	show(aText)
	{
	   Gui, show,, aText
	}
	
    __Delete()
    {
		
        ToolTip "Gui deleted"		
		Gui, Destroy
		ExitApp
    }
}
; Turns out loading in classes with subroutines will break auto-execution zones
;ButtonOK:
;	C_Gui.bActive := !C_Gui.bActive	
; return
