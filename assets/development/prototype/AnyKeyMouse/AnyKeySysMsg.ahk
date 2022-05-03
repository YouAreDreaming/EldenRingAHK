; Just prototyping a what-if the app wants to listen to non-HotKeys that trap the key Input
; and then do something which might eliminate uneeded references a::m etc.  
#NoEnv  
#Warn  
#Persistent
#InstallKeybdHook
#InstallMouseHook
SetBatchLines -1
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; this method is much better due to no use of loop.
; Member: Just Me https://www.autohotkey.com/board/topic/70111-retrieve-key-names-from-onmessage-wm-keydown/page-2
KeyHistory
SetTimer, S_GLOBALTIMER, 20     ; 90ms is about as fast as a human can press a key with 170ms the average

; https://wiki.winehq.org/List_Of_Windows_Messages
WM_KEYDOWN 		:= 0x100			; most keys except Alt would need system key for that keypress.
WM_KEYUP 		:= 0x101
WM_SYSKEYDOWN	:= 0x104
WM_SYSKEYUP		:= 0x105

; Mouse
WM_MOUSEFIRST		:= 0x200
WM_MOUSEMOVE		:= 0x200
WM_LBUTTONDOWN		:= 0x201
WM_LBUTTONUP		:= 0x202
WM_LBUTTONDBLCLK	:= 0x203
WM_RBUTTONDOWN		:= 0x204
WM_RBUTTONUP		:= 0x205
WM_RBUTTONDBLCLK	:= 0x206
WM_MBUTTONDOWN		:= 0x207
WM_MBUTTONUP		:= 0x208
WM_MBUTTONDBLCLK	:= 0x209
WM_MOUSELAST		:= 0x209
WM_MOUSEWHEEL		:= 0x020a 
WM_XBUTTONDOWN		:= 0x020b 
WM_XBUTTONUP		:= 0x020c 
WM_XBUTTONDBLCLK	:= 0x020d 
WM_MOUSEHWHEEL 		:= 0x020e 

S_GLOBALTIMER:
	OnMessage(WM_KEYDOWN, "ON_KEYDOWN")
	OnMessage(WM_KEYUP, "ON_KEYUP")
	OnMessage(WM_SYSKEYDOWN, "ON_KEYDOWN")
	OnMessage(WM_SYSKEYUP, "ON_KEYUP")

	OnMessage(WM_LBUTTONDOWN, "ON_MOUSE")
	OnMessage(WM_LBUTTONUP, "ON_MOUSE")
	OnMessage(WM_LBUTTONDBLCLK, "ON_MOUSE")
	OnMessage(WM_RBUTTONDOWN, "ON_MOUSE")
	OnMessage(WM_RBUTTONUP, "ON_MOUSE")
	OnMessage(WM_RBUTTONDBLCLK, "ON_MOUSE")
	OnMessage(WM_MBUTTONDOWN, "ON_MOUSE")
	OnMessage(WM_MBUTTONDBLCLK, "ON_MOUSE")
	OnMessage(WM_MBUTTONUP, "ON_MOUSE")
	OnMessage(WM_MOUSELAST, "ON_MOUSE")
	OnMessage(WM_MOUSEWHEEL, "ON_MOUSE")
	OnMessage(WM_XBUTTONUP, "ON_MOUSE")
	OnMessage(WM_XBUTTONDBLCLK, "ON_MOUSE")
	OnMessage(WM_MOUSEHWHEEL, "ON_MOUSE")
	
return



ON_KEYDOWN(wParam, lParam) {
   If (lParam & 0x40000000) ; most likely auto-repeat
      Return 0
   VK := Hex(wParam & 0xFF, 2)
   SC := Hex((lParam & 0x1FF0000) >> 16, 3)
	KeyName := GetKeyName("VK" . VK . "SC" . SC)
	ToolTip % "Key Pressed Down: " KeyName
   Return 0
}

ON_KEYUP(wParam, lParam) {  
   VK := Hex(wParam & 0xFF, 2)
   SC := Hex((lParam & 0x1FF0000) >> 16, 3)
	KeyName := GetKeyName("VK" . VK . "SC" . SC)
	ToolTip % "Key Pressed Up: " KeyName
   Return 0
}

ON_MOUSE( wParam, lParam, Msg )
{
	;if (msg < 0x200 && lParam & 1<<30) ; Not a mouse message && key-repeat.
	;return 0
	
	;VK := Hex(wParam & 0xFF, 2)
	VK :=wParam & ~12
	SC := Hex((lParam & 0x1FF0000) >> 16, 3)	
	ToolTip % "wParam: " wParam " lParam: " lParam " Msg: " msg " Vk: " VK " SC: " SC
}
Hex(I, N) {
   SetFormat, Integerfast, H
   Return SubStr("00000000" . SubStr(I + 0,3), 1 - N)
}



