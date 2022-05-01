; This moves the dynamic HotKey into a class prototype and lets the entire class contain all 
; subroutine and functions

; going to scope this prototype to see if it will manage the requirements of this application.

; Success it is meeting the scope requirements.  Now we need some utilities in the class to manage
; certain hotkeys and suspend.

; Time to see how to work in meta-data for key states.


class cHotKey 
{
	static aHotKey	
	
    __New( ByRef HotKeys, ByRef Actions )
    {
		
		this._addHotkeys( HotKeys, Actions)		
		; this._addHotkey( "^!+q", this, "_toggle", {"type": "obj"})
		;this.fHotkey("F1", this, "MsgBox", "foobar")		
	}
	
	__Get(aKey)            
    {
		global G_HotKeys
		return G_HotKeys[aKey]  
    }

    __Set(aKey, aValue)
    {
		global G_HotKeys
        G_HotKeys[aKey] := aValue
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
		; MsgBox, cHotKeys has been baleted			
    }
	
	getHotkey()
	{
		global G_HotKeys
		
		return G_HotKeys[A_ThisHotkey]
		;
		;IF A_ThisHotkey IN cHotKey.aHotKeys
		;{
		;	MsgBox Found Key %A_ThisHotkey%
	;		return cHotKey.aHotKeys[A_ThisHotkey]
	;	}
	;	ELSE 
	;		MsgBox Not Found %A_ThisHotkey%
	;		return 0
			
		;return CHotKey.aHotKey[getHotkey(A_ThisHotkey)]
		
	}
	_toggle()
	{
		; global cHotKey.aHotKeys
		global G_HotKeys
		global hotKeytoggle
		global gDebugMessage
		
		hotKeytoggle := (hotKeytoggle) ? 0 : 1  ; apparently toggling this way isn't working... wow what a suprise.
		
		
		FOR k, v IN G_HotKeys			
			IF( !hotKeytoggle )			
				HotKey, %k%, HandleHotkey, off
			ELSE 
				HotKey, %k%, HandleHotkey, on
				
				state := ( hotKeytoggle ) ? "ACTIVE" : "DEACTIVATED"
				gDebugMessage := % "HotKeys Status: " state
	}
	_getVal( k1, k2, a )
	{
		return a[k1][k2]
	}
	_addHotkeys( ByRef a, ByRef b )
	{	
		aB = ""
		args = ""
		
		for cat, cArr in a
		{	
			for label, hk in cArr
			{
				; to much sadness... it took this relabeling of the string to work in addressing
				; the key of the secondary array reference and I really don't know why b[cat][lable] doesn't work.
				;newCat 		:= % cat
				;newLabel 	:= % label
				; Don't ask me why... but passing these into another function makes it work... ???? interpreter issues likely fixed in V2?
				args := this._getVal( cat,label, b )
				
				func := % args.label		; work
				hKey := % hk				; Same problem the hk key reference cannot pass to the function as the key reference so ?? translated/recasted ?? weird man.. weird.
				; MsgBox Testing If Function %func%
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
		global G_HotKeys
		global gDebugMessage
		global G_AutoLock
		
		G_HotKeys[hKey] 				:= {}
		G_HotKeys[hKey].function 		:= function
		G_HotKeys[hKey].arg 			:= arg
		G_HotKeys[hKey].obj 			:= obj
		G_HotKeys[hKey].enabled 		:= 1					; KeyState: Suspended/On
		G_HotKeys[hKey].active 			:= 0					; IsActive: (meaning it's now firing  routine/function
		G_HotKeys[hKey].up 				:= 0					; IsUp
		G_HotKeys[hKey].down 			:= 0					; IsDown
		G_HotKeys[hKey].lastpressed		:= 0					; The last time it was pressed				
		G_HotKeys[hKey].animationtime 	:= arg.animationtime 	; 
		G_HotKeys[hKey].autolock 		:= arg.autolock 		; 		
			
		type := % arg.type
		
		switch type
		{
			case "obj":
				Hotkey, %hKey%, HandleHotkey, On
			return
			case "func":
				Hotkey, %hKey%, HandleHotkey, On
			return
			case "sub":	
				Hotkey, %hKey%, HandleHotkey, On			; to suspend we need to set on	
			return				
			case "reference":
			Hotkey, %hKey%, ON
				;MsgBox Not sure yet on references what I want to do.
			return
		}
			
		HandleHotkey:
			; This was a process but finally got it working so many idioms and neuances in AHK I have to over-come.
			gDebugMessage := ""
			
			IF !G_HotKeys[A_ThisHotkey].enabled
			{
				gDebugMessage := % "Hot key not enabled: " A_ThisHotkey
				Return
			}
			IF G_HotKeys[A_ThisHotkey].active			; to prevent key spam
			{
				gDebugMessage := % "Hotkey paused for in game animation cycle: " A_ThisHotkey
				return
			}
				
			IF G_HotKeys[A_ThisHotkey].lastpressed > 0
			{
				ptime := A_Tickcount - G_HotKeys[A_ThisHotkey].lastpressed 
				atime := G_HotKeys[A_ThisHotkey].animationtime * 1
				
				IF (ptime < atime)
				{
					gDebugMessage := % "Hotkey paused animation cycle in progress: " ptime " < " atime
					return
				}ELSE {
					G_HotKeys[A_ThisHotkey].lastpressed = 0
				}
			}
			
			IF (G_AutoLock==1) && (G_HotKeys[A_ThisHotkey].autolock==1)
				gosub S_AutoLock
				
			IF IsObject( G_HotKeys[A_ThisHotkey].obj )
			{
				;MsgBox Handling Object HotKey
				o := G_HotKeys[A_ThisHotkey].obj
				f := G_HotKeys[A_ThisHotkey].function				
				a := G_HotKeys[A_ThisHotkey].arg
				
				o[f]( a )										
			}ELSE IF IsFunc( G_HotKeys[A_ThisHotkey].function )				
			{
				; MsgBox Attempting to fire function hotkey %A_ThisHotkey% 
				G_HotKeys[A_ThisHotkey].function(G_HotKeys[A_ThisHotkey].arg)
				
			} ELSE IF IsLabel( G_HotKeys[A_ThisHotkey].function )
			{
				Gosub % G_HotKeys[A_ThisHotkey].function 
			}

			IF (G_AutoLock==1) && (G_HotKeys[A_ThisHotkey].autolock==1)
			{
				; need to wait x time for animation to start before unlocking
				sleep 1500
				gosub S_AutoLock			
			}
		Return
	}
}

