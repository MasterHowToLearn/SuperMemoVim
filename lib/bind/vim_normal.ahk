;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; p:: WheelUp 2
; n:: WheelDown 2

; ^d:: Auto-close *d*ismiss messages
; ^t: Open/Close Knowledge *T*ree
; u:: Focus into SuperMemo: Click 335, 320

; SuperMemo grading
; a: 1
; s: 2
; d: 3
; f: 4
; g: 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Prevent clicking too fast
#If WinActive("ahk_group " . Vim.GroupName)
^Space::return


; Escape Knowledge Tree without activating Windows Access
#If WinActive("ahk_group " . Vim.GroupName)
Alt::
Vim.State.SetNormal()
Send, {Alt 2}
return

; Training wheel: changing habit from !c -> ^e
; #If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
; !c:: return
; #If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
; !c:: return

; ^d:: Auto-close *d*ismiss messages
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
^d::
Vim.State.SetMode("Vim_Normal")
Send, ^d
Sleep, 100 ; wait for popup
IfWinActive, ahk_class TMsgDialog
{
Send, {Enter}
}
Sleep, 100 ; wait for popup
IfWinActive, ahk_class TMsgDialog
{
Send, {Enter}
return
}
return


; ^t:: Open/Close Knowledge *T*ree
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
^t::
Vim.State.SetNormal()
IfWinActive, ahk_class TElWind
{
Send, !c
}
else
{
WinActivate ahk_class TElWind
return
}
return


; Delete current line
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
+d::
Send, {Home}+{Down}
Send, +{Left}
Send, {BackSpace 2}
return

; Back to normal mode after extracting
#If WinActive("ahk_group " . Vim.GroupName)
!x::
Vim.State.SetNormal()
Send, !{x}
return

; Back to normal mode after clozing
#If WinActive("ahk_group " . Vim.GroupName)
!z::
Vim.State.SetNormal()
Send, !{z}
return


; Changed from Right to Space 
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
Space::
Send, {Space}
return

; Focus into Topic
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
u::
WinActivate, ahk_class TElWind
Click 33, 380
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
CoordMode, Mouse, Window
p::
Mousemove, 33, 380
Send, {WheelUp 2}
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
CoordMode, Mouse, Window
n::
Mousemove, 33, 380
Send, {WheelDown 2}
return

; SuperMemo grading
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
a::
    Send, {1}
    Sleep, 40
    Send, {Space} ; next item
return	

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
s::
    Send, {2}
    Sleep, 40
    Send, {Space} ; next item
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
d::
    Send, {3}
    Sleep, 40
    Send, {Space} ; next item
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
f::
    Send, {4}
    Sleep, 40
    Send, {Space} ; next item
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
g::
    Send, {5}
    Sleep, 40
    Send, {Space} ; next item
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
+j::
Send, {Down 5}
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
+k::
Send, {Up 5}
return
