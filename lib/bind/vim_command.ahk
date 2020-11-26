;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; After in Command Mode
; 123456789 can't be used
; For risky ones I've added ^ or ! or + to avoid unwanted triggers

; r: Go to *r*ead-point
; v: Cursor line as reading point
; u: Highlighted until the end then copy to Balabolka
; q: One HTML source

; ^t: For a branch in Knowledge Tree: Open Up *T*emplate
; m: Open Template: from ^+{m} -> :m

; w: Remove all text BEFORE cursor
; e: Remove all text AFTER cursor

; h: Knowledge Tree: Up to parent
; k: Knowledge Tree: Up one element
; j: Knowledge Tree: Down one element


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
:::Vim.State.SetMode("Command") ;(:)
`;::Vim.State.SetMode("Command") ;(;)


; Back to Normal Mode
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
:::
`;::
^o::
Esc::
Vim.State.SetMode("Vim_Normal")
return


; h: Knowledge Tree: Up to parent
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
h::
Send, ^{Up}
Vim.State.SetMode("Vim_Normal")
return

; j: Knowledge Tree: DOWN one element
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
j::
Send, {PgDn}
Vim.State.SetMode("Vim_Normal")
return

; k: Knowledge Tree: UP one element
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
k::
Send, {PgUp}
Vim.State.SetMode("Vim_Normal")
return

; Caution: probably coordinates are dependent upon SuperMemo's window size
; Change x and y accordingly
; ^t: For a branch in Knowledge Tree: Open Up *T*emplate
#If WinActive("ahk_class TContents") and (Vim.State.Mode == "Command")
CoordMode, Mouse, Client
^t::
Sleep, 20
BlockInput, On
Vim.State.SetMode("Vim_Normal")
Send, ^{Space}
Sleep, 300

IfWinActive, ahk_class TBrowser
{
Sleep, 300
SetControlDelay -1
Sleep, 100
; Only Item
ControlClick , X269 Y45, , , , , NA, ,

Sleep, 300
SetControlDelay -1
Sleep, 100

; Open Template Registry
ControlClick , X579 Y45, , , , , NA, ,
return
}
BlockInput, Off
return


; m: Open Template: from ^+{m} -> :m
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
m::
Sleep, 10
Vim.State.SetMode("Vim_Normal")
Send, ^+{m}
return



; w: Remove all text BEFORE cursor
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
w::
Sleep, 10
Vim.State.SetMode("Vim_Normal")
IfWinActive, ahk_class TElWind
{
Send, !\\
Sleep, 100
Send, {Enter}
return
}
return

; e: Remove all text AFTER cursor
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
e::
Sleep, 10
Vim.State.SetMode("Vim_Normal")
IfWinActive, ahk_class TElWind
{
Send, !.
Sleep, 100
Send, {Enter}
return
}
return

; q: One HTML source
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
q::
Sleep, 10
Vim.State.SetMode("Vim_Normal")
ControlSend, Internet Explorer_Server1, {Esc}
IfWinActive, ahk_class TElWind
{
Sleep, 100
Send, ^+{F6}
return
}
return


; v: cursor line as reading point
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
v::
Vim.State.SetMode("Vim_Normal")
Send, {Home}+{Down}
Send, +{Left}
Sleep, 20
Send, ^{F7}
Sleep, 40
Send, {Esc}
return

; r: Go to *r*ead-point
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
r::
Vim.State.SetMode("Vim_Normal")
Send, !{F7}
return
