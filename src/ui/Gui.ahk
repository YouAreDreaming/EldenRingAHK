; https://www.reddit.com/r/AutoHotkey/comments/pcp2uf/dynamically_create_helpgui_from_the_contents_of/?msclkid=8e9f3025c63511ecb336aeacc4aad90c
#Persistent
SetWorkingDir, %A_ScriptDir%
class C_Gui 
{
	
	static bActive := 0
	static vPic
    __New(  )
    {
		 
    }
	__Get(aName)
    {
        bActive := C_Gui.bActive
        if (bActive != "")  
            return bActive        
    }

    __Set(aName, aValue)
    {
        C_Gui.bActive := aValue       
    }
	
	addMenu( )
	{
		
		ToolTip, % "C_Gui Constructed for Config Menu"		
		C_Gui.bActive := ! C_Gui.bActive
		
		;FileInstall, menuBackground.png, %A_ScriptDir%\assets\images\ui\config\menu\menuBackground.png 0
		
		Gui, +AlwaysOnTop +Owner +HwndGuiClassMenu -SysMenu -Caption		;+Disabled 
		Gui, Add, Picture, x0 y0 w600 h-1 +BackgroundTrans, %A_ScriptDir%\assets\images\ui\config\menu\menuBackground.png
		;Gui, Add, Pic, w600 h-1 C_Gui.vPic +Border, % "HBITMAP:*" menuBackground.png
		Gui, Add, Button, x105 y130 w150 h40 default, GAME
		Gui, Add, Button, x355 y130 w150 h40 default, COMBOS
		
		Gui, Add, Button, x105 y200 w150 h40 default, POUCH
		Gui, Add, Button, x355 y200 w150 h40 default, BELT
		
		Gui, Add, Button, x105 y270 w150 h40 default, SPELL
		Gui, Add, Button, x355 y270 w150 h40 default, GESTURES
		
		Gui, Add, Button, x230 y340 w150 h40 default, CONFIG
		Gui, Add, Button, x180 y450 w245 h50 default, Close
		this.show("Config Menu")		
	}
	
	addGui( aKey )
	{
		
        ToolTip, % "C_Gui Constructed for" aKey	
		hw := % "+HwndGui"aKey		
		Gui, +AlwaysOnTop +Owner %hw% -SysMenu			;+Disabled 
		this.addElementsFromArray( aKey )
		Gui, Add, Button, default, OK
		this.show("Gui Class")		
	}
	
	; Gui, [Add], [ControlType] , [Options], [Text]	
	addElementsFromArray( rArray )
	{
		i := 1
		rx := 10
		ry := 10
		tw := 30
		ew := 30
		y := 10
		; For aKey, aValue in C_Gui.settings[ rKey ]
		For aKey, aValue in rArray
		{
			; Gui, Add, Picture, x0 y0 h350 w450, %A_WinDir%\system32\ntimage.gif
			; Gui, Add, Button, Default xp+20 yp+250, Start the Bar Moving
			vLabel = v%akey%	; passing v%Key% throws warn.
			
			x := rx 
					
			
			dx := % "x"x
			dy := % "y"(y+6)
			dw := % "W"tw
			
			this.guiElement( "Add", "Text", dx dy dw, aKey ) ; ys option starts a new column
			;this.logNp( "Text: i: " i " dx: " dx "dy: " dy "dw:" dw )
			;y := ry + (tw * i)
			x := rx + 130
			;y := (y - 60)
			dx := % "x"x
			dy := % "y"y
			
			options := % vLabel " " dx " " dy " W100"
			; this.guiElement( "Add", "Edit", vLabel dx dy "W100", aValue )
			 
			this.guiElement( "Add", "Edit", options, aValue )
			;this.logNp( "Edit: i: " i " dx: " dx "dy: " dy "dw:" dw )
			y := ry + (tw * i) + 5	
			i := i + 1	

			
			;this.logNp( "--------------------------------------------" )
			
			
		}
	}
	
	logNp(msg)
	{
	   
		ControlSend, Scintilla1, % "`r`n" msg , ahk_class Notepad++
	 
	}

	submit()
	{
		ToolTip, User Submitted 
		
	}
	;addGuiControlsFromArray( ar )
	;{
	;	For Key, Value in ar
	;	{
	;		vLabel = hwnd%key%	; passing v%Key% throws warn.			
	;		this.guiControl( value, key )			
	;	}
	;}
	; The Gui arguments 
	; subCommand 	:- new|add|show etc see: https://www.autohotkey.com/docs/commands/Gui.htm#SubCommands
	; 	controlType : based on the subCommand type for example Add uses Text|Button|Listbox etc see: https://www.autohotkey.com/docs/commands/Gui.htm#Add
	;		Options : See controlType for it's options  see: https://www.autohotkey.com/docs/commands/Gui.htm#ControlOptions
	;		Text    : Text to be displayed.
	guiElement( subCommand, controlType, Options :="", sText="" )
    {
		GUI %subCommand%, %controlType%, % Options, %sText%
	}
	
	guiControl( var1, myedit )
	{
		ControlSetText,, %var1%, ahk_id %myedit%
	}
	
	show(aText)
	{
	   Gui, show,, aText
	}
	
    __Delete()
    {
		
        ToolTip "Gui deleted"		
		Gui, Destroy
		;ExitApp
    }
}
; Turns out loading in classes with subroutines will break auto-execution zones
;ButtonOK:
;	C_Gui.bActive := !C_Gui.bActive	
; return
