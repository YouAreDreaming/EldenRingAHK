;----- Elden Ring AutoHotKey Overhaul V0.3
;----- see Readme.md for more info

;---- v0.4 features, requirements, bugs and scope.
;---- To move all user-settings to external files to better support future versions.
;---- Organize code into more managable components and external files.
;---- Toggle off hotkeys when menus are accessed and enabled when the main game resumes.
;---- QA v0.3 for any bugs that can be addressed in v0.4
;---- Adapting some nomenclature for the subroutines, functions, global variables, variables.
;---- G_ 	Global Variable
;---- V_ 	Variable
;---- S_  	Subroutine
;---- F_ 	function
;---- C_    class

global version := "0.5" ; currently working on v0.5

;--- Do not include any scripts that have hotkeys, subroutines (return) in the Auto-Execution area.
#include %A_ScriptDir%\config\globalVariables.ahk
#include %A_ScriptDir%\config\UserSettings.ahk
#include %A_ScriptDir%\ui\Gui.ahk

#SingleInstance Force
#Persistent
#NoEnv
#Warn
#MaxHotkeysPerInterval 200
#HotkeyInterval 2000
;#KeyHistory 0					; enable when not debugging
;ListLines Off					; turn off for production not debugging.
Process, Priority, , A			; sets a higher priority affinity to help reduce input latency
SetBatchLines, -1				; Testing if turning off sleep will reduce input latency
;SetKeyDelay, -1, -1			; Elden Ring uses DirectX so a 15ms polling should exist.
;SetMouseDelay, -1				; Likely a 10ms sleep is needed but here for testing.
SetDefaultMouseSpeed, 0			; 0 is the fastest setting for mouse movement.
;SetWinDelay, -1				; Here more for reference and testing.
SetControlDelay, 0				; 0 is the recommmended lowest setting  https://www.autohotkey.com/docs/commands/SetControlDelay.htm
SendMode Input

SetWorkingDir %A_ScriptDir%
SendMode InputThenPlay

; going to define all global variables with a preceeding G_ as functions need to reference
global G_settings 				; user defined settings managed by C_UserSettings and G_Settings
global G_defaultSettings		; default settings
global G_menuState				; to track if player is in a menu.

global cGui

;----------- Auto-Execution Zone ---------------------------------


MsgBox, 4, ,  Eldenring Script started. press Ctrl+Alt+X to stop.
IfMsgBox Yes
    gosub LaunchGui
else
    gosub Exit
;----------- End Auto-Execution Zone
; Include any hotkeys, subroutines files here
#include %A_ScriptDir%\Libraries\Commands\CommandRegistry.ahk
#include %A_ScriptDir%\Libraries\GameStates\DpadUI.ahk
#include %A_ScriptDir%\Libraries\Inputs\Keys.ahk
#include %A_ScriptDir%\Libraries\Debug.ahk
#include %A_ScriptDir%\ui\InputBoxes.ahk
#include %A_ScriptDir%\config\defaultHotkeys.ahk

;#IfWinActive, "ELDEN RING™" 			 ; not working maybe Anti-cheat engine blocks when used.   


initSettings:
	cUserSettings := new C_UserSettings("settings.ini", G_settings)
	;G_settings := C_UserSettings.aSettings
return		


LaunchGui:
	gosub initSettings
	cGui := new C_GUI()
	V_GUI := "GAME"
	
	cGui.addGui(G_settings[V_GUI])	
	; viewArray( G_settings[V_GUI] )
return

; Looks like the gui is populating global variables outside the class.
; will have to handle the settings here.
ButtonOK:
	Gui, Submit, Hide
	
	; viewArray(G_settings["GAME"])
	
	forIni := []
	
		For Key, Value in G_settings[V_GUI]
		{
			;ToolTip, % Key ": " Value
			;sleep 50
			if( %Key% != G_Settings[V_GUI][Key] )
			{
				ToolTip % "Key:" Key " changed " G_Settings[V_GUI][Key]			
				forIni[Key] := Value			
			}
		}
		Concat := ""
	For Each, Element In forIni

	   Concat .= (Concat <> "" ? "`n" : "") .  Each " : " Element
	MsgBox, %Concat%
		cGui.submit() ; not working ??	
	
	ExitApp
return

Exit:
	ExitApp
return

; --- for debugging arrays.
viewArray( dArray )
{
	FOR dK, Dv in dArray
	{
		Tooltip, % "Key: " dK "Value: " Dv
			sleep 500
	}
}