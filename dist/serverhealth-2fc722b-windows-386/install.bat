@echo off
setlocal

set APP_NAME=serverhealth
set INSTALL_DIR=%ProgramFiles%\%APP_NAME%

echo Installing %APP_NAME%...

REM Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Error: Administrator privileges required
    echo Please run this script as Administrator
    pause
    exit /b 1
)

REM Create install directory
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

REM Copy binary
copy "%APP_NAME%.exe" "%INSTALL_DIR%\"

REM Add to PATH
setx PATH "%PATH%;%INSTALL_DIR%" /M

echo Installation complete!
echo Run '%APP_NAME% configure' to get started
pause
