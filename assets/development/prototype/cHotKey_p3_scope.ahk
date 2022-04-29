#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Persistent
#SingleInstance
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; This moves the dynamic HotKey into a class prototype and lets the entire class contain all 
; subroutine and functions

; going to scope this prototype to see if it will manage the requirements of this application.

global gHotKeys := {}  ; unless anything outside of the HotKey class needs access this likely can move to that class.
global cHK
; Settings current associative array structure.
global settings := []
	settings["COMBOS"] := []
	settings["COMBOS"] := []
	settings["GAME"] := []
		settings["COMBOS"]["V_JUMPDUALWEILD"]:="+e"
		settings["COMBOS"]["V_JUMPSTRONG"]:="r" ; this interrupts 'R' in the menu state.
		settings["GAME"]["V_MOVE_FORWARD"] := "y" ; movement keys prefer static a::y so dynamic key?

; need to define what these above settings bind to for actions in another reference array
global hkActions := []
hkActions["COMBOS"] := [{ "type":"action" }]
hkActions["COMBOS"] := [{ "type":"action" }]
hkActions["GAME"] := [{ "type":"ref" }]

cHK := new cHotKey(settings,hkActions )

return
class cHotKey 
{
	
	static aHotKeys := {}
    __New( ByRef HotKeys, ByRef Actions )
    {
		;this.fHotkey("F1", this, "MsgBox", "foobar")
		
		this._addHotkeys( HotKeys, Actions )
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
	__Call( method, args* )
	{
		 if (method = "")
            return this.Call(args*)
        if (IsObject(method))
            return this.Call(method, args*)    
	}
    __Delete()
    {
		MsgBox, cHotKeys has been baleted			
    }
	_addHotkeys( ByRef a, b )
	{	
		for key, vars in a
		{			
			act := b[key]
			for k, v in vars
			{
				MsgBox %key% HK: %v%
			}
		}	
	}
	; https://stackoverflow.com/questions/12851677/dynamically-create-autohotkey-hotkey-to-function-subroutine?msclkid=1675536fc7c911ec9301c69bc06f8213
	; f the object is being used as a method, IsObject(method) is true and method contains a reference to the target object. 
	; For example, if x.y refers to this function object, x.y() → this[x]() → this.__Call(x) → this.Call(x).
	_addHotkey( hKey, ByRef obj, ByRef function, arg*  ) 
	{
	
		global gHotKeys
		
		gHotKeys[hKey] := {}
		gHotKeys[hKey].function := function
		gHotKeys[hKey].arg := arg
		gHotKeys[hKey].obj := obj
		
		Hotkey, %hKey%, HandleHotkey, On			; to suspend we need to set on
		
		HandleHotkey:			; label is now inside function
		
			IF IsObject( gHotKeys[A_ThisHotkey].obj )
			{
				o := gHotKeys[A_ThisHotkey].obj
				f := gHotKeys[A_ThisHotkey].function				
				a := gHotKeys[A_ThisHotkey].arg
				
				o[f]( a )										
			}			
			ELSE 
				MsgBox %ref% is not an object reference
			
			
		Return
	}
	MsgBox(args) {
		msg := IsObject(args) ? this.concat( args ) : args
		msgbox %msg%	
	ExitApp
	}
	concat( a ){
		c := ""
		for k, v in a 
			c .= v " "
		return c
	}
}

; Jump+Dual-Wield Combo Attack
S_JumpDualWeild:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_GUARD% down}
   sleep 25
   SendInput {%V_GUARD% up}
return
 
; Jump+Strong+Attack
S_JumpStrong:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_SATTACK% down}
   sleep 300
   SendInput {%V_SATTACK% up}
return