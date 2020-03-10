#NoEnv
SetWorkingDir, %A_ScriptDir%
#SingleInstance Force
CoordMode, Mouse, Window
MsgBox, 開啟自動設定功能
^F1::
    run,C:\WINDOWS\System32\UserAccountControlSettings.exe
    return
^F2::
    checkFile() ;複製檔案
    return 
^F3::
    configSetting() ;xampp設定
    return
^F4::
    sqlSetting()
    return

;^F5::
 ;   fileZilaSetting()
  ;  Return
^F6::
    laravelSchedule()
    return
sqlSetting(){
    Run, http://localhost/myadmin/
    sleep 5000
    IfWinExist, phpMyAdmin
    {
        WinActivate
    }
    Clipboard = root
    Send, ^v
    sleep 500
    Send, {tab}
    Clipboard = 59209167
    sleep 500
    Send, ^v
    sleep 500
    Send, {enter}
    
    sleep 3000
    Run, http://localhost/myadmin/server_privileges.php?adduser=1
    WinActivate
    Clipboard = ems
    sleep 3000
    Send, ^v
    sleep 200
    Send, {tab}
    sleep 200
    Send, {tab}
    sleep 200
    Send, {tab}
    sleep 200
    Send, {tab}
    sleep 200

    Clipboard = Bny8PMI9xwRMsq0u
    sleep 200
    Send, ^v
    sleep 200
    Send, {tab}
    sleep 200
    Send, ^v
    sleep 200
    Send, {tab}
    sleep 200
    Send, {tab}
    sleep 200
    Send, {tab}
    sleep 200
    Send, {tab}
    sleep 200
    Send, {space}
    sleep 200
    Send, {tab}
    sleep 200
    Send, {space}
    sleep 200
    Send, {tab}
    sleep 200
    Send, {space}
    sleep 1000

    Send, {enter}

    sleep 2000

    Run, http://localhost/myadmin/db_import.php?db=ems
    sleep 1500
    MsgBox, 已選擇ems資料庫，請手動選擇sql檔，並按下執行。
    

}

checkFile(){
    msg := ""
    if !FileExist("複製資料\EMS")
        msg .= "EMS,"
    if !FileExist("複製資料\EMS_Control")
        msg .= "EMS_Control,"
    if !FileExist("複製資料\MG")
        msg .= "MG,"
    if !FileExist("複製資料\OpenApp")
        msg .= "OpenApp,"
    if !FileExist("Laravel_Schedule.xml")
        msg .= "Laravel_Schedule.xml,"
    if (msg == ""){
        MsgBox, 檔案備妥，請先手動安裝所有環境軟體，再ctrl + F2。
        IfExist, C:\xampp
        {
            copyData("複製資料")
            return
        }
    }
    else
        MsgBox, %msg%缺少以上檔案，請備妥
    return 
}


; xampp安裝

copyData(copydata){
    FileCopyDir, %A_ScriptDir%\%copydata%\EMS, C:\EMS
    FileCopyDir, %A_ScriptDir%\%copydata%\MG, C:\MG
    FileCopyDir, %A_ScriptDir%\%copydata%\OpenApp, C:\OpenApp
    FileCopyDir, %A_ScriptDir%\%copydata%\EMS_Control, C:\xampp\htdocs\EMS_Control
    FileCopy, %A_ScriptDir%\%copydata%\啟動\*.*, %A_Startup%
    Return
}

installXampp(){
    IfExist, C:\xampp
    {
        MsgBox, 已經安裝xampp
        return
    }

    run, %A_ScriptDir%\環境軟體\xampp\xampp-windows-x64-7.3.6-0-VC15-installer.exe  , , ,NEWPID
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
            copyData("複製資料")
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
        MouseMove, 412, 170
        sleep 200
        Send, {LButton}
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
        sleep 400
        MouseMove, 80, 176
        sleep 400
        Send, {LButton}
        sleep 400
        windowsS()
        sleep 400
    }
    sleep 500

    IfWinExist, FileZilla Server
    {
        WinActivate
        sleep 200
        MouseMove, 107, 65
        sleep 200
        Send, {LButton}
    }
    sleep 500
    IfWinExist, Users
    {
        WinActivate
        sleep 200
        MouseMove, 510, 231
        sleep 200
        Send, {LButton}
    }
    sleep 500

    IfWinExist, Add user account
    {
        WinActivate
        sleep 200
        Clipboard = icpsi
        sleep 300
        Send, ^v
        MouseMove, 102, 168
        sleep 200
        Send, {LButton}
    }
    sleep 500

    IfWinExist, Users
    {
        WinActivate
        sleep 200
        MouseMove, 152, 85
        sleep 200
        Send, {LButton}
        MouseMove, 289, 85
        sleep 200
        Send, {LButton}
        Clipboard = 59209167
        sleep 300
        Send, ^v
        sleep 200
        MouseMove, 76, 79
        sleep 200
        Send, {LButton}
        MouseMove, 173, 259
        sleep 200
        Send, {LButton}
        sleep 500
        Send, {esc}
      

    }
    sleep 500
    IfWinExist, Users
    {
        WinActivate
        MouseMove, 210, 93
        sleep 500
        Send, {LButton}
        sleep 1000
        Clipboard = D:\EZ Pro Chinese Media
        Send, ^v
        sleep 200
        MouseMove, 71, 376
        sleep 200
        Send, {LButton}
    }
}


laravelSchedule(){
    run, C:\Windows\system32\taskschd.msc
    sleep 1500
    IfWinExist, 工作排程器
    {
    WinActivate
    MouseMove, 87, 41
    sleep 200
    Send, {LButton}
    sleep 200
    Send, m
    sleep 500
    Clipboard = %A_ScriptDir%\Laravel_Schedule.xml
    Send, ^v
    sleep 200
    Send, {enter}
    sleep 500
    }
    IfWinExist, 建立工作
    {
        WinActivate
        MouseMove, 484, 484
        sleep 200
        Send, {LButton}
    }
    return
}
