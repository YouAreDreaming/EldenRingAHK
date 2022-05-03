#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent
;#SingleInstance
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; This moves the dynamic HotKey into a class prototype and lets the entire class contain all 
; subroutine and functions

; going to scope this prototype to see if it will manage the requirements of this application.

; Success it is meeting the scope requirements.
 
global gHotKeys := {}  ; unless anything outside of the HotKey class needs access this likely can move to that class.
global cHK

; Settings current associative array structure.
global settings := []
	settings["COMBOS"] := []
	settings["COMBOS"] := []
	settings["GAME"] := [] 
		settings["COMBOS"]["V_JUMPDUALWEILD"]	:= "+e" ; A normal  
		settings["COMBOS"]["V_JUMPSTRONG"]		:= "r" 	; this interrupts 'R' in the menu state.
		settings["GAME"]["V_MOVE_FORWARD"] 		:= "y" 	; movement keys prefer static a::y so dynamic key?

; need to define what these above settings bind to for actions in another reference array
global hkActions := []
hkActions["COMBOS"] 	:= []
hkActions["COMBOS"] 	:= []
hkActions["GAME"] 		:= [] 

; scoping some meta data types
hkActions["COMBOS"]["V_JUMPDUALWEILD"] 	:= { "role": "event", 	"type": "sub", 		"label": "S_JumpDualWeild"	}
hkActions["COMBOS"]["V_JUMPSTRONG"] 	:= { "role": "event", 	"type": "sub",		"label": "S_JumpStrong"		}
hkActions["GAME"]["V_MOVE_FORWARD"] 	:= { "role": "repeat",	"type": "reference", "label": ""	 			}

cHK := new cHotKey( settings, hkActions )

return

class cHotKey 
{
	static aHotKeys := {}
	
    __New( ByRef HotKeys, ByRef Actions )
    {
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
	_addHotkeys( ByRef a, ByRef b )
	{	
		
		for cat, cArr in a
		{		
			for label, hk in cArr
			{
				; to much sadness... it took this relabeling of the string to work in addressing
				; the key of the secondary array reference and I really don't know why b[cat][lable] doesn't work.
				newCat := % cat
				newLabel := % label
				
				
				args := b[newCat][newLabel]
				func := % args.label
				hKey := % hk				; Same problem the hk key reference cannot pass to the function as the key reference so ?? translated/recasted ?? weird man.. weird.
				
				IF func
					this._addHotkey(hKey, "", func, args)
				;else MsgBox No Label for Hot Key skipping %cat% %label%
			}
		}	
	}
	; https://stackoverflow.com/questions/12851677/dynamically-create-autohotkey-hotkey-to-function-subroutine?msclkid=1675536fc7c911ec9301c69bc06f8213
	; f the object is being used as a method, IsObject(method) is true and method contains a reference to the target object. 
	; For example, if x.y refers to this function object, x.y() → this[x]() → this.__Call(x) → this.Call(x).
	_addHotkey( hKey, ByRef obj, ByRef function, arg  ) 
	{
	
		global gHotKeys
		
		gHotKeys[hKey] := {}
		gHotKeys[hKey].function := function
		gHotKeys[hKey].arg := arg
		gHotKeys[hKey].obj := obj
			
			type := % arg.type			
		switch type
		{
			case "obj":
			case "sub":								
				Hotkey, %hKey%, HandleHotkey, On			; to suspend we need to set on					
			return				
			case "reference":
				MsgBox Not sure yet on references what I want to do.
			return
		}
			
		HandleHotkey:
			; This was a process but finally got it working so many idioms and neuances in AHK I have to over-come.
			
			IF IsObject( gHotKeys[A_ThisHotkey].obj )
			{
				o := gHotKeys[A_ThisHotkey].obj
				f := gHotKeys[A_ThisHotkey].function				
				a := gHotKeys[A_ThisHotkey].arg
				
				o[f]( a )										
			}ELSE IF IsFunc( gHotKeys[A_ThisHotkey].function )				
			{
				MsgBox Attempting to fire function hotkey %A_ThisHotkey% 
				gHotKeys[A_ThisHotkey].function(gHotKeys[A_ThisHotkey].arg)
				
			} ELSE IF IsLabel( gHotKeys[A_ThisHotkey].function )
			{
				Gosub % gHotKeys[A_ThisHotkey].function 
			}				
		Return
	}
}

; Jump+Dual-Wield Combo Attack
S_JumpDualWeild:
	MsgBox JumpDualWeild Success!
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
	MsgBox S_JumpStrong Success!
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_SATTACK% down}
   sleep 300
   SendInput {%V_SATTACK% up}
return

ExitApp:
	ExitApp
Return

F1::gosub ExitApp