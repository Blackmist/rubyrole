REM Skip pathing setup if we're running under the emulator
if "%EMULATED%"=="true" goto :runapp

cd /d "%~dp0"

:runapp
cd app

ruby app.rb