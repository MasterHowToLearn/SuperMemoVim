#If WinActive("ahk_group " . Vim.GroupName) && (Vim.State.Mode == "Vim_Normal")
i::Vim.State.SetMode("Insert")


#If WinActive("ahk_group " . Vim.GroupName) && (Vim.State.Mode == "Vim_Normal")
+i::
  Send, {Home}
  Vim.State.SetMode("Insert")
Return


; Disabled: when in normal mode, press a will move to right instead of focus Answer field
; a::
;  Send, {Right}
;  Vim.State.SetMode("Insert")
;Return


#If WinActive("ahk_group " . Vim.GroupName) && (Vim.State.Mode == "Vim_Normal")
+a::
  Send, {End}
  Vim.State.SetMode("Insert")
Return


#If WinActive("ahk_group " . Vim.GroupName) && (Vim.State.Mode == "Vim_Normal")
o::
Send,{End}{Enter}
Vim.State.SetMode("Insert")
Return


#If WinActive("ahk_group " . Vim.GroupName) && (Vim.State.Mode == "Vim_Normal")
+o::
  Send, {Up}{End}{Enter}
  Vim.State.SetMode("Insert")
Return

