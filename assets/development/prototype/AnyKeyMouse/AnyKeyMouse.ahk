#NoEnv  
#Warn  
#Persistent
#InstallKeybdHook
#InstallMouseHook
SetBatchLines -1
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

KeyHistory
SetTimer, S_GLOBALTIMER, 1

S_GLOBALTIMER:
	detectInput(1, 1)

return

; This has a lot of promise for non-bound keys to still act as a HotKey so I want to explore it more.
detectInput(detectKeyboard:=1,detectMouse:=1) { ; return whatever key is down that has the largest scan code
	if (detectKeyboard) {
		loop % 86 { ; detect all common physical keys: https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html
			if (GetKeyState(keyname:=GetKeyName("sc" Format("{1:x}",A_Index)))) {				
				P := (GetKeyState( keyname, "P" )==1) ? "Down" : "Up"
				T := GetKeyState( keyname, "T" )
				HK := A_ThisHotkey
				ToolTip % "Key Pressed: " KeyName . " PState: " P " TState: " T " HK: " HK
				return keyname
			}
		}
	}
	if (detectMouse) {
		mouseArr := ["LButton","RButton","MButton","XButton1","XButton2"]
		loop % mouseArr.Count() {
			if (GetKeyState(mouseArr[A_Index])) {
			
				ToolTip % "Mouse Pressed: " KeyName
				return mouseArr[A_Index]
			}
		}
	}
	return ""
}


