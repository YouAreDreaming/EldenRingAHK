#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Persistent
#SingleInstance
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; This moves the dynamic HotKey into a class prototype
global gHotKeys := {}
global cHK

cHK := new cHotKey()

class cHotKey 
{
	
	static aHotKeys := {}
    __New( )
    {
		this.fHotkey("e", "msgbox", "foobar")
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
	
	; https://stackoverflow.com/questions/12851677/dynamically-create-autohotkey-hotkey-to-function-subroutine?msclkid=1675536fc7c911ec9301c69bc06f8213
	fHotkey(hKey, function, arg*) {
	
		global gHotKeys
		
		gHotKeys[hKey] := {}
		gHotKeys[hKey].function := function
		gHotKeys[hKey].arg := arg
		Hotkey, %hKey%, HandleHotkey
		
		HandleHotkey:			; label is now inside function
			gHotKeys[A_ThisHotkey].function(gHotKeys[A_ThisHotkey].arg*)	
		Return
	}
}


MsgBox(args) {
	msg := IsObject(args) ? concat( args ) : args
    msgbox %msg%	
	ExitApp
}
concat( a ){
	c := ""
	for k, v in a 
		c .= v " "
	return c
}