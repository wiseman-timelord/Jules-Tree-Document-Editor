@echo off
set "SCRIPT_DIR=%~dp0"
set "GTK_PATH=%SCRIPT_DIR%vendor\\gtk-windows\\bin"
set "PATH=%GTK_PATH%;%PATH%"
python "%SCRIPT_DIR%scripts\\editor.py"
