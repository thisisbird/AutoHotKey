#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^SPACE::  Winset, Alwaysontop, , A ; ctrl + 空白鍵 視窗最上層
:O:@gm::@gmail.com{Home} ; @gm 空白/Tab/Enter O是Omit的意思
:*:@gm::@gmail.com ; @gm *直接觸發

/* 測試區

thisisbird@gm
; asdasd
@gmail.com

*/