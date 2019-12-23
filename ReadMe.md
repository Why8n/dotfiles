Installation
------------
1. place `.vim`/`.vimrc` to Home direcotry:
* **Linux**:
```
ln -rs .vim ~/.vim
ln -rs .vimrc ~/.vimrc
```

* **Windows**:
```
mklink /D %userprofile%\.vim <dotfiles_abs_path>\.vim
mklink %userprofile%\.vimrc <dotfiles_abs_path>\.vimrc
```

2. open `vim`/`nvim`,type`:PlugInstall`

