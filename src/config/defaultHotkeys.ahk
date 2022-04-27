
 
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
; The Map and Equipment menus cannot have a key mapped here or it will not work, you'll have to use the controller
; 
;a::k 							; L1 Dual-Attack, Parry, Block 
a::gosub S_Parry 				; Switching to parry combo, using mouse button for light attack.
s::l 							; L2 Use Skill
d::h  							; R1 Light Attack
f::j 							;
n::gosub S_AutoRun				; Move Forward (bound to my mouse as n key)
~v::Enter						; Use Action 
+a::gosub S_2H_Left 				; left hand weapon twohanded
+s::gosub S_2H_Right 				; right hand weapon twohanded
+d::gosub S_LeftArmement 		; toggle left hand armement
+f::gosub S_RightArmement 		; toggle right hand armement.
+e::gosub S_JumpDualWeild 		; Does a jump and dual-weild combo attack
w::gosub S_Crouch 				; Crouch+Attack
e::gosub S_Jump 					; Jump+Attack
r::gosub S_JumpStrong 			; Jump+Strong+Attack

c::t 							; C for Crouch.
+z::gosub S_UseBelt1 				; Physics Flask on BELT SLOT 1
^+z::gosub S_ToggleSpellHand 	; Toggles which hand to cast spell from
^+!d::gosub S_ToggleDebug		; Toggles debugging if any is enabled.
m::g 							; m for Map
^+1::gosub S_SetSpellSlots		; CTRL-SHIFT-1 lets you set the number of spell slots.
^+2::gosub S_SetBeltSlots		; CTRL-SHIFT-2 lets you set the number of spell slots.
^+d::gosub S_debugGui			; First attempt at a gui overlay for debugging
;----  Best to leave as is and reference to a key-map above if needed ---
1::gosub S_Spell1  				; use Spell place 1
2::gosub S_Spell2  				; use Spell place 2
3::gosub S_Spell3  				; use Spell place 3
4::gosub S_Spell4  				; use Spell place 4
5::gosub S_Spell5  				; use Spell place 5
6::gosub S_Spell6  				; use Spell place 6
7::gosub S_Spell7  				; use Spell place 7
8::gosub S_Spell8  				; use Spell place 8
9::gosub S_Spell9  				; use Spell place 9
0::gosub S_Spell10  				; use Spell place 10
 
+1::gosub S_SpellReset  			; reset Spell to place 1
+2::gosub S_SpellSlot2  			; use Spell place 2
+3::gosub S_SpellSlot3  			; use Spell place 3
+4::gosub S_SpellSlot4  			; use Spell place 4
+5::gosub S_SpellSlot5  			; use Spell place 5
+6::gosub S_SpellSlot6  			; use Spell place 6
+7::gosub S_SpellSlot7  			; use Spell place 7
+8::gosub S_SpellSlot8  			; use Spell place 8
+9::gosub S_SpellSlot9  			; use Spell place 9

F1::gosub S_UseBelt1 				; use belt place 1
F2::gosub S_UseBelt2 				; use belt place 2
F3::gosub S_UseBelt3 				; use belt place 3
F4::gosub S_UseBelt4 				; use belt place 4
F5::gosub S_UseBelt5 				; use belt place 5
F6::gosub S_UseBelt6 				; use belt place 6
F7::gosub S_UseBelt7 				; use belt place 7
F8::gosub S_UseBelt8 				; use belt place 8
F9::gosub S_UseBelt9 				; use belt place 9
F10::gosub S_UseBelt10 			; use belt place 10

+F1::gosub S_Belt_reset 			; use belt place 1
+F2::gosub S_SwitchBelt2 			; use belt place 2
+F3::gosub S_SwitchBelt3 			; use belt place 3
+F4::gosub S_SwitchBelt4 			; use belt place 4
+F5::gosub S_SwitchBelt5 			; use belt place 5
+F6::gosub S_SwitchBelt6 			; use belt place 6
+F7::gosub S_SwitchBelt7 			; use belt place 7
+F8::gosub S_SwitchBelt8 			; use belt place 8
+F9::gosub S_SwitchBelt9 			; use belt place 9
+F10::gosub S_SwitchBelt10 		; use belt place 10

+Numpad1::gosub S_gesture_1 ; gesture 1
+Numpad2::gosub S_gesture_2 ; gesture 2
+Numpad3::gosub S_gesture_3 ; gesture 3
+Numpad4::gosub S_gesture_4 ; gesture 4
+Numpad5::gosub S_gesture_5 ; gesture 5
+Numpad6::gosub S_gesture_6 ; gesture 6


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