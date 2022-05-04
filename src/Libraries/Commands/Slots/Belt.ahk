doBeltUseLoop( iteration, bUse )
{
	global gDebugMessage
   loop %iteration%
   {
      ; loop to target position
      if( doDown() )
      {
         ;sleep 25
      }}
   if( bUse = 1 ){
      
	  startAutoLock()
	  sleep 90
      gosub P_B ; activate use
	  endAutoLock()
	  gDebugMessage := % "Looped: " iteration " sending use"
   }}
   

doBeltItr( itr, slot, bUse )
{
	global gDebugMessage
   if( itr == 0 ) {
      if( bUse == 1){
		 startAutoLock()
         gosub P_B
		 endAutoLock()
		 gDebugMessage  := % "On current slot: " slot " just sending use"
		 return 0
      }     
   }else  if ( itr == 1 )  {
		;logNp( "Iteration: " itr " should activate only once" )
		active := getGuiActive()
      if( doDown() )  ; this may be causing the bug the whole time...
      {
			sleep 100  ; give time for gui to load
		 if( active == 1 ) 	
		 {
			sleep 90
			gosub P_Down
		 }
         if( bUse == 1){
		    ; just a litte sleep padding for the rapid clicks in a loop
            ; sleep
			startAutoLock()			
            gosub P_B
			endAutoLock()
			gDebugMessage  := % "Doing Two steps: Activate GUI then Move up 1 slot"
         }
		 return 1
	 }      
   }else  {
      doBeltUseLoop(itr, bUse) 
		return 1 	  
   }
   return 0
}


; pipes all the slot actions to a unified function for easier debugging / tracking and cleaner code.
doBeltSlot( slot, activate )
{
	global V_BELTSLOT 
	global V_BELT_SLOTS
	global V_BBReset
	global V_GUIFade
	global G_HotKeys
	global gDebugMessage
	global isCycling
	if( V_BELT_SLOTS < slot ){
      gDebugMessage := % "Assigned Belt Slots " V_BELT_SLOTS " is less than target: " slot
      return 0
	}else{
	
			
		     
			if( V_BBReset = 1 )
			{
				isCycling := 1
				gosub S_Belt_reset
				gDebugMessage := % "doBeltSlot Resetting to slot 1"
				return
			}
			
		  IF isCycling
		  {
			gDebugMessage := % "Currently Cycling to another slot"
			return 0
		  }
		  iteration := findIteration( slot, V_BELTSLOT, V_BELT_SLOTS )	
		  V_GUIFade := 3500			; this actuall has two states 3500 and 2500... maybe 3500 on cycle, 2500 on just use?
		  
			; logNp( "Belt Iteration " iteration " for loop" )		  
		  
		  isCycling := 1
		  success := doBeltItr( iteration, V_BELTSLOT, activate )
		  isCycling := 0
		  
		  IF success 
			gDebugMessage := % "GUI FADE: " V_GUIFade " Target Slot: " slot " Current Slot: " V_BELTSLOT
			
			V_BELTSLOT := slot
	}
}

;--------------scripts-Belt----------
S_Belt_reset:
  
   gosub P_Down   
   gosub H_Down
   V_BELTSLOT := 1
   V_BBReset := 0   
return
S_UseBelt1:
	gosub S_Belt_reset
	gosub P_B
    V_GUIFade := 3600			; the GUI fades after 3600 if all is pressed is this	
   ;doBeltSlot( 1, 1 )
return
S_UseBelt2:
    doBeltSlot( 2, 1 )
return
S_UseBelt3:
    doBeltSlot( 3, 1 )
return
S_UseBelt4:
    doBeltSlot( 4, 1 )
return
S_UseBelt5:
    doBeltSlot( 5, 1 )
return
S_UseBelt6:
   doBeltSlot( 6, 1 )
return
S_UseBelt7:
    doBeltSlot( 7, 1 )
return
S_UseBelt8:
    doBeltSlot( 8, 1 )
return
S_UseBelt9:
   doBeltSlot( 9, 1 )
return
S_UseBelt10:
    doBeltSlot( 10, 1 )
return


S_SwitchBelt1:
   doBeltSlot( 1, 0 )
return
S_SwitchBelt2:
    doBeltSlot( 2, 0 )
return
S_SwitchBelt3:
   doBeltSlot( 3, 0 )
return
S_SwitchBelt4:
   doBeltSlot( 4, 0 )
return
S_SwitchBelt5:
   doBeltSlot( 5, 0 )
return
S_SwitchBelt6:
   doBeltSlot( 6, 0 )
return
S_SwitchBelt7:
   doBeltSlot( 7, 0 )
return
S_SwitchBelt8:
  doBeltSlot( 8, 0 )
return
S_SwitchBelt9:
   doBeltSlot( 9, 0 )
return
S_SwitchBelt10:
  doBeltSlot( 10, 0 )
return