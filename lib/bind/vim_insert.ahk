;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Insert mode
; ^w:: remove left word
; ^e:: remove right word
; ^h:: remove left character
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
^w::
Send, ^{BS}
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
^e::
Send, ^{Del}
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert"))
^h::
KeyWait Control  ; wait for Control and to be released
Send, {BackSpace}
return
