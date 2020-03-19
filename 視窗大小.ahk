#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;win+v       將視窗置中
;win+ctrl+v  調整大小為800x600並將視窗置中
;win+方向鍵  移動視窗位置
;win+1/2/3   切換視窗透明度並且置頂
;win+4       切換置頂

;center active window
#V::
WinGetPos, , , WinWidth, WinHeight, A
WinMove, A, , (A_ScreenWidth/2)-(WinWidth/2), (A_ScreenHeight/2)-(WinHeight/2)
return
#^V::   ;1200x800
WinMove, A, , (A_ScreenWidth/2)-(1200/2), (A_ScreenHeight/2)-(800/2), 1200, 800
return

;move active window
#Left::MoveWindow(-1, 0)
#Right::MoveWindow(1, 0)
#Up::MoveWindow(0, -1)
#Down::MoveWindow(0, 1)
MoveWindow(dx, dy){
        WinGetPos, WinPosX, WinPosY, , , A
        WinMove, A, , WinPosX+dx, WinPosY+dy
        return
}

;toggle alwaysontop & transparency
#1::SetTransparency(64)
#2::SetTransparency(128)
#3::SetTransparency(192)
#4::WinSet, AlwaysOnTop, toggle, A
SetTransparency(trans){
        WinGet, Transparency, Transparent, A
        If Transparency
                WinSet, Transparent, Off, A
        else
                WinSet, Transparent, %trans%, A
        WinSet, AlwaysOnTop, toggle, A
        return
}