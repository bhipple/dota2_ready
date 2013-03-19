HotKeySet("{END}", "Terminate")

Local $ready[2] =  			[788, 536]
Local $matchFound[3] = 			[1015, 358, "979797"]
Local $searchingMatch[3] =		[1546, 108, "A5C763"]
Local $accepted

While(1)

	If (Hex(PixelGetColor($searchingMatch[0], $searchingMatch[1]), 6) = $searchingMatch[2]) Then
		ToolTip("Waiting to find a game", 0, 0)
		$accepted = false
		Call("ReadyUp")
	EndIf

	Sleep(5000)
WEnd

Func ReadyUp()
	
	While NOT $accepted
		If (Hex(PixelGetColor($matchFound[0], $matchFound[1]), 6) = $matchFound[2]) Then
			WinActivate("DOTA 2")
			Sleep(1000)
			MouseClick("left", $ready[0], $ready[1], 1, 1)
			ToolTip("Accepting match", 0, 0)
			Sleep(5000)
			ToolTip("")
			$accepted = true
		EndIf
	WEnd
EndFunc


Func Terminate()
    Exit 0
EndFunc
