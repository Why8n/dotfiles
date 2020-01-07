source ~/.vim/init.vim

" reload vimrc
" map <C-l> :source $MYVIMRC<CR>
" no backup
set noundofile
set nobackup
set noswapfile


" No annoying sound on errors
set noerrorbells
set novisualbell
set vb t_vb= " turn off visual bell,error flash
set tm=500

" set cmd window height :( cmd )
set cmdheight=1
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" remove gui
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Fixing Vim's Background Color Erase for 256-color tmux and GNU screen
if !empty(&t_ut)
  " see http://snk.tuxfamily.org/log/vim-256color-bce.html
  let &t_ut=''
endif

" x显示末尾空格
set list
set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
set showbreak=\\ " [bonus]

" jump to last known cursor position when reopen a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Disable arrow movement, resize splits instead.
" if get(g:, 'elite_mode')
map <Up>    :resize +2<CR>
map <Down>  :resize -2<CR>
map <Left>  :vertical resize +2<CR>
map <Right> :vertical resize -2<CR>

" auto complete brackets
" inoremap {<CR> {<C-o>o}<C-o>O
" inoremap ( ()<ESC>i
" inoremap < <><ESC>i
" inoremap " ""<ESC>i
" inoremap ' ''<ESC>i


" disable window search style
" nnoremap <C-f> /
" inoremap <C-f> <ESC>/
" vnoremap <C-f> <ESC>/<C-r><C-w>
" " command mode
" cnoremap <C-f> <C-r><C-w>

set ruler
set t_Co=256
