@echo off
mklink %HOME%\.npmrc %CD%\.npmrc
mkdir %HOME%\pip
mklink %HOME%\pip\pip.ini %CD%\pip.ini
