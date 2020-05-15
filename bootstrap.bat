@echo off
del %HOME%\.npmrc
mklink %HOME%\.npmrc %CD%\.npmrc

rmdir /s /q %HOME%\pip
mkdir %HOME%\pip
mklink %HOME%\pip\pip.ini %CD%\pip.ini

cd vim
start bootstrap.bat
