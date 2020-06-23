; Resources
; https://www.autohotkey.com/docs/KeyList.htm
; https://www.autohotkey.com/docs/Hotkeys.htm

#NoEnv
SendMode Input

; ! = Alt
; ^ = Ctrl
; + = Shift
; # = Win

; #MenuMaskKey LAlt
~LAlt::Send {Blind}{vkE8}

; LCtrl q close
<^q::WinClose A

; RAlt m minimize
>!m::WinMinimize A



<!1::
  Send ^{1}
  Return

<!+1::
  Send ^+{1}
  Return

<!2::
  Send ^{2}
  Return

<!+2::
  Send ^+{2}
  Return

<!3::
  Send ^{3}
  Return

<!4::
  Send ^{4}
  Return

<!5::
  Send ^{5}
  Return



<!p::
  Send ^p
  Return

<!+p::
  Send ^+p
  Return

; new tab
<!t::
  Send ^t
  Return

; reload
<!r::
  Send ^r
  Return

; find
<!f::
  Send ^f
  Return

; shift find
<!+f::
  Send ^+f
  Return

; select all
<!a::
  Send ^a
  Return

; copy
<!c::
  Send ^c
  Return

; cut
<!x::
  Send ^x
  Return

; paste
<!v::
  Send ^v
  Return

; save
<!s::
  Send ^s
  Return

; undo
<!z::
  Send ^z
  Return

; redo
<!+z::
  Send ^+z
  Return

; close
<!w::
  Send ^w
  Return

; delete
<!d::
  Send {Delete}
  Return

; backspace
<!BS::
  Send ^{BS}
  Return



; NAVIGATION ^

; home
<!n::
  Send {Home}
  Return

; home select
<!+n::
  Send +{Home}
  Return

; end
<!m::
  Send {End}
  Return

; end select
<!+m::
  Send +{End}
  Return

; left
<!h::
  Send {Left}
  Return

^<!h::
  Send ^{Left}
  Return

; left select
<!+h::
  Send +{Left}
  Return

^<!+h::
  Send ^+{Left}
  Return

; down
<!j::
  Send {Down}
  Return

; down select
<!+j::
  Send +{Down}
  Return

; up
<!k::
  Send {Up}
  Return

; up select
<!+k::
  Send +{Up}
  Return

; right
<!l::
  Send {Right}
  Return

^<!l::
  Send ^{Right}
  Return

; right select
<!+l::
  Send +{Right}
  Return

^<!+l::
  Send ^+{Right}
  Return

; page up
<!u::
  Send {PgUp}
  Return

; control page up
<!+u::
  Send ^{PgUp}
  Return

; page down
<!o::
  Send {PgDn}
  Return

; control page down
<!+o::
  Send ^{PgDn}
  Return

; NAVIGATION $



; EDITOR ^

; comment
<!/::
  Send ^/
  Return

; select similar
<!+d::
  Send ^d
  Return

; enter to new line
<!Enter::Send ^{Enter}

; VSCode Explorer
<!+e::Send ^+e

; VSCode select similar in find
#Enter::Send !{Enter}

; EDITOR $



; MISC ^

; 1Password Firefox
<!.::
  Send ^.
  Return

; 1Password Chrome
<!+x::
  Send ^+x
  Return

; MISC $
