doSpellUseLoop( iteration, bUse )
{
   loop %iteration%
   {
      ; loop to target position      
      if( doUP() )
      {
        ; sleep 25
      }}   
   if( bUse == 1 ){
      startAutoLock()
      gosub P_K ; activate use
	  endAutoLock()
	  gDebugMessage := % "Looped: " iteration " sending use"
   }}
   
doSpellItr( itr, slot, bUse )
{
	global gDebugMessage
	
   if( itr == 0 ) {
      if( bUse == 1){
			doSpellUse()
			gDebugMessage  := % "On current slot: " slot " just sending use"
         return 0
      }
     
   }else  if ( itr == 1 )  {
		active := getGuiActive()
      if( doUp() )
      {  
		sleep 100
		
		if( active == 1 ) 	
		 {
			doUp()
			gDebugMessage  := % "Doing Two steps: Activate GUI then Move up 1 slot"
		 }
         if( bUse == 1){
		 
           doSpellUse()
         }
		 return 1
		 }
      
   }else  {
		doSpellUseLoop(itr, bUse)
		return 1      
   }
   return 0
}
doSpellUse()
{
	
	  startAutoLock()
      gosub P_K
	  endAutoLock()
} 
; pipes all the slot actions to a unified function for easier debugging / tracking and cleaner code.
doSpellSlot( slot, activate )
{
	global V_SPELLSLOT 
	global V_SPELL_SLOTS
	global V_BSReset
	global V_GUIFade
	global G_HotKeys
	global gDebugMessage
	global isCycling	
	global V_ToggleSpell
	global V_GUARD  
	global V_ATTACK
	
	; If they have less active spell slots than the target slot, just do nothing
	if( V_SPELL_SLOTS < slot ){
		gDebugMessage := % "Assigned Spell Slots " V_SPELL_SLOTS " is less than target: " slot
      return 0
	}else  {
		    
			
			IF G_HotKeys[A_ThisHotKey].hand
			{
				k := % G_HotKeys[A_ThisHotKey].hand
				V_ToggleSpell := (%k% == V_GUARD ) ? V_GUARD : V_ATTACK
				gDebugMessage := % "Spell Hand detected: " A_ThisHotKey " value: " V_ToggleSpell
				; MsgBox % "Spell Key" A_ThisHotKey " Toggle: " V_ToggleSpell " Key: " k
			}
				
			if( V_BSReset == 1 )
			{
				isCycling := 1
				gosub S_SpellReset
				gDebugMessage := % "doSpellSlot Resetting to slot 1"
				return
			}
			
		  iteration := findIteration( slot, V_SPELLSLOT, V_SPELL_SLOTS)		  
		  V_GUIFade := 2000			; GUI fades after 2000 on both use/unuse or with count
		  IF isCycling
		  {
			gDebugMessage := % "Currently Cycling to another slot"
			return 0
		  }
		  isCycling := 1
		  success := doSpellItr( iteration, V_SPELLSLOT, activate )
		  isCycling := 0
		  IF success  
			gDebugMessage := % "GUI FADE: " V_GUIFade " Target Slot: " slot " Current Slot: " V_SPELLSLOT
		  
		  V_SPELLSLOT := slot 
	}
}

S_SpellReset:
   
   ;gosub P_UP   
   gosub S_UP
  
   V_SPELLSLOT := 1
   V_BSReset := 0   
return
S_Spell1:	
	gosub S_SpellReset
	doSpellSlot( 1, 1 )	
	V_GUIFade := 1550			; the GUI fades after 1450 if all is pressed is this	
	;doSpellSlot( 1, 1 )	
return
S_Spell2: ; Player always has 2 slots...		
	doSpellSlot( 2, 1 )	
return
S_Spell3:	
	doSpellSlot( 3, 1 )	
return
S_Spell4:
   doSpellSlot( 4, 1 )   
return
S_Spell5:   
   doSpellSlot( 5, 1 )   
return
S_Spell6:   
  doSpellSlot( 6, 1 )  
return
S_Spell7:   
   doSpellSlot( 7, 1 )   
return
S_Spell8:   
  doSpellSlot( 8, 1 )  
return
S_Spell9:   
  doSpellSlot( 9, 1 )  
return
S_Spell10:   
   doSpellSlot( 10, 1 )   
return

;--------------scripts-Spells Switch to no cast (intended to use shift to activate ) ----------
 
S_SpellSlot2:
   doSpellSlot( 2, 0 )
return
S_SpellSlot3:
   doSpellSlot( 3, 0 )
return
S_SpellSlot4:
    doSpellSlot( 4, 0 )
return
S_SpellSlot5:
    doSpellSlot( 5, 0 )
return
S_SpellSlot6:
   doSpellSlot( 6, 0 )
return
S_SpellSlot7:
    doSpellSlot( 7, 0 )
return
S_SpellSlot8:
   doSpellSlot( 8, 0 )
return
S_SpellSlot9:
   doSpellSlot( 9, 0 )
return
S_SpellSlot10:
   doSpellSlot( 10, 0 )
return