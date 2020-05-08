#!/bin/bash
[ -f ~/.vimrc ] && rm -v ~/.vimrc
[ -d ~/.vim ] && rm -rfv ~/.vim
[ -f .config/nvim/init.vim ] && rm -v .config/nvim/init.vim
FILE=~/.config
if [ -d "$FILE" ]; then     
	rm -rfv "$FILE"
fi

ln -rs .vim ~/.vim && echo link .vim done
# for vim
ln -rs ../.vimrc ~/.vimrc && echo link .vimrc done
# for neovim
ln -rs .config ~/.config && echo link .config done
ln -rs ../.vimrc ~/.config/nvim/init.vim && echo link .init.vim done



