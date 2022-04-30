; This moves the dynamic HotKey into a class prototype and lets the entire class contain all 
; subroutine and functions

; going to scope this prototype to see if it will manage the requirements of this application.

; Success it is meeting the scope requirements.  Now we need some utilities in the class to manage
; certain hotkeys and suspend.

; Time to see how to work in meta-data for key states.

class cHotKey 
{
	static aHotKeys
	toggle := 1
	
    __New( ByRef HotKeys, ByRef Actions )
    {
		cHotKey.aHotKeys := {}
		this._addHotkeys( HotKeys, Actions )		
		this._addHotkey( "F2", this, "_toggle", {"type": "obj"}  )
		;this.fHotkey("F1", this, "MsgBox", "foobar")		
	}
	
	__Get(aKey)
    {
        return cHotKey.aHotKeys[aKey]      
    }

    __Set(aKey, aValue)
    {
        cHotKey.aHotKeys[aKey] := aValue
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
	_toggle()
	{
		; global cHotKey.aHotKeys
		
		this.toggle := !this.toggle		
		
		FOR k, v IN cHotKey.aHotKeys			
			IF( !this.toggle &&  k != "F2" )			
				HotKey, %k%, HandleHotkey, off
			ELSE 
				HotKey, %k%, HandleHotkey, on
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
				
				func := % args.label
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
		; global cHotKey.aHotKeys
		
		cHotKey.aHotKeys[hKey] 					:= {}
		cHotKey.aHotKeys[hKey].function 		:= function
		cHotKey.aHotKeys[hKey].arg 				:= arg
		cHotKey.aHotKeys[hKey].obj 				:= obj
		cHotKey.aHotKeys[hKey].enabled 			:= 1					; KeyState: Suspended/On
		cHotKey.aHotKeys[hKey].active 			:= 0					; IsActive: (meaning it's now firing  routine/function
		cHotKey.aHotKeys[hKey].up 				:= 0					; IsUp
		cHotKey.aHotKeys[hKey].down 			:= 0					; IsDown
		cHotKey.aHotKeys[hKey].lastpressed		:= 0					; The last time it was pressed				
		cHotKey.aHotKeys[hKey].animationtime 	:= arg.animationtime 	; 	 
			
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
				MsgBox Not sure yet on references what I want to do.
			return
		}
			
		HandleHotkey:
			; This was a process but finally got it working so many idioms and neuances in AHK I have to over-come.
			
			IF !cHotKey.aHotKeys[A_ThisHotkey].enabled
				Return
	
			IF cHotKey.aHotKeys[A_ThisHotkey].active			; to prevent key spam
				return
				
			IF cHotKey.aHotKeys[A_ThisHotkey].lastpressed > 0
			{
				time := A_Tickcount - cHotKey.aHotKeys[A_ThisHotkey].lastpressed 
				
				IF time < cHotKey.aHotKeys[A_ThisHotkey].animationtime
					return
			}
			
			IF IsObject( cHotKey.aHotKeys[A_ThisHotkey].obj )
			{
				;MsgBox Handling Object HotKey
				o := cHotKey.aHotKeys[A_ThisHotkey].obj
				f := cHotKey.aHotKeys[A_ThisHotkey].function				
				a := cHotKey.aHotKeys[A_ThisHotkey].arg
				
				o[f]( a )										
			}ELSE IF IsFunc( cHotKey.aHotKeys[A_ThisHotkey].function )				
			{
				; MsgBox Attempting to fire function hotkey %A_ThisHotkey% 
				cHotKey.aHotKeys[A_ThisHotkey].function(cHotKey.aHotKeys[A_ThisHotkey].arg)
				
			} ELSE IF IsLabel( cHotKey.aHotKeys[A_ThisHotkey].function )
			{
				Gosub % cHotKey.aHotKeys[A_ThisHotkey].function 
			}				
		Return
	}
}

