;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ^o && ^[:: Focus away Topic for going to next item
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Back to normal mode
#If WinActive("ahk_group " . Vim.GroupName)
Esc::
Vim.State.SetNormal()
Send, {Esc}
return

#If WinActive("ahk_group " . Vim.GroupName)
^o::
^[::
Vim.State.SetNormal()
ControlGetFocus, currentFocus, ahk_class TElWind, , , 
if ((currentFocus == "Internet Explorer_Server2") || (currentFocus == "Internet Explorer_Server1"))
{
Send, {Esc}
}
ControlFocus, TBitBtn3
return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Insert")) and (Vim.Conf["VimJK"]["val"] == 1)
j & k::
k & j::
  SendInput, {BackSpace 1}
  Vim.State.SetNormal()
return
