#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#x::
  WinGetClass, sClass, A  ;//取出目前視窗的類別
  WinGetTitle, sTitle, A  ;//取出目前視窗的標題
  sNow = %A_NOW%          ;//取出目前日期時間
  MsgBox 類別=%sClass%, 標題=%sTitle%, 目前時間=%sNow%
  if (sClass = "CabinetWClass") {
    MsgBox 檔案總管裡按 Win+C
  } if (sClass = "Chrome_WidgetWin_1") {
    MsgBox 網頁標題是: %sTitle%
  } else {
    MsgBox 目前時間是: %sNow%  
  }
  return

#c::
  WinGetClass, sClass, A  ;//取出目前視窗的類別
  WinGetTitle, sTitle, A  ;//取出目前視窗的標題
  sNow = %A_NOW%          ;//取出目前日期時間
  ;MsgBox 類別=%sClass%, 標題=%sTitle%, 目前時間=%sNow%
  ListVars
  Pause
  if (sClass = "CabinetWClass") {
    MsgBox 檔案總管裡按 Win+C
  } if (sClass = "Chrome_WidgetWin_1") {
    MsgBox 網頁標題是: %sTitle%
  } else {
    MsgBox 目前時間是: %sNow%  
  }
  return

#v::
  WinGetClass, sClass, A
  WinGetTitle, sTitle, A
  sNow = %A_NOW%
  OutputDebug, 除錯輸出。類別=%sClass%, 標題=%sTitle%, 目前時間=%sNow%

  if (sClass = "CabinetWClass") {
    MsgBox 檔案總管裡按 Win+C
  } if (sClass = "Chrome_WidgetWin_1") {
    MsgBox 網頁標題是: %sTitle%
  } else {
    MsgBox 目前時間是: %sNow%  
  }
  return

