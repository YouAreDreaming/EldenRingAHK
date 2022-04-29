#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global gHotKeys := {}
;Single Argument example:
	;fHotkey("e", "msgbox", "foobar")
	
; As a simple array
	;fHotkey("e", "msgbox", ["foobar"])
	
; veridic Simple Array 
	;fHotkey("e", "msgbox", ["foobar", "is", "now", "veridic"])
	
; veridic Associative Array 
	;fHotkey("e", "msgbox", {"foobar":"my", "is":"cat", "now":"likes", "veridic":"fish"})

; With variables	
  my 		:= "My"
  dog 		:= "dog"
  likes 	:= "likes"  
  bacon		:= "bacon"
  fHotkey("e", "msgbox", {"foobar":my, "is":dog, "now":likes, "veridic":bacon})
Return

; https://stackoverflow.com/questions/12851677/dynamically-create-autohotkey-hotkey-to-function-subroutine?msclkid=1675536fc7c911ec9301c69bc06f8213
fHotkey(hKey, function, arg*) {
    global gHotKeys
    gHotKeys[hKey] := {}
    gHotKeys[hKey].function := function
    gHotKeys[hKey].arg := arg
    Hotkey, %hKey%, HandleHotkey
Return

}
HandleHotkey:
	gHotKeys[A_ThisHotkey].function(gHotKeys[A_ThisHotkey].arg*)
return
MsgBox(args) {
	msg := IsObject(args) ? concat( args ) : args
    msgbox %msg%	
	ExitApp
}
concat( a ){
	c := ""
	for k, v in a 
		c .= v " "
	return c
}
; https://www.autohotkey.com/docs/commands/Hotkey.htm
; Note: If the label or function is specified but the hotkey is disabled from a previous use of this command, the hotkey will remain disabled. To prevent this, include the word ON in Options.