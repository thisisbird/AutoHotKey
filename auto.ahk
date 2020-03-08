#NoEnv
SetWorkingDir, %A_ScriptDir%
#SingleInstance Force
CoordMode, Mouse, Window

^F2::
    run,C:\WINDOWS\System32\UserAccountControlSettings.exe
    return 
; xampp安裝
^F3::
    IfExist, C:\xampp
        MsgBox, 已經安裝xampp
    else{
        installXampp()
    }
    return

^F4::
    copyData()
    Return

copyData(){
    FileCopyDir, %A_ScriptDir%\testcopy, C:\testcopy
    FileCopyDir, %A_ScriptDir%\testcopy2, C:\testcopy2
    FileCopyDir, %A_ScriptDir%\testcopy3, C:\testcopy3
    FileCopyDir, %A_ScriptDir%\EMS_Control, C:/xampp/htdocs/EMS_Control/
    
    FileCopy, %A_ScriptDir%\啟動\*.*, %A_Startup%
    Return
}

installXampp(){
    run, %A_ScriptDir%\xampp.exe  , , ,NEWPID
    WinGetTitle,Title,ahk_pid %NEWPID%
    WinWaitActive, Warning , , 15
    if ErrorLevel
    {
        MsgBox, WinWait timed out.
        return
    }
    else{
        IfWinExist, %Title%
        {
            WinActivate ; use the window found above
            Send, {enter}
        }
        sleep,1000
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
            sleep 200
            Send, {enter}
            copyData()
            MsgBox, xampp安裝中,看到Finish再按確定
            windowsS()
            installFinsh()
        }
    }
    return
}

installFinsh(){
    IfWinExist, Setup
    {
        WinActivate
        sleep 200
        Send, {enter}
    }
    sleep 3000
    IfWinExist, Language
    {
        WinActivate
        sleep 200
        MouseMove, 182, 148
        sleep 200
        Send, {LButton}
        sleep 1000
        configSetting()
    }
    return
}

!x::
    configSetting()
    return 

configSetting(){
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
        MsgBox, 未啟動xampp Control
    }
    sleep 1000
    pathChange()
    return
}

pathChange(){
    IfWinExist, httpd.conf
    {
        ; 開啟notepad
        WinActivate
        sleep 200
        Send, ^h
        Clipboard = "C:/xampp/htdocs"
        sleep 300
        Send, ^v
        sleep 300
        Send, {tab}
        Clipboard = "C:/xampp/htdocs/EMS_Control/public"
        sleep 300
        Send, ^v
        sleep 200
        Send, !a
        sleep 500
        Send, ^s
        sleep 500
        WinClose
    }
    startApache_Filezila()
    return
}
startApache_Filezila(){
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
        sleep 200
        windowsS()
        sleep 200
        fileZilaSetting()
    }
    return
}
windowsS(){
    IfWinExist, Windows 安全性警訊
    {
        WinActivate
        sleep 200
        MouseMove, 448,413
        sleep 200
        Send, {LButton}
    }
}
fileZilaSetting(){
    IfWinExist, Connect to Server
    {
        ; filezila
        WinActivate
        sleep 200
        MouseMove, 344, 114
        sleep 200
        Send, {LButton}
        sleep 200
        MouseMove, 331, 167
        sleep 200
        Send, {LButton}
        sleep 200
        windowsS()
        sleep 200
    }
    IfWinExist, FileZilla Server
    {
        WinActivate

    }
}
