#Persistent
class C_UserSettings
{
	static aSettings
	
    __New(settingsFile, ByRef settings)
    {
       ; ToolTip, UserSettings Constructed
		; aSettings := []
		
		this.initSettings(settingsFile)
        ;return this  ; This line can be omitted when using the 'new' operator.
    }
	__Get(aKey)
    {
        return C_UserSettings.aSettings[aKey]      
    }

    __Set(aName, aValue)
    {
        C_UserSettings.aSettings := aValue
        ; NOTE: Using 'return' here would break this.stored_RGB and this.RGB.
    }
	initSettings(settingsFile)
	{
		global G_settings
		global V_GUARD
		
		FileInstall, settings.ini, settings.ini, 0
		
		;settings := {}		
					
		G_settings["GAME"] := []
			G_settings["GAME"]["V_MOVE_CONTROL"] := "Backspace" 
			G_settings["GAME"]["V_MOVE_FORWARD"] := "y"		
			G_settings["GAME"]["V_MOVE_BACKWARDS"] := "u" 	
			G_settings["GAME"]["V_MOVE_LEFT"] := "i" 		
			G_settings["GAME"]["V_MOVE_RIGHT"] := "o" 		
			G_settings["GAME"]["V_DODGE"] := "p"
			G_settings["GAME"]["V_JUMP"] := "Space"
			G_settings["GAME"]["V_CROUCH"] := "t"
			G_settings["GAME"]["V_CAMUP"] := "s"
			G_settings["GAME"]["V_CAMDOWN"] := "s"
			G_settings["GAME"]["V_CAMLEFT"] := "+z"
			G_settings["GAME"]["V_CAMRIGHT"] := "+x"
			G_settings["GAME"]["V_LOCKON"] := "Tab"
			G_settings["GAME"]["V_DUP"] := "Up"
			G_settings["GAME"]["V_DDOWN"] := "Down"
			G_settings["GAME"]["V_DRIGHT"] := "Right"
			G_settings["GAME"]["V_DLEFT"] := "Left"
			G_settings["GAME"]["V_ATTACK"] := "k"
			G_settings["GAME"]["V_SATTACK"] := "l"
			G_settings["GAME"]["V_GUARD"] := "h"
			G_settings["GAME"]["V_SKILL"] := "j"
			G_settings["GAME"]["V_USEITEM"] := "b"
			G_settings["GAME"]["V_EVENT_ACTION"] := "Enter"
			
		G_settings["COMBOS"] := []
			G_settings["COMBOS"]["V_AUTORUN"]:="n"
			G_settings["COMBOS"]["V_PARRY"]:="a"
			G_settings["COMBOS"]["V_2H_LEFT"]:="+a"
			G_settings["COMBOS"]["V_2H_RIGHT"]:="+s"
			G_settings["COMBOS"]["V_LEFTARMEMENT"]:="+d"
			G_settings["COMBOS"]["V_RIGHTARMEMENT"]:="+f"
			G_settings["COMBOS"]["V_JUMPDUALWEILD"]:="+e"
			G_settings["COMBOS"]["V_CROUCH"]:="w"
			G_settings["COMBOS"]["V_JUMPATTACK"]:="e"
			G_settings["COMBOS"]["V_JUMPSTRONG"]:="r"
			
			

		G_settings["POUCH"] := []
			G_settings["POUCH"]["V_UPOUCH"] := "z"
			G_settings["POUCH"]["V_LPOUCH"] := "x"
			G_settings["POUCH"]["V_RPOUCH"] := "+v"
			G_settings["POUCH"]["V_DPOUCH"] := "+c"
			G_settings["POUCH"]["V_5POUCH"] := "^!+p"		; Left these as junk keys as not using currently still locked.
			G_settings["POUCH"]["V_6POUCH"] := "^!+l"		; yet junk keys.. 
		
		G_settings["BELT"] := []
			G_settings["BELT"]["V_USEBELTSLOT1"] := "F1"
			G_settings["BELT"]["V_USEBELTSLOT2"] := "F2"
			G_settings["BELT"]["V_USEBELTSLOT3"] := "F3"
			G_settings["BELT"]["V_USEBELTSLOT4"] := "F4"
			G_settings["BELT"]["V_USEBELTSLOT5"] := "F5"
			G_settings["BELT"]["V_USEBELTSLOT6"] := "F6"
			G_settings["BELT"]["V_USEBELTSLOT7"] := "F7"
			G_settings["BELT"]["V_USEBELTSLOT8"] := "F8"
			G_settings["BELT"]["V_USEBELTSLOT9"] := "F9"
			G_settings["BELT"]["V_USEBELTSLOT10"]:= "F10"
			G_settings["BELT"]["V_SWITCHBELTSLOT1"] := "+F1"
			G_settings["BELT"]["V_SWITCHBELTSLOT2"] := "+F2"
			G_settings["BELT"]["V_SWITCHBELTSLOT3"] := "+F3"
			G_settings["BELT"]["V_SWITCHBELTSLOT4"] := "+F4"
			G_settings["BELT"]["V_SWITCHBELTSLOT5"] := "+F5"
			G_settings["BELT"]["V_SWITCHBELTSLOT6"] := "+F6"
			G_settings["BELT"]["V_SWITCHBELTSLOT7"] := "+F7"
			G_settings["BELT"]["V_SWITCHBELTSLOT8"] := "+F8"
			G_settings["BELT"]["V_SWITCHBELTSLOT9"] := "+F9"
			G_settings["BELT"]["V_SWITCHBELTSLOT10"]:= "+F10"
		
		G_settings["SPELL"] := []
			G_settings["SPELL"]["V_USESPELLSLOT1"] := "1"
			G_settings["SPELL"]["V_USES_SpellSlot2"] := "2"
			G_settings["SPELL"]["V_USES_SpellSlot3"] := "3"
			G_settings["SPELL"]["V_USES_SpellSlot4"] := "4"
			G_settings["SPELL"]["V_USES_SpellSlot5"] := "5"
			G_settings["SPELL"]["V_USES_SpellSlot6"] := "6"
			G_settings["SPELL"]["V_USES_SpellSlot7"] := "7"
			G_settings["SPELL"]["V_USES_SpellSlot8"] := "8"
			G_settings["SPELL"]["V_USES_SpellSlot9"] := "9"
			G_settings["SPELL"]["V_USES_SpellSlot10"] := "0"
			G_settings["SPELL"]["V_SWITCHSPELLSLOT1"] := "+1"
			
			G_settings["SPELL"]["V_SWITCHS_SpellSlot2"] := "+2"
			G_settings["SPELL"]["V_SWITCHS_SpellSlot3"] := "+3"
			G_settings["SPELL"]["V_SWITCHS_SpellSlot4"] := "+4"
			G_settings["SPELL"]["V_SWITCHS_SpellSlot5"] := "+5"
			G_settings["SPELL"]["V_SWITCHS_SpellSlot6"] := "+6"
			G_settings["SPELL"]["V_SWITCHS_SpellSlot7"] := "+7"
			G_settings["SPELL"]["V_SWITCHS_SpellSlot8"] := "+8"
			G_settings["SPELL"]["V_SWITCHS_SpellSlot9"] := "+9"
			G_settings["SPELL"]["V_SWITCHS_SpellSlot10"] := "+0"
			 
		G_settings["SPELLHAND"] := []
			G_settings["SPELLHAND"]["V_SPELLHAND1"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND2"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND3"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND4"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND5"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND6"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND7"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND8"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND9"] := V_GUARD
			G_settings["SPELLHAND"]["V_SPELLHAND10"] := V_GUARD
		
		G_settings["GESTURES"] := []
			G_settings["GESTURES"]["V_GESTURE1"] := "Numpad7"
			G_settings["GESTURES"]["V_GESTURE2"] := "Numpad8"
			G_settings["GESTURES"]["V_GESTURE3"] := "Numpad9"
			G_settings["GESTURES"]["V_GESTURE4"] := "Numpad4"
			G_settings["GESTURES"]["V_GESTURE5"] := "Numpad5"
			G_settings["GESTURES"]["V_GESTURE6"] := "Numpad6"
			
		G_settings["TOGGLE"] := []
			G_settings["TOGGLE"]["V_TOGGLESPELLHAND"]	:="^+z"
			G_settings["TOGGLE"]["V_TOGGLEDEBUG"]		:="^+!d"
			G_settings["TOGGLE"]["V_TOGGLEAUTOLOCK"]	:="^+!s"
			G_settings["TOGGLE"]["V_TOGGLEAUTORUN"]		:="^+!r"
		; Config is likely not applicable for this data-set... 
		; This class is more specific to User HotKey G_settings, not application G_settings.
		G_settings["CONFIG"] := []
			G_settings["CONFIG"]["V_SPELL_SLOTS"] 		:= "8"  ; not a hot key...
			G_settings["CONFIG"]["V_BELT_SLOTS"] 		:= "10" ; not a hot key...	
			G_settings["CONFIG"]["V_AutoRun"] 			:= 1	; Toggle AutoRun on off V_TOGGLEAUTORUN
			G_settings["CONFIG"]["V_AutoLock"] 			:= 1	; V_TOGGLEAUTOLOCK			
		
		;C_UserSettings.aSettings := settings
		; viewArray( G_Settings )
		this.parseSettings(settingsFile)					
	}
	
	submitIniChanges( rArray, sectionName )
	{
		;this.viewArray( rArray )
		For skey, svalue in rArray{
			IniWrite, %svalue%, %A_ScriptDir%\settings.ini, %sectionName%, %skey%
			this.setKNVal(sectionName, skey, svalue )
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
	setKNVal( k, n, v )
	{
		global G_settings			
		G_settings[k][n] := v
	}
	setGVal( vLabel, value )
	{
		%vLabel% := value
	}
	parseSettings(settingsFile)
	{
		global G_settings
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
					
				this.setKNVal(thisSection, valArr[1], valArr[2] )
				this.setGVal( valArr[1], valArr[2] )
			}
		}
	}
    __Delete()
    {
        ; ToolTip UserSettings deleted		
    }
}