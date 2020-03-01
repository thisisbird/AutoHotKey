#SingleInstance Force

sURL := "https://www.google.com/"

iBrowser := 1

if (iBrowser = 1) {
  driver:= ComObjCreate("Selenium.ChromeDriver")
  driver.setBinary("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
  driver.SetProfile("D:\chrome")
} else if (iBrowser = 2) {
  driver:= ComObjCreate("Selenium.IEDriver")
} else if (iBrowser = 3) {
  driver:= ComObjCreate("Selenium.FireFoxDriver") 
} else if (iBrowser = 4) {
  driver := ComObjCreate("Selenium.PhantomJSDriver")  ; headless 無視窗的瀏覽器
}

driver.Get(sURL)

element := driver.findElementByName("q")
element.SendKeys("flutter").SendKeys(driver.Keys.ENTER)

driver.wait(500)  ; wait for 500 miliseconds

driver.executeScript("alert('這是瀏覽器彈出的對話窗。網頁標題: ' + document.title);")

MsgBox 這是AutoHotkey的對話窗...

driver.quit()
driver := ""