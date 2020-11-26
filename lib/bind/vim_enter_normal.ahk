#If WinActive("ahk_group " . Vim.GroupName)
^o::
^[::
Esc::
Vim.State.SetNormal()
Send, {Esc}
return




#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert")) and (Vim.Conf["VimJK"]["val"] == 1)
j & k::
k & j::
  SendInput, {BackSpace 1}
  Vim.State.SetNormal()
return
