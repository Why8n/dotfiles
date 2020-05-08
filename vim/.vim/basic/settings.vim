" change leader \ to ;
let mapleader=' '
set nocompatible

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

" 1 tab = 4 spaces
" Set <<  and >> shift width 4
set shiftwidth=4
set tabstop=4
set softtabstop=0
" Be smart when using tabs
set smarttab
set expandtab

" 检测文件类型
filetype on
filetype indent on 
filetype plugin on 
filetype plugin indent on 
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

" --------------------
" vim涉及字符显示的选项有三个，fileencoding文件字符编码，encoding缓冲区字符编码，termencoding终端字符编码。  
"
" 　　vim显示字符的顺序:（探测文件编码，从fileencodings里面选择最合适的编码赋值给fileencoding）按fileencoding编码读取文件->将读取到的内容转成encoding编码->将encoding编码转换成termencoding打印到终端->终端(我们平时主要使用的是securecrt)按设置的编码(一般是utf8)显示字符。
" --------------------
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8

"搜索到文件两端时不重新搜索
" set nowrapscan
" 不突出显示当前行
set nocursorline
" Disable the blinking cursor.
set gcr=a:blinkon0
" set cursor appearance on insert mode
set guicursor+=i:ver100-iCursor
" 屏幕滚动时在光标上下方保留5行预览代码
set so=3

set autochdir
set showcmd
" command line auto complete
set wildmenu
set wildmode=longest,list,full
" 使能鼠标操作
set mouse=a

" fileformat
set ff=unix
" fileformats
set ffs=unix,dos,mac

" search will center on the line it's found in.
" nnoremap n nzzzv
" nnoremap N Nzzzv

set history=200
" disable continuation of comments to the next line
setlocal formatoptions-=cro
" show commands on status bar
set showcmd
" 标尺(右下角显示百分比)
set ruler
set rulerformat=%15(%c%V\ %p%%%)
" 自动重新读入
set autoread

" makes popup menu smaller
set pumheight=10
