#!/bin/bash
# zsh
rm -v ~/.zshrc 
rm -v ~/.p10k.zsh
ln -rs .p10k.zsh ~/.p10k.zsh && echo link .p10k.zsh done
ln -rs .zshrc ~/.zshrc && echo link and source ~/.zshrc done

# vim
cd vim
bash bootstrap.sh


