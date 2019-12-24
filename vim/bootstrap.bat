@echo off
mklink /D %userprofile%\.vim %cd%\.vim
mklink %userprofile%\.vimrc %cd%\.vimrc
