#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Vim_")) and (not Vim.State.g)
; g::Vim.State.SetMode("", 1)

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Vim_"))
; 1 character
h::Vim.Move.Repeat("h")
j::Vim.Move.Repeat("j")
k::Vim.Move.Repeat("k")
l::Vim.Move.Repeat("l")

; Clash with SuperMemo's shortcuts
; ^h::Vim.Move.Repeat("h")
; ^j::Vim.Move.Repeat("j") 
; ^k::Vim.Move.Repeat("k")
; ^l::Vim.Move.Repeat("l")
return

; Home/End
0::Vim.Move.Move("0")
$::Vim.Move.Move("$")
; ^::Vim.Move.Move("^") ; 

; Words
w::Vim.Move.Repeat("w")
b::Vim.Move.Repeat("b")
; +w::Vim.Move.Repeat("w") ; +w/e/+e are same as w
; e::Vim.Move.Repeat("w")
; +e::Vim.Move.Repeat("w")
; +b::Vim.Move.Repeat("b") ; +b = b

; Page Up/Down
; ^u::Vim.Move.Repeat("^u")
; ^d::Vim.Move.Repeat("^d") ; must not work
; ^b::Vim.Move.Repeat("^b")
; ^f::Vim.Move.Repeat("^f")
