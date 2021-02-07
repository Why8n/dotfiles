" " auto-install vim-plug
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   "autocmd VimEnter * PlugInstall
"   autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif
"
" call plug#begin('~/.cache/plugged')
"
" Plug 'unblevable/quick-scope'
"
" Plug 'asvetliakov/vim-easymotion'
"
" Plug 'tpope/vim-repeat'
"
" call plug#end()

" call dein#add('unblevable/quick-scope')

call dein#add('asvetliakov/vim-easymotion', {
        \'lazy': 1,
        \'on_map': {
        \'n':['<Leader><Leader>w',
            \'<Leader><Leader>b',
            \'<Leader><Leader>s',
            \'<Leader><Leader>f',
            \'<Leader><Leader>F',
            \'<Leader><Leader>t',
            \'<Leader><Leader>T',
            \]}
        \})

