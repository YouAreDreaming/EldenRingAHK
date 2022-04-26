
; ------------ Subroutines -------------------

S_SetSpellSlots:
InputBox, slots, Enter the number of spell slots on your character, hide
if ErrorLevel
    MsgBox, % "Cancelled. Leaving as " %V_SPELL_SLOTS% "slots"	
else
    V_SPELL_SLOTS := slots
	MsgBox, % "Spell Slots set to " slots
return

S_SetBeltSlots:
InputBox, slots, Enter the number of belt slots on your character, hide
if ErrorLevel
    MsgBox, % "Cancelled. Leaving as " %V_BELT_SLOTS% "slots"	
else
    V_BELT_SLOTS := slots
	MsgBox, % "Belt Slots set to " slots
return