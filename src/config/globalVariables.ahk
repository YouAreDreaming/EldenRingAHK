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
V_SPELL_SLOTS := 8 		; Set your default spell slots.  Change in game with CTRL-SHIFT-1
V_BELT_SLOTS := 10 		; Set # of belt slots you want to auto use.  Change in game with CTRL-SHIFT-2
 
V_MOVE_CONTROL = Backspace ; Movement control (slows walk).
V_MOVE_FORWARD = y 		; !!Move Forwards used with auto-run
V_MOVE_BACKWARDS = u 	; Move Backwards
V_MOVE_LEFT = i 		; Move Left
V_MOVE_RIGHT = o 		; Move Right
V_DODGE = p 			; !!Backstep, Dodge Roll, Dash
V_JUMP = Space 			; !!Jump
V_CROUCH = t 			; !!Crouch / Stand Up
 
V_CAMUP = ""				; Move Camera / Change Target (Up)
V_CAMDOWN = ""			; Move Camera / Change Target (Down)
V_CAMLEFT = +z 		; Move Camera / Change Target (Left)
V_CAMRIGHT = +x 		; Move Camera / Change Target (Right)
V_LOCKON = tab 		; Reset Camera, Lock-On/Remove Target
 
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

; --- Combo Global Variables for Hotkeys.
V_AUTORUN = n
V_PARRY = a
V_2H_LEFT = +a
V_2H_RIGHT = +s
V_LEFTARMEMENT = +d 
V_RIGHTARMEMENT = +f
V_JUMPDUALWEILD = +e
V_CROUCH = w
V_JUMP = e
V_JUMPSTRONG = r
V_TOGGLESPELLHAND = ^+z
V_TOGGLEDEBUG = ^+!d 
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
V_USES_SpellSlot2 = 2
V_USES_SpellSlot3 = 3
V_USES_SpellSlot4 = 4
V_USES_SpellSlot5 = 5
V_USES_SpellSlot6 = 6
V_USES_SpellSlot7 = 7
V_USES_SpellSlot8 = 8
V_USES_SpellSlot9 = 9
V_USES_SpellSlot10 = 0
 
V_SWITCHSPELLSLOT1 = +1
V_SWITCHS_SpellSlot2 = +2
V_SWITCHS_SpellSlot3 = +3
V_SWITCHS_SpellSlot4 = +4
V_SWITCHS_SpellSlot5 = +5
V_SWITCHS_SpellSlot6 = +6
V_SWITCHS_SpellSlot7 = +7
V_SWITCHS_SpellSlot8 = +8
V_SWITCHS_SpellSlot9 = +9
V_SWITCHS_SpellSlot10 = +0
;-----[ Gestures ]
;----- ^ is for CTRL
V_GESTURE1 = ^1
V_GESTURE2 = ^2
V_GESTURE3 = ^3
V_GESTURE4 = ^4
V_GESTURE5 = ^5
V_GESTURE6 = ^6
 
V_SetSpellSlots	= ^+1
V_SetBeltSlots	= ^+2
V_debugGui	= ^+d	

   
;----- Variables for tracking states.
;----- Do not edit these as they are used by the program to track various states
V_DBoolean = 0				; A boolean to track use or not use.
V_BSReset = 0 				; A boolean to track spell slot reset if it goes out of sync on any button press.
V_BBReset = 0 				; A boolean to track belt slot reset if it goes out of sync on any button press.
V_SpellSlot = 0 			; To track what the current slot is for better cycling. Reset position if alignment is off.
V_BeltSlot = 0 				; To track what the current belt slot is for better cycling.  Reset position if alingment is off
V_ToggleSpell := V_GUARD 	; To track what hand is using the wand/incantation item for spell casting.
V_Gui_Active := 0			; to track the 3 second interval when the D-PAD GUI in the game is open
V_GUIFade = 2000			; The gui fades under certain states so we need to change this value to match those timing states
V_LastKey = 0				; Track the last key pressed
V_LastKeyTime = 0 			; The time it was pressed

V_Categories := { "GAME": 12, "COMBOS": 14, "POUCH": 10, "BELT": 10,  "SPELL": 10, "GESTURES": 10, "CONFIG": 10 }