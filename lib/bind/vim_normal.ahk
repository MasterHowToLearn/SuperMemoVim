;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; p:: {WheelUp 2}
; n::{WheelDown 2}
; ^o:: mapped to Esc

; e:: Item to Balabolka
; r:: Switch to Balabolka
; t:: Switch to VSCode
; ^i:: Switch to VSCode
; u:: Focus into SuperMemo: Click 335, 320

; asdfg: SuperMemo grading

; Ctrl_1: GrayBackground
; Ctrl_2: Image_Reduced_30%

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Changed from Right to Space 
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
Space::
Send, {Space}
return

; Switch to VSCode
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
t::
^i::
WinActivate ahk_exe code.exe
return

; Switch to Balabolka
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
r::
WinActivate, ahk_exe balabolka.exe
return

; Focus into SuperMemo
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
u::
WinActivate, ahk_class TElWind
SystemCursor("Off")
Click 33, 380
SystemCursor("On")
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
CoordMode, Mouse, Window
p::
SystemCursor("Off")
Mousemove, 33, 380
SystemCursor("On")
Send, {WheelUp 2}
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
CoordMode, Mouse, Window
n::
WinActivate, ahk_exe sm18.exe
SystemCursor("Off")
Mousemove, 33, 280
SystemCursor("On")
Send, {WheelDown 2}
return

; SuperMemo grading
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
a::
    Send, {1}
    Sleep, 40
    Send, {Space}
return	

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
s::
    Send, {2}
    Sleep, 40
    Send, {Space}
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
d::
    Send, {3}
    Sleep, 40
    Send, {Space}
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
f::
    Send, {4}
    Sleep, 40
    Send, {Space}
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
g::
    Send, {5}
    Sleep, 40
    Send, {Space}
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
+j::
Send, {Down 5}
Sleep, 40
Vim.State.SetNormal()
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
+k::
Send, {Up 5}
Sleep, 40
Vim.State.SetNormal()
return

;; Item to balabolka
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
e::
Sleep, 40
SetControlDelay -1
ControlClick, Internet Explorer_Server2, ,,,, NA
IfWinActive, ahk_class TElWind
{
Sleep, 40
Send, ^{a}
Sleep, 40
Send, ^{c}
Sleep, 30
Send, {Esc}
Sleep, 30
}

if WinExist("ahk_exe balabolka.exe")
{
   WinActivate, ahk_exe balabolka.exe
   return
}
else
   ExitApp
return


; Ctrl_1_GrayBackground
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
CoordMode, Mouse, Window
^1::
Sleep, 150
BlockInput, On
Sleep, 100
SetControlDelay -1
ControlClick , X15 Y464, , , RIGHT, , NA, ,
Sleep, 100
Send {Up 8}
Sleep, 100
Send, {Enter}
Sleep, 130

If WinActive("ahk_class #32770") {
Sleep, 70
Send, {Left 2}
Sleep, 50
Send, {Space}
Sleep, 50
Send, {Enter}
}
BlockInput, Off
return


; Ctrl_2_Image_Reduced_30%
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
CoordMode, Mouse, Client
^2::
Sleep, 100
BlockInput, On
WinActivate, ahk_class TElWind
Sleep, 100
; Click 445, 350
SetControlDelay -1
Sleep, 20
ControlClick , X445 Y350, , , , , NA, ,
Sleep, 800
Send, ^{F9}
Sleep, 800
if WinExist("ahk_class MSPaintApp")
{
Send, ^{w}
Sleep, 400
Send, {tab}
Sleep, 400
SendRaw, 70
Sleep, 400
Send, {Enter}
Sleep, 400
Send, ^s
Sleep, 400
Send, !{f}
Sleep, 400
Send, x
return
}
BlockInput, Off
return


SystemCursor(OnOff=1)   ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
{
    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
    if (OnOff = "Init" or OnOff = "I" or $ = "")       ; init when requested or at first call
    {
        $ = h                                          ; active default cursors
        VarSetCapacity( h_cursor,4444, 1 )
        VarSetCapacity( AndMask, 32*4, 0xFF )
        VarSetCapacity( XorMask, 32*4, 0 )
        system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
        StringSplit c, system_cursors, `,
        Loop %c0%
        {
            h_cursor   := DllCall( "LoadCursor", "Ptr",0, "Ptr",c%A_Index% )
            h%A_Index% := DllCall( "CopyImage", "Ptr",h_cursor, "UInt",2, "Int",0, "Int",0, "UInt",0 )
            b%A_Index% := DllCall( "CreateCursor", "Ptr",0, "Int",0, "Int",0
                , "Int",32, "Int",32, "Ptr",&AndMask, "Ptr",&XorMask )
        }
    }
    if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
        $ = b  ; use blank cursors
    else
        $ = h  ; use the saved cursors

    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "Ptr",%$%%A_Index%, "UInt",2, "Int",0, "Int",0, "UInt",0 )
        DllCall( "SetSystemCursor", "Ptr",h_cursor, "UInt",c%A_Index% )
    }
}