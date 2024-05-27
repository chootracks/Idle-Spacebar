#SingleInstance, Force
WinGet, lastWin, ProcessName, A
active = %lastWin%
toggle = Off
counter := 0

F6::Reload

^q::
    ExitApp, 0

F2::
    if toggle = Off
    {
        toggle = 1
        ControlClick, x400 y420, ahk_exe Burger.exe,,,, Pos
    }
    else
    {
        toggle = Off
    }

    SetTimer, Idle, %toggle%
return
 
Idle:
    ControlSend, ,{Space}, ahk_exe Burger.exe

    if counter between 0 and 5
    {
        ControlClick, x400 y420, ahk_exe Burger.exe,,,, Pos
        counter := counter + 1
    }

    WinGet, lastWin, ProcessName, A

    if not lastWin = active
    {
        counter = 0
    }

    active = %lastWin%
return
