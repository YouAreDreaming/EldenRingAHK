#Persistent
class cAutoLock 
{
	
	static oAutoLock
	
    __New( )
    {
		cAutoLock.oAutoLock := {}
		cAutoLock.active := 0		; If AutoLock is active
		cAutoLock.locked := 0		; Won't allow it to turn off.
		cAutoLock.timer := 0		; How Long it's active for a quick AL
		cAutoLock.count := 0		;
		cAutoLock.key := 0		;
		
		return this
		;MsgBox % "AutoLock Class Initiated " cAutoLock.count
	}
	
	__Get(aKey)
    {
        return cAutoLock.oAutoLock[aKey]      
    }

    __Set(aKey, aValue)
    {
        cAutoLock.oAutoLock[aKey] := aValue
        ; NOTE: Using 'return' here would break this.stored_RGB and this.RGB.
    }
	
    __Delete()
    {
				
    }
	
	_timer(tick, aKey)
	{
		global gDebugMessage
		global V_LOCKON						; check if player pressed tab to turn off autolock
		
		
		if cAutoLock.active
		{
			;gDebugMessage := % "AutoLock Active"
 			
			IF !cAutoLock.locked
			{
				
				atime := tick - cAutoLock.timer
				gDebugMessage := % "AutoLock timer:" atime
				IF atime > 2000
					this._end("_timer has ended autolock line 53 at time " atime)
			}ELSE{
			
				IF (aKey == V_LOCKON)
					this._end("Tab key pressed ending AutoLock")
				else {
					gDebugMessage := % "AutoLock Locked:" aKey " vs " cAutoLock.key
				}
				
			}
			
		}
	}
	_keySpam(aKey, o )
	{
		gDebugMessage := % "AutoLock Key Spam"
 			
		IF o.autolock && cAutoLock.active
		{
			IF cAutoLock.count
				{
					cAutoLock.count++
					cAutoLock.locked := true
					gDebugMessage := % "AutoLock Locked: " cAutoLock.count
				}
		}
			
	}
	
	_enableLock(tick)
	{
		global V_LOCKON	
		global V_AutoLock 
		global gDebugMessage 
		
		; Don't send a lock if AL is turned off.
		IF !V_AutoLock
			return 0
		
		IF cAutoLock.locked
			return 0
			
		gDebugMessage := % "AutoLock Sending: " V_LOCKON 		
		this._sendTab()
		
		cAutoLock.timer 	:= tick ; How Long it's active for a quick AL
		
		
	}
	_sendTab()
	{
		global V_LOCKON
		SendInput {%V_LOCKON% down}  
		sleep 60

		SendInput {%V_LOCKON% up}  
		sleep 20
	}
	_start(hKey, oKey, tick)
	{
		global gDebugMessage
		global V_AutoLock 
		
		; Don't send a lock if AL is turned off.
		IF !V_AutoLock
			return 0
			
		gDebugMessage := % "AutoLock Started"
		
		IF !oKey.autolock 
			Return
			
		IF !oKey.enabled
			return
		
		IF cAutoLock.locked
			return
			
		cAutoLock.active 	:= 1				
		cAutoLock.count 	:= cAutoLock.count + 1
		cAutoLock.timer 	:= tick
		cAutoLock.key 		:= hKey
		this._enableLock(tick)
		
	}
	
	_end(msg)
	{
		global gDebugMessage
		cAutoLock.active := ""		; If AutoLock is active
		cAutoLock.locked := ""		; Won't allow it to turn off.
		cAutoLock.timer := 0		; How Long it's active for a quick AL
		cAutoLock.count := 0
		cAutoLock.key 		:= ""
		this._sendTab()
		gDebugMessage := % "" msg
	}
	
}

checkAutoLockStatus()
{
	global gAutoLock
		
		
}
startAutoLock()
{

	global G_HotKeys	
	global gAutoLock
	
	IF !gAutoLock.locked		
		gAutoLock._start(A_ThisHotkey, G_HotKeys[A_ThisHotkey], A_Tickcount)
	else 
		return
	
}         
endAutoLock()
{
	global gAutoLock
	; gAutoLock._end()
}

