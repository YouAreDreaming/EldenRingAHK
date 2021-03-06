initHotKeyMeta(ByRef G_HotKeyMeta)
{ 

G_HotKeyMeta 				:= []

G_HotKeyMeta["GAME"]				:= []
G_HotKeyMeta["COMBOS"]				:= []
G_HotKeyMeta["POUCH"] 				:= []
G_HotKeyMeta["BELT"] 				:= []
G_HotKeyMeta["SPELL"] 				:= []
G_HotKeyMeta["GESTURES"] 			:= []
G_HotKeyMeta["TOGGLE"] 				:= []
G_HotKeyMeta["CONFIG"] 				:= []

G_HotKeyMeta["GAME"]["V_MOVE_CONTROL"]			:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_MOVE_FORWARD"]			:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_MOVE_BACKWARDS"]		:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_MOVE_LEFT"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_MOVE_RIGHT"]			:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_DODGE"]					:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_JUMP"]					:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_CROUCH"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_CAMUP"]					:= { "type": "reference","label": "", "animationtime": "0", "enabled":"0"}
G_HotKeyMeta["GAME"]["V_CAMDOWN"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"0"}
G_HotKeyMeta["GAME"]["V_CAMLEFT"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_CAMRIGHT"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_LOCKON"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_DUP"]					:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_DDOWN"]					:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_DRIGHT"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_DLEFT"]					:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_ATTACK"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_SATTACK"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_GUARD"]					:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_SKILL"]					:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_USEITEM"]				:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["GAME"]["V_EVENT_ACTION"]			:= { "type": "reference","label": "", "animationtime": "0", "enabled":"1"}

G_HotKeyMeta["POUCH"]["V_UPOUCH"]				:= { "type": "func","label": "S_Pouch_Up", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["POUCH"]["V_LPOUCH"]				:= { "type": "func","label": "S_Pouch_Left", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["POUCH"]["V_RPOUCH"]				:= { "type": "func","label": "S_Pouch_Right", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["POUCH"]["V_DPOUCH"]				:= { "type": "func","label": "S_Pouch_Down", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["POUCH"]["V_5POUCH"]				:= { "type": "func","label": "S_Pouch_5", "animationtime": "0", "enabled":"1"}
G_HotKeyMeta["POUCH"]["V_6POUCH"]				:= { "type": "func","label": "S_Pouch_6", "animationtime": "0", "enabled":"1"}

G_HotKeyMeta["COMBOS"]["V_PARRY"]				:= { "type": "func","label": "S_Parry", "animationtime": "1600", "enabled":"1"}
G_HotKeyMeta["COMBOS"]["V_2H_LEFT"]				:= { "type": "func","label": "S_2H_Left", "animationtime": "500", "enabled":"1"}
G_HotKeyMeta["COMBOS"]["V_2H_RIGHT"]			:= { "type": "func","label": "S_2H_Right", "animationtime": "500", "enabled":"1"}
G_HotKeyMeta["COMBOS"]["V_LEFTARMEMENT"]		:= { "type": "func","label": "S_LeftArmement", "animationtime": "500", "enabled":"1"}
G_HotKeyMeta["COMBOS"]["V_RIGHTARMEMENT"]		:= { "type": "func","label": "S_RightArmement", "animationtime": "500", "enabled":"1"}
G_HotKeyMeta["COMBOS"]["V_JUMPDUALWEILD"]		:= { "type": "func","label": "S_JumpDualWeild", "animationtime": "1300", "enabled":"1"}
G_HotKeyMeta["COMBOS"]["V_CROUCH"]				:= { "type": "func","label": "S_Crouch", "animationtime": "1200", "enabled":"1"}
G_HotKeyMeta["COMBOS"]["V_JUMPATTACK"]			:= { "type": "func","label": "S_Jump", "animationtime": "1200", "enabled":"1"}
G_HotKeyMeta["COMBOS"]["V_JUMPSTRONG"]			:= { "type": "func","label": "S_JumpStrong", "animationtime": "2200", "enabled":"1"}

G_HotKeyMeta["BELT"]["V_USEBELTSLOT1"]			:= { "type": "func","label": "S_UseBelt1", "animationtime": "500", "autolock":"V_BELTAUTOLOCK1", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT2"]			:= { "type": "func","label": "S_UseBelt2", "animationtime": "500", "autolock":"V_BELTAUTOLOCK2", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT3"]			:= { "type": "func","label": "S_UseBelt3", "animationtime": "500", "autolock":"V_BELTAUTOLOCK3", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT4"]			:= { "type": "func","label": "S_UseBelt4", "animationtime": "500", "autolock":"V_BELTAUTOLOCK4", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT5"]			:= { "type": "func","label": "S_UseBelt5", "animationtime": "500", "autolock":"V_BELTAUTOLOCK5", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT6"]			:= { "type": "func","label": "S_UseBelt6", "animationtime": "500", "autolock":"V_BELTAUTOLOCK6", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT7"]			:= { "type": "func","label": "S_UseBelt7", "animationtime": "500", "autolock":"V_BELTAUTOLOCK7", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT8"]			:= { "type": "func","label": "S_UseBelt8", "animationtime": "500", "autolock":"V_BELTAUTOLOCK8", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT9"]			:= { "type": "func","label": "S_UseBelt9", "animationtime": "500", "autolock":"V_BELTAUTOLOCK9", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_USEBELTSLOT10"]			:= { "type": "func","label": "S_UseBelt10", "animationtime": "500", "autolock":"V_BELTAUTOLOCK10", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT1"]		:= { "type": "func","label": "S_Belt_reset", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT2"]		:= { "type": "func","label": "S_SwitchBelt2", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT3"]		:= { "type": "func","label": "S_SwitchBelt3", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT4"]		:= { "type": "func","label": "S_SwitchBelt4", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT5"]		:= { "type": "func","label": "S_SwitchBelt5", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT6"]		:= { "type": "func","label": "S_SwitchBelt6", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT7"]		:= { "type": "func","label": "S_SwitchBelt7", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT8"]		:= { "type": "func","label": "S_SwitchBelt8", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT9"]		:= { "type": "func","label": "S_SwitchBelt9", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["BELT"]["V_SWITCHBELTSLOT10"]		:= { "type": "func","label": "S_SwitchBelt10", "animationtime": "200", "enabled":"1"}

G_HotKeyMeta["GESTURES"]["V_GESTURE1"]			:= { "type": "func","label": "S_gesture_1", "animationtime": "1000", "enabled":"1"}
G_HotKeyMeta["GESTURES"]["V_GESTURE2"]			:= { "type": "func","label": "S_gesture_2", "animationtime": "1000", "enabled":"1"}
G_HotKeyMeta["GESTURES"]["V_GESTURE3"]			:= { "type": "func","label": "S_gesture_3", "animationtime": "1000", "enabled":"1"}
G_HotKeyMeta["GESTURES"]["V_GESTURE4"]			:= { "type": "func","label": "S_gesture_4", "animationtime": "1000", "enabled":"1"}
G_HotKeyMeta["GESTURES"]["V_GESTURE5"]			:= { "type": "func","label": "S_gesture_5", "animationtime": "1000", "enabled":"1"}
G_HotKeyMeta["GESTURES"]["V_GESTURE6"]			:= { "type": "func","label": "S_gesture_6", "animationtime": "1000", "enabled":"1"}

G_HotKeyMeta["SPELL"]["V_USESPELLSLOT1"]		:= { "type": "func","label": "S_Spell1", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK1", "hand":"V_SPELLHAND1", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot2"]		:= { "type": "func","label": "S_Spell2", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK2", "hand":"V_SPELLHAND2", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot3"]		:= { "type": "func","label": "S_Spell3", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK3", "hand":"V_SPELLHAND3", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot4"]		:= { "type": "func","label": "S_Spell4", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK4", "hand":"V_SPELLHAND4", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot5"]		:= { "type": "func","label": "S_Spell5", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK5", "hand":"V_SPELLHAND5", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot6"]		:= { "type": "func","label": "S_Spell6", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK6", "hand":"V_SPELLHAND6", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot7"]		:= { "type": "func","label": "S_Spell7", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK7", "hand":"V_SPELLHAND7", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot8"]		:= { "type": "func","label": "S_Spell8", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK8", "hand":"V_SPELLHAND8", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot9"]		:= { "type": "func","label": "S_Spell9", "animationtime": "500",  "autolock":"V_SPELLAUTOLOCK9", "hand":"V_SPELLHAND9", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_USES_SpellSlot10"]		:= { "type": "func","label": "S_Spell10", "animationtime": "500", "autolock":"V_SPELLAUTOLOCK10", "hand":"V_SPELLHAND10", "enabled":"1"}


G_HotKeyMeta["SPELL"]["V_SWITCHSPELLSLOT1"]		:= { "type": "func","label": "S_SpellReset", "animationtime": "500", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot2"]	:= { "type": "func","label": "S_SpellSlot2", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot3"]	:= { "type": "func","label": "S_SpellSlot3", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot4"]	:= { "type": "func","label": "S_SpellSlot4", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot5"]	:= { "type": "func","label": "S_SpellSlot5", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot6"]	:= { "type": "func","label": "S_SpellSlot6", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot7"]	:= { "type": "func","label": "S_SpellSlot7", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot8"]	:= { "type": "func","label": "S_SpellSlot8", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot9"]	:= { "type": "func","label": "S_SpellSlot9", "animationtime": "200", "enabled":"1"}
G_HotKeyMeta["SPELL"]["V_SWITCHS_SpellSlot10"]	:= { "type": "func","label": "S_SpellSlot10", "animationtime": "200", "enabled":"1"}
	
G_HotKeyMeta["TOGGLE"]["V_TOGGLESPELLHAND"]		:= { "type": "func","label": "S_ToggleSpellHand", "animationtime": "500", "enabled":"1"}
G_HotKeyMeta["TOGGLE"]["V_TOGGLEDEBUG"]			:= { "type": "func","label": "S_ToggleDebug", "animationtime": "500", "enabled":"1"}
G_HotKeyMeta["TOGGLE"]["V_TOGGLEAUTOLOCK"]		:= { "type": "func","label": "S_TOGGLEAUTOLOCK", "animationtime": "500", "enabled":"1"}
G_HotKeyMeta["TOGGLE"]["V_TOGGLEAUTORUN"]		:= { "type": "func","label": "S_ToggleAutoRun", "animationtime": "500", "enabled":"1"}


Return
}
