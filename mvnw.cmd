@echo off
setlocal
set ROOT=%~dp0
set ROOT=%ROOT:~0,-1%
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0mvnw.ps1" %*
endlocal
