#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Persistent
#SingleInstance
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; This moves the dynamic HotKey into a class prototype and lets the entire class contain all 
; subroutine and functions

global G_HotKeys := {}
global cHK

cHK := new cHotKey()
class cHotKey 
{
	
	static aHotKeys := {}
    __New( )
    {
		this.fHotkey("F1", this, "MsgBox", "foobar")
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
	
	; https://stackoverflow.com/questions/12851677/dynamically-create-autohotkey-hotkey-to-function-subroutine?msclkid=1675536fc7c911ec9301c69bc06f8213
	; f the object is being used as a method, IsObject(method) is true and method contains a reference to the target object. 
	; For example, if x.y refers to this function object, x.y() → this[x]() → this.__Call(x) → this.Call(x).
	fHotkey(hKey, ByRef obj, ByRef function, arg*) {
	
		global G_HotKeys
		
		G_HotKeys[hKey] := {}
		G_HotKeys[hKey].function := function
		G_HotKeys[hKey].arg := arg
		G_HotKeys[hKey].obj := obj
		
		Hotkey, %hKey%, HandleHotkey
		
		HandleHotkey:			; label is now inside function
		
			IF IsObject( G_HotKeys[A_ThisHotkey].obj )
			{
				o := G_HotKeys[A_ThisHotkey].obj
				f := G_HotKeys[A_ThisHotkey].function				
				a := G_HotKeys[A_ThisHotkey].arg
				
				o[f]( a )			; this shorthand version worked... joy.
				
				
				;IF IsFunc( f )
				;	Msgbox %f% Is a function
				;Else
				;	MsgBox %f% Is not a function
				; tried all the variants of x.y() → this[x]() → this.__Call(x) → this.Call(x) here
				; nothing worked so used variable expressions above and that worked.  
				;G_HotKeys[A_ThisHotkey].ref[G_HotKeys[A_ThisHotkey].function]( "Hello" )
				;G_HotKeys[A_ThisHotkey].ref.G_HotKeys[A_ThisHotkey].function( G_HotKeys[A_ThisHotkey].arg )				
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


