@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set "folderToAdd=C:\Program Files\DDoS-Ripper"

REM Read current user PATH
for /f "tokens=2,*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "xPath=%%B"

REM Check if folder is already in PATH (case-insensitive)
echo !xPath! | findstr /i /c:"%folderToAdd%" >nul
if %errorlevel% EQU 0 (
    echo Folder is already in PATH.
) else (
    REM Append folder to user PATH
    setx Path "!xPath!;%folderToAdd%"
    echo Folder added to PATH. Please restart your terminal sessions.
)