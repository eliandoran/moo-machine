@echo off

echo The Moo Machine Uninstaller
echo (C) 2015 Elian Doran
echo.

taskkill /F /im MooMachine.exe
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\MooMachine.lnk"
del "%appdata%\MooMachine.exe"
del /F /S /Q "%temp%\MooMachine\*"
rmdir "%temp%\MooMachine"
timeout 3