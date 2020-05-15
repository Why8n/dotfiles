@echo off
rmdir /s /q %userprofile%\.vim
mklink /D %userprofile%\.vim %cd%\.vim

REM  for vim
del %userprofile%\.vimrc
mklink %userprofile%\.vimrc %cd%\..\.vimrc
REM  for neovim
del %appdata%\..\Local\nvim\init.vim 
mklink %appdata%\..\Local\nvim\init.vim %cd%\..\.vimrc
