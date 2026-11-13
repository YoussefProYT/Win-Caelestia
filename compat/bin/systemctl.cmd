@echo off
setlocal
set "LOG=%CAELESTIA_WIN_LOG%"
if not defined LOG set "LOG=%LOCALAPPDATA%\caelestia-win\logs\compat.log"
>>"%LOG%" echo [%date% %time%] systemctl %*
if /i "%CAELESTIA_WIN_ALLOW_POWER%"=="1" (
  if /i "%~1"=="poweroff" shutdown.exe /s /t 0
  if /i "%~1"=="reboot" shutdown.exe /r /t 0
  if /i "%~1"=="suspend" rundll32.exe powrprof.dll,SetSuspendState 0,1,0
)
exit /b 0
