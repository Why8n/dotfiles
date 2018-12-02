" change leader \ to ;
let mapleader=' '

set nu
set relativenumber
" Highlight search results
set hlsearch
"  real time search result shown
set incsearch
" Ignore case when searching
set ignorecase
" When searching try to be samrt about cases
set smartcase
" Show matching brackets when text indicator is over them
set showmatch
" 搜索到文件两端时不重新搜索
set expandtab
" 1 tab = 4 spaces
" Set <<  and >> shift width 4
set shiftwidth=4
set tabstop=4
" Be smart when using tabs
set smarttab

set nocompatible
" 检测文件类型
" filetype on
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" enable syntax highlighting
syntax enable
" auto syntax highlight
syntax on

" allow to switch buffers without saving
set hidden

" 智能缩进
set smartindent

" set cmd window height :( cmd )
set cmdheight=1
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" encoding setting
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"搜索到文件两端时不重新搜索
" set nowrapscan
" 不突出显示当前行
set nocursorline
" Use spaces instead of tabs

" Tab operation
noremap <tab> gt
noremap <S-tab> gT

" format
nnoremap <leader>fm gg=G''
vnoremap <leader>fm =

" Fast quiting without saving
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>

" cusor mvoement in insertmode
" inoremap <c-h> <left>
" inoremap <c-l> <right>
" inoremap <c-j> <c-o>gj
" inoremap <c-k> <c-o>gk
" inoremap <c-j> <up>
" inoremap <c-k> <down>



" Ctrl+a
nnoremap <silent> <C-a> ggvG$

" 选中状态下 Ctrl+c 复制
vnoremap <c-c> "+y

" Ctrl+v
nnoremap <silent> <C-v> "+p
inoremap <silent> <C-v> <C-r>+


"switch windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
"nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
nmap wh <C-w>h
nmap wl <C-w>l
nmap wj <C-w>j
nmap wk <C-w>k

" 屏幕滚动时在光标上下方保留5行预览代码
set so=5
