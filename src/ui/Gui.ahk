; https://www.reddit.com/r/AutoHotkey/comments/pcp2uf/dynamically_create_helpgui_from_the_contents_of/?msclkid=8e9f3025c63511ecb336aeacc4aad90c
#Persistent
SetWorkingDir, %A_ScriptDir%
class C_Gui 
{
	
	static bActive := 0
	static vPic
    __New(  )
    {
		OGdip.Startup()
		OnExit(ObjBindMethod(OGdip, "Shutdown"))
		OGdip.autoGraphics := False 
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
		
		Gui, -SysMenu -Caption +AlwaysOnTop +Owner +LastFound +OwnDialogs +HwndGuiClassMenu		;+Disabled  +E0x80000 
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
		;;Gui, Color, 000111
		;; WinSet, TransColor, 000111, ahk_id %GuiClassMenu%
		return
	}
	
	addGui( rArray, vLabel )
	{
		; Load external font
		global G_FONT
		
		
		
		hw := % "+HwndGui"vLabel		
		Gui, -SysMenu -Caption +AlwaysOnTop +Owner +LastFound +OwnDialogs %hw% 	;+Disabled 
		
		size := this.array_size( rArray )
		IF( size <= 6 )
		{
			Gui, Add, Picture, x0 y0 w280 h-1 +BackgroundTrans, %A_ScriptDir%\assets\images\ui\config\panel\panel_square.png
			
		} else if ( (size > 6) && (size <= 12) )
		{
			Gui, Add, Picture, x0 y0 w280 h-1 +BackgroundTrans, %A_ScriptDir%\assets\images\ui\config\panel\panel_tall.png			
		}else 
		{
			Gui, Add, Picture, x0 y0 w625 h-1 +BackgroundTrans, %A_ScriptDir%\assets\images\ui\config\panel\panel_wide.png
		}
		y := this.addElementsFromArray( rArray, size )
		
		options := % "x20y" y " w100 h40"
		Gui, Add, Button, % options, OK
		WinSet, TransColor, EEAA99
		WinSet, TransColor, 000111, ahk_id %vLabel%
		this.show("Gui Class")		
	}
	drawText( _displayString, textFont, rectLayout,textFormat )
	{
		CC := {Base:{__Get:OGdip.GetColor}}
		bmpText := new OGdip.Bitmap(200, 20)
		bmpText.GetGraphics()
		bmpText.G.Clear(CC.White)
		bmpText.G.SetOptions( {textHint:"Antialias"})  
		_RL := rectLayout
		bmpText.G.SetPen(CC.LGray).SetBrush(CC.EEE)

		If ((_RL[3] == 0) || (_RL[4] == 0)) {
			bmpText.G.DrawRectangle( _RL[1], _RL[2]
				, ((_RL[3] == 0) ? 9001 : _RL[3])
				, ((_RL[4] == 0) ? 9001 : _RL[4]))
		}
		bmpText.G.SetPen("")
		bmpText.G.SetBrush(CC.Black)
		bmpText.G.DrawString(_displayString, textFont, rectLayout, textFormat)
		return bmpText.GetHBITMAP()
	}
	array_size( rArray )
	{
		i := 1
		FOR k, v IN rArray 
		{
			i := i + 1
		}
		return i
	}
	; Gui, [Add], [ControlType] , [Options], [Text]	
	addElementsFromArray( rArray, size )
	{
		global V_Categories
		global V_GUI

		mx := V_Categories[V_GUI]		
		
		i := 1
		j := 1
		x := 0
		y := 0
		
		rx := 10
		ry := 60
		tw := 30		
		
		y := ry
		
		
		textFont   := new OGdip.Font( G_FONT , 15)
        rectLayout := [5, 0, 200, 20]
		textFormat := new OGdip.StringFormat(0)
		
		For aKey, aValue in rArray
		{
			vLabel = v%akey%	
			x := rx 		
			
			dx := % "x"x
			dy := % "y"y
			dw := % "W"tw
			
			
			
			textBMP := this.drawText( aKey, textFont, rectLayout, textFormat )				 
			
			options := % dx " " dy " w200 h20"				
			this.guiElement( "Add", "Picture", options , "HBITMAP:*"textBMP )
			
			;this.logNp( "Picture: i: " i " dx: " dx " dy: " dy " j: " j )
			
			x := rx + 210			
			dx := % "x"x
			dy := % "y"y
			
			options := % vLabel " " dx " " dy " W100 H20"			 
			this.guiElement( "Add", "Edit", options, aValue )
			
			;this.logNp( "Edit: i: " i " dx: " dx "dy: " dy " dw:" dw " j: " j )
			
			y := ry + (tw * i) + 5				
			
			i := i + 1	
			j := j + 1	
			
			if( i > mx )
			{
				i := 1
			}
				
			if( j == (mx+1) )
			{
				rx := 400
				y := ry
			}
			
			;this.logNp( "--------------------------------------------" )
		}
		return y
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
