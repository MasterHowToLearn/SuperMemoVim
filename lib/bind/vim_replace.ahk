﻿; #If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "Vim_Normalsdfwefef")
; r::Vim.State.SetMode("r_once")
; +r::Vim.State.SetMode("r_repeat")

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "r_once")
~a::
~+a::
~b::
~+b::
~c::
~+c::
~d::
~+d::
~e::
~+e::
~f::
~+f::
~g::
~+g::
~h::
~+h::
~i::
~+i::
~j::
~+j::
~k::
~+k::
~l::
~+l::
~m::
~+m::
~n::
~+n::
~o::
~+o::
~p::
~+p::
~q::
~+q::
~r::
~+r::
~s::
~+s::
~t::
~+t::
~u::
~+u::
~v::
~+v::
~w::
~+w::
~x::
~+x::
~y::
~+y::
~z::
~+z::
~0::
~1::
~2::
~3::
~4::
~5::
~6::
~7::
~8::
~9::
~`::
~~::
~!::
~@::
~#::
~$::
~%::
~^::
~&::
~*::
~(::
~)::
~-::
~_::
~=::
~+::
~[::
~{::
~]::
~}::
~\::
~|::
~;::
~'::
~"::
~,::
~<::
~.::
~>::

; ~Space::
;  Send, {Del}
;  Vim.State.SetMode("Vim_Normal")
;Return

; ::: ; ":" can't be used with "~"?
;  Send, {:}{Del}
;  Vim.State.SetMode("Vim_Normal")
; Return

#If WinActive("ahk_group " . Vim.GroupName) and (Vim.State.Mode == "r_repeatsdfoijsdfiojererererer")
~a::
~+a::
~b::
~+b::
~c::
~+c::
~d::
~+d::
~e::
~+e::
~f::
~+f::
~g::
~+g::
~h::
~+h::
~i::
~+i::
~j::
~+j::
~k::
~+k::
~l::
~+l::
~m::
~+m::
~n::
~+n::
~o::
~+o::
~p::
~+p::
~q::
~+q::
~r::
~+r::
~s::
~+s::
~t::
~+t::
~u::
~+u::
~v::
~+v::
~w::
~+w::
~x::
~+x::
~y::
~+y::
~z::
~+z::
~0::
~1::
~2::
~3::
~4::
~5::
~6::
~7::
~8::
~9::
~`::
~~::
~!::
~@::
~#::
~$::
~%::
~^::
~&::
~*::
~(::
~)::
~-::
~_::
~=::
~+::
~[::
~{::
~]::
~}::
~\::
~|::
~;::
~'::
~"::
~,::
~<::
~.::
~>::

; ~Space::
; Return

; :::
Return
