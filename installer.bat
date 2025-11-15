@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "GTK_INSTALLER_PATH=%SCRIPT_DIR%data\\packages\\gtk-runtime-3.8.1-i686.exe"
set "GTK_VENDOR_PATH=%SCRIPT_DIR%vendor\\gtk-windows"

if exist "%GTK_VENDOR_PATH%" (
    echo GTK runtime already installed.
    goto :eof
)

if not exist "%GTK_INSTALLER_PATH%" (
    echo ERROR: GTK installer not found at %GTK_INSTALLER_PATH%
    echo Please place the GTK installer in the specified directory.
    exit /b 1
)

echo Installing GTK runtime...
"%GTK_INSTALLER_PATH%" /S /D=%GTK_VENDOR_PATH%

echo GTK runtime installed successfully.
endlocal
