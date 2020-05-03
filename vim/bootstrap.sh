#!/bin/bash

ln -rs .vim ~/.vim
# for vim
ln -rs .vimrc ~/.vimrc
# for neovim
FILE=~/.config/nvim
if [ ! -d "$FILE" ]; then     
	echo "create directory $FILE"
	mkdir -p "$FILE"
fi
ln -rs .vimrc ~/.config/nvim/init.vim



