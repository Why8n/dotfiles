"detected os:https://vi.stackexchange.com/questions/2572/detect-os-in-vimscript 
function! IsWin32()
    return has('win32')
endfunction

function! IsWin32Unix()
    return has('win32unix')
endfunction

function! IsUnix()
    return has('unix')
endfunction

function! IsMac()
    return has('macunix')
endfunction

" global configurations
if IsWin32()
    " source $VIMRUNTIME/general.vim
    "  C:/Users/<user>/general.vim
    source $userprofile/general.vim
    let g:python ='"D:/Program Files (x86)/Python/python3/python.exe"'
    let g:ycm_extra_conf="D:/Program\ Files\ (x86)/Vim/vimfiles/.ycm_extra_conf.py"
    let g:chrome = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
elseif IsUnix() || IsWin32Unix() || IsMac()
    source ~/general.vim
    let g:python ='/usr/bin/python'
    let g:ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
    let g:chrome = '/usr/bin/chrome'
endif


" let g:python ='"D:/Program Files (x86)/Python/python3/python.exe"'
" let g:python = IsWin32() ? '"D:/Program Files (x86)/Python/python3/python.exe"' : '/usr/bin/python'

" reload vimrc
nnoremap <C-l> :source $MYVIMRC<CR>
" no backup
set noundofile
set nobackup
set noswapfile


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
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

" plug-vim configurations
" set the runtime path for package manager tool
if IsWin32()
    call plug#begin('$VIM/vimfiles/plugged/')
elseif IsUnix() || IsWin32Unix() || IsMac()
    call plug#begin('~/.vim/plugged')
endif

"
" -------------------------------------------------------------------------
" add plugin here
Plug 'dyng/ctrlsf.vim'
if executable('ag')
    let g:ctrlsf_ackprg = 'ag'
endif
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_default_view_mode = 'normal'
let g:ctrlsf_position = 'left'
let g:ctrlsf_winsize = '30%'

nnoremap <C-f> :CtrlSF<Space>
inoremap <C-f> <ESC>:CtrlSF<Space>
" visiual and select mode
vnoremap <C-f> "1y:CtrlSF<Space><C-R>1 
" visiual mode
"xnoremap <C-f> :CtrlSF<Space> 
" command line mode
cnoremap <C-f> CtrlSF 

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set local working directory:current file
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" exclusions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ }
" let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
" Use a custom file listing command:
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    let g:ctrlp_user_command = ['ag','ag %s -i --nocolor --nogroup --hidden
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ --ignore "**/*.pyc"
                \ -g ""' ]
elseif IsUnix() || IsMac()
    let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
elseif IsWin32()
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
endif


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
nmap wm :NERDTreeToggle<CR>
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" 当不带参数打开Vim时自动加载项目树 -- no
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
"Refresh both CtrlP and NERDTree
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'
" syntastic default config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" overwrite quickfix when execute :SyntasticSetLocList
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <F2> :SyntasticToggleMode<CR>

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
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

vmap <C-b> <leader>cc

" markdown
Plug 'iamcco/markdown-preview.vim',{ 'for': 'markdown' }
" path to the chrome or the command to open chrome(or other modern browsers)
let g:mkdp_path_to_chrome = g:chrome

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


" Plug 'reedes/vim-pencil'
" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd,md call pencil#init()
"   autocmd FileType text         call pencil#init()
" augroup END
" let g:airline_section_x = '%{PencilMode()}'

"Plug 'Valloric/YouCompleteMe'
"let g:ycm_key_invoke_completion = '<M-/>' "default <C-Space>,modify to alt+/
"" 自动补全配置
"set completeopt=longest,menu " "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"
""youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
"
"let g:ycm_min_num_of_chars_for_completion = 1
""在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"" 让YouCompleteMe同时利用原来的ctags
"let g:ycm_collect_identifiers_from_tag_files = 1  
"let g:clang_user_options='|| exit 0'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

let g:ycm_server_python_interpreter=g:python
let g:ycm_global_ycm_extra_conf= g:ycm_extra_conf

" add support completions of java
let g:EclimCompletionMethod = 'omnifunc'
" add support completions of python
let g:ycm_python_binary_path =g:python

Plug 'Raimondi/delimitMate'
inoremap {<CR> {<CR>}<C-o>O
" Use this option to tell delimitMate which characters should be considered
" matching pairs. Read |delimitMateAutoClose| for details.
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/Marks-Browser'
nmap <silent> <leader>mb :MarksBrowser<cr>
" the browser window close itself after you jump to a mark
let marksCloseWhenSelected = 1

" scheme for console
" Plug 'jnurmine/Zenburn'
if has('gui_running')
    colorscheme SolarizedDark
else
    colorscheme zenburn
endif

Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

" -------------------------------------------------------------------------
" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()

map <F5> :call CompileRun()<CR>
nnoremap <leader>cmd :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %< && ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< && ./%<"
    elseif &filetype == 'java'
        exec "!javac % && java %<"
    elseif &filetype == 'kotlin'
        if IsWin32()
            exec "!kotlinc % -include-runtime -d %<.jar && java -jar %<.jar && del %<.jar"
        else
            exec "!kotlinc % -include-runtime -d %<.jar && java -jar %<.jar && rm %<.jar"
        endif
    elseif &filetype == 'python'
        exec "!".g:python." %"
    elseif &filetype == 'html'
        exec "!chrome % &"
    elseif &filetype == 'go'
        exec "!go build %< && go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html & && !chrome %.html &"
    elseif &filetype == 'sh'
        :!bash %
    elseif &filetype == 'dosbatch'
        exec "!cmd /c %"
    endif
endfunc
