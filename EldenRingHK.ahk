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
V_DEBUG = 1 ; Set to 1 to enable debugging - will output to notepad++
V_SPELL_SLOTS := 8 ; Set your current spell slots here and update this when they change for better loops.
V_BELT_SLOTS := 10 ; Set this is you only want to auto-use/scroll through x number of belt slots or leave as is.
 
;V_MOVE_CONTROL = Backspace ; Movement control (slows walk).
V_MOVE_FORWARD = y ; !!Move Forwards
;V_MOVE_BACKWARDS = u ; Move Backwards
;V_MOVE_LEFT = i ; Move Left
;V_MOVE_RIGHT = o ; Move Right
V_DODGE = p ; !!Backstep, Dodge Roll, Dash
V_JUMP = Space ; !!Jump
V_CROUCH = t ; !!Crouch / Stand Up
 
;V_CAMUP = ; Move Camera / Change Target (Up)
;V_CAMDOWN = ; Move Camera / Change Target (Down)
;V_CAMLEFT = +z ; Move Camera / Change Target (Left)
;V_CAMRIGHT = +x ; Move Camera / Change Target (Right)
;V_LOCKON = tab ; Reset Camera, Lock-On/Remove Target
 
V_DUP = Up ; !!Switch Sorcery/Incantation D-Pad
V_DDOWN = Down ; !!Switch Item  D-Pad
V_DRIGHT = Right ; !!Switch Right-Hand Armament D-Pad
V_DLEFT = Left ; !!Switch Left-Hand Armament  D-Pad
;--- Doesn't preform well with mousbuttons asigned to switching to keyboard references.
V_ATTACK = k ; !!Attack (RH & Two-Handed Armament)
V_SATTACK = l ; !!Strong Attack (RH & 2H Armament)
V_GUARD = h ; !!Guard (LH Armament)
V_SKILL = j ; !!Skill
V_USEITEM = b ; !!Use Item
V_EVENT_ACTION = Enter ; !!Event Action (Examine, Open, etc.)
 
;-----[ AutoHotKey Key/Mouse Bindings ] --------------------------------------------
;-----  These are keyboard/mouse assignments outside of the Elden Ring in-game settings
 
;-----[ POUCH ]
V_UPOUCH = z ; Use Up Pouch (I have HP flask assigned )
V_LPOUCH = x ; Use Left Pouch ( I have FP flash assigned )
V_RPOUCH = +v ; Use Right Pouch ( I have spirit ash summon assigned using SHIFT-V to summon)
V_DPOUCH = +c ; Use Down Pouch ( I have torrent ring, using SHIFT+C )
V_5POUCH = ^!+p ; Use 5 Pouch currently unnasigned just a placeholder key combo
V_6POUCH = ^!^l ; Use 6 Pouch currently unnasigned just a placeholder key combo
 
V_DOWN = Down ; Down Arrow
V_UP   = Up ; UP Arrow
V_LEFT = Left ; Left Arrow
V_RIGHT = Right ; Right Arrow
;-----[ BELT SLOTS ]
V_USEBELTSLOT1 = F1 ; Change F1 to the key you want to use the item in belt slot 1
V_USEBELTSLOT2 = F2 ; Change F2 to the key you want to use the item in belt slot 2
V_USEBELTSLOT3 = F3 ; Change F3 to the key you want to use the item in belt slot 3
V_USEBELTSLOT4 = F4 ; Change F4 to the key you want to use the item in belt slot 4
V_USEBELTSLOT5 = F5 ; Change F5 to the key you want to use the item in belt slot 5
V_USEBELTSLOT6 = F6 ; Change F6 to the key you want to use the item in belt slot 6
V_USEBELTSLOT7 = F7 ; Change F7 to the key you want to use the item in belt slot 7
V_USEBELTSLOT8 = F8 ; Change F8 to the key you want to use the item in belt slot 8
V_USEBELTSLOT9 = F9 ; Change F9 to the key you want to use the item in belt slot 9
V_USEBELTSLOT10= F10 ; Change F10 to the key you want to use the item in belt slot 10
 
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
V_DBoolean = 0	; A boolean to track use or not use.
V_BReset = 0 ; A boolean to track spell slot reset if it goes out of sync on any button press.
V_SpellSlot = 0 ; To track what the current slot is for better cycling. Reset position if alignment is off.
V_BeltSlot = 0 ; To track what the current belt slot is for better cycling.  Reset position if alingment is off
V_ToggleSpell := V_GUARD ; To track what hand is using the wand/incantation item for spell casting.

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
 
Hotkey, %V_USEBELTSLOT1%, UseBelt1
Hotkey, %V_USEBELTSLOT2%, UseBelt2
Hotkey, %V_USEBELTSLOT3%, UseBelt3
Hotkey, %V_USEBELTSLOT4%, UseBelt4
Hotkey, %V_USEBELTSLOT5%, UseBelt5
Hotkey, %V_USEBELTSLOT6%, UseBelt6
Hotkey, %V_USEBELTSLOT7%, UseBelt7
Hotkey, %V_USEBELTSLOT8%, UseBelt8
Hotkey, %V_USEBELTSLOT9%, UseBelt9
Hotkey, %V_USEBELTSLOT10%, UseBelt10
 
Hotkey, %V_SWITCHBELTSLOT1%, SwitchBelt1
Hotkey, %V_SWITCHBELTSLOT2%, SwitchBelt2
Hotkey, %V_SWITCHBELTSLOT3%, SwitchBelt3
Hotkey, %V_SWITCHBELTSLOT4%, SwitchBelt4
Hotkey, %V_SWITCHBELTSLOT5%, SwitchBelt5
Hotkey, %V_SWITCHBELTSLOT6%, SwitchBelt6
Hotkey, %V_SWITCHBELTSLOT7%, SwitchBelt7
Hotkey, %V_SWITCHBELTSLOT8%, SwitchBelt8
Hotkey, %V_SWITCHBELTSLOT9%, SwitchBelt9
Hotkey, %V_SWITCHBELTSLOT10%, SwitchBelt10
 
;Hotkey, %V_USESPELLSLOT1%, Spell1
;Hotkey, %V_USESPELLSLOT2%, Spell2
;Hotkey, %V_USESPELLSLOT3%, Spell3
;Hotkey, %V_USESPELLSLOT4%, Spell4
;Hotkey, %V_USESPELLSLOT5%, Spell5
;Hotkey, %V_USESPELLSLOT6%, Spell6
;Hotkey, %V_USESPELLSLOT7%, Spell7
;Hotkey, %V_USESPELLSLOT8%, Spell8
;Hotkey, %V_USESPELLSLOT9%, Spell9
;Hotkey, %V_USESPELLSLOT10%, Spell10
;
;Hotkey, %V_SWITCHSPELLSLOT1%, Spell_reset
;Hotkey, %V_SWITCHSPELLSLOT2%, SpellSlot2
;Hotkey, %V_SWITCHSPELLSLOT3%, SpellSlot3
;Hotkey, %V_SWITCHSPELLSLOT4%, SpellSlot4
;Hotkey, %V_SWITCHSPELLSLOT5%, SpellSlot5
;Hotkey, %V_SWITCHSPELLSLOT6%, SpellSlot6
;Hotkey, %V_SWITCHSPELLSLOT7%, SpellSlot7
;Hotkey, %V_SWITCHSPELLSLOT8%, SpellSlot8
;Hotkey, %V_SWITCHSPELLSLOT9%, SpellSlot9
;Hotkey, %V_SWITCHSPELLSLOT10%, SpellSlot10
 
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
;a::k ; L1 Dual-Attack, Parry, Block
a::gosub Parry ; Switching to parry, using mouse button for light attack.
s::l ; L2 Use Skill
d::h  ; R1 Light Attack
f::j ;
n::gosub A_AutoRun
 
+a::gosub 2H-Left ; left hand weapon twohanded
+s::gosub 2H-Right ; right hand weapon twohanded
+d::Left ; toggle left hand armement
+f::Right ; toggle right hand armement.
+e::gosub JumpDualWeild ; Does a jump and dual-weild combo attack
w::gosub Crouch ; Crouch+Attack
;+q::gosub Parry ; Parry+Light Attack - May not want to use Q as it causes some problems with the Map and exiting menus, I just use my controller for the map.
e::gosub Jump ; Jump+Attack
r::gosub JumpStrong ; Jump+Strong+Attack
v::gosub A_USE ; Points to the use key
c::t ; C for Crouch.
+z::gosub UseBelt1 ; Physics Flask on BELT SLOT 1
^+z::gosub A_ToggleSpellHand 
; Moving this back here for testing between variable and fixed asignments as too many bugs
; are occuring with the varible hotkey declarations so we may be stuck with this but that's ok
; because just map a key to the keys below will likely solve most usabiliy issues.
1::gosub Spell1  ;use Spell place 1
2::gosub Spell2  ;use Spell place 2
3::gosub Spell3  ;use Spell place 3
4::gosub Spell4  ;use Spell place 4
5::gosub Spell5  ;use Spell place 5
6::gosub Spell6  ;use Spell place 6
7::gosub Spell7  ;use Spell place 7
8::gosub Spell8  ;use Spell place 8
9::gosub Spell9  ;use Spell place 9
0::gosub Spell10  ;use Spell place 10
 
+1::gosub Spell_reset  ;reset Spell to place 1
+2::gosub SpellSlot2  ;use Spell place 2
+3::gosub SpellSlot3  ;use Spell place 3
+4::gosub SpellSlot4  ;use Spell place 4
+5::gosub SpellSlot5  ;use Spell place 5
+6::gosub SpellSlot6  ;use Spell place 6
+7::gosub SpellSlot7  ;use Spell place 7
+8::gosub SpellSlot8  ;use Spell place 8
+9::gosub SpellSlot9  ;use Spell place 9
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
; q::gosub Parry ; Parry+Light Attack
Parry:
   SendInput {%V_SKILL% down}
   sleep 25
   SendInput {%V_SKILL% up}
   sleep 300
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
;w::gosub Crouch ; Crouch+Attack
Crouch:
   SendInput {%V_CROUCH% down}
   sleep 25
   SendInput {%V_CROUCH% up}
   sleep 100
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
;e::gosub Jump ; Jump+Attack
Jump:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_ATTACK% down}
   sleep 25
   SendInput {%V_ATTACK% up}
return
 
;+e::gosub JumpDualWeild ; Jump+Dual-Wield Combo Attack
JumpDualWeild:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_GUARD% down}
   sleep 25
   SendInput {%V_GUARD% up}
return
 
;r::gosub JumpStrong ; Jump+Strong+Attack
JumpStrong:
   SendInput {%V_JUMP% down}
   sleep 300
   SendInput {%V_JUMP% up}
   sleep 25
   SendInput {%V_SATTACK% down}
   sleep 300
   SendInput {%V_SATTACK% up}
return
 
;--------------scripts-Spells Auto-Cast ----------
; This is universal for all 4 required loops on belts and spells
findIteration( target, position, slots )
{
   logNp( "findIteration line: 400 Target:" target ", Position:" position ", Slots:" slots  )

   ; Return 0 and do nothing as we are on the correct slot.
   if (target = position){
      return 0
   }
   val := target - position
   if( val > 0 ){
      return val
   }else  {
      return slots + val
   }}
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
doSpellUseLoop( iteration, bUse )
{
   i := 0
   logNp( iteration "Going to loop key presses" )
   sleep 1000 ; just giving 1 second to see message before execution
   loop %iteration%
   {
      ; loop to target position
      i++
      if( doUP() )
      {
         logNp(i "Iteration Successful" )
         sleep 25
      }}
   logNp("Total Loops" i "out of " iteration)
   if( bUse = 1 ){
      sleep 150
      gosub P_K ; activate use
   }}
doSpellItr( itr, slot, bUse )
{
   if( itr = 0 ) {
      if( bUse = 1){
         gosub P_K
         return
      }
      logNp("Slot " slot " Target: " itr " Just use dont move" )
   }else  if ( itr = 1 )  {
      if( doUp() )
      {
         logNp("Slot " slot "  Target: " itr  "Moving Once" )
         if( bUse = 1){
            sleep 150
            gosub P_K
         }}
      ;}else if( itr >= 4) {
      ; gosub S_UP
      ; doSpellUseLoop(slot-1)
      ;MsgBox Slot %slot% Target: %itr% Reset
   }else  {
      doSpellUseLoop(itr, bUse)
      logNp( "Slot" slot "Target:" itr " Looping")
   }
   return
}
 
doBeltUseLoop( iteration, bUse )
{
   loop %iteration%
   {
      ; loop to target position
      if( doDown() )
      {
         sleep 25
      }}
   if( bUse = 1 ){
      sleep 150
      gosub P_K ; activate use
   }}
doBeltItr( itr, slot, bUse )
{
   if( itr = 0 ) {
      if( bUse = 1){
         gosub P_K
      }
      ;MsgBox Slot 2 Target: %itr% Just use
   }else  if ( itr = 1 )  {
      if( doDown() )
      {
         if( bUse = 1){
            sleep 150
            gosub P_K
         }}
      ;}else if( itr >= 4) { was testing if resetting was faster but in the end just looping is fine
      ; gosub S_UP
      ; doBeltUseLoop(slot-1)
      ;MsgBox Slot %slot% Target: %itr% Reset
   }else  {
      doBeltUseLoop(itr, bUse)
      ;MsgBox Slot %slot% Target: %itr% Looping
   }
   return
}
; piples all the slot actions to a unified function for easier debugging / tracking and cleaner code.
doSpellSlot( slot, activate )
{
	global V_SPELLSLOT 
	global V_SPELL_SLOTS
	
	if( V_SPELL_SLOTS < slot ){
      return
   }else  {
      gosub S_UP
      V_SPELLSLOT := 1
      iteration := findIteration( slot, V_SPELLSLOT, V_SPELL_SLOTS )
      ;MsgBox Slot 3 Target: %itr% Position: %V_SPELLSLOT%
      V_SPELLSLOT := slot ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      success := doSpellItr( iteration, V_SPELLSLOT, activate )
   }
}

logNp(msg)
{
   global V_DEBUG
   if( V_DEBUG == 1 ) {
		ControlSend, Scintilla1, % "`r`n" msg "`r`n", ahk_class Notepad++
   }
}
Spell_reset:
   gosub S_UP
   V_SPELLSLOT := 1
   logNp( "Resetting to Spell Slot: " V_SPELLSLOT )
return
Spell1:
   V_SPELLSLOT := 1 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
   itr := findIteration( 1, V_SPELLSLOT, V_SPELL_SLOTS )
   gosub S_UP
   suc := doSpellItr( itr, V_SPELLSLOT, 1)
return
Spell2: ; Player always has 2 slots...
gosub S_UP
	V_SPELLSLOT := 1
	itr := findIteration( 2, V_SPELLSLOT, V_SPELL_SLOTS )
	logNp(  "Slot 2 Iteration:" itr "Current Spell Slot:" V_SPELLSLOT )
	sleep 1000
	V_SPELLSLOT := 2 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
	suc := doSpellItr( itr, V_SPELLSLOT, 1 )
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
   itr := findIteration( 2, V_SPELLSLOT, V_SPELL_SLOTS )
   ;MsgBox Slot 2 Target: %itr% Position: %V_SPELLSLOT%
   V_SPELLSLOT := 2 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
   suc := doSpellItr( itr, V_SPELLSLOT, 0 )
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
   gosub H_Down
return
UseBelt1:
   itr := findIteration( 1, V_BELTSLOT, V_BELT_SLOTS )
   V_BELTSLOT := 1 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
   suc := doBeltItr( itr, V_BELTSLOT, 1)
return
UseBelt2:
   itr := findIteration( 2, V_BELTSLOT, V_BELT_SLOTS )
   ;MsgBox Slot 2 Iteration: %itr% Current Spell Slot: %V_BELTSLOT%
   V_BELTSLOT := 2 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
   suc := doBeltItr( itr, V_BELTSLOT, 1 )
return
UseBelt3:
   if( V_BELT_SLOTS < 3 ){
      return
   }else  {
      itr := findIteration( 3, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 3 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 3 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 1 )
   }
return
UseBelt4:
   if( V_BELT_SLOTS < 4 ){
      return
   }else  {
      itr := findIteration( 4, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 4 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 4 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 1 )
   }
return
UseBelt5:
   if( V_BELT_SLOTS < 5 ){
      return
   }else  {
      itr := findIteration( 5, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 5 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 5 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 1 )
   }
return
UseBelt6:
   if( V_BELT_SLOTS < 6 ){
      return
   }else  {
      itr := findIteration( 6, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 6 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 6 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 1 )
   }
return
UseBelt7:
   if( V_BELT_SLOTS < 7 ){
      return
   }else  {
      itr := findIteration( 7, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 7 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 7 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 1 )
   }
return
UseBelt8:
   if( V_BELT_SLOTS < 8 ){
      return
   }else  {
      itr := findIteration( 8, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 8 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 8 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 1 )
   }
return
UseBelt9:
   if( V_BELT_SLOTS < 9 ){
      return
   }else  {
      itr := findIteration( 9, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 9 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 9 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 1 )
   }
return
UseBelt10:
   if( V_BELT_SLOTS < 10 ){
      return
   }else  {
      itr := findIteration( 10, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 10 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 10 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 1 )
   }
return
SwitchBelt1:
   gosub H_Down
return
SwitchBelt2:
   itr := findIteration( 2, V_BELTSLOT, V_BELT_SLOTS )
   ;MsgBox Slot 2 Target: %itr% Position: %V_BELTSLOT%
   V_BELTSLOT := 2 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
   suc := doBeltItr( itr, V_BELTSLOT, 0 )
return
SwitchBelt3:
   itr := findIteration( 3, V_BELTSLOT, V_BELT_SLOTS )
   ;MsgBox Slot 3 Target: %itr% Position: %V_BELTSLOT%
   V_BELTSLOT := 3 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
   suc := doBeltItr( itr, V_BELTSLOT, 0 )
return
SwitchBelt4:
   if( V_BELT_SLOTS < 4 ){
      return
   }else  {
      itr := findIteration( 4, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 4 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 4 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 0 )
   }
return
SwitchBelt5:
   if( V_BELT_SLOTS < 5 ){
      return
   }else  {
      itr := findIteration( 5, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 5 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 5 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 0 )
   }
return
SwitchBelt6:
   if( V_BELT_SLOTS < 6 ){
      return
   }else  {
      itr := findIteration( 6, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 6 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 6 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 0 )
   }
return
SwitchBelt7:
   if( V_BELT_SLOTS < 7 ){
      return
   }else  {
      itr := findIteration( 7, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 7 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 7 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 0 )
   }
return
SwitchBelt8:
   if( V_BELT_SLOTS < 8 ){
      return
   }else  {
      itr := findIteration( 8, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 8 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 8 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 0 )
   }
return
SwitchBelt9:
   if( V_BELT_SLOTS < 9 ){
      return
   }else  {
      itr := findIteration( 9, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 9 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 9 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 0 )
   }
return
SwitchBelt10:
   if( V_BELT_SLOTS < 10 ){
      return
   }else  {
      itr := findIteration( 10, V_BELTSLOT, V_BELT_SLOTS )
      ;MsgBox Slot 10 Target: %itr% Position: %V_BELTSLOT%
      V_BELTSLOT := 10 ; always set the slot even if loop fails.  Player will have to reset if latency causes loop problems.
      suc := doBeltItr( itr, V_BELTSLOT, 0 )
   }
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
return
Pouch_Right:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_DRIGHT% down}
   sleep 25
   SendInput {%V_DRIGHT% up}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
return
Pouch_Up:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   SendInput {%V_DUP% down}
   sleep 25
   SendInput {%V_DUP% up}
   sleep 25
   SendInput {%V_EVENT_ACTION% up}
return
Pouch_Down:
   SendInput {%V_EVENT_ACTION% down}
   sleep 25
   gosub P_Down
   SendInput {%V_EVENT_ACTION% up}
return
Pouch_5:
   gosub P_Esc
   MouseMove 1750, 470
   sleep 25
   gosub P_E
   gosub P_Esc
return
Pouch_6:
   gosub P_Esc
   MouseMove 1840, 470
   sleep 25
   gosub P_E
   gosub P_Esc
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
return
gesture_2:
   gosub P_Esc
   MouseMove 3660, 1225 ; 1840, 620
   sleep 25
   gosub P_E
   gosub P_Esc
return
gesture_3:
   gosub P_Esc
   MouseMove 3470, 1410 ; 1750, 710
   sleep 25
   gosub P_E
   gosub P_Esc
return
gesture_4:
   gosub P_Esc
   MouseMove 3660, 1410 ; 1840, 710
   sleep 25
   gosub P_E
   gosub P_Esc
return
gesture_5:
   gosub P_Esc
   MouseMove 3470, 1600 ; 1750, 800
   sleep 25
   gosub P_E
   gosub P_Esc
return
gesture_6:
   gosub P_Esc
   MouseMove 3660, 1600 ; 1840, 800
   sleep 25
   gosub P_E
   gosub P_Esc
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
  sleep 50
  SendInput {%V_ToggleSpell% up}
  sleep 50
return
P_Down:
   SendInput {%V_DOWN% down}
   sleep 40
   SendInput {%V_DOWN% up}
   sleep 10
return
; Keyboard polls ~ 15 milleseconds. Repeat key-presses may not reach the client during a poll
; resulting in some but not all the key presses being sent.  Elden Ring uses Anti-cheat which
; may cause some interference.  Noted directly referencing keybindings causes all sorts of problems
; so we reference to that binding and it works better.  This is why we have reserved keys for the client
; and reference to those keybindings with HotKeys.  This is also why run script can be more problematic
; than compiling and running the executable (which running as Administrator is recommended).  
; Other issues can be the window setting for Elden Ring, so setting it to Borderless Window is recommended.
; Anti-Cheat software may also see the games name as an exe as some type of cheat so another recommendation
; is to rename the compiled AHK script to something ambiguous.  The biggest challenge thus far has been
; managing the spell slots and belt slots.  Moving to Variable hotkeys seemed to cause a lot more issues
; but working with those issues there has been some great progress albiet not perfect performance.
; Noted using SHIFT can cause multiple keypresses instead of 'one' when called as a hotkey.  I noted this
; when directly referencing a ER keybinding and used it with a shift.  Caused a series of random behaviors
; but when referenced to a keybinding as another key defined in AutoHot key it preformed as expected.
; With the belt/slot I have ok performance without the shift 'one' click.  The shift paramater causes 2
; clicks resulting in two slot changes instead of one.  I've seen improved performance with SendInput
; so switched to that instead of Send, but in certain cases Send may be a better solution so where there
; are problems I'll need to test between the two.  
 
; Tested 15 for each - loss several key-strokes in loop ie stopped at 4 instead of 8.
; Tested 60/40 - that seemed to have ok consistency.
; Testing slow emulated key presses 200/20 and it hasn't proven better consistency but good for debugging.
; The slow clicking is definately consistent so we can tweak this once we get any other programatic issues
; resolved.  The slower inputs also make shift more concistent but still having 'double-click' issues.
; For testing the non-shift is using reset on every slot.  The shift is using slot-tracking but the double-click issue
; is throwing off placement.
P_Up:
   SendInput {%V_DUP% down}
   logNp( "Key " V_DUP "down")
   sleep 200
   SendInput {%V_DUP% up}
   logNp( "Key " V_DUP "up")
   sleep 20
return
 
H_Down:
   SendInput {%V_DOWN% down}
   sleep 550
   SendInput {%V_DOWN% up}
   sleep 25
return
 
; Noting inconsistencies here, it sometimes successfully resets and other times it doesn't.
; Current setting is 550 and inconsistencies are noted.
; Trying a full second now to see if this guarantees a proper reset.
; At 1000 all resets occured consistently so the sweet spot is definately between >550-1000
S_UP:
   SendInput {%V_DUP% down}
   sleep 1000
   SendInput {%V_DUP% up}
   sleep 25
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
 
;^::gosub Belt_reset ; reset belt to place 1
;F1::gosub Belt1 ; use belt place 1
;F2::gosub Belt2 ; use belt place 2
;F3::gosub Belt3 ; use belt place 3
;F4::gosub Belt4 ; use belt place 4
;F5::gosub Belt5 ; use belt place 5
;F6::gosub Belt6 ; use belt place 6
;F7::gosub Belt7 ; use belt place 7
;F8::gosub Belt8 ; use belt place 8
;F9::gosub Belt9 ; use belt place 9
;F10::gosub Belt10 ; use belt place 10
 
;+F1::gosub gesture_1 ; gesture 1
;+F2::gosub gesture_2 ; gesture 2
;+F3::gosub gesture_3 ; gesture 3
;+F4::gosub gesture_4 ; gesture 4
;+F5::gosub gesture_5 ; gesture 5
;+F6::gosub gesture_6 ; gesture 6