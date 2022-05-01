S_ToggleDebug:
	V_DEBUG := !V_DEBUG
	IF V_DEBUG
		gosub S_debugGui
return


; Just a simple function to send data to a blank notepad++ page for real-time debugging
logNp(msg)
{
   global V_DEBUG
   if( V_DEBUG == 1 ) {
		ControlSend, Scintilla1, % "`r`n" msg , ahk_class Notepad++
   }
}

S_debugGui:

	CustomColor := "EEAA99"  ; Can be any RGB color (it will be made transparent below).
	
	Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
	Gui, Color, %CustomColor%
	Gui, Font, s16  ; Set a large font size (32-point).
	Gui, Add, Text, vGuiActiveText cLime, Game D-Pad GUI State: XXXXXXXX
	Gui, Add, Text, vGUIFadeText cLime, GUI Fades in: XXXXXXXX
	Gui, Add, Text, vLastKeyTimeText cLime, Time New Key Pressed: XXXXXXXX
	Gui, Add, Text, vSpellSlotText cLime, Current Spell Slot: xx
	Gui, Add, Text, vBeltSlotText cLime, Current Belt Slot: xx
	Gui, Add, Text, vSpellArmText cLime, Spell Arm:: xxxx
	Gui, Add, Text, vLastKeyText cLime, Last Key Pressed: xxxx
	
	Gui, Add, Text, venabledText cLime, Enabled: xxxxx
	Gui, Add, Text, vactiveText cLime, active: xxxxx
	Gui, Add, Text, vupText cLime, up: xxxxx
	Gui, Add, Text, vdownText cLime, down: xxxxx
	Gui, Add, Text, vlastpressedText cLime, lastpressed: xxxxxx
	Gui, Add, Text, vanimationtimeText cLime, animationtime: xxxxxx
	
	Gui, Add, Text, vmessageText cLime, This area will display messages for debugging xxxxxxxxxx
	
	;FOR k,v IN kd
	;{
		;MsgBox %k%
		
		;label := v%k%
		
		;Gui, Add, Text, label cLime, % k " : xxxx"
	;}
	
	;V_BSReset = 0 				; A boolean to track spell slot reset if it goes out of sync on any button press.
	;V_BBReset = 0 				; A boolean to track belt slot reset if it goes out of sync on any button press.

	 := 0	
	; Make all pixels of this color transparent and make the text itself translucent (150):
	WinSet, TransColor, %CustomColor% 150
	SetTimer, UpdateOSD, 10
	Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer.
	Gui, Show, x0 y400 NoActivate  ; NoActivate avoids deactivating the currently active window.
	return

UpdateOSD:

	mtime:=A_Tickcount - V_Gui_Active
	bNewKey := ( V_LastKey != A_ThisHotkey ) ? 1 : 0
	
	if( bNewKey )
	{
		V_LastKeyTime := mtime
		V_LastKey := A_ThisHotkey	
	}
	
	osdK := G_HotKeys[A_ThisHotkey]		
	;nTime:= A_Tickcount - osdK.lastpressed
	lvenabled := (osdK.enabled) ? "YES" : "NO" 			
	lvactive := (osdK.active) ? "YES" : "NO" 			 			
	lvup := (osdK.up) ? "YES" : "NO" 			 				
	lvdown := (osdK.down) ? "YES" : "NO" 			 			
	lvlastpressed := A_Tickcount - osdK.lastpressed
	lvanimationtime := osdK.animationtime
	
	GuiControl,, GuiActiveText, % "Game D-Pad GUI State: " mtime
	GuiControl,, GUIFadeText, % "GUI Fades in: " V_GUIFade	
	GuiControl,, LastKeyTimeText, % "Time New Key Pressed: " V_LastKeyTime	
	GuiControl,, SpellSlotText, % "Current Spell Slot: " V_SpellSlot
	GuiControl,, BeltSlotText, % "Current Belt Slot: " V_BeltSlot
	GuiControl,, SpellArmText, % "Spell Arm:" V_ToggleSpell
	GuiControl,, LastKeyText, % "Last HotKey Pressed:" A_ThisHotkey
	
	; kd = % C_HotKeys.getHotkey(A_ThisHotkey, cHotKey.aHotKeys)

	
	GuiControl,, enabledText, % "Enabled: " lvenabled
	GuiControl,, activeText, % "active: " lvactive
	GuiControl,, upText, % "up: " lvup
	GuiControl,, downText, % "down: " lvdown
	GuiControl,, lastpressedText, % "lastpressed: " lvlastpressed
	GuiControl,, animationtimeText, % "animationtime: " lvanimationtime
	
	GuiControl,, messageText, % " " gDebugMessage
	
	
		
	
return

;GuiClose(hWnd) {
;    WinGetTitle, windowTitle, ahk_id %hWnd%
;    MsgBox, The Gui with title "%windowTitle%" is going to be closed! This script will exit afterwards!
;    ExitApp
;}