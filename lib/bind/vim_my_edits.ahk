; ^q:: upper to lower case
; ^d:: Auto-close *d*ismiss messages
; ^e:: Open/Close Knowledge Tree
; e:: backspace


; Swap case; Bug: can't lower to upper
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
^q::
Vim.State.SetNormal()
Sleep, 30
bak := ClipboardAll
Clipboard =
Send, +{Right}^x
Sleep, 30
ClipWait, 1
StringUpper, Clipboard, Clipboard
Sleep, 60
Send, ^v
Clipboard := bak
return

;; Prevent clicking too fast
#If WinActive("ahk_group " . Vim.GroupName)
^Space::return

;; Training wheel to remap Tab -> Ctrl
#If WinActive("ahk_group " . Vim.GroupName)
Tab::return


#If WinActive("ahk_group " . Vim.GroupName)
Ctrl::
Vim.State.SetNormal()
ControlFocus, TBitBtn3
return


; Escape Knowledge Tree without activating Windows Access
#If WinActive("ahk_group " . Vim.GroupName)
Alt::
Vim.State.SetNormal()
Send, {Alt 2}
return

; Training Wheel: changing habit from !c -> ^e
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
!c:: return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
!c:: return

; ^d:: Auto-close *d*ismiss messages
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
^d::
Sleep, 10
BlockInput, On
Vim.State.SetMode("Vim_Normal")
Send, ^d
Sleep, 100
IfWinActive, ahk_class TMsgDialog
{
Send, {Enter}
}
Sleep, 150
IfWinActive, ahk_class TMsgDialog
{
Sleep, 20
Send, {Enter}
return
}
BlockInput, Off
return


; ^e:: Open/Close Knowledge Tree
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
^e::
Sleep, 20
Vim.State.SetNormal()
IfWinActive, ahk_class TElWind
{
Send, !c
} else {
WinActivate ahk_class TElWind
return
}
return


; e:: backspace
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
e::
Send, {BS}
return


; Delete current line
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
+d::
Sleep, 20
BlockInput, On
WinActivate ahk_class TElWind
Sleep, 20
Send, {Home}+{Down}
Sleep, 100
Send, +{Left}
Sleep, 130
Send, {BackSpace 2}
BlockInput, Off
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
^w::
Send, ^{BS}
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
^e::
Send, ^{Del}
return



; #If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
; ^o::
; return


#If WinActive("ahk_group " . Vim.GroupName)
!x::
Vim.State.SetNormal()
Send, !{x}
return


#If WinActive("ahk_group " . Vim.GroupName)
!z::
Vim.State.SetNormal()
Send, !{z}
return


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
^h::
KeyWait Control  ; Wait for Control and to be released.
Send, {BackSpace}
return
