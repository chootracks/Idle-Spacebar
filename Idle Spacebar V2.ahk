#SingleInstance, Force
SetControlDelay -1
CoordMode, Mouse, Window
WinGet, activeWin, ProcessName, A
lastWin = explorer.exe
toggle = Off
rebootcount = 0
combocount = 0
modeselect = Normal Mode


if not WinExist("ahk_exe Burger.exe")
{
    Run, steam://rungameid/2976910
}

WinWait, ahk_exe Burger.exe

WinMove, ahk_exe Burger.exe,, 80, 65, 851, 562
WinSet, Style, -0x40000, ahk_exe Burger.exe
Winset, AlwaysOnTop, On,  ahk_exe Burger.exe
Winset, AlwaysOnTop, Off,  ahk_exe Burger.exe

Gui, Font, s12 
Gui, Add, Text, x138, Happy Burgering
Gui, Add, DropDownList, x135 y45 w130 gModeFunc vmodeselect, Normal Mode||Speed Mode|Cheese Mode|Cat Mode
Gui, Add, Button, x75 y90 w120 h35 gF2, F2 Start
Gui, Add, Button, xp+130 yp w120 h35 gF6, F6 Reset
Gui Show, x525 y635 w400 h150, Idle Spacebar *Ctrl+Q to Quit*
return


ModeFunc:
    Gui, Submit, NoHide

    if modeselect = Speed Mode
    {
	mousex = 420
	mousey = 302
    }
    if modeselect = Cheese Mode
    {
	mousex = 420
	mousey = 302
    }
    if modeselect = Cat Mode
    {
	mousex = 167
	mousey = 440
    }
return


GuiClose:
    ExitApp
return



Ctrl::ControlSend,, {Ctrl}, ahk_exe %lastWin%

Alt::ControlSend,, {Alt}, ahk_exe %lastWin%

Shift::ControlSend,, {Shift}, ahk_exe %lastWin%

F7::MsgBox %mouse%
return

^q::ExitApp, 0

F6::Reload

F2::
    if toggle = Off
    {
        toggle = 1
        rebootcount = 0
        GuiControl,, Button1, F2 Stop
	GuiControl, Disable, Button1
	GuiControl, Disable, Button2
	GuiControl, Disable, ComboBox1

	if not modeselect = "Normal Mode"
	{
	    BlockInput, MouseMove
	    ControlFocus,, ahk_exe Burger.exe
	    MouseMove, %mousex%, %mousey%, 0
	}
    }
    else	
    {
        toggle = Off
        rebootcount = 5
        GuiControl,, Button1, F2 Start
	GuiControl, Enable, Button1
	GuiControl, Enable, Button2
	GuiControl, Enable, ComboBox1

	BlockInput, MouseMoveOff
    }

    SetTimer, Idle, %toggle%
return

Idle:
    if toggle = 1
    {
	ControlClick,, ahk_exe Burger.exe,,,, NA x420 y302
        ControlSend,, {Space}, ahk_exe Burger.exe

   	if modeselect = Cheese Mode
    	{
	    combocount := combocount+1

	    if combocount between 0 and 25
	    {
	    	if mousex = 420
	   	{
	    	    mousex = 674
		    mousey = 250
	            MouseMove, %mousex%, %mousey%, 0
	  	}
	    }
	    else if combocount between 26 and 75
	    {
	    	if mousex = 674
	   	{
	    	    mousex = 420
	    	    mousey = 302
	            MouseMove, %mousex%, %mousey%, 0
	   	}
	    }
	    else if combocount > 75
	    {
		   combocount = 0
	    }
    	}

        if rebootcount between 0 and 3
        {
            ControlClick, x670 y230, ahk_exe Burger.exe
            rebootcount := rebootcount+1
        }

        WinGet, activeWin, ProcessName, A

        if not activeWin = lastWin
        {
            rebootcount = 0
        }

        if activeWin = "Burger.exe" or activeWin = "AutoHotkeyU64.exe" or activeWin = ""
        {
	    WinActivate, ahk_exe explorer.exe
            WinGet, activeWin, ProcessName, A
        }
        else
        {
            lastWin = %activeWin%        
        }

	WinGet, minned, MinMax, ahk_exe Burger.exe
	if not minned = 0
	{
	WinRestore , ahk_exe Burger.exe
	WinMove, ahk_exe Burger.exe,, 80, 65, 851, 562
	WinSet, Style, -0x40000, ahk_exe Burger.ex
        }
    }
return