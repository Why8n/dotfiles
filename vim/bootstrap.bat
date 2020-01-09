@echo off
mklink /D %userprofile%\.vim %cd%\.vim
REM  for vim
mklink %userprofile%\.vimrc %cd%\.vimrc
REM  for neovim
mklink %appdata%\..\Local\nvim\init.vim %cd%\.vimrc
