#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^SPACE::  Winset, Alwaysontop, , A ; ctrl + 空白鍵 視窗最上層
:O:@gm::@gmail.com{Home} ; @gm 空白/Tab/Enter O是Omit的意思
:*:@gm::@gmail.com ; @gm *直接觸發


^A::FileCreateShortcut, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe , %A_Now%.lnk , ,--app=%Clipboard%  --kiosk
^+g::
  current_clipboard = %Clipboard%   ; 把目前的剪貼簿內容存起來供後面還原
  Send ^c   ; 把選取字串用〔Ctrl+C〕存入剪貼簿
  ClipWait,1
  ; 下行使用Google執行搜尋動作，要搜尋的字串就是剪貼簿內容
  Run http://www.google.com.tw/search?hl=zh-TW&q=%Clipboard%
  Clipboard = %current_clipboard%   ; 還原先前的剪貼簿內容
  return

/* 測試區
--app="https://www.youtube.com/watch?v=KjoBihzWqY8" --kiosk
thisisbird@gm
; asdasd
@gmail.com

*/