#SingleInstance Force
#NoEnv
#Warn
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%\..\external\OGdip\OGdip.ahk
OGdip.Startup()
OnExit(ObjBindMethod(OGdip, "Shutdown"))
OGdip.autoGraphics := False
CC := {Base:{__Get:OGdip.GetColor}}


; Load external font
textFont   := new OGdip.Font( A_ScriptDir "\..\assets\fonts\EB_Garamond\EBGaramond-Regular.ttf", 15)
rectLayout := [5, 5, 200, 30]
textFormat := new OGdip.StringFormat(0)
textString := "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
textMeasure := "None"
textFormat.TabStops := [30, 70, 30]

helloBMP := drawText( "Hello", textFont, rectLayout, textFormat )	
goodbyeBMP := drawText( "Goodbye", textFont, rectLayout, textFormat )	


	;bmpText.G.DrawString(_displayString, textFont, rectLayout, textFormat)
;Gui, +E0x02080000  ; WS_EX_COMPOSITED & WS_EX_LAYERED => Double Buffer - reduces flicker on bitmap reloading


;Gui, Add, Picture ,  x010 y010 w600 h200  HwndHIDisplay  +0x800000
Gui, Add, Picture ,  x0 y0 w200 h30  HwndHIBmp,  HBITMAP:*%helloBMP%
Gui, Add, Picture ,  x0 y35 w200 h30  HwndHIBmp,  HBITMAP:*%goodbyeBMP%

Gui, Show,, String Example

Return



drawText( _displayString, textFont, rectLayout,textFormat )
{
    global CC
	bmpText := new OGdip.Bitmap(200, 30)
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