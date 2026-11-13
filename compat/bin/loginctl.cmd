@echo off
setlocal
set "LOG=%CAELESTIA_WIN_LOG%"
if not defined LOG set "LOG=%LOCALAPPDATA%\caelestia-win\logs\compat.log"
if not exist "%~dp0..\..\logs" mkdir "%~dp0..\..\logs" >nul 2>&1
>>"%LOG%" echo [%date% %time%] loginctl %*
if /i "%~1"=="lock-session" (
  rundll32.exe user32.dll,LockWorkStation
  exit /b %errorlevel%
)
if /i "%CAELESTIA_WIN_ALLOW_POWER%"=="1" (
  if /i "%~1"=="poweroff" shutdown.exe /s /t 0
  if /i "%~1"=="reboot" shutdown.exe /r /t 0
  if /i "%~1"=="suspend" rundll32.exe powrprof.dll,SetSuspendState 0,1,0
)
exit /b 0
