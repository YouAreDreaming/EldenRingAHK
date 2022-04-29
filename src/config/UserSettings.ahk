#Persistent
class C_UserSettings
{
	static aSettings
	
    __New(settingsFile, ByRef settings)
    {
        ToolTip, UserSettings Constructed
		; settings := []
		
		this.initSettings(settingsFile, settings)
        ;return this  ; This line can be omitted when using the 'new' operator.
    }
	__Get()
    {
        return C_UserSettings.aSettings      
    }

    __Set(aName, aValue)
    {
        C_UserSettings.aSettings := aValue
        ; NOTE: Using 'return' here would break this.stored_RGB and this.RGB.
    }
	initSettings(settingsFile, ByRef settings)
	{
		FileInstall, settings.ini, settings.ini, 0
		
		settings := {}		
					
		settings["GAME"] := []
			settings["GAME"]["V_MOVE_CONTROL"] := "Backspace" 
			settings["GAME"]["V_MOVE_FORWARD"] := "y"		
			settings["GAME"]["V_MOVE_BACKWARDS"] := "u" 	
			settings["GAME"]["V_MOVE_LEFT"] := "i" 		
			settings["GAME"]["V_MOVE_RIGHT"] := "o" 		
			settings["GAME"]["V_DODGE"] := "p"
			settings["GAME"]["V_JUMP"] := "Space"
			settings["GAME"]["V_CROUCH"] := "t"
			settings["GAME"]["V_CAMUP"] := "s"
			settings["GAME"]["V_CAMDOWN"] := "s"
			settings["GAME"]["V_CAMLEFT"] := "+z"
			settings["GAME"]["V_CAMRIGHT"] := "+x"
			settings["GAME"]["V_LOCKON"] := "tab"
			settings["GAME"]["V_DUP"] := "Up"
			settings["GAME"]["V_DDOWN"] := "Down"
			settings["GAME"]["V_DRIGHT"] := "Right"
			settings["GAME"]["V_DLEFT"] := "Left"
			settings["GAME"]["V_ATTACK"] := "k"
			settings["GAME"]["V_SATTACK"] := "l"
			settings["GAME"]["V_GUARD"] := "h"
			settings["GAME"]["V_SKILL"] := "j"
			settings["GAME"]["V_USEITEM"] := "b"
			settings["GAME"]["V_EVENT_ACTION"] := "Enter"
			
		settings["COMBOS"] := []
			settings["COMBOS"]["V_AUTORUN"]:="n"
			settings["COMBOS"]["V_PARRY"]:="a"
			settings["COMBOS"]["V_2H_LEFT"]:="+a"
			settings["COMBOS"]["V_2H_RIGHT"]:="+s"
			settings["COMBOS"]["V_LEFTARMEMENT"]:="+d"
			settings["COMBOS"]["V_RIGHTARMEMENT"]:="+f"
			settings["COMBOS"]["V_JUMPDUALWEILD"]:="+e"
			settings["COMBOS"]["V_CROUCH"]:="w"
			settings["COMBOS"]["V_JUMP"]:="e"
			settings["COMBOS"]["V_JUMPSTRONG"]:="r"
			settings["COMBOS"]["V_TOGGLESPELLHAND"]:="^+z"
			settings["COMBOS"]["V_TOGGLEDEBUG"]:="^+!d"

		settings["POUCH"] := []
			settings["POUCH"]["V_UPOUCH"] := "z"
			settings["POUCH"]["V_LPOUCH"] := "x"
			settings["POUCH"]["V_RPOUCH"] := "+v"
			settings["POUCH"]["V_DPOUCH"] := "+c"
			settings["POUCH"]["V_5POUCH"] := "^!+p"
			settings["POUCH"]["V_6POUCH"] := "^!^l"
		
		settings["BELT"] := []
			settings["BELT"]["V_USEBELTSLOT1"] := "F1"
			settings["BELT"]["V_USEBELTSLOT2"] := "F2"
			settings["BELT"]["V_USEBELTSLOT3"] := "F3"
			settings["BELT"]["V_USEBELTSLOT4"] := "F4"
			settings["BELT"]["V_USEBELTSLOT5"] := "F5"
			settings["BELT"]["V_USEBELTSLOT6"] := "F6"
			settings["BELT"]["V_USEBELTSLOT7"] := "F7"
			settings["BELT"]["V_USEBELTSLOT8"] := "F8"
			settings["BELT"]["V_USEBELTSLOT9"] := "F9"
			settings["BELT"]["V_USEBELTSLOT10"]:= "F10"
			settings["BELT"]["V_SWITCHBELTSLOT1"] := "+F1"
			settings["BELT"]["V_SWITCHBELTSLOT2"] := "+F2"
			settings["BELT"]["V_SWITCHBELTSLOT3"] := "+F3"
			settings["BELT"]["V_SWITCHBELTSLOT4"] := "+F4"
			settings["BELT"]["V_SWITCHBELTSLOT5"] := "+F5"
			settings["BELT"]["V_SWITCHBELTSLOT6"] := "+F6"
			settings["BELT"]["V_SWITCHBELTSLOT7"] := "+F7"
			settings["BELT"]["V_SWITCHBELTSLOT8"] := "+F8"
			settings["BELT"]["V_SWITCHBELTSLOT9"] := "+F9"
			settings["BELT"]["V_SWITCHBELTSLOT10"]:= "+F10"
		
		settings["SPELL"] := []
			settings["SPELL"]["V_USESPELLSLOT1"] := "1"
			settings["SPELL"]["V_USES_SpellSlot2"] := "2"
			settings["SPELL"]["V_USES_SpellSlot3"] := "3"
			settings["SPELL"]["V_USES_SpellSlot4"] := "4"
			settings["SPELL"]["V_USES_SpellSlot5"] := "5"
			settings["SPELL"]["V_USES_SpellSlot6"] := "6"
			settings["SPELL"]["V_USES_SpellSlot7"] := "7"
			settings["SPELL"]["V_USES_SpellSlot8"] := "8"
			settings["SPELL"]["V_USES_SpellSlot9"] := "9"
			settings["SPELL"]["V_USES_SpellSlot10"] := "0"
			settings["SPELL"]["V_SWITCHSPELLSLOT1"] := "+1"
			settings["SPELL"]["V_SWITCHS_SpellSlot2"] := "+2"
			settings["SPELL"]["V_SWITCHS_SpellSlot3"] := "+3"
			settings["SPELL"]["V_SWITCHS_SpellSlot4"] := "+4"
			settings["SPELL"]["V_SWITCHS_SpellSlot5"] := "+5"
			settings["SPELL"]["V_SWITCHS_SpellSlot6"] := "+6"
			settings["SPELL"]["V_SWITCHS_SpellSlot7"] := "+7"
			settings["SPELL"]["V_SWITCHS_SpellSlot8"] := "+8"
			settings["SPELL"]["V_SWITCHS_SpellSlot9"] := "+9"
			settings["SPELL"]["V_SWITCHS_SpellSlot10"] := "+0"
		
		settings["GESTURES"] := []
			settings["GESTURES"]["V_GESTURE1"] := "^1"
			settings["GESTURES"]["V_GESTURE2"] := "^2"
			settings["GESTURES"]["V_GESTURE3"] := "^3"
			settings["GESTURES"]["V_GESTURE4"] := "^4"
			settings["GESTURES"]["V_GESTURE5"] := "^5"
			settings["GESTURES"]["V_GESTURE6"] := "^6"
		; Config is likely not applicable for this data-set... 
		; This class is more specific to User HotKey settings, not application settings.
		settings["CONFIG"] := []
			settings["CONFIG"]["V_SPELL_SLOTS"] := "8"  ; not a hot key...
			settings["CONFIG"]["V_BELT_SLOTS"] := "10"  ; not a hot key...
			settings["CONFIG"]["V_DEBUG"] := "0"  		; not a hot key...
			settings["CONFIG"]["V_SetSpellSlots"] := "^+1"
			settings["CONFIG"]["V_SetBeltSlots"] := "^+2"
			settings["CONFIG"]["V_debugGui"] := "^+d"
		
		C_UserSettings.aSettings := settings
		; viewArray( C_UserSettings.aSettings )
		this.parseSettings(settingsFile, settings)					
	}
	
	submitIniChanges( rArray, sectionName )
	{
		;this.viewArray( rArray )
		For skey, svalue in rArray{
		IniWrite, %svalue%, %A_ScriptDir%\settings.ini, %sectionName%, %skey%
		}
	}
	viewArray( dArray )
	{
		FOR dK, Dv in dArray
		{
			Tooltip, % "Key: " dK "Value: " Dv
				sleep 500
		}
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
				settings[sectionNames][valArr[1]] := valArr[2]
			}
		}
	}
    __Delete()
    {
        ToolTip UserSettings deleted		
    }
}