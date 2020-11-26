;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; After in Visual Mode

; c: *C*loze                                  ; must in Visual mode
; g: Extract                                  ; must in Visual mode
; +j: 5 Lines Down                            ; must in Visual mode
; +k: 5 Lines Up                              ; must in Visual mode
; s: Highlighted till end then Balabolka      ; must in Visual mode
; r: Go to read point

; [: Cursor before *[*...]; make it formatted
; t: Highlighted *t*urned [...]

; ^2: Remove item through deleting HTML source
; 4: Set Reading Point
; 5: Remove formatting through SuperMemo Commander


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Visual Char/Block/Line
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")
v::
Vim.State.SetMode("Vim_VisualChar")
Return




+v:: ; Start selecting from START
Vim.State.SetMode("Vim_VisualChar")
Send, {Home}+{Down}
Send, +{Left}
return


+c:: ; Start selecting from END
Vim.State.SetMode("Vim_VisualChar")
Send, {End}
Send, +{Home}
return


; +j: 5 Lines Down
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
; n::
+j::
Send, +{Down 5}
return

; +k: 5 Lines Up
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



; Extracting -> Back to Normal Mode
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
!x::
g::
Sleep, 50
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Send, !{x}
return

; *C*loze -> Back to Normal Mode
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
!z::
c::
Sleep, 50
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Send, !{z}
Return

;; t: Highlighted *t*urned [...]
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
t::
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Sleep, 50
clipboard = <span class="Cloze">[...]</span>
Sleep, 80
Send, ^{v}
Sleep, 50
Send +^{Left 8}
Sleep, 80
Send ^+{1}
Sleep, 80
Send, {Esc}
return



;; Cursor before [...]; make it formatted
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
[::
; Sleep, 50
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Send +{Right 5}
Sleep, 70
clipboard = <span class="Cloze">[...]</span>
Sleep, 70
Send, ^{v}
Sleep, 50
Send ^+{Left 8}
Sleep, 70
Send, ^+{1}
Sleep, 100
Send, {Esc}
return



; r: Go to read-point
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
r::
Vim.State.SetMode("Vim_Normal")
Send, !{F7}
return

; Highlighted until the end then Balabolka (s for sound)
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
s::
Vim.State.SetMode("Vim_Normal", 0, 0, 0)
Sleep, 20
Send, +^{End}
Sleep, 140
Send, ^{c}
Sleep, 120
Send, {Esc}
Sleep, 80
if WinExist("ahk_exe balabolka.exe")
{
   WinActivate
   return
 }
else
    ExitApp
return



;;;;;;;;;;;;START OF NUMBER SESSION;;;;;;;;;;;;


;; ^2: Remove item through deleting HTML source
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
^2::
Vim.State.SetMode("Vim_Normal")
Send, q
Sleep, 100
Send, {Esc}
Sleep, 100
Send, ^+{F6}
Sleep, 130
if WinExist("ahk_exe notepad.exe")
{
    WinActivate
	Sleep, 100
    WinWaitActive, ahk_exe notepad.exe
    Sleep, 100
    Send, ^{a}
    Sleep, 80
    Send, {Backspace}
    Sleep, 70
    Send, ^{s}
    Sleep, 200
	WinClose , ahk_exe notepad.exe, , 0, , 
}
else
    ExitApp
return


; 4: Set Reading Point
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
4::
Vim.State.SetMode("Vim_Normal")
Sleep, 20
Send, ^{F7}
Sleep, 100
Send, {Esc}
return


; 5: Remove formatting through SuperMemo Commander
#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.StrIsInCurrentVimMode("Visual"))
5::
Sleep, 50
Vim.State.SetMode("Vim_Normal")
clipboard = Remove formatting: Selection
Send, ^{Enter}
Sleep, 100
Send, ^{v}
Sleep, 200
Send, {Enter}
return
