#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
SetTitleMatchMode 2
;部分字串比對

;#win;^ctrl;!alt

#n::
  run notepad
  Return
  
^!f4::
  WinGetTitle sTitle, A
  ; MsgBox %sTitle%
  ; InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Font, Timeout, Default]
  InputBox sTitle, 視窗標題, 請輸入視窗的標題文字, , 300, 150, , , , , %sTitle%
  if (sTitle = "nb") {
      sTitle := "記事本"  ;; 或用 sTitle = 記事本
  } else if (sTitle = "ie") {
      sTitle := "Internet Explorer"
  }
  while WinExist(sTitle)
    WinClose
  Return
