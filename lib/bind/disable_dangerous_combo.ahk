#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normal")

; If you disable the keys here,
; you can use it for SuperMemoVim
; effectively remapping original shortcuts

; All Two-key combo

F11:: ; Random jump/pick in a registry or tasklist manager
+Tab:: ; Move to the previous option or option group
+F2:: ; Search SuperMemo Wiki Help
+F3:: ; Search for leeches
+F4:: ; Import mail from MS Outlook for IR
+F12:: ; Quick backup
F3:: ; No search
^m::

^]:: ; increase font size
^[:: ; decrease font size
^Delete:: ; in the element window, delete the current component
^F2:: ; Execute the final drill 
^F3:: ; Search the web for the currently selected phrase
; ^F5:: ; Using Restore the default windows layout
^F12:: ; Repair collection
^o:: ; IMPORTANT: Open Favorite; Remapped to Esc
!Backspace:: ; Undo text editing (same as Ctrl+Z)
!F1:: ; Add a new task
!F4:: ; Close the program
!F5:: ; Dock toolbars (e.g. to clear the desktop) 
!F10:: ; Open the context menu of the currently active window
!F11:: ; Random test or Resume random test 
!F12:: ; Open the component menu of the current component 
!o:: ; Tools : Options 
Return



;; Disable built-in for SuperMemo's delete next word
^e::
Return

;; Disable built-in for SuperMemo's delete previous word
^w::
Return

;;; Below without comment means you can freely use them
;;; For SuperMemoVim
;;; Disable built-in for SuperMemoVim

;;;;;;;; Alt

!h:: ; Help menu
!l:: ; Learn menu
!v:: ; 
!n::
!s:: ;
!b::
!e:: ; Edit menu 
!f:: ; File menu

!r:: ; in the element window: Rename member on the component menu
!t:: ; Edit : Title or Reference : Title depending 
!u:: ; translate all text components in the element window 
!w:: ; Window menu 
!y:: ; phonetic transcription to all text components

;;;;;;;; Ctrl
^q::
^f::
^r:: ; No Replace Text
^g:: ; go to an element with a given number 
^s:: ; Search for texts containing a given string 
Return





;;;;;;; BELOW ARE ALL MULTI-KEY COMBO THAT
;;;;;;; WONT BE REMAPPED FOR SuperMemoVim
; All Three-key combo
; All Ctrl+Shift+Key combo

; Delete Current Element
; Shift & V::
; GetKeyState, state, Ctrl
; if state = D
; {
; MsgBox Shouldn't have clicked that.
; Return
; } else {
; Send, +V
; return
; }

; Delete the currently displayed element 
Shift & Del::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}

; Impose template 
Shift & F2::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}

; Save as default
Shift & F5::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}

; Process picture
Shift & F8::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}

; Randomize (outstanding) repetitions 
Shift & F11::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}

; Convert formatted text to plain text 
Shift & F12::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}

; Text : deHTML-ize 
Shift & F1::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}





; when editing HTML: Add a bullet to the text 
Shift & L::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
Send, +L
return
}



; Force repetition
Shift & R::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
Send, +R
return
}


; Display the ancestors window
Shift & X::
GetKeyState, state, Ctrl
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
Send, +X
return
}




; All Shift+Alt+Key combo

; Tools : Statistics : Analysis
Alt & A::
GetKeyState, state, Shift
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}



; Mercy
Alt & M::
GetKeyState, state, Shift
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}

; Components : Tile components (on the element menu) 
Alt & T::
GetKeyState, state, Shift
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
return
}

; Schedule extract and define its priority
; Clash with existing shortcut keys
; Alt & X::
GetKeyState, state, Shift
if state = D
{
MsgBox Shouldn't have clicked that.
Return
} else {
Send, !X
return
}



; Ctrl Shift Enter: Remove all elements
Ctrl & Enter::
GetKeyState, state, Shift
if state = D
{
MsgBox Shouldn't have clicked that.
Send, {Esc}
Sleep, 100
Send, {Esc}
Return
} else {
Send, ^{Enter}
return
}
