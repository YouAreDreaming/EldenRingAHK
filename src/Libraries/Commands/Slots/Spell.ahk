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
				gosub S_SpellReset
			}
		  iteration := findIteration( slot, V_SPELLSLOT, V_SPELL_SLOTS)		  
		  V_SPELLSLOT := slot 
		  success := doSpellItr( iteration, V_SPELLSLOT, activate )
	}
}

S_SpellReset:
   
   gosub P_UP   
   gosub S_UP
   V_SPELLSLOT := 1
   V_BSReset := 0   
return
S_Spell1:	
	gosub S_SpellReset
	gosub P_K
	getGuiActive()	
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