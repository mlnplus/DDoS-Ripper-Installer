@echo off

REM Check if git is installed
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not installed. Please install it through the official Git page.
    echo Opening the Git download page in your browser...
    start https://git-scm.com/install/windows
    pause
    exit /b
) else (
    echo Git is installed.
)

REM Your other commands go here
REM For example:

set "PYTHON="
where python3 >nul 2>&1
if %errorlevel%==0 (
    set "PYTHON=python3"
) else (
    where python >nul 2>&1
    if %errorlevel%==0 (
        set "PYTHON=python"
    )
)

if not defined PYTHON (
    echo Python3 or Python is not installed or not in PATH.
    echo Please install Python 3 and add it to PATH.
    pause
    exit /b
)

echo Using python command: %PYTHON%

start /wait cmd /c "git clone https://github.com/palahsu/DDoS-Ripper"

if not exist "DDoS-Ripper" (
    echo Failed to clone repository. Check your network or git installation.
    pause
    exit /b
)

%PYTHON% -m pip install --upgrade pip
%PYTHON% -m pip install rich pyfiglet

move /Y ddos.py "%CD%\DDoS-Ripper\ddos.py"

start cmd /c "drippertopath.bat"

start cmd /k "cd DDoS-Ripper && %PYTHON% ddos.py"
