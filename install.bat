@echo off

REM Check for python3 or python in PATH
where python3 >nul 2>&1
if %errorlevel%==0 (
    set PYTHON=python3
) else (
    where python >nul 2>&1
    if %errorlevel%==0 (
        set PYTHON=python
    ) else (
        echo Python3 or Python is not installed or not in PATH.
        echo Please install Python 3 and add it to PATH.
        pause
        exit /b
    )
)

echo Using python command: %PYTHON%

REM Clone the repo and wait for completion
start /wait cmd /c "git clone https://github.com/palahsu/DDoS-Ripper"

REM Verify repo cloned
if not exist "DDoS-Ripper" (
    echo Failed to clone repository. Check your network or git installation.
    pause
    exit /b
)

REM Install required Python packages
%PYTHON% -m pip install --upgrade pip
%PYTHON% -m pip install rich pyfiglet

REM Move ddos.py to repo folder
move /Y ddos.py "%CD%\DDoS-Ripper\ddos.py"

REM Run the script in a new terminal window
start cmd /c "drippertopath.bat"

REM Run the script in a new terminal window
start cmd /k "cd DDoS-Ripper && %PYTHON% ddos.py"


