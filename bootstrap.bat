@echo off

set cur_path=%CD%

REM  npm configuration
del %HOME%\.npmrc
mklink %HOME%\.npmrc %cur_path%\.npmrc

REM  pip configuration
rmdir /s /q %HOME%\pip
mkdir %HOME%\pip
mklink %HOME%\pip\pip.ini %cur_path%\pip.ini

REM  vim configuration
cd %cur_path%\vim
start bootstrap.bat

REM  windows terminal configuration
cd %cur_path%\windows\terminal
start bootstrap.bat

