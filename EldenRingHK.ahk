;----- Elden Ring AutoHotKey Overhaul V0.2
;----- Original Script unmodified:
;----- https://steamlists.com/elden-ring-script-for-autohotkey-for-mouse-keyboard/?msclkid=391ff484c21f11ec8b7f40c06c9be788
;----- Original Author: Olaf Krahl "Gooru"
;-----
;----- This script has been heavily modified from the original to include attack combos and key prioritization and spell slot support.
;----- Modified by: Ian Wilson https://www.dreamingforgamers.com/
;----- Twitch: https://dashboard.twitch.tv/u/dreamingforgamers
;----- Designed for ergonomic game-play feel free to modify to suit your keybindings
;----- Adding variables for easier customization that you can assign keys used in functions
; Change Log V0.2
; Added Variable Support for easier end-user configuration
; Added ability to switch to but not use Spell and Belt slots
;-----------------------------------------------------------------------
#SingleInstance Force
#NoEnv
#Warn
SetWorkingDir %A_ScriptDir%
SendMode InputThenPlay
MsgBox Eldenring Script started. press Ctrl+Alt+X to stop.
;--- Set your screen width/height
;-----------------------------------------------------------------------
;----- Variables Section that you can edit and assign keys for customization
;----- Change the right value to the key you want to assign
;-----------------------------------------------------------------------
 
;----- [ Core Elden Ring keybindings ] !!!must match your in-game configuration!!!
;----- If they are commented out, they are not currently used in the AutoHotKey combos/actions etc
;----- But leave this for future updates so all you have to do is copy-paste your variable settings
;----- to any new version and this should keep continuity and just work.  If the comment has a !!
;----- Then this is a critically used variable to make other features work, do not comment those out.
;----- AutoHotKey uses short-key references to SHIFT/CTRL/ALT so here's a quick reference
; Quick Reference:
; SHIFT +
; CTRL ^
; ALT !
;---------h----------------------------------------------------------------
V_DEBUG = 0 			; Set to CTRL+ALT+SHIFT+D to enable debugging - will output to notepad++
V_SPELL_SLOTS := 8 		; Set your current spell slots here and update this when they change for better loops.
V_BELT_SLOTS := 10 		; Set this is you only want to auto-use/scroll through x number of belt slots or leave as is.
 
V_MOVE_CONTROL = Backspace ; Movement control (slows walk).
V_MOVE_FORWARD = y 		; !!Move Forwards
;V_MOVE_BACKWARDS = u 	; Move Backwards
;V_MOVE_LEFT = i 		; Move Left
;V_MOVE_RIGHT = o 		; Move Right
V_DODGE = p 			; !!Backstep, Dodge Roll, Dash
V_JUMP = Space 			; !!Jump
V_CROUCH = t 			; !!Crouch / Stand Up
 
;V_CAMUP = 				; Move Camera / Change Target (Up)
;V_CAMDOWN = 			; Move Camera / Change Target (Down)
;V_CAMLEFT = +z 		; Move Camera / Change Target (Left)
;V_CAMRIGHT = +x 		; Move Camera / Change Target (Right)
;V_LOCKON = tab 		; Reset Camera, Lock-On/Remove Target
 
V_DUP = Up 				; !!Switch Sorcery/Incantation D-Pad
V_DDOWN = Down 			; !!Switch Item  D-Pad
V_DRIGHT = Right 		; !!Switch Right-Hand Armament D-Pad
V_DLEFT = Left 			; !!Switch Left-Hand Armament  D-Pad

;--- Doesn't preform well with mousbuttons asigned to switching to keyboard references.
V_ATTACK = k 			; !!Attack (RH & Two-Handed Armament)
V_SATTACK = l 			; !!Strong Attack (RH & 2H Armament)
V_GUARD = h 			; !!Guard (LH Armament)
V_SKILL = j 			; !!Skill
V_USEITEM = b 			; !!Use Item
V_EVENT_ACTION = Enter 	; !!Event Action (Examine, Open, etc.)
 
;-----[ AutoHotKey Key/Mouse Bindings ] --------------------------------------------
;-----  These are keyboard/mouse assignments outside of the Elden Ring in-game settings
 
;-----[ POUCH ]
V_UPOUCH = z 			; Use Up Pouch (I have HP flask assigned )
V_LPOUCH = x 			; Use Left Pouch ( I have FP flash assigned )
V_RPOUCH = +v 			; Use Right Pouch ( I have spirit ash summon assigned using SHIFT-V to summon)
V_DPOUCH = +c 			; Use Down Pouch ( I have torrent ring, using SHIFT+C )
V_5POUCH = ^!+p 		; Use 5 Pouch currently unnasigned just a placeholder key combo
V_6POUCH = ^!^l 		; Use 6 Pouch currently unnasigned just a placeholder key combo 

;-----[ BELT SLOTS ]
V_USEBELTSLOT1 = F1 	; Change F1 to the key you want to use the item in belt slot 1
V_USEBELTSLOT2 = F2 	; Change F2 to the key you want to use the item in belt slot 2
V_USEBELTSLOT3 = F3 	; Change F3 to the key you want to use the item in belt slot 3
V_USEBELTSLOT4 = F4 	; Change F4 to the key you want to use the item in belt slot 4
V_USEBELTSLOT5 = F5 	; Change F5 to the key you want to use the item in belt slot 5
V_USEBELTSLOT6 = F6 	; Change F6 to the key you want to use the item in belt slot 6
V_USEBELTSLOT7 = F7 	; Change F7 to the key you want to use the item in belt slot 7
V_USEBELTSLOT8 = F8 	; Change F8 to the key you want to use the item in belt slot 8
V_USEBELTSLOT9 = F9 	; Change F9 to the key you want to use the item in belt slot 9
V_USEBELTSLOT10= F10 	; Change F10 to the key you want to use the item in belt slot 10
 
;---- + means SHIFT so SHIT+F1 to switch to belt slot 1 but not activate and use the item.
V_SWITCHBELTSLOT1 = +F1 ; Change +F1 to the key you want to switch to the item in belt slot 1
V_SWITCHBELTSLOT2 = +F2 ; Change +F2 to the key you want to switch to the item in belt slot 2
V_SWITCHBELTSLOT3 = +F3 ; Change +F3 to the key you want to switch to the item in belt slot 3
V_SWITCHBELTSLOT4 = +F4 ; Change +F4 to the key you want to switch to the item in belt slot 4
V_SWITCHBELTSLOT5 = +F5 ; Change +F5 to the key you want to switch to the item in belt slot 5
V_SWITCHBELTSLOT6 = +F6 ; Change +F6 to the key you want to switch to the item in belt slot 6
V_SWITCHBELTSLOT7 = +F7 ; Change +F7 to the key you want to switch to the item in belt slot 7
V_SWITCHBELTSLOT8 = +F8 ; Change +F8 to the key you want to switch to the item in belt slot 8
V_SWITCHBELTSLOT9 = +F9 ; Change +F9 to the key you want to switch to the item in belt slot 9
V_SWITCHBELTSLOT10= +F10 ; Change +F10 to the key you want to switch to the item in belt slot 10
 
;-----[ SPELL SLOTS ]
;----- Your character must have an item to use spells equipt in the left hand.
;----- I will see if I can get the script to toggle between left/right action
 
V_USESPELLSLOT1 = 1
V_USESPELLSLOT2 = 2
V_USESPELLSLOT3 = 3
V_USESPELLSLOT4 = 4
V_USESPELLSLOT5 = 5
V_USESPELLSLOT6 = 6
V_USESPELLSLOT7 = 7
V_USESPELLSLOT8 = 8
V_USESPELLSLOT9 = 9
V_USESPELLSLOT10 = 0
 
V_SWITCHSPELLSLOT1 = +1
V_SWITCHSPELLSLOT2 = +2
V_SWITCHSPELLSLOT3 = +3
V_SWITCHSPELLSLOT4 = +4
V_SWITCHSPELLSLOT5 = +5
V_SWITCHSPELLSLOT6 = +6
V_SWITCHSPELLSLOT7 = +7
V_SWITCHSPELLSLOT8 = +8
V_SWITCHSPELLSLOT9 = +9
V_SWITCHSPELLSLOT10 = +0
;-----[ Gestures ]
;----- ^ is for CTRL
V_GESTURE1 = ^1
V_GESTURE2 = ^2
V_GESTURE3 = ^3
V_GESTURE4 = ^4
V_GESTURE5 = ^5
V_GESTURE6 = ^6
 
 
;----- Variables for tracking states.
;----- Do not edit these as they are used by the program to track various states
V_DBoolean = 0				; A boolean to track use or not use.
V_BSReset = 0 				; A boolean to track spell slot reset if it goes out of sync on any button press.
V_BBReset = 0 				; A boolean to track belt slot reset if it goes out of sync on any button press.
V_SpellSlot = 0 			; To track what the current slot is for better cycling. Reset position if alignment is off.
V_BeltSlot = 0 				; To track what the current belt slot is for better cycling.  Reset position if alingment is off
V_ToggleSpell := V_GUARD 	; To track what hand is using the wand/incantation item for spell casting.
V_Gui_Active := 0			; to track the 3 second interval when the D-PAD GUI in the game is open

;----- Variable key assignments
;----- Do not edit these as they reference your keys assigned in the variable section above.
;----- There are key references after the hotkeys, but I can't place them above or it breaks
;----- the script.  Scroll down right after the hotkey definitions to bind actions/combos to keys.
HotKey, ~%V_MOVE_FORWARD%, A_AutoRun
HotKey, ~*%V_MOVE_FORWARD% up, A_AutoRunOff
HotKey, ~+%V_MOVE_FORWARD%, A_Walk
HotKey, ~%V_DODGE%, A_Dodge
 
Hotkey, %V_UPOUCH%, Pouch_Up
Hotkey, %V_LPOUCH%, Pouch_Left
Hotkey, %V_RPOUCH%, Pouch_Right
Hotkey, %V_DPOUCH%, Pouch_Down
Hotkey, %V_5POUCH%, Pouch_5
Hotkey, %V_6POUCH%, Pouch_6
 
Hotkey, %V_GESTURE1%, gesture_1
Hotkey, %V_GESTURE2%, gesture_2
Hotkey, %V_GESTURE3%, gesture_3
Hotkey, %V_GESTURE4%, gesture_4
Hotkey, %V_GESTURE5%, gesture_5
Hotkey, %V_GESTURE6%, gesture_6
 
;-----------------------------------------------------------------------
;-----
;----- Chance your hotkeys here if you like
;----- us comment ; to disable a key.
;-----
;-----------------------------------------------------------------------
 
;--- Keys mapped to reserved keys and functions.  This time change
;--- the key on the left side not the right side to map to your keyboard or mouse
;--- Why we map to reserve keys is to allow shift/ctrl/alt options otherwise it will
;--- often trigger just the key bound in the Elden Ring keyboard binding section.
;a::k 							; L1 Dual-Attack, Parry, Block 
a::gosub Parry 					; Switching to parry combo, using mouse button for light attack.
s::l 							; L2 Use Skill
d::h  							; R1 Light Attack
f::j 							;
n::gosub A_AutoRun
 
+a::gosub 2H-Left 				; left hand weapon twohanded
+s::gosub 2H-Right 				; right hand weapon twohanded
+d::gosub A_LeftArmement 		; toggle left hand armement
+f::gosub A_RightArmement 		; toggle right hand armement.
+e::gosub JumpDualWeild 		; Does a jump and dual-weild combo attack
w::gosub Crouch 				; Crouch+Attack
e::gosub Jump 					; Jump+Attack
r::gosub JumpStrong 			; Jump+Strong+Attack

c::t 							; C for Crouch.
+z::gosub UseBelt1 				; Physics Flask on BELT SLOT 1
^+z::gosub A_ToggleSpellHand 	; Toggles which hand to cast spell from
^+!d::gosub A_ToggleDebug		; Toggles debugging if any is enabled.
m::g 							; m for Map

;----  Best to leave as is and reference to a key-map above if needed ---
1::gosub Spell1  				; use Spell place 1
2::gosub Spell2  				; use Spell place 2
3::gosub Spell3  				; use Spell place 3
4::gosub Spell4  				; use Spell place 4
5::gosub Spell5  				; use Spell place 5
6::gosub Spell6  				; use Spell place 6
7::gosub Spell7  				; use Spell place 7
8::gosub Spell8  				; use Spell place 8
9::gosub Spell9  				; use Spell place 9
0::gosub Spell10  				; use Spell place 10
 
+1::gosub Spell_reset  			; reset Spell to place 1
+2::gosub SpellSlot2  			; use Spell place 2
+3::gosub SpellSlot3  			; use Spell place 3
+4::gosub SpellSlot4  			; use Spell place 4
+5::gosub SpellSlot5  			; use Spell place 5
+6::gosub SpellSlot6  			; use Spell place 6
+7::gosub SpellSlot7  			; use Spell place 7
+8::gosub SpellSlot8  			; use Spell place 8
+9::gosub SpellSlot9  			; use Spell place 9


F1::gosub UseBelt1 				; use belt place 1
F2::gosub UseBelt2 				; use belt place 2
F3::gosub UseBelt3 				; use belt place 3
F4::gosub UseBelt4 				; use belt place 4
F5::gosub UseBelt5 				; use belt place 5
F6::gosub UseBelt6 				; use belt place 6
F7::gosub UseBelt7 				; use belt place 7
F8::gosub UseBelt8 				; use belt place 8
F9::gosub UseBelt9 				; use belt place 9
F10::gosub UseBelt10 			; use belt place 10

+F1::gosub Belt_reset 			; use belt place 1
+F2::gosub SwitchBelt2 			; use belt place 2
+F3::gosub SwitchBelt3 			; use belt place 3
+F4::gosub SwitchBelt4 			; use belt place 4
+F5::gosub SwitchBelt5 			; use belt place 5
+F6::gosub SwitchBelt6 			; use belt place 6
+F7::gosub SwitchBelt7 			; use belt place 7
+F8::gosub SwitchBelt8 			; use belt place 8
+F9::gosub SwitchBelt9 			; use belt place 9
+F10::gosub SwitchBelt10 		; use belt place 10

;-------------------------------------------------------------------------
;-------------------------------------------------------------------------
;----- don´t touch anything below unless you know what you are doing
;-------------------------------------------------------------------------
;-------------------------------------------------------------------------
^!x::
   MsgBox Eldenring Script stopped.
   exitapp
    
   ;---- CTRL-ALT_SHIFT+C to display variables and hotkey values for debugging ------
   ^!+c::gosub H_VARDEBUG
   H_VARDEBUG:
   ListHotkeys
return
 
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
	sleep 25ypyp
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
Spell_reset:
   
   gosub P_UP
   getGuiActive()
   gosub S_UP
   V_SPELLSLOT := 1
   V_BSReset := 0   
return
Spell1:	
	doSpellSlot( 1, 1 )	
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
   getGuiActive()
   gosub H_Down
   V_BELTSLOT := 1
   V_BBReset := 0   
return
UseBelt1:
   doBeltSlot( 1, 1 )
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
 

 
;+F1::gosub gesture_1 ; gesture 1
;+F2::gosub gesture_2 ; gesture 2
;+F3::gosub gesture_3 ; gesture 3
;+F4::gosub gesture_4 ; gesture 4
;+F5::gosub gesture_5 ; gesture 5
;+F6::gosub gesture_6 ; gesture 6