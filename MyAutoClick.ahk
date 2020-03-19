;;●●● AutoHotKey函式 ShowBanner(x) 產生標題畫面 0.5秒
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ShowBanner(x)
{
    Gui, -Caption +ToolWindow +LastFound +AlwaysOnTop
	
    Trans := 255
    Gui, Add, Text,, %x%
    GuiControl, Text, String, % Text
	Gui, Show, center xcenter NoActivate, MyTransparentBanner
    WinSet, Transparent, %Trans%, MyTransparentBanner
    Sleep 500
    
    Loop
    {
        if(Trans <= 0)
        {
            Trans := 0
            WinSet, Transparent, %Trans%, MyTransparentBanner
            break
        }
                
        WinSet, Transparent, %Trans%, MyTransparentBanner
        Trans := Trans - 5
        Sleep, 10
    }
    Gui, Destroy
    return
}


;●●● 暫停Autohotkey的功能 Mouse(L)+s
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & s::
	Suspend ,Toggle 
	ShowBanner("AutoHotKey 暫停/回復")
return

;●●● 重新載入Autohotkey的腳本ahk Mouse(L)+r
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & r::
	ShowBanner("AutoHotKey 重新載入腳本")
	reload
return

;●●●讀TXT檔案對應位置自動點擊滑鼠
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & a::
  CoordMode, Mouse, Screen
  XArray := Object()
  XArray[j] := A_LoopField
  XArray[j, k] := A_LoopReadLine               

  Loop, Read, %A_ScriptDir%\MyAutoClick.txt
  {
      XArrayCount += 1
      XArray[XArrayCount] := A_LoopReadLine
 }

  XArrayCount/= 2
 
  Sleep, 500
  Loop
  {
        nowIndx := 1
       Loop %XArrayCount%
      {
          nowX := XArray[nowIndx]
          newY := XArray[nowIndx+1]
          
          mousemove, %nowX%,%newY%,50,
          MouseClick
		  Sleep,500
          nowIndx += 2
      }
  }
return

;●●●取得滑鼠座標
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & g::
CoordMode, Mouse, Screen   
MouseGetPos, xpos, ypos,,,1
FileAppend,                
(
%xpos%
%ypos%

),%A_ScriptDir%\MyAutoClick.txt ;
ToolTip, 取得: X%xpos% Y%ypos%
return

;●●●清除檔案
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
~LButton & c::
FileDelete, %A_ScriptDir%\MyAutoClick.txt
FileAppend, ,%A_ScriptDir%\MyAutoClick.txt
return

