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
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

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

set t_Co=256




" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

function s:isFileExists()
    return strlen(expand('%'))
endfunction

function! AutoSave()
    if s:isFileExists()
        augroup autoSave
            autocmd!
            autocmd FocusLost <buffer> silent write
        augroup END
    endif
endfunction
" auto save when edit a exist file 
autocmd BufReadPost * call AutoSave()

" todo::remvoe
" Eng: 1033
" Chn: 2052
" function! s:imSwitcher(en)
"     let en = system('im-select') =~? '1033'
"     echom 'en = '.en
"     if xor(a:en, en)
"         call system('im-select locale')
"     endif
" endfunction
"
" augroup ImSwitcher
"     autocmd!
"     au InsertEnter * call <SID>imSwitcher(0)
"     au InsertLeave * call <SID>imSwitcher(1)
    " au CmdlineEnter * call <SID>imSwitcher(0)
    " au CmdlineLeave * call <SID>imSwitcher(1)
" augroup END
    
" let g:curImMode = 1033
" function! s:imSwitcher(mode)
"     let g:curImMode = system('im-select')
"     if a:mode ==? 1033
"         call system('im-select 1033')
"     elseif a:mode ==? 2052
"         echom 'enter insert mode'
"         call system('im-select 2052')
"     endif
" endfunction
"
" augroup ImSwitcher
"     autocmd!
"     autocmd InsertEnter * :call <SID>imSwitcher(g:curImMode)
"     autocmd InsertLeave * :call <SID>imSwitcher(1033)
" augroup END
