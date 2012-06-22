REM Skip pathing stuff if we're running under the emulator
if "%EMULATED%"=="true" goto :bundler

cd /d "%~dp0"

:bundler
cd app

REM update RubyGems
call gem update --system

REM Install bundler, which will install other gems
call gem install bundler --no-ri --no-rdoc

REM Install gems from Gemfile.
call bundle install