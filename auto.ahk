﻿#NoEnv
SetWorkingDir, %A_ScriptDir%
#SingleInstance Force
CoordMode, Mouse, Window

; xampp安裝
^a::
    run, %A_ScriptDir%\xampp.exe  , , ,NEWPID
    sleep,6000
    WinGetTitle,Title,ahk_pid %NEWPID%
    ; IfWinExist, Setup
    IfWinExist, %Title%
    {
        WinActivate ; use the window found above
        Send, {enter}
    }else{
        Msgbox 找不到視窗
    }
    sleep,200
    IfWinExist, Setup
    {
        WinActivate ; use the window found above
        Send, {enter}
        sleep 200
        Send, {enter}
        sleep 200
        Send, {enter}
        sleep 200
        MouseMove, 389, 199
        Send, {LButton}
        sleep 200
        Send, {enter}
        sleep 1000
        ; +-----
        IfWinExist, Warming
        { ; 已安裝過,取消安裝
            WinActivate
            sleep 200
            Send, {enter}
            sleep 200
            IfWinExist, Setup
            {
                MsgBox, 111
                WinActivate
                MouseMove, 487, 15
                sleep 200
                Send, {LButton}
            }
            sleep 500
            IfWinExist, Question
            {
                MsgBox, 222
                WinActivate
                sleep 200
                Send, {enter}
            }
            return
        }else{
            return 
        }
        ; +----
        Send, {enter}
    }
    sleep,200
    MsgBox, xampp安裝中
    

!s::
    IfWinExist, Setup
    {
        WinActivate
        sleep 200
        Send, {enter}
    }
    sleep 200
    IfWinExist, Language
    {
        WinActivate
        sleep 200
        MouseMove, 182, 148
        sleep 200
        Send, {LButton}
    }
!d::
    IfWinExist, XAMPP Control
    {
        WinActivate
        sleep 200
        MouseMove, 633, 47
        sleep 200
        Send, {LButton}
        sleep 200
        MouseMove, 50, 156
        sleep 200
        Send, {LButton}
        sleep 200
        MouseMove, 158, 156
        sleep 200
        Send, {LButton}
        sleep 200
        MouseMove, 117, 242
        sleep 200
        Send, {LButton}
        sleep 200
        MouseMove, 321, 429
        sleep 200
        Send, {LButton}
        ; 以上設定自動開啟config

        sleep 200
        MouseMove, 480, 116
        sleep 200
        Send, {LButton}
        sleep 200
        MouseMove, 600, 126
        sleep 200
        Send, {LButton}
    }else{
        MsgBox, 無
    }

!g::
    IfWinExist, httpd.conf
    {
        ; 開啟notepad
        WinActivate
        sleep 200
        Send, ^h
        Clipboard = "C:/xampp/htdocs"
        sleep 200
        Send, ^v
        sleep 200
        Send, {tab}
        Clipboard = "C:/xampp/htdocs/EMS_Control/public"
        sleep 200
        Send, ^v
        sleep 200
        Send, !a
        sleep 200
        Send, ^s
        WinClose
    }
    IfWinExist, XAMPP Control
    {
        ; 啟動apache filezila
        WinActivate
        sleep 200
        MouseMove, 344, 114
        sleep 200
        Send, {LButton}

        sleep 200
        MouseMove, 331, 167
        sleep 200
        Send, {LButton}
    }
