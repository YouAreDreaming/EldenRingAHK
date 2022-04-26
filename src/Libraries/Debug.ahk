S_ToggleDebug:
	V_DEBUG := !V_DEBUG
return


; Just a simple function to send data to a blank notepad++ page for real-time debugging
logNp(msg)
{
   global V_DEBUG
   if( V_DEBUG == 1 ) {
		ControlSend, Scintilla1, % "`r`n" msg , ahk_class Notepad++
   }
}

