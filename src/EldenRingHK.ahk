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

;SetTitleMatchMode, 

MsgBox Eldenring Script started. press Ctrl+Alt+X to stop.

;#IfWinActive, ELDEN RING™ 			 ; not working maybe Anti-cheat engine blocks when used.         

global version := "0.4" ; currently working on v0.4

; going to define all global variables with a preceeding G_ as functions need to reference
; them as global.  As nomenclature goes, I may stick with a preceeding identifier:
global G_settings				; user defined settings
global G_defaultSettings		; default settings
global G_menuState				; to track if player is in a menu.

;readSettings("settings.ini", G_settings )

#include %A_ScriptDir%\config\globalVariables.ahk
#include %A_ScriptDir%\config\dynamicHotkeys.ahk
#include %A_ScriptDir%\config\defaultHotkeys.ahk
#include %A_ScriptDir%\ui\InputBoxes.ahk
#include %A_ScriptDir%\Libraries\Commands\CommandRegistry.ahk
#include %A_ScriptDir%\Libraries\GameStates\DpadUI.ahk
#include %A_ScriptDir%\Libraries\Inputs\Keys.ahk
#include %A_ScriptDir%\Libraries\Debug.ahk

