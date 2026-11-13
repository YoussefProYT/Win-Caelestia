@echo off
setlocal
set "LOG=%CAELESTIA_WIN_LOG%"
if not defined LOG set "LOG=%LOCALAPPDATA%\caelestia-win\logs\compat.log"
if not exist "%LOCALAPPDATA%\caelestia-win\logs" mkdir "%LOCALAPPDATA%\caelestia-win\logs" >nul 2>&1
>>"%LOG%" echo [%date% %time%] swappy %*
exit /b 0
