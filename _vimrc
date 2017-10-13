source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" reload vimrc
nnoremap <C-l> :source $MYVIMRC<CR>
" 显示行号  
set number  
" no backup
set noundofile
set nobackup
set noswapfile
" 实时搜索  
set incsearch  
" 搜索到文件两端时不重新搜索  
set nowrapscan  
" 不突出显示当前行  
set nocursorline  
set expandtab  
" 设定 tab 长度为 4  
set tabstop=4  
" 设定 << 和 >> 命令移动时的宽度为 4  
set shiftwidth=4  
set smarttab  
colorscheme SolarizedDark

" 自动语法高亮  
syntax on  
 " 检测文件类型  
filetype on  
" 不设定在插入状态无法用退格键和 Delete 键删除回车符  
set backspace=indent,eol,start  
set whichwrap+=<,>,h,l  

"switch windows
"nnoremap <C-h> <C-w>h  
"nnoremap <C-l> <C-w>l  
"nnoremap <C-j> <C-w>j  
"nnoremap <C-k> <C-w>k 
nmap wh <C-w>h
nmap wl <C-w>l
nmap wj <C-w>j
nmap wk <C-w>k

" auto complete brackets
inoremap {<CR> {<C-o>o}<C-o>O
inoremap ( ()<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

"detected os:https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript

"if has('win32')
	"echo "this is windowns"
	"set nu	
"elseif has('unix')
	"echo "this is unix"
"elseif has(macunix)
	"echo "this is mac"
"elseif has(win32unix)
	"echo "this is Cywin"
"endif

function IsWin32()
	return has('win32')
endfunction

function IsWin32Unix()
	return has('win32unix')
endfunction

function IsUnix()
	return has('unix')
endfunction

function IsMac()
	return has('macunix')
endfunction


" vundle configurations
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if IsWin32()
	set rtp+=$VIM/vimfiles/bundle/Vundle.vim
	call vundle#begin('$VIM/vimfiles/bundle/')
elseif IsUnix() || IsWin32Unix() || IsMac()
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 " -------------------------------------------------------------------------
" add plugin here
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set local working directory:current file
let g:ctrlp_working_path_mode = 'ra'

" exclusions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plugin 'scrooloose/nerdtree'
nmap wm :NERDTreeToggle<CR>
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
"Refresh both CtrlP and NERDTree
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

Plugin 'easymotion/vim-easymotion'
Plugin 'vim-syntastic/syntastic'
" syntastic default config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
 let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 let g:NERDCustomDelimiters = { 'java': { 'left': '//'} }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" markdown
Plugin 'iamcco/markdown-preview.vim'
" path to the chrome or the command to open chrome(or other modern browsers)
let g:mkdp_path_to_chrome = 'C:\Program Files (x86)\Google\Chrome\Application\chrome'

" set to 1, the vim will open the preview window once enter the markdown
" buffer
let g:mkdp_auto_start = 0

" set to 1, the vim will auto open preview window when you edit the
" markdown file
let g:mkdp_auto_open = 1

" set to 1, the vim will auto close current preview window when change
" from markdown buffer to another buffer
let g:mkdp_auto_close = 1

" set to 1, the vim will just refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file
let g:mkdp_command_for_global = 0
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode
" -------------------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required 

