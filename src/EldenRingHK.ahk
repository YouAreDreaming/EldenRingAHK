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

#include %A_ScriptDir%\config\globalVariables.ahk
#include %A_ScriptDir%\config\dynamicHotkeys.ahk
#include %A_ScriptDir%\config\UserSettings.ahk 
#include %A_ScriptDir%\ui\Gui.ahk
global G_HotKeyMeta
#include %A_ScriptDir%\config\hotKeyMetaData.ahk


; going to define all global variables with a preceeding G_ as functions need to reference
global G_FONT := A_ScriptDir "\assets\fonts\EB_Garamond\EBGaramond-Bold.ttf"
global cGui							; Class Gui
global C_HotKey						; Class HotKey
global G_settings := {}				; user defined settings managed by C_UserSettings and G_Settings
global G_defaultSettings			; default settings
global G_menuState					; to track if player is in a menu.
global G_UserSettings				;
global G_GuiActive	:= 0			;
global G_DebugGuiActive	:= 0		;
global G_HotKeys := {}				; See if one of these are redundant.
global gDebugMessage := "Enabled"	; Holds the messages displayed at the bottom of the Debug GUI.
global hotKeytoggle := 1			; in defaultHotKeys.ahk 
global gAutoLock					; The AutoLock Class

			
;----------- Auto-Execution Zone ---------------------------------

gosub initSettings
gosub LaunchGui
SetTimer, S_GLOBALTIMER, 10
;MsgBox, 4, ,  Eldenring Script started. press Ctrl+Alt+X to stop.

	
;----------- End Auto-Execution Zone
; Include any hotkeys, subroutines files here
#include %A_ScriptDir%\Libraries\Inputs\cHotKey.ahk
#include %A_ScriptDir%\Libraries\Inputs\cAutoLock.ahk
#include %A_ScriptDir%\Libraries\Commands\CommandRegistry.ahk
#include %A_ScriptDir%\Libraries\GameStates\DpadUI.ahk
#include %A_ScriptDir%\Libraries\Inputs\Keys.ahk
#include %A_ScriptDir%\Libraries\Debug.ahk
#include %A_ScriptDir%\ui\InputBoxes.ahk
#Include %A_ScriptDir%\external\OGdip\OGdip.ahk

;#IfWinActive, "eldenring.exe"
;#IfWinActive, "ELDEN RING™.exe" 			 ; not working maybe Antcheat engine blocks when used. 
#include %A_ScriptDir%\config\defaultHotkeys.ahk
#include %A_ScriptDir%\userDefinedHotkeys.ahk				; User can add custom hotkeys here 

initSettings:
	G_UserSettings := new C_UserSettings("settings.ini", G_settings)
	initHotKeyMeta(G_HotKeyMeta)
	C_HotKey 		:= new cHotKey( G_settings, G_HotKeyMeta, G_HotKeys ) 
	gAutoLock		:= new cAutoLock()
	;G_settings := C_UserSettings.aSettings
return		

LaunchGui:	
	G_GuiActive := ( G_GuiActive ) ? 0 : 1
	IF G_GuiActive 
	{
		gosub S_TOGGLEKEYS	
		cGui := new C_GUI()	
		cGui.addMenu()	
		
	} Else
		cGui := ""
return

ButtonGAME:
	cGui := new C_GUI()
	V_GUI := "GAME"	
	cGui.addGui(G_settings[V_GUI], G_GuiActive, V_GUI)
return
ButtonCOMBOS:
	cGui := new C_GUI()
	V_GUI := "COMBOS"	
	cGui.addGui(G_settings[V_GUI], G_GuiActive, V_GUI)
return
ButtonPOUCH:
	cGui := new C_GUI()
	V_GUI := "POUCH"	
	cGui.addGui(G_settings[V_GUI], G_GuiActive, V_GUI)
return
ButtonBELT:
	cGui := new C_GUI()
	V_GUI := "BELT"	
	cGui.addGui(G_settings[V_GUI], G_GuiActive, V_GUI)
return
ButtonSPELL:
	cGui := new C_GUI()
	V_GUI := "SPELL"	
	cGui.addGui(G_settings[V_GUI], G_GuiActive, V_GUI)
return
ButtonGESTURES:
	cGui := new C_GUI()
	V_GUI := "GESTURES"	
	cGui.addGui(G_settings[V_GUI], G_GuiActive, V_GUI)
return

ButtonTOGGLE:
	cGui := new C_GUI()
	V_GUI := "TOGGLE"	
	cGui.addGui(G_settings[V_GUI], G_GuiActive, V_GUI)
return

ButtonCONFIG:
	cGui := new C_GUI()
	V_GUI := "CONFIG"	
	cGui.addGui(G_settings[V_GUI], G_GuiActive, V_GUI)
return

ButtonClose:
	cGui = ""
	gosub S_TOGGLEKEYS
return
	
S_TOGGLEKEYS:
	C_HotKey._toggle()
return

S_TOGGLEAUTOLOCK:
	V_AutoLock := (V_AutoLock) ? 0 : 1
	gDebugMessage := % "AutoLock is " alState
	alState := (V_AutoLock) ? "ON" : "OFF"
return

S_GLOBALTIMER:
	IF G_DebugGuiActive
	{
		Gosub, UpdateOSD
	}
	IF V_AutoLock	
	{
			tick := A_Tickcount
			vaKey := AnyKeyIsDown( 1, 0 )
			gAutoLock._timer(tick, vaKey)	
	}
return
getVal( k, ar )
{
	return ar[k]
}

; Looks like the gui is populating global variables outside the class.
; will have to handle the settings here.
ButtonOK:
	Gui, Submit, Hide
	
	;if( G_GuiActive )
	;{
	
		forIni := []		
		
		fml := getVal( V_GUI, G_settings )
		
		For Key, Value in fml
		{
			;MsgBox := % "Menu Submit - V_GUI: " V_GUI " Key: " Key " Value: " Value
			if( %Key% != fml[Key] )
			{
				; MsgBox % "Key:" Key " changed " 							
				forIni[Key] := %Key%			
			}
		}
		Concat := ""
		
		;For Each, Element In forIni
		;   Concat .= (Concat <> "" ? "`n" : "") .  Each " : " Element
		;MsgBox, %Concat%
		G_UserSettings.submitIniChanges( forIni, V_GUI ) 
	;}
	
	cGui := new C_GUI()	
	cGui.addMenu()	
	; -- Don't forget to remove this before a release.
	; ExitApp
return

Exit:
	ExitApp 
return




; --- for debugging arrays.
viewArray( dArray )
{
	FOR dK, Dv in dArray
	{
		; Tooltip, % "Key: " dK "Value: " Dv
			sleep 500
	}
}

AnyKeyIsDown(detectKeyboard:=1,detectMouse:=1) { ; return whatever key is down that has the largest scan code
	if (detectKeyboard) {
		loop % 86 { ; detect all common physical keys: https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html
			if (GetKeyState(keyname:=GetKeyName("sc" Format("{1:x}",A_Index)))) {
				return keyname
			}
		}
	}
	if (detectMouse) {
		mouseArr := ["LButton","RButton","MButton","XButton1","XButton2"]
		loop % mouseArr.Count() {
			if (GetKeyState(mouseArr[A_Index])) {
				return mouseArr[A_Index]
			}
		}
	}
	return ""
}