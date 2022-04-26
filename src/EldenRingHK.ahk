;----- Elden Ring AutoHotKey Overhaul V0.3
;----- see Readme.md for more info

;---- v0.4 features, requirements, bugs and scope.
;---- To move all user-settings to external files to better support future versions.
;---- Organize code into more managable components and external files.
;---- Toggle off hotkeys when menus are accessed and enabled when the main game resumes.
;---- QA v0.3 for any bugs that can be addressed in v0.4

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

; going to define all global variables with a preceeding G_
global G_settings				; user defined settings
global G_defaultSettings		; default settings
global G_menuState				; to track if player is in a menu.

;readSettings("settings.ini", G_settings )

#include %A_ScriptDir%\config\globalVariables.ahk
#include %A_ScriptDir%\config\dynamicHotkeys.ahk
#include %A_ScriptDir%\config\defaultHotkeys.ahk




;----- Variable key assignments
;----- Do not edit these as they reference your keys assigned in the variable section above.
;----- There are key references after the hotkeys, but I can't place them above or it breaks
;----- the script.  Scroll down right after the hotkey definitions to bind actions/combos to keys.


 
;------------------- Auto-Run ------------------------------
; This enables auto-run when moving forward rather than having to
; hold two keys.  It detects when your dodge key is pressed and will
; interupt to preform a dodge.  After the dodge, it will resume
; auto-run until another dodge interupts it.
A_ToggleDebug:
	V_DEBUG := !V_DEBUG
return
; The auto-run sub will check to see if enabled.  Is enabled by default. 
A_AutoRun:
   if !V_DBoolean
   {
      SendInput {%V_DODGE% Down}
      V_DBoolean := 1
      sleep 25
   }
return
; Turns off auto-run from the config but we can also make this a in-game toggle feature.
A_AutoRunOff:
   if V_DBoolean
   V_DBoolean := 0
return
; Holding shift toggles off auto run for those... need to walk moments.
A_Walk:
   if V_DBoolean
   {
      SendInput {%V_DODGE% Up}
      V_DBoolean := 0
      sleep 1000
      return
   }
   ; Sometimes after a dodge roll, it keeps on running
   if GetKeyState( V_DODGE, "P" )
   {
      SendInput {%V_DODGE% Up}
      sleep 1000
   }
return

A_LeftArmement:	
	send {%V_DLEFT% Down}
	sleep 50
	send {%V_DLEFT% Up}
	sleep 50
	V_Gui_Active := A_Tickcount
return

A_RightArmement:
	send {%V_DRIGHT% Down}
	sleep 50
	send {%V_DRIGHT% Up}
	sleep 50
	V_Gui_Active := A_Tickcount
return

; This untraps the dodge key during running so it preforms a proper dodge otherwise the character
; just keeps running without dodging.
A_Dodge:
   if V_DBoolean
   {
      SendInput {%V_DODGE% Up}
      sleep 50
      SendInput {%V_DODGE% down}
      sleep 200
      SendInput {%V_DODGE% up}
      sleep 200
      SendInput {%V_DODGE% down}
      sleep 50
   }
return
; -- end Auto Run ------------------------------------------
 
A_USE:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
return

A_ToggleSpellHand:
V_ToggleSpell := ( V_ToggleSpell = V_GUARD ) ? V_ATTACK : V_GUARD
logNp( "Toggled Spell hand to key: " V_ToggleSpell )
return

;--------------scripts-2H------------
2H-Right:
	SendInput {%V_EVENT_ACTION% down}
	sleep 25
	SendInput {%V_ATTACK% down}
	sleep 25
	SendInput {%V_ATTACK% up}
	sleep 25
	SendInput {%V_EVENT_ACTION% up}
return
2H-Left:
	SendInput {%V_EVENT_ACTION% down}
	sleep 25
	SendInput {%V_GUARD% down}
	sleep 25
	SendInput {%V_GUARD% up}
	sleep 25
	SendInput {%V_EVENT_ACTION% up}
return
 
;--------------Attack Combos----------
; Parry+Light Attack
Parry:
   SendInput {%V_SKILL% down}
   sleep 25
   SendInput {%V_SKILL% up}
   sleep 300
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
; Crouch+Attack
Crouch:
   SendInput {%V_CROUCH% down}
   sleep 25
   SendInput {%V_CROUCH% up}
   sleep 100
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
; Jump+Attack
Jump:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
; Jump+Dual-Wield Combo Attack
JumpDualWeild:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_GUARD% down}
   sleep 25
   SendInput {%V_GUARD% up}
return
 
; Jump+Strong+Attack
JumpStrong:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_SATTACK% down}
   sleep 300
   SendInput {%V_SATTACK% up}
return
 
;-------------- Functions ----------

; Sets GUI active when D-Pad is used to bump +1 increments for spell/belt
getGuiActive()
{
	global V_Gui_Active
	
	if( V_Gui_Active = 0 )
	{
		V_Gui_Active := A_Tickcount		
		return 1
	}Else
	{
		time:=A_Tickcount - V_Gui_Active
		if( time > 3000 ) 
		{
			V_Gui_Active := A_Tickcount			
			return 1
		} else {			
			; ToolTip, % "Time" time
			return 0
		}
	}	
}

; Calculates the iterations beteen slots
findIteration( target, position, slots )
{
   if (target = position){
      return 0
   }
   inc := getGuiActive() ;  for both spell and belt the first down activates gui causing click glitches.
   val := target - position
   if( val > 0 ){
      return val + inc
   }else  {
      return slots + val + inc
   }}


doSpellUseLoop( iteration, bUse )
{
   loop %iteration%
   {
      ; loop to target position      
      if( doUP() )
      {
        ; sleep 25
      }}   
   if( bUse = 1 ){
      ;sleep 150
      gosub P_K ; activate use
   }}
doSpellItr( itr, slot, bUse )
{
   if( itr = 0 ) {
      if( bUse = 1){
         gosub P_K
         return
      }
     
   }else  if ( itr = 1 )  {
		active := getGuiActive()
      if( doUp() )
      {  
		if( active == 1 ) 	
		 {
			doUp()
		 }
         if( bUse = 1){
            ;sleep 25
            gosub P_K
         }}
      
   }else  {
      doSpellUseLoop(itr, bUse)      
   }
   return
}
 
; pipes all the slot actions to a unified function for easier debugging / tracking and cleaner code.
doSpellSlot( slot, activate )
{
	global V_SPELLSLOT 
	global V_SPELL_SLOTS
	global V_BSReset
	
	if( V_SPELL_SLOTS < slot ){
      return
	}else  {
		     
			if( V_BSReset = 1 )
			{
				gosub Spell_reset
			}
		  iteration := findIteration( slot, V_SPELLSLOT, V_SPELL_SLOTS)		  
		  V_SPELLSLOT := slot 
		  success := doSpellItr( iteration, V_SPELLSLOT, activate )
	}
}
doBeltUseLoop( iteration, bUse )
{
   loop %iteration%
   {
      ; loop to target position
      if( doDown() )
      {
         ;sleep 25
      }}
   if( bUse = 1 ){
      ;sleep 25
      gosub P_B ; activate use
   }}
doBeltItr( itr, slot, bUse )
{
	
   if( itr = 0 ) {
      if( bUse = 1){
         gosub P_B
		 return
      }     
   }else  if ( itr = 1 )  {
		;logNp( "Iteration: " itr " should activate only once" )
		active := getGuiActive()
      if( doDown() )  ; this may be causing the bug the whole time...
      {
			
		 if( active == 1 ) 	
		 {
			gosub P_Down
		 }
         if( bUse = 1){
		    ; just a litte sleep padding for the rapid clicks in a loop
            ; sleep 
            gosub P_B
			;logNp( "Slot " slot " is activating only once." )
         }
		 }      
   }else  {
      doBeltUseLoop(itr, bUse)      
   }
   return
}
; pipes all the slot actions to a unified function for easier debugging / tracking and cleaner code.
doBeltSlot( slot, activate )
{
	global V_BELTSLOT 
	global V_BELT_SLOTS
	global V_BBReset
	
	if( V_BELT_SLOTS < slot ){
      return
	}else  {
		     
			if( V_BBReset = 1 )
			{
				gosub Belt_reset
			}
		  iteration := findIteration( slot, V_BELTSLOT, V_BELT_SLOTS )	
			; logNp( "Belt Iteration " iteration " for loop" )		  
		  V_BELTSLOT := slot 
		  success := doBeltItr( iteration, V_BELTSLOT, activate )
	}
}

; Just a simple function to send data to a blank notepad++ page for real-time debugging
logNp(msg)
{
   global V_DEBUG
   if( V_DEBUG == 1 ) {
		ControlSend, Scintilla1, % "`r`n" msg , ahk_class Notepad++
   }
}

; For testing if action was completed   
doUP()
{
   gosub P_Up
   return 1
}
doDown()
{
   gosub P_Down
   return 1
}

; ------------ Subroutines -------------------

A_SetSpellSlots:
InputBox, slots, Enter the number of spell slots on your character, hide
if ErrorLevel
    MsgBox, % "Cancelled. Leaving as " %V_SPELL_SLOTS% "slots"	
else
    V_SPELL_SLOTS := slots
	MsgBox, % "Spell Slots set to " slots
return

A_SetBeltSlots:
InputBox, slots, Enter the number of belt slots on your character, hide
if ErrorLevel
    MsgBox, % "Cancelled. Leaving as " %V_BELT_SLOTS% "slots"	
else
    V_BELT_SLOTS := slots
	MsgBox, % "Belt Slots set to " slots
return

Spell_reset:
   
   gosub P_UP   
   gosub S_UP
   V_SPELLSLOT := 1
   V_BSReset := 0   
return
Spell1:	
	gosub Spell_reset
	gosub P_K
	getGuiActive()	
return
Spell2: ; Player always has 2 slots...		
	doSpellSlot( 2, 1 )	
return
Spell3:	
	doSpellSlot( 3, 1 )	
return
Spell4:
   doSpellSlot( 4, 1 )   
return
Spell5:   
   doSpellSlot( 5, 1 )   
return
Spell6:   
  doSpellSlot( 6, 1 )  
return
Spell7:   
   doSpellSlot( 7, 1 )   
return
Spell8:   
  doSpellSlot( 8, 1 )  
return
Spell9:   
  doSpellSlot( 9, 1 )  
return
Spell10:   
   doSpellSlot( 10, 1 )   
return
 
;--------------scripts-Spells Switch to no cast (intended to use shift to activate ) ----------
 
SpellSlot2:
   doSpellSlot( 2, 0 )
return
SpellSlot3:
   doSpellSlot( 3, 0 )
return
SpellSlot4:
    doSpellSlot( 4, 0 )
return
SpellSlot5:
    doSpellSlot( 5, 0 )
return
SpellSlot6:
   doSpellSlot( 6, 0 )
return
SpellSlot7:
    doSpellSlot( 7, 0 )
return
SpellSlot8:
   doSpellSlot( 8, 0 )
return
SpellSlot9:
   doSpellSlot( 9, 0 )
return
SpellSlot10:
   doSpellSlot( 10, 0 )
return
;--------------scripts-Belt----------
Belt_reset:
  
   gosub P_Down   
   gosub H_Down
   V_BELTSLOT := 1
   V_BBReset := 0   
return
UseBelt1:
	gosub Belt_reset
	gosub P_B
   getGuiActive()
return
UseBelt2:
    doBeltSlot( 2, 1 )
return
UseBelt3:
    doBeltSlot( 3, 1 )
return
UseBelt4:
    doBeltSlot( 4, 1 )
return
UseBelt5:
    doBeltSlot( 5, 1 )
return
UseBelt6:
   doBeltSlot( 6, 1 )
return
UseBelt7:
    doBeltSlot( 7, 1 )
return
UseBelt8:
    doBeltSlot( 8, 1 )
return
UseBelt9:
   doBeltSlot( 9, 1 )
return
UseBelt10:
    doBeltSlot( 10, 1 )
return


SwitchBelt1:
   doBeltSlot( 1, 0 )
return
SwitchBelt2:
    doBeltSlot( 2, 0 )
return
SwitchBelt3:
   doBeltSlot( 3, 0 )
return
SwitchBelt4:
   doBeltSlot( 4, 0 )
return
SwitchBelt5:
   doBeltSlot( 5, 0 )
return
SwitchBelt6:
   doBeltSlot( 6, 0 )
return
SwitchBelt7:
   doBeltSlot( 7, 0 )
return
SwitchBelt8:
  doBeltSlot( 8, 0 )
return
SwitchBelt9:
   doBeltSlot( 9, 0 )
return
SwitchBelt10:
  doBeltSlot( 10, 0 )
return
;--------------scripts-Pouch---------
Pouch_Left:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_DLEFT% down}
   sleep 25
   SendInput {%V_DLEFT% up}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
   V_Gui_Active := A_Tickcount
return
Pouch_Right:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_DRIGHT% down}
   sleep 25
   SendInput {%V_DRIGHT% up}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
   V_Gui_Active := A_Tickcount
return
Pouch_Up:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_DUP% down}
   sleep 25
   SendInput {%V_DUP% up}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
   V_Gui_Active := A_Tickcount
return
Pouch_Down:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   gosub P_Down
   SendInput {%V_EVENT_ACTION% up}
   V_Gui_Active := A_Tickcount
return
Pouch_5:
   gosub P_Esc
   MouseMove 1750, 470
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
Pouch_6:
   gosub P_Esc
   MouseMove 1840, 470
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
;----------scripts-Gestures----------
; This is based on your screen resolution so if it doesn't work, you'll have to right-click on the hotkey icon in the taskbar
; and look at the window-spy then hover over the gestures and update the x-y to fit.  I set this to my 4K display, the commented
; x,y values are for HD 1920x1080
gesture_1:
   gosub P_Esc
   MouseMove 3470, 1225 ; 1750, 620
   sleep 25
   gosub P_E    
   sleep 25
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
gesture_2:
   gosub P_Esc
   MouseMove 3660, 1225 ; 1840, 620
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
gesture_3:
   gosub P_Esc
   MouseMove 3470, 1410 ; 1750, 710
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
gesture_4:
   gosub P_Esc
   MouseMove 3660, 1410 ; 1840, 710
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
gesture_5:
   gosub P_Esc
   MouseMove 3470, 1600 ; 1750, 800
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
gesture_6:
   gosub P_Esc
   MouseMove 3660, 1600 ; 1840, 800
   sleep 25
   gosub P_E
   gosub P_Esc
   V_Gui_Active := A_Tickcount
return
;-------------------Keys-------------
P_E:
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
   sleep 25
return
P_B:
   SendInput {%V_USEITEM% down}
   sleep 25
   SendInput {%V_USEITEM% up}
   sleep 25
return
 
P_K:

;   SendInput {%V_GUARD% down}
;   sleep 50
;   SendInput {%V_GUARD% up}
;   sleep 50

  SendInput {%V_ToggleSpell% down}
  sleep 25
  SendInput {%V_ToggleSpell% up}
  sleep 25
return
P_Down:
   SendInput {%V_DDOWN% down}
   sleep 60
   SendInput {%V_DDOWN% up}
   sleep 40
   V_Gui_Active := A_Tickcount
return

P_Up:
   SendInput {%V_DUP% down}   
   sleep 60						; if you are having lost input tweak here and compile.
   SendInput {%V_DUP% up}   
   sleep 40
   V_Gui_Active := A_Tickcount
return
 
H_Down:
   SendInput {%V_DDOWN% down}
   sleep 650
   SendInput {%V_DDOWN% up}
   sleep 25
   V_Gui_Active := A_Tickcount
return
 
; Noting inconsistencies here, it sometimes successfully resets and other times it doesn't.
; Current setting is 550 and inconsistencies are noted.
; Trying a full second now to see if this guarantees a proper reset.
; At 1000 all resets occured consistently so the sweet spot is definately between >550-1000
S_UP:
   SendInput {%V_DUP% down}
   sleep 650
   SendInput {%V_DUP% up}
   sleep 25
   V_Gui_Active := A_Tickcount
return
P_Esc:
   SendInput {Esc down}
   sleep 25
   SendInput {Esc up}
   sleep 25
return
 
 
;---- Legacy V0.1 code reference only for transition to V0.2
; [POUCH]
;z::gosub Pouch_Up ; use pouch up ; Uses Flask of Crimson Tears Flask of Cerulean Tears
;`::gosub Pouch_Right ; use pouch right ; Summons Spirit Ash
;x::gosub Pouch_Left ; use pouch left ; Uses Flask of Cerulean Tears
;+c::gosub Pouch_Down ; use pouch down ; Summmons torrent
;5::gosub Pouch_5 ; use pouch place 5 ; Unassigned at the moment.
;6::gosub Pouch_6 ; use pouch place 6 ; Unassigned at the moment.
 

 
