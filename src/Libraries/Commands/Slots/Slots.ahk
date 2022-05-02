#include %A_ScriptDir%\Libraries\Commands\Slots\Spell.ahk
#include %A_ScriptDir%\Libraries\Commands\Slots\Belt.ahk

; Calculates the iterations beteen slots
findIteration( target, position, slots )
{
	global gAutoLock
	global G_HotKeys
	global gDebugMessage
	
   if (target == position){
		gDebugMessage := "Same key doing auto-lock check"
		gAutoLock._keySpam( A_ThisHotkey, G_HotKeys[A_ThisHotkey] )
      return 0
   }
   inc := getGuiActive() ;  for both spell and belt the first down activates gui causing click glitches.
   val := target - position
   if( val > 0 ){
      return val + inc
   }else  {
      return slots + val + inc
   }}

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

S_ToggleSpellHand:
	V_ToggleSpell := ( V_ToggleSpell = V_GUARD ) ? V_ATTACK : V_GUARD
	gDebugMessage := % "Toggled Spell hand to key: " V_ToggleSpell
return