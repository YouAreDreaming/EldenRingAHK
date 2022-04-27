#Persistent

class C_UserSettings
{
	static settings := []
    __New(settingsFile, ByRef settings)
    {
        ToolTip, UserSettings Constructed
		settings := []
		
		this.initSettings(settingsFile, settings)
        ;return this  ; This line can be omitted when using the 'new' operator.
    }
	__Get(aName)
    {
        setting := C_UserSettings.settings[aName]
        if (setting != "")  
            return setting        
    }

    __Set(aName, aValue)
    {
        C_UserSettings.settings[aName] := aValue
        ; NOTE: Using 'return' here would break this.stored_RGB and this.RGB.
    }
	initSettings(settingsFile, ByRef settings)
	{
		FileInstall, settings.ini, settings.ini, 0
		
		settings := []		
		settings["V_DEBUG"] := 0 			
		settings["V_SPELL_SLOTS"] := 8 		
		settings["V_BELT_SLOTS"] := 10 		 
		settings["V_MOVE_CONTROL"] := "Backspace" 
		settings["V_MOVE_FORWARD"] := "y"		
		settings["V_MOVE_BACKWARDS"] := "u" 	
		settings["V_MOVE_LEFT"] := "i" 		
		settings["V_MOVE_RIGHT"] := "o" 		
		settings["V_DODGE"] := "p"
		settings["V_JUMP"] := "Space"
		settings["V_CROUCH"] := "t"
		settings["V_CAMUP"] := "s"
		settings["V_CAMDOWN"] := "s"
		settings["V_CAMLEFT"] := "+z"
		settings["V_CAMRIGHT"] := "+x"
		settings["V_LOCKON"] := "tab"
		settings["V_DUP"] := "Up"
		settings["V_DDOWN"] := "Down"
		settings["V_DRIGHT"] := "Right"
		settings["V_DLEFT"] := "Left"
		settings["V_ATTACK"] := "k"
		settings["V_SATTACK"] := "l"
		settings["V_GUARD"] := "h"
		settings["V_SKILL"] := "j"
		settings["V_USEITEM"] := "b"
		settings["V_EVENT_ACTION"] := "Enter"
		settings["V_UPOUCH"] := "z"
		settings["V_LPOUCH"] := "x"
		settings["V_RPOUCH"] := "+v"
		settings["V_DPOUCH"] := "+c"
		settings["V_5POUCH"] := "^!+p"
		settings["V_6POUCH"] := "^!^l"
		settings["V_USEBELTSLOT1"] := "F1"
		settings["V_USEBELTSLOT2"] := "F2"
		settings["V_USEBELTSLOT3"] := "F3"
		settings["V_USEBELTSLOT4"] := "F4"
		settings["V_USEBELTSLOT5"] := "F5"
		settings["V_USEBELTSLOT6"] := "F6"
		settings["V_USEBELTSLOT7"] := "F7"
		settings["V_USEBELTSLOT8"] := "F8"
		settings["V_USEBELTSLOT9"] := "F9"
		settings["V_USEBELTSLOT10"]:= "F10"
		settings["V_SWITCHBELTSLOT1"] := "+F1"
		settings["V_SWITCHBELTSLOT2"] := "+F2"
		settings["V_SWITCHBELTSLOT3"] := "+F3"
		settings["V_SWITCHBELTSLOT4"] := "+F4"
		settings["V_SWITCHBELTSLOT5"] := "+F5"
		settings["V_SWITCHBELTSLOT6"] := "+F6"
		settings["V_SWITCHBELTSLOT7"] := "+F7"
		settings["V_SWITCHBELTSLOT8"] := "+F8"
		settings["V_SWITCHBELTSLOT9"] := "+F9"
		settings["V_SWITCHBELTSLOT10"]:= "+F10"
		settings["V_USESPELLSLOT1"] := "1"
		settings["V_USES_SpellSlot2"] := "2"
		settings["V_USES_SpellSlot3"] := "3"
		settings["V_USES_SpellSlot4"] := "4"
		settings["V_USES_SpellSlot5"] := "5"
		settings["V_USES_SpellSlot6"] := "6"
		settings["V_USES_SpellSlot7"] := "7"
		settings["V_USES_SpellSlot8"] := "8"
		settings["V_USES_SpellSlot9"] := "9"
		settings["V_USES_SpellSlot10"] := "0"
		settings["V_SWITCHSPELLSLOT1"] := "+1"
		settings["V_SWITCHS_SpellSlot2"] := "+2"
		settings["V_SWITCHS_SpellSlot3"] := "+3"
		settings["V_SWITCHS_SpellSlot4"] := "+4"
		settings["V_SWITCHS_SpellSlot5"] := "+5"
		settings["V_SWITCHS_SpellSlot6"] := "+6"
		settings["V_SWITCHS_SpellSlot7"] := "+7"
		settings["V_SWITCHS_SpellSlot8"] := "+8"
		settings["V_SWITCHS_SpellSlot9"] := "+9"
		settings["V_SWITCHS_SpellSlot10"] := "+0"
		settings["V_GESTURE1"] := "^1"
		settings["V_GESTURE2"] := "^2"
		settings["V_GESTURE3"] := "^3"
		settings["V_GESTURE4"] := "^4"
		settings["V_GESTURE5"] := "^5"
		settings["V_GESTURE6"] := "^6"
		
		
		this.parseSettings(settingsFile, settings)
		
			
	}
	parseSettings(settingsFile, ByRef settings)
	{
		; read from the ini file and overwrite any of the above values
		IniRead, sectionNames, %settingsFile%
		Loop, Parse, sectionNames , `n
		{
			thisSection := A_LoopField
			IniRead, OutputVarSection, %settingsFile%, %thisSection%
			Loop, Parse, OutputVarSection , `n
			{
				valArr := StrSplit(A_LoopField,"=")
				valArr[1]
				if (valArr[2] == "true") {
					valArr[2] := true
				}
				if (valArr[2] == "false") {
					valArr[2] := false
				}
				settings[valArr[1]] := valArr[2]
			}
		}
	}
    __Delete()
    {
        ToolTip UserSettings deleted
    }
}