; Auto-execute section
Vim := new VimAhk()
Vim.State.SetNormal()
Return

#Include %A_LineFile%\..\lib\vim_ahk.ahk

; Assign Ctrl-Alt-R as a hotkey to restart SuperMemoVim.
^!r::Reload
