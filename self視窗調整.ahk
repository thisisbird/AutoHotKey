#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%

~RButton & LButton::
  WinGetTitle sTitle, A
  if WinExist(sTitle)
    WinRestore
    WinMove ,,, 0, 0 ,(A_ScreenWidth/2) , , , 
  Return
~LButton & RButton::
  WinGetTitle sTitle, A
  if WinExist(sTitle)
    WinRestore
    WinMove ,,, (A_ScreenWidth/2), 0 , (A_ScreenWidth/2) , , , 
  Return

~LButton & t::  Winset, Alwaysontop, , A ; ctrl + 空白鍵 視窗最上層
