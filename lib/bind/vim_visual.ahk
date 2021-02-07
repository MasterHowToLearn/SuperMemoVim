;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Visual Mode

; c: *C*loze
; e: *E*xtract
; t: Highlighted *t*urned [...]
; f: Remove *f*ormatting through SuperMemo Commander

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Visual Char
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
v::
Vim.State.SetMode("Vim_VisualChar")
Return

; Visual Line
+v::
Vim.State.SetMode("Vim_VisualChar")
Send, {Home}+{Down}
Sleep, 10
Send, +{Left}
return


; +j: 5 lines down
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
; n::
+j::
Send, +{Down 5}
return

; +k: 5 lines up
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
+k::
Send, +{Up 5}
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
j & k::
k & j::
Vim.State.SetNormal()
Send, {Left}
return



; After *e*xtracting, go back to Normal Mode
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
!x:: ; default SuperMemo shortcut
e::
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Send, !{x}
return

; After *C*lozing, go back to Normal Mode
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
!z:: ; default SuperMemo shortcut
c::
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Send, !{z}
Return

;; t: Highlighted *t*urned [...]
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
t::
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Clip("<span class=""Cloze"">[...]</span>")
Send +^{Left 8}
Sleep, 30
Send ^+{1}
Sleep, 30
Send, {Esc}
return


; f: Remove *f*ormatting through SuperMemo Commander
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
f::
Vim.State.SetMode("Vim_Normal")
Send, ^{Enter}
Sleep, 100
Clip("Remove formatting: Selection")
Sleep, 100
Send, {Enter}
return
