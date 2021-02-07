;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Command Mode
; 123456789 can't be used as triggers

; r: Go to *r*ead point
; s: *S*et current line as read point

; a: Remove all text *a*fter cursor
; b: Remove all text *b*efore cursor

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




; b: Remove all text *B*EFORE cursor
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
b::
Vim.State.SetMode("Vim_Normal")
IfWinActive, ahk_class TElWind
{
Send, !\\
Sleep, 100
Send, {Enter}
return
}

; a: Remove all text *A*FTER cursor
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
a::
Vim.State.SetMode("Vim_Normal")
IfWinActive, ahk_class TElWind
{
Send, !.
Sleep, 100
Send, {Enter}
return
}

; r: Go to *r*ead point
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
r::
Vim.State.SetMode("Vim_Normal")
Send, !{F7}
return

; s: *S*et read point at current cursor location
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Command")
s::
Vim.State.SetMode("Vim_Normal")
Send, {Home}+{Down}
Send, +{Left}
Sleep, 20
Send, ^{F7}
Sleep, 40
Send, {Esc}
return
