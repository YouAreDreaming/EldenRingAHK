#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
global 
class C_HotKey 
{
	
	static aHotKeys := {}
    __New( rHotKeys )
    {
		
	}
	
	__Get(aKey)
    {
        return aHotKeys.aHotKeys[aKey]      
    }

    __Set(aKey, aValue)
    {
        aHotKeys.aHotKeys[aKey] := aValue
        ; NOTE: Using 'return' here would break this.stored_RGB and this.RGB.
    }
	
    __Delete()
    {
		MsgBox, cHotKeys has been baleted		
    }
	_
}
; Turns out loading in classes with subroutines will break auto-execution zones
;ButtonOK:
;	C_Gui.bActive := !C_Gui.bActive	
; return
